import csv
import json
import sys
import tempfile
import unittest
from collections import Counter
from pathlib import Path
from unittest.mock import patch

import numpy as np
from PIL import Image

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from app import main


class ExhibitionRegressionTests(unittest.TestCase):
    def test_detached_avatar_debris_is_removed_without_changing_person(self):
        data = np.zeros((100, 100, 4), dtype=np.uint8)
        data[10:90, 30:70] = [120, 90, 70, 255]
        data[40:43, 5:8] = [10, 10, 10, 255]
        cleaned = np.array(main._clean_avatar_alpha(Image.fromarray(data)))
        np.testing.assert_array_equal(cleaned[10:90, 30:70], data[10:90, 30:70])
        self.assertEqual(int(cleaned[40:43, 5:8, 3].sum()), 0)

    def test_retailer_category_beats_styling_words_in_title(self):
        item = main._naver_public_item({"title": "데님 자켓 코디 와이드 팬츠", "category3": "바지"}, "코트")
        self.assertEqual(item["item_type"], "하의")
        item = main._naver_public_item({"title": "청바지 코디 니트", "category3": "니트"}, "아우터")
        self.assertEqual(item["item_type"], "상의")

    def test_seven_per_category_and_unworn_photos_first(self):
        with tempfile.TemporaryDirectory() as folder:
            root = Path(folder)
            (root / "data").mkdir()
            rows, audits = [], {}
            for category in ("상의", "하의", "아우터"):
                for i in range(10):
                    url = f"https://example.com/{category}/{i}.jpg"
                    rows.append({"title": f"남성 {category} {i}", "category2": "남성의류", "category3": category, "image": url, "link": url})
                    audits[url] = {"category": category, "photo_type": "flat-lay" if i >= 5 else "model"}
            with (root / "structured_clothes_data.csv").open("w", encoding="utf-8", newline="") as output:
                writer = csv.DictWriter(output, fieldnames=list(rows[0]))
                writer.writeheader()
                writer.writerows(rows)
            (root / "data/product_image_audit.json").write_text(json.dumps(audits), encoding="utf-8")
            with patch.object(main, "ROOT_DIR", root), patch.object(main, "retrieve_style_context", return_value={}), patch.object(main, "_score_naver_item", return_value={"recommendation_score": 1}), patch.object(main, "_catalog_image_available", return_value=True):
                items = main._recommend_catalog_outfits("데일리", "캐주얼", "male", "", "", "", 21)
            self.assertEqual(Counter(item["item_type"] for item in items), {"상의": 7, "하의": 7, "아우터": 7})
            for category in ("상의", "하의", "아우터"):
                photos = [item["photo_type"] for item in items if item["item_type"] == category]
                self.assertEqual(photos[:5], ["flat-lay"] * 5)


if __name__ == "__main__":
    unittest.main()
