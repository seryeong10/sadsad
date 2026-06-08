from __future__ import annotations

import argparse
import json
from pathlib import Path

from app.outfit_search_rules import get_outfit_search_options
from app.style_recommendation_ruleset import (
    DEFAULT_RULESET_PATH,
    make_ruleset_key,
    split_rule_terms,
)


COLOR_LABEL_TO_KEY = {
    "봄웜": "spring_warm",
    "여쿨": "summer_cool",
    "여름쿨": "summer_cool",
    "가을웜": "autumn_warm",
    "겨쿨": "winter_cool",
    "겨울쿨": "winter_cool",
}
COLOR_KEY_TO_LABEL = {
    value: key
    for key, value in COLOR_LABEL_TO_KEY.items()
    if key in {"봄웜", "여쿨", "가을웜", "겨쿨"}
}

GENDER_LABEL_TO_KEY = {
    "여자": "female",
    "남자": "male",
}
GENDER_KEY_TO_LABEL = {
    value: key
    for key, value in GENDER_LABEL_TO_KEY.items()
}

APP_SITUATION_TO_SOURCE = {
    "데일리": ["캠퍼스·데일리"],
    "여행": ["여행·나들이"],
    "데이트": ["데이트룩"],
    "출근/면접": ["출근룩", "면접·발표룩"],
    "하객룩": ["하객룩"],
    "운동/활동": ["캠퍼스·데일리", "여행·나들이"],
    "파티/모임": ["데이트룩", "하객룩"],
}

APP_MOOD_TO_SOURCE = {
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

APP_SKELETON_TO_SOURCE = {
    "female": {
        "스트레이트": ["스트레이트"],
        "웨이브": ["웨이브"],
        "내추럴": ["내추럴"],
    },
    "male": {
        "스트레이트": ["직사각형", "슬림형"],
        "웨이브": ["슬림형", "둥근형"],
        "내추럴": ["역삼각형", "직사각형"],
    },
}

CLOTHING_TERMS = {
    "티셔츠",
    "셔츠",
    "블라우스",
    "니트",
    "가디건",
    "맨투맨",
    "후디",
    "후드",
    "탑",
    "폴로",
    "팬츠",
    "슬랙스",
    "데님",
    "청바지",
    "스커트",
    "치마",
    "원피스",
    "점프수트",
    "재킷",
    "자켓",
    "블레이저",
    "코트",
    "트렌치",
    "아우터",
    "베스트",
    "조끼",
}

ACCESSORY_TERMS = {
    "로퍼",
    "신발",
    "펌프스",
    "힐",
    "구두",
    "운동화",
    "스니커즈",
    "부츠",
    "샌들",
    "플랫",
    "백",
    "가방",
    "토트",
    "숄더",
    "크로스백",
    "힙색",
    "머플러",
    "스카프",
    "목걸이",
    "이어링",
    "귀걸이",
    "팔찌",
    "벨트",
    "핀",
    "모자",
    "캡",
}

DETAIL_TERMS = {
    "단추",
    "버튼",
    "메탈",
    "체인",
    "레더",
    "프린트",
    "워싱",
    "포켓",
    "원단",
    "소재",
    "디테일",
    "스티치",
    "플리츠",
    "리본",
    "셔링",
    "프릴",
    "레이스",
}

FIT_TERMS = {
    "핏",
    "실루엣",
    "라인",
    "기장",
    "와이드",
    "일자",
    "정핏",
    "슬림",
    "루즈",
    "오버",
    "세미",
    "플레어",
    "A라인",
    "H라인",
    "미디",
    "롱",
    "크롭",
    "하이웨이스트",
    "로우라이즈",
    "테이퍼드",
    "스트레이트",
}

AVOID_DROP_TERMS = {
    "운동화 없는",
    "신발",
    "가방",
    "백",
    "토트",
    "스카프",
    "머플러",
    "목걸이",
    "이어링",
    "색상 4개 이상",
    "관리 어려운",
    "소재",
    "구성",
    "신부보다 화려한 장식",
}


def main() -> None:
    parser = argparse.ArgumentParser(description="Import A-VATA style recommendation ruleset from xlsx.")
    parser.add_argument("xlsx_path", type=Path)
    parser.add_argument("--output", type=Path, default=DEFAULT_RULESET_PATH)
    parser.add_argument("--sheet", default="추천룰셋_1008")
    args = parser.parse_args()

    try:
        import openpyxl
    except ImportError as exc:
        raise RuntimeError("openpyxl이 필요합니다. Codex 번들 Python 또는 openpyxl 설치 환경에서 실행하세요.") from exc

    workbook = openpyxl.load_workbook(args.xlsx_path, read_only=True, data_only=True)
    worksheet = workbook[args.sheet]
    rows = worksheet.iter_rows(values_only=True)
    headers = [str(value).strip() for value in next(rows)]
    source_rules = {}

    for row in rows:
        values = dict(zip(headers, row))
        if not values.get("성별"):
            continue

        gender_label = str(values.get("성별", "")).strip()
        color_label = str(values.get("퍼스널컬러", "")).strip()
        skeleton_type = str(values.get("체형", "")).strip()
        situation = str(values.get("상황", "")).strip()
        mood = str(values.get("무드", "")).strip()
        gender = GENDER_LABEL_TO_KEY.get(gender_label, gender_label)
        personal_color = COLOR_LABEL_TO_KEY.get(color_label, color_label)

        key = make_ruleset_key(
            gender=gender,
            personal_color=personal_color,
            skeleton_type=skeleton_type,
            situation=situation,
            mood=mood,
        )
        recommended_items = _read_terms(values, "좋은 아이템 6개", "추천아이템")
        recommended_colors = _read_terms(values, "좋은 색상 6개", "추천색상")
        recommended_fit = _read_terms(values, "좋은 핏/실루엣 6개", "추천핏")
        recommended_materials = _read_terms(values, "소재/디테일 6개", "소재/디테일")
        avoid = _read_terms(values, "피해야 할 것 6개", "피해야할것")

        source_rules[key] = {
            "id": _rule_id(
                gender=gender,
                personal_color=personal_color,
                skeleton_type=skeleton_type,
                situation=situation,
                mood=mood,
            ),
            "source_key": key,
            "gender": gender,
            "gender_label": gender_label,
            "personal_color": personal_color,
            "personal_color_label": color_label,
            "skeleton_type": skeleton_type,
            "situation": situation,
            "mood": mood,
            "items": _categorize_items(_filter_clothing_terms(recommended_items)),
            "recommended_items": _filter_clothing_terms(recommended_items),
            "colors": recommended_colors,
            "recommended_colors": recommended_colors,
            "fits": _filter_fit_terms(recommended_fit),
            "recommended_fit": _filter_fit_terms(recommended_fit),
            "recommended_materials": recommended_materials,
            "avoid": _filter_avoid_terms(avoid),
            "description": str(values.get("추천기준", "") or "").strip(),
        }

    rules = _build_app_rules(source_rules)

    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(rules, ensure_ascii=False, indent=2), encoding="utf-8")
    print(json.dumps({"output": str(args.output), "count": len(rules)}, ensure_ascii=False))


