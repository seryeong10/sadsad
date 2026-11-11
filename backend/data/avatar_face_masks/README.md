# Face-only avatar masks

These PNGs are semantic face masks for the 18 shipped body selections and the
two default avatars. They contain no user photographs. `index.json` binds each
mask to the SHA-256 of the exact original avatar file.

White pixels permit edits to facial skin, eyebrows, eyes, nose and lips.
Hair, ears, accessories, neck, clothing and background remain black. A small
inward boundary margin protects hair and neck edges. Final blending feathers
inside this boundary; it never expands the editable region.

Rebuild after changing avatar assets:

```powershell
backend/.venv/Scripts/python.exe deployment/build-avatar-face-masks.py
```

The builder requires CPU PyTorch, torchvision, facenet-pytorch and the existing
`backend/models/79999_iter.pth` checkpoint. Inspect an overlay before publishing
new masks. Unknown source files use runtime face detection and parsing; failure
returns an error instead of falling back to a head/body rectangle.

The face parser uses the checkpoint's original ResNet8/context8 fusion, separately
from the existing personal-color pipeline. Source architecture:
https://github.com/zllrunning/face-parsing.PyTorch/blob/master/model.py

The output canvas always comes from the original avatar, including its alpha
after background debris cleanup. Only generated facial RGB pixels are blended
back. The API's temporary 1024x1536 transport canvas is not the final output size.
