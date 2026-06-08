from __future__ import annotations

import json
from functools import lru_cache
from pathlib import Path


ROOT_DIR = Path(__file__).resolve().parents[1]
DEFAULT_RULESET_PATH = ROOT_DIR / "data" / "style_recommendation_ruleset.json"


GENDER_LABELS = {
    "female": "여자",
    "male": "남자",
}

PERSONAL_COLOR_LABELS = {
    "spring_warm": "봄웜",
    "summer_cool": "여쿨",
    "autumn_warm": "가을웜",
    "winter_cool": "겨쿨",
}

SITUATION_ALIASES = {
    "데일리": ["캠퍼스·데일리"],
    "여행": ["여행·나들이"],
    "데이트": ["데이트룩"],
    "출근/면접": ["출근룩", "면접·발표룩"],
    "하객룩": ["하객룩"],
    "운동/활동": ["캠퍼스·데일리", "여행·나들이"],
    "파티/모임": ["데이트룩", "하객룩"],
}

MOOD_ALIASES = {
    "미니멀": ["미니멀"],
    "캐주얼": ["캐주얼"],
    "꾸안꾸": ["캐주얼", "미니멀"],
    "러블리": ["러블리"],
    "시크": ["시크"],
    "내추럴": ["캐주얼", "단아한"],
    "리조트": ["캐주얼", "단아한"],
    "보헤미안": ["힙·스트릿", "캐주얼"],
    "스포티": ["캐주얼", "힙·스트릿"],
    "포토제닉": ["힙·스트릿", "러블리"],
    "페미닌": ["러블리", "단아한"],
    "로맨틱": ["러블리"],
    "청순": ["단아한", "러블리"],
    "포멀": ["단아한", "미니멀"],
    "클래식": ["단아한", "미니멀"],
    "모던": ["미니멀", "시크"],
    "단정한": ["단아한"],
    "소프트 오피스": ["단아한", "미니멀"],
    "우아한": ["단아한"],
    "세미포멀": ["미니멀", "단아한"],
    "애슬레저": ["캐주얼", "힙·스트릿"],
    "액티브": ["캐주얼", "힙·스트릿"],
    "스트릿": ["힙·스트릿"],
    "고프코어": ["힙·스트릿", "캐주얼"],
    "글램": ["시크", "러블리"],
    "트렌디": ["힙·스트릿", "시크"],
    "키치": ["힙·스트릿", "러블리"],
    "댄디": ["미니멀", "단아한"],
    "남친룩": ["캐주얼", "미니멀"],
    "스마트 캐주얼": ["미니멀", "캐주얼"],
    "아웃도어": ["캐주얼", "힙·스트릿"],
    "시티보이": ["힙·스트릿", "캐주얼"],
}

MALE_SKELETON_ALIASES = {
    "스트레이트": ["직사각형", "슬림형"],
    "웨이브": ["슬림형", "둥근형"],
    "내추럴": ["역삼각형", "직사각형"],
}


def get_style_recommendation_rule(
    gender: str,
    personal_color: str,
    skeleton_type: str,
    situation: str,
    mood: str,
) -> dict[str, object] | None:
    rules = load_style_recommendation_rules()
    for key in candidate_ruleset_keys(
        gender=gender,
        personal_color=personal_color,
        skeleton_type=skeleton_type,
        situation=situation,
        mood=mood,
    ):
        if key in rules:
            rule = dict(rules[key])
            rule["matched_key"] = key
            return rule
    return None


@lru_cache(maxsize=1)
def load_style_recommendation_rules() -> dict[str, dict[str, object]]:
    if not DEFAULT_RULESET_PATH.exists():
        return {}
    data = json.loads(DEFAULT_RULESET_PATH.read_text(encoding="utf-8"))
    return {
        str(rule.get("key", "")): rule
        for rule in data
        if rule.get("key")
    }


def make_ruleset_key(
    gender: str,
    personal_color: str,
    skeleton_type: str,
    situation: str,
    mood: str,
) -> str:
    gender_label = GENDER_LABELS.get(gender, gender)
    color_label = PERSONAL_COLOR_LABELS.get(personal_color, personal_color)
    return "|".join([
        gender_label,
        color_label,
        skeleton_type,
        situation,
        mood,
    ])


def candidate_ruleset_keys(
    gender: str,
    personal_color: str,
    skeleton_type: str,
    situation: str,
    mood: str,
) -> list[str]:
    situation_values = _alias_values(situation, SITUATION_ALIASES)
    mood_values = _alias_values(mood, MOOD_ALIASES)
    skeleton_values = [skeleton_type]
    if gender == "male":
        skeleton_values.extend(MALE_SKELETON_ALIASES.get(skeleton_type, []))

    keys = []
    for skeleton_value in skeleton_values:
        for situation_value in situation_values:
            for mood_value in mood_values:
                keys.append(make_ruleset_key(
                    gender=gender,
                    personal_color=personal_color,
                    skeleton_type=skeleton_value,
                    situation=situation_value,
                    mood=mood_value,
                ))
    return _dedupe_keep_order(keys)


def split_rule_terms(value: object) -> list[str]:
    if isinstance(value, list):
        values = value
    else:
        values = str(value or "").split(",")
    return _dedupe_keep_order(
        str(item).strip()
        for item in values
        if str(item).strip()
    )


def _alias_values(value: str, aliases: dict[str, list[str]]) -> list[str]:
    return _dedupe_keep_order([value, *aliases.get(value, [])])


def _dedupe_keep_order(values) -> list[str]:
    seen = set()
    result = []
    for value in values:
        if value in seen:
            continue
        seen.add(value)
        result.append(value)
    return result
