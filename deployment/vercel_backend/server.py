"""Vercel entrypoint: run the existing FastAPI app, without a local PC tunnel."""
import os
import sys
from pathlib import Path

root = Path(__file__).resolve().parent
sys.path.insert(0, str(root / "backend"))
if os.getenv("VERCEL"):
    os.environ.setdefault("HF_HOME", "/tmp/avata-huggingface")
    os.environ.setdefault("AVATA_MODEL_CACHE", "/tmp/avata-models")

from app.main import app
