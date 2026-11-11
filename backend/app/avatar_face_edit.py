"""Face-only editing with an immutable, full-resolution avatar as the output base."""
from dataclasses import dataclass
from io import BytesIO
from pathlib import Path
import os
import hashlib
import json

import numpy as np
from PIL import Image
from scipy import ndimage


FACE_LABELS = {1, 2, 3, 4, 5, 10, 11, 12, 13}
PROMPT_PATH = Path(__file__).with_name("prompts") / "avatar_face_edit.txt"
MASK_ROOT = Path(__file__).resolve().parents[1] / "data/avatar_face_masks"


def face_edit_prompt() -> str:
    """Keep the user's identity instructions; adapt only transport framing."""
    prompt = PROMPT_PATH.read_text(encoding="utf-8").strip()
    prompt = prompt.replace("This is the original full-body avatar selected by the user.",
        "This is a tightly cropped facial portrait of the avatar selected by the user. The full body is stored separately and preserved by local compositing.")
    prompt = prompt.replace("The complete body, including the top of the head and both feet, must remain visible.",
        "Only the face already present in this portrait crop must remain visible at exactly the same scale and position. Never draw a miniature person, body, torso, clothes or feet inside the facial region.")
    return prompt + "\n\nOUTPUT SCOPE: Edit the existing large face in Image 1 at its current scale. Return the same facial portrait crop, never a full-body image. Body preservation is performed outside this API."


def png_bytes(image: Image.Image) -> bytes:
    output = BytesIO()
    image.save(output, format="PNG")
    return output.getvalue()


def clean_avatar_alpha(image: Image.Image) -> Image.Image:
    """Clear silhouette debris in alpha only; never recolor the avatar."""
    rgba = np.array(image.convert("RGBA"))
    core = ndimage.binary_opening(rgba[:, :, 3] > 128, iterations=2)
    labels, count = ndimage.label(core)
    if not count:
        raise ValueError("아바타의 불투명 영역을 찾을 수 없습니다.")
    sizes = np.bincount(labels.ravel())
    sizes[0] = 0
    person = labels == sizes.argmax()
    keep = ndimage.binary_dilation(person, iterations=3)
    rgba[:, :, 3][~keep] = 0
    return Image.fromarray(rgba)


def _face_parser_logits(model, tensor):
    """79999_iter checkpoint's original ResNet8 + context8 fusion.

    Keep this inference path separate from personal-color preprocessing.
    Reference: zllrunning/face-parsing.PyTorch/model.py, BiSeNet.forward.
    """
    import torch
    import torch.nn.functional as F
    cp, resnet = model.cp, model.cp.resnet
    value = resnet.maxpool(resnet.relu(resnet.bn1(resnet.conv1(tensor))))
    feat8 = resnet.layer2(resnet.layer1(value))
    feat16 = resnet.layer3(feat8)
    feat32 = resnet.layer4(feat16)
    avg = cp.conv_avg(feat32.mean(dim=(2, 3), keepdim=True))
    context16 = cp.conv_head32(F.interpolate(cp.arm32(feat32) + avg,
                                           size=feat16.shape[2:], mode="nearest"))
    context8 = cp.conv_head16(F.interpolate(cp.arm16(feat16) + context16,
                                          size=feat8.shape[2:], mode="nearest"))
    fused = model.ffm.convblk(torch.cat([feat8, context8], dim=1))
    attention = fused.mean(dim=(2, 3), keepdim=True)
    # The checkpoint's attention convolutions have no bias parameters.
    attention = F.relu(F.conv2d(attention, model.ffm.conv1.weight))
    attention = torch.sigmoid(F.conv2d(attention, model.ffm.conv2.weight))
    return F.interpolate(model.conv_out(fused + fused * attention),
                         size=tensor.shape[2:], mode="bilinear", align_corners=True)


def parse_avatar_face(image: Image.Image) -> np.ndarray:
    """Return original-coordinate parsing labels. Exclude hair/neck/ears/accessories."""
    import torch
    from app.face_preprocess import _load_mtcnn, _load_bisenet, _BISENET_INPUT
    from app.model_files import resolve_model_file

    bounds = image.getchannel("A").getbbox()
    if bounds is None:
        raise ValueError("아바타 이미지가 비어 있습니다.")
    left, top, right, bottom = bounds
    head_box = (left, top, right, min(bottom, top + round((bottom - top) * .35)))
    white = Image.new("RGBA", image.size, "white")
    white.alpha_composite(image)
    head = white.convert("RGB").crop(head_box)
    boxes, probabilities = _load_mtcnn().detect(head)
    valid = [] if boxes is None else [box for box, confidence in zip(boxes, probabilities)
                                     if np.isfinite(confidence) and float(confidence) >= .9]
    if len(valid) != 1:
        raise ValueError("기본 아바타에서 얼굴 하나를 정확히 찾지 못했습니다.")
    x1, y1, x2, y2 = valid[0]
    width, height = x2 - x1, y2 - y1
    crop_box = (max(left, int(left + x1 - width * .15)),
                max(top, int(top + y1 - height * .15)),
                min(right, int(left + x2 + width * .15)),
                min(head_box[3], int(top + y2 + height * .10)))
    backend = Path(__file__).resolve().parents[1]
    configured = Path(os.getenv("BISENET_CKPT_PATH", "models/79999_iter.pth"))
    checkpoint = resolve_model_file(
        configured if configured.is_absolute() else backend / configured,
        "BISENET_MODEL_URL",
        "468e13ca13a9b43cc0881a9f99083a430e9c0a38abd935431d1c28ee94b26567",
    )
    if not checkpoint.is_file():
        raise RuntimeError("얼굴 전용 마스크를 위한 BiSeNet 모델이 없습니다.")
    crop = white.convert("RGB").crop(crop_box)
    with torch.inference_mode():
        logits = _face_parser_logits(_load_bisenet(str(checkpoint)), _BISENET_INPUT(crop).unsqueeze(0))
    labels = logits.argmax(dim=1).squeeze(0).cpu().numpy().astype(np.uint8)
    parsed = Image.fromarray(labels).resize(crop.size, Image.Resampling.NEAREST)
    result = np.zeros((image.height, image.width), dtype=np.uint8)
    result[crop_box[1]:crop_box[3], crop_box[0]:crop_box[2]] = np.array(parsed)
    return result