def _build_app_rules(source_rules: dict[str, dict[str, object]]) -> list[dict[str, object]]:
    app_rules = []
    for gender, skeleton_map in APP_SKELETON_TO_SOURCE.items():
        outfit_options = get_outfit_search_options(gender)
        for personal_color in _dedupe(list(COLOR_LABEL_TO_KEY.values())):
            for app_skeleton, source_skeletons in skeleton_map.items():
                source_skeletons = _dedupe([app_skeleton, *source_skeletons])
                for app_situation, app_moods in outfit_options.items():
                    source_situations = _dedupe([
                        app_situation,
                        *APP_SITUATION_TO_SOURCE.get(app_situation, []),
                    ])
                    for app_mood in app_moods:
                        source_moods = _dedupe([
                            app_mood,
                            *APP_MOOD_TO_SOURCE.get(app_mood, []),
                        ])
                        merged = {
                            "items": {
                                "tops": [],
                                "bottoms": [],
                                "outer": [],
                                "onepiece": [],
                            },
                            "recommended_items": [],
                            "recommended_colors": [],
                            "recommended_fit": [],
                            "recommended_materials": [],
                            "avoid": [],
                            "source_keys": [],
                        }
                        for source_skeleton in source_skeletons:
                            for source_situation in source_situations:
                                for source_mood in source_moods:
                                    key = make_ruleset_key(
                                        gender=gender,
                                        personal_color=personal_color,
                                        skeleton_type=source_skeleton,
                                        situation=source_situation,
                                        mood=source_mood,
                                    )
                                    source = source_rules.get(key)
                                    if not source:
                                        continue
                                    for section, terms in source.get("items", {}).items():
                                        merged["items"].setdefault(section, [])
                                        merged["items"][section].extend(terms)
                                    merged["recommended_items"].extend(source["recommended_items"])
                                    merged["recommended_colors"].extend(source["recommended_colors"])
                                    merged["recommended_fit"].extend(source["recommended_fit"])
                                    merged["recommended_materials"].extend(source["recommended_materials"])
                                    merged["avoid"].extend(source["avoid"])
                                    merged["source_keys"].append(source["source_key"])

                        if not merged["source_keys"]:
                            continue

                        app_rules.append({
                            "id": _rule_id(
                                gender=gender,
                                personal_color=personal_color,
                                skeleton_type=app_skeleton,
                                situation=app_situation,
                                mood=app_mood,
                            ),
                            "key": make_ruleset_key(
                                gender=gender,
                                personal_color=personal_color,
                                skeleton_type=app_skeleton,
                                situation=app_situation,
                                mood=app_mood,
                            ),
                            "gender": gender,
                            "gender_label": GENDER_KEY_TO_LABEL.get(gender, gender),
                            "personal_color": personal_color,
                            "personalColor": COLOR_KEY_TO_LABEL.get(personal_color, personal_color),
                            "skeleton_type": app_skeleton,
                            "bodyType": app_skeleton,
                            "situation": app_situation,
                            "mood": app_mood,
                            "items": {
                                section: _dedupe(values)[:6]
                                for section, values in merged["items"].items()
                            },
                            "recommended_items": _dedupe(merged["recommended_items"])[:8],
                            "colors": _dedupe(merged["recommended_colors"])[:8],
                            "recommended_colors": _dedupe(merged["recommended_colors"])[:8],
                            "fits": _dedupe(merged["recommended_fit"])[:8],
                            "recommended_fit": _dedupe(merged["recommended_fit"])[:8],
                            "recommended_materials": _dedupe(merged["recommended_materials"])[:8],
                            "avoid": _dedupe(merged["avoid"])[:8],
                            "description": "",
                            "source_keys": _dedupe(merged["source_keys"]),
                        })
    return app_rules


