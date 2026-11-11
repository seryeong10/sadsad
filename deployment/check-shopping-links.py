"""Check supplied product URLs; a reachable page does not verify availability."""
from concurrent.futures import ThreadPoolExecutor
from datetime import datetime, timezone
from html.parser import HTMLParser
import json
from pathlib import Path
import requests

root = Path(__file__).resolve().parents[1]
products = json.loads((root / "backend/data/shopping_products.json").read_text(encoding="utf-8-sig"))

class Metadata(HTMLParser):
    def __init__(self):
        super().__init__(); self.title = ""; self.in_title = False; self.meta = {}
    def handle_starttag(self, tag, attrs):
        values = dict(attrs)
        if tag == "title": self.in_title = True
        if tag == "meta": self.meta[values.get("property") or values.get("name", "")] = values.get("content", "")
    def handle_endtag(self, tag):
        if tag == "title": self.in_title = False
    def handle_data(self, data):
        if self.in_title: self.title += data

def check(product):
    record = {"id": product["id"], "name": product["name"], "url": product["product_url"], "availability_verified": False}
    try:
        response = requests.get(product["product_url"], timeout=20, allow_redirects=True)
        parser = Metadata(); parser.feed(response.text)
        title = parser.meta.get("og:title") or parser.title
        record.update(status=response.status_code, final_url=response.url, title=title,
                      public_image_candidate=parser.meta.get("og:image") or None)
        if response.status_code in (401, 403, 429): record["result"] = "verification_blocked"
        elif response.status_code >= 400: record["result"] = "http_error"
        elif any(term in title.lower() for term in ["not found", "페이지를 찾을", "존재하지", "접근이", "access denied"]): record["result"] = "invalid_page"
        elif not title: record["result"] = "needs_browser_check"
        else: record["result"] = "reachable_review_title"
    except requests.RequestException as exc:
        record.update(result="connection_error", error=type(exc).__name__)
    print(record["id"], record["result"], record.get("status"), flush=True)
    return record

with ThreadPoolExecutor(max_workers=5) as pool:
    records = list(pool.map(check, products))
report = {"checked_at": datetime.now(timezone.utc).isoformat(), "availability_note": "Link checks do not verify stock, price or image usage rights", "products": records}
target = root / ".tmp/shopping-http-check.json"
target.parent.mkdir(parents=True, exist_ok=True)
target.write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")
