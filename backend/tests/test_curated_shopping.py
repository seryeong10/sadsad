import sys
from pathlib import Path
from collections import Counter
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from app import main


class CuratedShoppingTests(unittest.TestCase):
    def recommend(self, gender, **kwargs):
        with patch.object(main, "retrieve_style_context", return_value={}), patch.object(main.requests, "get", side_effect=AssertionError("Recommendations must not fetch a shopping API")):
            return main._recommend_json_outfits("데일리", "캐주얼", gender, "", "", "", 21, **kwargs)

    def test_seven_per_category_and_gender_for_both_users(self):
        for gender in ("male", "female"):
            items = self.recommend(gender)
            self.assertEqual(Counter(item["item_type"] for item in items), {"상의": 7, "하의": 7, "아우터": 7})
            self.assertTrue(all(item["image_id"].startswith(gender + "_") for item in items))
            self.assertEqual(len({item["link"] for item in items}), 21)
            self.assertTrue(all(item["photo_type"] == "flat-lay" for item in items))
        self.assertTrue(any("스커트" in item["title"] for item in self.recommend("female")))

    def test_refresh_uses_all_three_unseen_products_per_category_first(self):
        for gender in ("male", "female"):
            first = self.recommend(gender)
            ids = {item["image_id"] for item in first}
            second = self.recommend(gender, refresh_seed="next", exclude_ids=ids)
            fresh = [item for item in second if item["image_id"] not in ids]
            self.assertEqual(Counter(item["item_type"] for item in fresh), {"상의": 3, "하의": 3, "아우터": 3})

    def test_unknown_information_stays_unknown_and_urls_are_exact(self):
        import json
        source = {row["id"]: row for row in json.loads((main.ROOT_DIR / "data/shopping_products.json").read_text(encoding="utf8"))}
        for item in self.recommend("female") + self.recommend("male"):
            row = source[item["image_id"]]
            self.assertEqual(item["link"], row["product_url"])
            self.assertEqual(item["product_url"], row["product_url"])
            self.assertEqual(item["image_url"], row["image_url"])
            self.assertTrue((main.ROOT_DIR.parent / "frontend" / item["image_url"]).is_file())
            self.assertEqual(item["price"], "")
            self.assertEqual(item["color"], "")
            self.assertIs(item["availability_verified"], False)

    def test_existing_profile_scorer_is_used(self):
        with patch.object(main, "retrieve_style_context", return_value={}), patch.object(main, "_score_naver_item", wraps=main._score_naver_item) as scorer:
            main._recommend_json_outfits("출근/면접", "미니멀", "male", "winter_cool", "스트레이트", "", 21)
        self.assertEqual(scorer.call_count, 30)
        self.assertTrue(all(call.args[1:6] == ("출근/면접", "미니멀", "male", "winter_cool", "스트레이트") for call in scorer.call_args_list))


if __name__ == "__main__":
    unittest.main()