def _read_terms(values: dict[str, object], legacy_column: str, numbered_prefix: str) -> list[str]:
    legacy_value = values.get(legacy_column)
    terms = split_rule_terms(legacy_value)
    if terms:
        return terms
    return [
        str(values.get(f"{numbered_prefix}{index}", "") or "").strip()
        for index in range(1, 7)
        if str(values.get(f"{numbered_prefix}{index}", "") or "").strip()
    ]


def _filter_clothing_terms(value: object) -> list[str]:
    terms = split_rule_terms(value)
    return [
        term
        for term in terms
        if _contains_any(term, CLOTHING_TERMS)
        and not _contains_any(term, ACCESSORY_TERMS)
    ]


def _categorize_items(items: list[str]) -> dict[str, list[str]]:
    categorized = {
        "tops": [],
        "bottoms": [],
        "outer": [],
        "onepiece": [],
    }
    for item in items:
        section = _item_section(item)
        if section:
            categorized[section].append(item)
    return {
        section: _dedupe(values)
        for section, values in categorized.items()
    }


def _item_section(item: str) -> str:
    normalized = item.replace(" ", "")
    if any(keyword in normalized for keyword in ["원피스", "드레스", "점프수트"]):
        return "onepiece"
    if any(keyword in normalized for keyword in ["자켓", "재킷", "코트", "가디건", "블레이저", "점퍼", "집업", "로브", "베스트", "조끼"]):
        return "outer"
    if any(keyword in normalized for keyword in ["팬츠", "슬랙스", "데님", "청바지", "스커트", "치마", "반바지", "레깅스", "조거", "카고"]):
        return "bottoms"
    if any(keyword in normalized for keyword in ["블라우스", "셔츠", "티셔츠", "니트", "맨투맨", "후드", "탑", "폴로", "카라티"]):
        return "tops"
    return ""


def _filter_avoid_terms(value: object) -> list[str]:
    terms = split_rule_terms(value)
    result = []
    for term in terms:
        if any(drop in term for drop in AVOID_DROP_TERMS):
            continue
        if len(term) > 18 and not _contains_any(term, CLOTHING_TERMS):
            continue
        result.append(term)
    return result


def _filter_fit_terms(value: object) -> list[str]:
    terms = split_rule_terms(value)
    return [
        term
        for term in terms
        if _contains_any(term, FIT_TERMS)
        and not _contains_any(term, ACCESSORY_TERMS)
        and not _contains_any(term, DETAIL_TERMS)
    ]


def _contains_any(value: str, keywords: set[str]) -> bool:
    return any(keyword in value for keyword in keywords)


def _dedupe(values: list[str]) -> list[str]:
    result = []
    seen = set()
    for value in values:
        if value in seen:
            continue
        seen.add(value)
        result.append(value)
    return result


def _rule_id(
    gender: str,
    personal_color: str,
    skeleton_type: str,
    situation: str,
    mood: str,
) -> str:
    parts = [gender, personal_color, skeleton_type, situation, mood]
    return "_".join(_slug_part(part) for part in parts if _slug_part(part))


def _slug_part(value: str) -> str:
    normalized = str(value or "").strip().lower()
    replacements = {
        "female": "female",
        "male": "male",
        "spring_warm": "spring_warm",
        "summer_cool": "summer_cool",
        "autumn_warm": "autumn_warm",
        "winter_cool": "winter_cool",
        "여자": "female",
        "남자": "male",
        "봄웜": "spring_warm",
        "여쿨": "summer_cool",
        "가을웜": "autumn_warm",
        "겨쿨": "winter_cool",
        "스트레이트": "straight",
        "웨이브": "wave",
        "내추럴": "natural",
        "데일리": "daily",
        "여행": "travel",
        "데이트": "date",
        "출근/면접": "office_interview",
        "하객룩": "guest",
        "운동/활동": "active",
        "파티/모임": "party",
        "단아한": "danah",
    }
    if normalized in replacements:
        return replacements[normalized]
    return "".join(
        character if character.isascii() and character.isalnum() else "_"
        for character in normalized
    ).strip("_")


if __name__ == "__main__":
    main()