def face_support(labels: np.ndarray, alpha: np.ndarray) -> np.ndarray:
    mask = np.isin(labels, list(FACE_LABELS)) & (alpha >= 128)
    # Stay inside the detected skin boundary; feathering must never spill into hair.
    mask = ndimage.binary_erosion(mask, iterations=1)
    if int(mask.sum()) < 32:
        raise ValueError("머리카락과 목을 제외한 얼굴 영역을 찾지 못했습니다.")
    return mask


@dataclass
class FaceEditInputs:
    original: Image.Image
    support: np.ndarray
    api_base: bytes
    api_mask: bytes
    api_size: tuple[int, int]
    paste_box: tuple[int, int, int, int]
    source_box: tuple[int, int, int, int]


def prepare_face_edit(base_bytes: bytes) -> FaceEditInputs:
    original = clean_avatar_alpha(Image.open(BytesIO(base_bytes)).convert("RGBA"))
    index_path = MASK_ROOT / "index.json"
    index = json.loads(index_path.read_text(encoding="utf-8")) if index_path.is_file() else {}
    entry = index.get(hashlib.sha256(base_bytes).hexdigest())
    if entry:
        mask = Image.open(MASK_ROOT / entry["mask"]).convert("L")
        if mask.size != original.size:
            raise RuntimeError("기본 아바타와 얼굴 마스크 해상도가 다릅니다.")
        support = (np.array(mask) > 0) & (np.array(original.getchannel("A")) >= 128)
        if int(support.sum()) < 32:
            raise RuntimeError("기본 아바타의 얼굴 마스크가 비어 있습니다.")
    else:
        labels = parse_avatar_face(original)
        support = face_support(labels, np.array(original.getchannel("A")))
    # This is a portrait edit: send only facial context, never the full body.
    # The original body remains local and cannot be redrawn by the image model.
    ys, xs = np.where(support)
    margin = max(2, round((xs.max() - xs.min() + 1) * .12))
    source_box = (max(0, int(xs.min()) - margin), max(0, int(ys.min()) - margin),
                  min(original.width, int(xs.max()) + 1 + margin), int(ys.max()) + 1)
    portrait = original.crop(source_box)
    api_size = (1024, 1024)
    scale = min(api_size[0] / portrait.width, api_size[1] / portrait.height)
    size = (max(1, round(portrait.width * scale)), max(1, round(portrait.height * scale)))
    left, top = (api_size[0] - size[0]) // 2, (api_size[1] - size[1]) // 2
    canvas = Image.new("RGBA", api_size, (255, 255, 255, 0))
    canvas.paste(portrait.resize(size, Image.Resampling.LANCZOS), (left, top))
    edit_region = Image.fromarray(support.astype(np.uint8) * 255).crop(source_box).resize(size, Image.Resampling.NEAREST)
    full_region = Image.new("L", api_size, 0)
    full_region.paste(edit_region, (left, top))
    mask = Image.new("RGBA", api_size, (0, 0, 0, 255))
    mask.putalpha(Image.fromarray(255 - np.array(full_region)))
    return FaceEditInputs(original, support, png_bytes(canvas), png_bytes(mask), api_size,
                          (left, top, left + size[0], top + size[1]), source_box)


def composite_face_edit(inputs: FaceEditInputs, generated_bytes: bytes) -> bytes:
    generated = Image.open(BytesIO(generated_bytes)).convert("RGBA")
    if generated.size != inputs.api_size:
        raise ValueError("얼굴 합성 결과의 캔버스 크기가 요청과 다릅니다.")
    x1, y1, x2, y2 = inputs.source_box
    face = inputs.original.copy()
    face.paste(generated.crop(inputs.paste_box).resize((x2-x1, y2-y1), Image.Resampling.LANCZOS), (x1, y1))
    distance = ndimage.distance_transform_edt(inputs.support)
    feather_width = max(1.0, min(inputs.original.size) * .003)
    weights = np.minimum(distance / feather_width, 1.0)
    original = np.array(inputs.original)
    edited = np.array(face)
    # Missing/generated transparency must not punch holes through the original.
    weights *= edited[:, :, 3] / 255.0
    rgb = np.round(original[:, :, :3] * (1 - weights[:, :, None])
                   + edited[:, :, :3] * weights[:, :, None]).astype(np.uint8)
    result = original.copy()
    result[inputs.support, :3] = rgb[inputs.support]
    # Preserve the cleaned original alpha exactly, including inside the face.
    return png_bytes(Image.fromarray(result))
