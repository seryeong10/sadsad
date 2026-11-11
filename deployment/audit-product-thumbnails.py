"""Audit existing catalog photos with vision; never infer photo type from titles."""
import base64
import csv
import json
from concurrent.futures import ThreadPoolExecutor, as_completed
from io import BytesIO
from pathlib import Path

import requests
from dotenv import load_dotenv
from openai import OpenAI
from PIL import Image, ImageOps

root = Path(__file__).resolve().parents[1]
load_dotenv(root / "backend/.env")
client = OpenAI(timeout=45, max_retries=1)
destination = root / "backend/data/product_image_audit.json"
results = json.loads(destination.read_text()) if destination.exists() else {}
rows = list(csv.DictReader((root / "backend/structured_clothes_data.csv").open(encoding="utf-8-sig")))

def audit(row):
    url = row["image"]
    response = requests.get(url, timeout=12)
    response.raise_for_status()
    image = ImageOps.exif_transpose(Image.open(BytesIO(response.content))).convert("RGB")
    image.thumbnail((512, 512))
    stream = BytesIO()
    image.save(stream, format="JPEG", quality=85)
    result = client.chat.completions.create(
        model="gpt-4o-mini", temperature=0,
        response_format={"type": "json_object"},
        messages=[{"role": "user", "content": [
            {"type": "text", "text": (
                "Classify the MAIN garment SOLD in this product photo. Return JSON only: "
                "category: 상의/하의/아우터/원피스/기타; photo_type: flat-lay/model/mixed; "
                "single_garment: boolean. flat-lay means a single unworn garment, including "
                "ghost mannequin or hanger. Any visible human wearing it, even cropped legs "
                "or torso without face, is model. Collages/multiple garments are mixed. "
                "Use the photo to verify category; ignore styling garments in the title. "
                "Product title: " + row["title"] + "; retailer category: " + row["category3"]
            )},
            {"type": "image_url", "image_url": {"url": "data:image/jpeg;base64," + base64.b64encode(stream.getvalue()).decode(), "detail": "low"}},
        ]}],
    )
    value = json.loads(result.choices[0].message.content)
    if value.get("category") not in {"상의", "하의", "아우터", "원피스", "기타"} or value.get("photo_type") not in {"flat-lay", "model", "mixed"}:
        raise ValueError("Invalid audit response")
    return url, value

with ThreadPoolExecutor(max_workers=6) as pool:
    jobs = {pool.submit(audit, row): row for row in rows if row["image"] not in results}
    for future in as_completed(jobs):
        try:
            url, value = future.result()
            results[url] = value
            destination.write_text(json.dumps(results, ensure_ascii=False, indent=2), encoding="utf-8")
        except Exception as exc:
            print("Photo audit failed:", type(exc).__name__, flush=True)
        print("Audited", len(results), "of", len(rows), flush=True)
