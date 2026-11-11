import importlib.util
from io import BytesIO
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

import numpy as np
from PIL import Image

SCRIPT = Path(__file__).resolve().parents[2] / "deployment/import-shopping-images.py"
spec = importlib.util.spec_from_file_location("shopping_image_import", SCRIPT)
importer = importlib.util.module_from_spec(spec)
spec.loader.exec_module(importer)


class ShoppingImageImportTests(unittest.TestCase):
    def fixture_bytes(self):
        output = BytesIO()
        Image.new("RGBA", (40, 80), (200, 50, 10, 255)).save(output, format="PNG")
        return output.getvalue()

    def test_512_white_background_and_preserved_ratio(self):
        result = Image.open(BytesIO(importer.normalize_image(self.fixture_bytes())))
        self.assertEqual(result.size, (512, 512))
        self.assertEqual(result.mode, "RGB")
        pixels = np.array(result)
        self.assertEqual(pixels[0, 0].tolist(), [255, 255, 255])
        rows, columns = np.where(np.any(pixels != 255, axis=2))
        self.assertEqual((int(columns.max()-columns.min()+1), int(rows.max()-rows.min()+1)), (232, 464))

    def test_import_requires_permission_and_exact_product_match(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            products = [{"id": "fixture_01", "name": "test fixture", "product_url": "https://example.com/1", "image_url": None, "price": None, "availability_verified": False}]
            catalog, manifest = root/"products.json", root/"permissions.json"
            catalog.write_text(json.dumps(products))
            original = catalog.read_bytes()
            manifest.write_text("{}")
            with patch.object(importer, "read_source", side_effect=AssertionError("No download without rights")):
                records = importer.import_images(catalog, manifest, root/"assets", root/"report.json", True)
            self.assertEqual(records[0]["status"], "permission_not_confirmed")
            self.assertEqual(catalog.read_bytes(), original)
            self.assertFalse((root/"assets").exists())
            approval = {"fixture_01": {"permission": "owned", "permission_basis": "unit test pattern, not a product photo", "source": "fixture.png", "product_match_verified": True, "product_url": "https://example.com/1"}}
            manifest.write_text(json.dumps(approval))
            with patch.object(importer, "read_source", return_value=self.fixture_bytes()):
                records = importer.import_images(catalog, manifest, root/"assets", root/"report.json", True)
            self.assertEqual(records[0]["status"], "imported")
            result = json.loads(catalog.read_text())[0]
            self.assertEqual(result["product_url"], products[0]["product_url"])
            self.assertEqual(result["image_url"], "assets/shopping_products/fixture_01.png")
            self.assertIsNone(result["price"])
            self.assertFalse(result["availability_verified"])

    def test_permission_does_not_allow_wrong_product_image(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            catalog, manifest = root/"products.json", root/"permissions.json"
            catalog.write_text(json.dumps([{"id": "fixture", "name": "fixture", "product_url": "https://example.com/right", "image_url": None}]))
            manifest.write_text(json.dumps({"fixture": {"permission": "licensed", "permission_basis": "test", "source": "x.png", "product_match_verified": True, "product_url": "https://example.com/wrong"}}))
            with patch.object(importer, "read_source", side_effect=AssertionError("Wrong product must not download")):
                records = importer.import_images(catalog, manifest, root/"assets", root/"report.json", True)
            self.assertEqual(records[0]["status"], "product_match_not_verified")


if __name__ == "__main__":
    unittest.main()
