"""Verify the pixel invariants even when the image model redraws everything."""
import asyncio
import base64
import hashlib
import json
from io import BytesIO
from pathlib import Path
import sys
from types import SimpleNamespace
import unittest
from unittest.mock import patch, Mock

import numpy as np
from PIL import Image
from fastapi import UploadFile
from fastapi.testclient import TestClient
from openai import BadRequestError
import httpx
import os

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from app import avatar_face_edit as edit
from app import main


class FaceOnlyEditTests(unittest.TestCase):
    def setUp(self):
        # Arbitrary source dimensions, hair, face, neck, and body.
        self.base = np.zeros((320, 180, 4), dtype=np.uint8)
        self.base[15:305, 45:135] = [120, 90, 70, 255]
        self.base[15:40, 45:135, :3] = [20, 15, 10]
        self.labels = np.zeros((320, 180), dtype=np.uint8)
        self.labels[15:40, 45:135] = 17  # hair
        self.labels[40:85, 55:125] = 1  # facial skin
        self.labels[85:110, 65:115] = 14  # neck
        self.labels[110:305, 45:135] = 16  # clothing/body
        self.labels[44:48, 58:65] = 17  # bangs over the face
        self.labels[53:57, 64:71] = 4  # eyes
        self.labels[67:73, 80:100] = 12  # lips

    def prepare(self):
        with patch.object(edit, "parse_avatar_face", return_value=self.labels):
            return edit.prepare_face_edit(edit.png_bytes(Image.fromarray(self.base)))

    def test_mask_excludes_hair_neck_clothes_and_background(self):
        support = edit.face_support(self.labels, self.base[:, :, 3])
        for label in (0, 14, 16, 17):
            self.assertFalse(support[self.labels == label].any())
        self.assertTrue(support[60, 90])
        inputs = self.prepare()
        base = Image.open(BytesIO(inputs.api_base))
        mask = Image.open(BytesIO(inputs.api_mask))
        self.assertEqual(base.size, mask.size)
        self.assertEqual(mask.mode, "RGBA")
        self.assertEqual(set(np.unique(np.array(mask)[:, :, 3])), {0, 255})
        self.assertEqual(inputs.api_size, (1024, 1024))
        # No neck or body is sent to the provider for a facial edit.
        self.assertLessEqual(inputs.source_box[3], 85)

    def test_adversarial_redraw_cannot_modify_non_face_pixels_or_alpha(self):
        inputs = self.prepare()
        # Deliberately change the entire API canvas, including body and hair.
        redraw = Image.new("RGBA", inputs.api_size, (250, 0, 220, 255))
        output = Image.open(BytesIO(edit.composite_face_edit(inputs, edit.png_bytes(redraw))))
        result, original = np.array(output), np.array(inputs.original)
        self.assertEqual(output.size, (180, 320))
        self.assertEqual(output.mode, "RGBA")
        np.testing.assert_array_equal(result[~inputs.support], original[~inputs.support])
        np.testing.assert_array_equal(result[:, :, 3], original[:, :, 3])
        self.assertTrue(np.any(result[inputs.support, :3] != original[inputs.support, :3]))

    def test_transparent_model_output_does_not_erase_face(self):
        inputs = self.prepare()
        redraw = Image.new("RGBA", inputs.api_size, (0, 0, 0, 0))
        result = Image.open(BytesIO(edit.composite_face_edit(inputs, edit.png_bytes(redraw))))
        np.testing.assert_array_equal(np.array(result), np.array(inputs.original))

    def test_missing_face_fails_closed(self):
        with patch.object(edit, "parse_avatar_face", return_value=np.zeros_like(self.labels)):
            with self.assertRaises(ValueError):
                edit.prepare_face_edit(edit.png_bytes(Image.fromarray(self.base)))

    def test_nearly_opaque_avatar_skin_is_editable(self):
        # Existing body-type assets use alpha=254 throughout the facial skin.
        alpha = self.base[:, :, 3].copy()
        alpha[alpha == 255] = 254
        support = edit.face_support(self.labels, alpha)
        self.assertTrue(support[60, 90])
        self.assertFalse(support[self.labels == 17].any())

    def test_wrong_api_canvas_is_rejected(self):
        with self.assertRaises(ValueError):
            edit.composite_face_edit(self.prepare(), edit.png_bytes(Image.new("RGBA", (10, 10))))

    def test_endpoint_sends_prompt_and_face_mask_and_returns_original_resolution(self):
        inputs = self.prepare()
        generated = edit.png_bytes(Image.new("RGBA", inputs.api_size, (200, 150, 120, 255)))
        call = Mock(return_value=SimpleNamespace(data=[SimpleNamespace(b64_json=base64.b64encode(generated).decode())]))
        with patch.object(main, "prepare_face_edit", return_value=inputs), patch.object(main, "client", SimpleNamespace(images=SimpleNamespace(edit=call))):
            result = asyncio.run(main.generate_avatar(
                UploadFile(filename="chosen_body_type.png", file=BytesIO(edit.png_bytes(Image.fromarray(self.base)))),
                UploadFile(filename="user.png", file=BytesIO(edit.png_bytes(Image.new("RGB", (100, 100), "white")))),
            ))
        sent = call.call_args.kwargs
        self.assertEqual(sent["prompt"], edit.PROMPT_PATH.read_text(encoding="utf8").strip())
        self.assertEqual(sent["mask"].getvalue(), inputs.api_mask)
        self.assertEqual(sent["input_fidelity"], "high")
        self.assertEqual(sent["background"], "transparent")
        image = Image.open(BytesIO(base64.b64decode(result["image"].split(",", 1)[1])))
        self.assertEqual(image.size, inputs.original.size)

    def test_provider_rejection_returns_readable_error_with_cors_without_retry(self):
        error = BadRequestError("safety rejection", response=httpx.Response(
            400, request=httpx.Request("POST", "https://api.openai.com/v1/images/edits")), body={})
        call = Mock(side_effect=error)
        photo = edit.png_bytes(Image.new("RGB", (100, 100), "white"))
        with patch.dict(os.environ, {"REQUIRE_FIREBASE_AUTH": "false"}), patch.object(main, "prepare_face_edit", return_value=self.prepare()), patch.object(main, "client", SimpleNamespace(images=SimpleNamespace(edit=call))):
            response = TestClient(main.app).post("/generate-avatar",
                headers={"Origin": "https://a-vata-demo.vercel.app"},
                files={"base_avatar": ("base.png", photo, "image/png"), "user_face": ("face.png", photo, "image/png")})
        self.assertEqual(response.status_code, 422)
        self.assertIn("승인하지", response.json()["detail"])
        self.assertEqual(response.headers["access-control-allow-origin"], "*")
        call.assert_called_once()

    def test_all_twenty_shipped_avatars_have_matching_face_masks(self):
        root = Path(__file__).resolve().parents[2]
        paths = list((root / "frontend/assets/avatars/body_types").glob("*.png"))
        paths += list((root / "frontend/assets/avatars").glob("*_base.png"))
        index = json.loads((edit.MASK_ROOT / "index.json").read_text(encoding="utf8"))
        self.assertEqual(len(paths), 20)
        self.assertEqual(len(index), 20)
        for path in paths:
            with self.subTest(asset=path.name):
                entry = index[hashlib.sha256(path.read_bytes()).hexdigest()]
                with Image.open(edit.MASK_ROOT / entry["mask"]) as mask, Image.open(path) as original:
                    self.assertEqual(mask.size, original.size)
                    rows, _ = np.where(np.array(mask) > 0)
                    self.assertGreater(len(rows), 32)
                    self.assertLess(int(rows.max()), mask.height * .3)


if __name__ == "__main__":
    unittest.main()
