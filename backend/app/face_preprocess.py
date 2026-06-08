"""
얼굴 이미지 전처리 파이프라인
1. MTCNN 얼굴 검출 + 20% margin crop
2. BiSeNet 피부 마스킹 (skin/ear/nose/neck 외 → 회색 128)
3. Resize 256 → CenterCrop 224 → ImageNet 정규화
출력: (1, 3, 224, 224) 텐서
"""

from __future__ import annotations

from functools import lru_cache
from io import BytesIO

import numpy as np
import torch
import torch.nn as nn
import torchvision.transforms as T
from PIL import Image, ImageOps

# ─── BiSeNet (face-parsing.PyTorch, 19-class CelebAMask-HQ compatible) ────────

class _ConvBnRelu(nn.Module):
    def __init__(self, in_ch, out_ch, ks=3, stride=1, pad=1, dilation=1):
        super().__init__()
        self.layers = nn.Sequential(
            nn.Conv2d(in_ch, out_ch, ks, stride=stride, padding=pad,
                      dilation=dilation, bias=False),
            nn.BatchNorm2d(out_ch),
            nn.ReLU(inplace=True),
        )
    def forward(self, x):
        return self.layers(x)


class _AttentionRefinementModule(nn.Module):
    def __init__(self, in_ch, out_ch):
        super().__init__()
        self.conv = _ConvBnRelu(in_ch, out_ch)
        self.conv_atten = nn.Conv2d(out_ch, out_ch, 1, bias=False)
        self.bn_atten = nn.BatchNorm2d(out_ch)
        self.sigmoid = nn.Sigmoid()

    def forward(self, x):
        feat = self.conv(x)
        atten = feat.mean(dim=(2, 3), keepdim=True)
        atten = self.sigmoid(self.bn_atten(self.conv_atten(atten)))
        return feat * atten


class _FeatureFusionModule(nn.Module):
    def __init__(self, in_ch, out_ch):
        super().__init__()
        self.convblk = _ConvBnRelu(in_ch, out_ch)
        self.conv1 = nn.Conv2d(out_ch, out_ch // 4, 1, bias=False)
        self.conv2 = nn.Conv2d(out_ch // 4, out_ch, 1, bias=False)
        self.relu = nn.ReLU(inplace=True)
        self.sigmoid = nn.Sigmoid()

    def forward(self, sp, cp):
        fcat = torch.cat([sp, cp], dim=1)
        feat = self.convblk(fcat)
        atten = feat.mean(dim=(2, 3), keepdim=True)
        atten = self.sigmoid(self.conv2(self.relu(self.conv1(atten))))
        return feat + feat * atten


class _BiSeNetOutput(nn.Module):
    def __init__(self, in_ch, mid_ch, n_classes):
        super().__init__()
        self.conv = _ConvBnRelu(in_ch, mid_ch)
        self.conv_out = nn.Conv2d(mid_ch, n_classes, 1, bias=False)

    def forward(self, x):
        return self.conv_out(self.conv(x))


class _SpatialPath(nn.Module):
    def __init__(self):
        super().__init__()
        self.conv1 = _ConvBnRelu(3, 64, stride=2)
        self.conv2 = _ConvBnRelu(64, 128, stride=2)
        self.conv3 = _ConvBnRelu(128, 256, stride=2)

    def forward(self, x):
        return self.conv3(self.conv2(self.conv1(x)))


class _ContextPath(nn.Module):
    def __init__(self):
        super().__init__()
        import torchvision.models as tvm
        resnet = tvm.resnet18(weights=None)
        self.conv1 = resnet.conv1
        self.bn1 = resnet.bn1
        self.relu = resnet.relu
        self.maxpool = resnet.maxpool
        self.layer1 = resnet.layer1
        self.layer2 = resnet.layer2
        self.layer3 = resnet.layer3
        self.layer4 = resnet.layer4
        self.arm16 = _AttentionRefinementModule(256, 128)
        self.arm32 = _AttentionRefinementModule(512, 128)
        self.conv_head32 = _ConvBnRelu(128, 128)
        self.conv_head16 = _ConvBnRelu(128, 128)
        self.conv_avg = _ConvBnRelu(512, 128)

    def forward(self, x):
        x = self.relu(self.bn1(self.conv1(x)))
        x = self.maxpool(x)
        x = self.layer1(x)
        feat8 = self.layer2(x)
        feat16 = self.layer3(feat8)
        feat32 = self.layer4(feat16)
        avg = self.conv_avg(feat32.mean(dim=(2, 3), keepdim=True))
        feat32_arm = self.arm32(feat32)
        feat32_sum = feat32_arm + avg
        feat32_up = nn.functional.interpolate(feat32_sum, scale_factor=2, mode='nearest')
        feat32_up = self.conv_head32(feat32_up)
        feat16_arm = self.arm16(feat16)
        feat16_sum = feat16_arm + feat32_up
        feat16_up = nn.functional.interpolate(feat16_sum, scale_factor=2, mode='nearest')
        feat16_up = self.conv_head16(feat16_up)
        return feat16_up, feat32_up


class BiSeNet(nn.Module):
    """face-parsing.PyTorch 호환 BiSeNet (19-class CelebAMask-HQ)"""

    def __init__(self, n_classes: int = 19):
        super().__init__()
        self.cp = _ContextPath()
        self.ffm = _FeatureFusionModule(256 + 128, 256)
        self.conv_out = _BiSeNetOutput(256, 256, n_classes)
        self.conv_out16 = _BiSeNetOutput(128, 64, n_classes)
        self.conv_out32 = _BiSeNetOutput(128, 64, n_classes)
        self.sp = _SpatialPath()

    def forward(self, x):
        h, w = x.shape[2:]
        feat_cp16, feat_cp32 = self.cp(x)
        feat_sp = self.sp(x)
        feat_fuse = self.ffm(feat_sp, feat_cp16)
        out = self.conv_out(feat_fuse)
        out = nn.functional.interpolate(out, size=(h, w), mode='bilinear', align_corners=False)
        if self.training:
            out16 = self.conv_out16(feat_cp16)
            out32 = self.conv_out32(feat_cp32)
            out16 = nn.functional.interpolate(out16, size=(h, w), mode='bilinear', align_corners=False)
            out32 = nn.functional.interpolate(out32, size=(h, w), mode='bilinear', align_corners=False)
            return out, out16, out32
        return out


# ─── 설정 ──────────────────────────────────────────────────────────────────────

# 남길 CelebAMask-HQ 라벨: skin(1), l_ear(7), r_ear(8), nose(10), neck(14)
SKIN_LABELS = {1, 7, 8, 10, 14}
GRAY_VALUE = 128 / 255.0

_NORMALIZE = T.Compose([
    T.Resize(256),
    T.CenterCrop(224),
    T.ToTensor(),
    T.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225]),
])

