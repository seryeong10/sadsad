"""Build verified face-only PNG masks for the unchanged shipped avatar assets."""
import hashlib
import json
import os
from pathlib import Path
import sys

os.environ.setdefault("OMP_NUM_THREADS", "1")
root = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(root / "backend"))
import torch
import numpy as np
from PIL import Image
from app.avatar_face_edit import MASK_ROOT, clean_avatar_alpha, parse_avatar_face, face_support

torch.set_num_threads(1)
MASK_ROOT.mkdir(parents=True, exist_ok=True)
assets = sorted((root / "frontend/assets/avatars/body_types").glob("*.png"))
assets += sorted((root / "frontend/assets/avatars").glob("*_base.png"))
index = {}
for asset in assets:
    image = clean_avatar_alpha(Image.open(asset))
    labels = parse_avatar_face(image)
    support = face_support(labels, np.array(image.getchannel("A")))
    assert not support[np.isin(labels, [0, 6, 7, 8, 9, 14, 15, 16, 17, 18])].any()
    filename = asset.stem + "_face.png"
    Image.fromarray(support.astype(np.uint8) * 255).save(MASK_ROOT / filename)
    index[hashlib.sha256(asset.read_bytes()).hexdigest()] = {"asset": asset.name, "mask": filename}
    print(asset.name, int(support.sum()), flush=True)
assert len(index) == 20, "Expected all 18 body selections and both default avatars"
(MASK_ROOT / "index.json").write_text(json.dumps(index, indent=2) + "\n", encoding="utf-8")
