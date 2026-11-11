"""Resolve the same model checkpoints in a writable serverless cache."""

import hashlib
import os
from pathlib import Path
from urllib.request import urlopen
from uuid import uuid4


def resolve_model_file(local_path: Path, url_variable: str, sha256: str = "") -> Path:
    if local_path.is_file():
        return local_path
    url = os.getenv(url_variable, "")
    if not url:
        return local_path
    if not url.startswith("https://"):
        raise ValueError(f"{url_variable} must use HTTPS")
    cache = Path(os.getenv("AVATA_MODEL_CACHE", "/tmp/avata-models"))
    cache.mkdir(parents=True, exist_ok=True)
    target = cache / local_path.name
    if target.is_file():
        return target
    temporary = cache / f"{local_path.name}.{uuid4().hex}.download"
    digest = hashlib.sha256()
    try:
        with urlopen(url, timeout=60) as response, temporary.open("wb") as output:
            size = 0
            while chunk := response.read(1024 * 1024):
                size += len(chunk)
                if size > 256 * 1024 * 1024:
                    raise ValueError("Model checkpoint exceeds 256 MB")
                output.write(chunk)
                digest.update(chunk)
        if sha256 and digest.hexdigest().lower() != sha256.lower():
            raise ValueError(f"Model checkpoint checksum mismatch: {local_path.name}")
        temporary.replace(target)
    finally:
        temporary.unlink(missing_ok=True)
    return target