_BISENET_INPUT = T.Compose([
    T.Resize((512, 512)),
    T.ToTensor(),
    T.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225]),
])


# ─── 모델 로더 (경로별 캐시) ────────────────────────────────────────────────────

@lru_cache(maxsize=4)
def _load_bisenet(ckpt_path: str) -> BiSeNet:
    model = BiSeNet(n_classes=19)
    state = torch.load(ckpt_path, map_location="cpu", weights_only=False)
    if isinstance(state, dict) and "state_dict" in state:
        state = state["state_dict"]
    model.load_state_dict(state)
    model.eval()
    return model


@lru_cache(maxsize=1)
def _load_mtcnn():
    from facenet_pytorch import MTCNN
    return MTCNN(keep_all=False, device="cpu")


# ─── 전처리 함수 ────────────────────────────────────────────────────────────────

def preprocess_face_image(
    image_bytes: bytes,
    bisenet_ckpt: str,
) -> torch.Tensor:
    """
    Parameters
    ----------
    image_bytes  : 원본 이미지 바이트
    bisenet_ckpt : BiSeNet 체크포인트 경로 (.pth)

    Returns
    -------
    torch.Tensor  shape (1, 3, 224, 224), ImageNet 정규화 완료

    Raises
    ------
    ValueError : 얼굴이 검출되지 않은 경우
    """
    # 1. 이미지 로드
    image = Image.open(BytesIO(image_bytes))
    image = ImageOps.exif_transpose(image).convert("RGB")

    # 2. MTCNN 얼굴 검출 + 20% margin crop
    mtcnn = _load_mtcnn()
    boxes, _ = mtcnn.detect(image)
    if boxes is None or len(boxes) == 0:
        raise ValueError("얼굴을 검출하지 못했습니다. 정면 사진을 사용해주세요.")

    x1, y1, x2, y2 = boxes[0]
    w, h = x2 - x1, y2 - y1
    margin = 0.2
    x1 = max(0, x1 - w * margin)
    y1 = max(0, y1 - h * margin)
    x2 = min(image.width, x2 + w * margin)
    y2 = min(image.height, y2 + h * margin)
    face = image.crop((int(x1), int(y1), int(x2), int(y2)))

    # 3. BiSeNet 피부 마스킹
    bisenet = _load_bisenet(bisenet_ckpt)
    inp = _BISENET_INPUT(face).unsqueeze(0)
    with torch.no_grad():
        logits = bisenet(inp)
    parsing = logits.argmax(dim=1).squeeze(0).cpu().numpy()

    face_np = np.array(face.resize((512, 512))).astype(np.float32) / 255.0
    skin_mask = np.isin(parsing, list(SKIN_LABELS))
    face_masked = np.where(skin_mask[:, :, None], face_np, GRAY_VALUE)
    face_pil = Image.fromarray((face_masked * 255).astype(np.uint8))

    # 4. Resize 256 → CenterCrop 224 → ImageNet 정규화
    tensor = _NORMALIZE(face_pil).unsqueeze(0)  # (1, 3, 224, 224)
    return tensor
