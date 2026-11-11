"""BiRefNet Lite segmentation and white-background closet normalization."""

from functools import lru_cache
from io import BytesIO
from pathlib import Path

import numpy as np
import onnxruntime as ort
from PIL import Image, ImageOps
from app.model_files import resolve_model_file


MODEL_PATH = Path(__file__).resolve().parents[1] / "models" / "birefnet-lite-512.onnx"
MODEL_SIZE = (512, 512)


@lru_cache(maxsize=1)
def _birefnet_session():
    model_path = resolve_model_file(
        MODEL_PATH, "BIREFNET_MODEL_URL",
        "16f6a4f726ff851eb6b50b56daf54c426c836a7372f44df21b2065af2d915d23",
    )
    if not model_path.is_file():
        raise RuntimeError(f"BiRefNet 모델 파일을 찾을 수 없습니다: {MODEL_PATH.name}")

    options = ort.SessionOptions()
    options.intra_op_num_threads = 2
    options.inter_op_num_threads = 1
    options.execution_mode = ort.ExecutionMode.ORT_SEQUENTIAL
    options.graph_optimization_level = ort.GraphOptimizationLevel.ORT_ENABLE_BASIC
    return ort.InferenceSession(
        str(model_path),
        sess_options=options,
        providers=["CPUExecutionProvider"],
    )


def _predict_alpha(image: Image.Image) -> Image.Image:
    resized = image.resize(MODEL_SIZE, Image.Resampling.LANCZOS)
    pixels = np.asarray(resized, dtype=np.float32) / 255.0
    pixels -= np.asarray([0.485, 0.456, 0.406], dtype=np.float32)
    pixels /= np.asarray([0.229, 0.224, 0.225], dtype=np.float32)
    input_tensor = np.transpose(pixels, (2, 0, 1))[None, ...]

    session = _birefnet_session()
    logits = session.run(
        [session.get_outputs()[0].name],
        {session.get_inputs()[0].name: input_tensor},
    )[0][0, 0]
    logits = np.clip(logits, -80, 80)
    alpha = 1.0 / (1.0 + np.exp(-logits))
    mask = Image.fromarray(np.uint8(np.clip(alpha * 255.0, 0, 255)))
    return mask.resize(image.size, Image.Resampling.BILINEAR)


def prepare_closet_image(image_bytes: bytes) -> bytes:
    """Remove the photo background and return a centered white-background JPEG."""
    with Image.open(BytesIO(image_bytes)) as source:
        source = ImageOps.exif_transpose(source).convert("RGB")

    cutout = source.convert("RGBA")
    cutout.putalpha(_predict_alpha(source))

    bounds_mask = cutout.getchannel("A").point(
        lambda value: 255 if value > 24 else 0
    )
    bounds = bounds_mask.getbbox()
    if bounds is None:
        raise ValueError("옷 영역을 찾지 못했어요. 옷 전체가 보이게 다시 촬영해주세요.")

    left, top, right, bottom = bounds
    garment_width, garment_height = right - left, bottom - top
    padding_x = max(12, round(garment_width * 0.08))
    padding_y = max(12, round(garment_height * 0.06))
    crop = cutout.crop((
        max(0, left - padding_x),
        max(0, top - padding_y),
        min(cutout.width, right + padding_x),
        min(cutout.height, bottom + padding_y),
    ))

    canvas_size = (768, 1024)
    garment = ImageOps.contain(crop, canvas_size, method=Image.Resampling.LANCZOS)
    canvas = Image.new("RGBA", canvas_size, (255, 255, 255, 255))
    x = (canvas.width - garment.width) // 2
    y = (canvas.height - garment.height) // 2
    canvas.alpha_composite(garment, (x, y))

    output = BytesIO()
    canvas.convert("RGB").save(
        output,
        format="JPEG",
        quality=92,
        optimize=True,
        progressive=True,
    )
    return output.getvalue()
