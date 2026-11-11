"""Import approved, manually matched product photos. Never guess image URLs."""
import argparse
from datetime import datetime, timezone
from io import BytesIO
import json
from pathlib import Path
from urllib.error import HTTPError
from urllib.parse import urlsplit
from urllib.request import Request, urlopen, build_opener, HTTPRedirectHandler
from urllib.robotparser import RobotFileParser

from PIL import Image, ImageOps

ROOT = Path(__file__).resolve().parents[1]
AGENT = "AVATA-Thumbnail-Importer/1.0"
MAX_BYTES = 12 * 1024 * 1024


class NoImageRedirect(HTTPRedirectHandler):
    def redirect_request(self, req, fp, code, msg, headers, newurl):
        raise PermissionError("Redirected image URL requires a separate source review")


def read_source(source: str, manifest_directory: Path) -> bytes:
    if not source.startswith("https://"):
        path = Path(source)
        if not path.is_absolute():
            path = manifest_directory / path
        if path.stat().st_size > MAX_BYTES:
            raise ValueError("Image exceeds 12 MB")
        return path.read_bytes()
    parsed = urlsplit(source)
    if parsed.username or parsed.password or parsed.port not in (None, 443):
        raise ValueError("Invalid HTTPS image URL")
    robots_url = f"https://{parsed.netloc}/robots.txt"
    robots = RobotFileParser(robots_url)
    try:
        with urlopen(Request(robots_url, headers={"User-Agent": AGENT}), timeout=15) as response:
            robots.parse(response.read(1024 * 1024).decode("utf-8", errors="replace").splitlines())
        if not robots.can_fetch(AGENT, source):
            raise PermissionError("Image access disallowed by robots policy")
    except HTTPError as exc:
        if exc.code != 404:
            raise PermissionError(f"Cannot verify robots policy: HTTP {exc.code}") from exc
    with build_opener(NoImageRedirect()).open(Request(source, headers={"User-Agent": AGENT}), timeout=20) as response:
        data = response.read(MAX_BYTES + 1)
    if len(data) > MAX_BYTES:
        raise ValueError("Image exceeds 12 MB")
    return data


def normalize_image(data: bytes) -> bytes:
    with Image.open(BytesIO(data)) as source:
        image = ImageOps.exif_transpose(source).convert("RGBA")
    image = ImageOps.contain(image, (464, 464), Image.Resampling.LANCZOS)
    canvas = Image.new("RGBA", (512, 512), "white")
    canvas.alpha_composite(image, ((512 - image.width) // 2, (512 - image.height) // 2))
    output = BytesIO()
    canvas.convert("RGB").save(output, format="PNG")
    return output.getvalue()


def import_images(catalog: Path, manifest: Path, assets: Path, report: Path, apply=False):
    products = json.loads(catalog.read_text(encoding="utf-8-sig"))
    approvals = json.loads(manifest.read_text(encoding="utf-8"))
    records, changed = [], False
    for product in products:
        product_id = product["id"]
        entry = approvals.get(product_id, {})
        record = {"id": product_id, "name": product["name"], "product_url": product["product_url"]}
        if entry.get("permission") not in ("owned", "licensed") or not entry.get("permission_basis"):
            record["status"] = "permission_not_confirmed"
        elif (entry.get("product_match_verified") is not True
              or entry.get("product_url") != product["product_url"]):
            record["status"] = "product_match_not_verified"
        elif not entry.get("source"):
            record["status"] = "source_missing"
        elif not apply:
            record["status"] = "ready_for_import"
        else:
            try:
                if not product_id.replace("_", "").isalnum():
                    raise ValueError("Invalid product ID")
                data = normalize_image(read_source(entry["source"], manifest.parent))
                assets.mkdir(parents=True, exist_ok=True)
                destination = assets / f"{product_id}.png"
                destination.write_bytes(data)
                product["image_url"] = f"assets/shopping_products/{product_id}.png"
                record.update(status="imported", path=product["image_url"],
                              permission_basis=entry["permission_basis"], size=[512, 512])
                changed = True
            except Exception as exc:
                record.update(status="image_import_failed", reason=f"{type(exc).__name__}: {exc}")
        records.append(record)
    if changed:
        catalog.write_text(json.dumps(products, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    report.parent.mkdir(parents=True, exist_ok=True)
    report.write_text(json.dumps({"checked_at": datetime.now(timezone.utc).isoformat(),
                                 "products": records}, ensure_ascii=False, indent=2), encoding="utf-8")
    return records


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--catalog", type=Path, default=ROOT / "backend/data/shopping_products.json")
    parser.add_argument("--apply", action="store_true")
    args = parser.parse_args()
    records = import_images(args.catalog, args.manifest,
                            ROOT / "frontend/assets/shopping_products",
                            ROOT / "backend/data/shopping_image_report.json", args.apply)
    from collections import Counter
    print(json.dumps(dict(Counter(row["status"] for row in records))))
