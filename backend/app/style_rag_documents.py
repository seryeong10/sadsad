from __future__ import annotations

from copy import deepcopy
from typing import Optional

from app.outfit_search_rules import get_outfit_search_keywords
from app.personal_color_model import COLOR_RESULTS
from app.personal_color_palette import get_personal_color_palette
from app.season_style_rules import (
    get_season_search_keywords,
    get_season_style_rules,
    resolve_season,
)
from app.skeleton_style_rules import get_skeleton_style_rules
from app.style_recommendation_ruleset import get_style_recommendation_rule


def retrieve_style_context(
    gender: str,
    personal_color: str,
    skeleton_type: str,
    situation: str,
    mood: str,
    season: str = "",
) -> dict:
    gender_key = "male" if gender == "male" else "female"
    season_key = resolve_season(season) if season.strip() else ""
    context = {
        "query": {
            "gender": gender_key,
            "personal_color": personal_color,
            "skeleton_type": skeleton_type,
            "situation": situation,
            "mood": mood,
            "season": season_key,
        },
        "documents": [],
        "search_keywords": [],
        "recommended_colors": [],
        "avoid_colors": [],
        "recommended_fit": [],
        "recommended_items": [],
        "recommended_materials": [],
        "avoid_skeleton_keywords": [],
        "season": season_key,
        "season_label": "",
        "recommended_season_keywords": [],
        "avoid_season_keywords": [],
        "context_text": "",
    }

    personal_doc = _personal_color_document(gender_key, personal_color)
    if personal_doc:
        context["documents"].append(personal_doc)
        context["recommended_colors"].extend(personal_doc["recommended_colors"])
        context["avoid_colors"].extend(personal_doc["avoid_colors"])

    skeleton_doc = _skeleton_document(gender_key, skeleton_type)
    if skeleton_doc:
        context["documents"].append(skeleton_doc)
        context["recommended_fit"].extend(skeleton_doc["recommended_fit"])
        context["recommended_items"].extend(skeleton_doc["recommended_items"])
        context["recommended_materials"].extend(skeleton_doc["recommended_materials"])
        context["avoid_skeleton_keywords"].extend(skeleton_doc["avoid"])

    mood_doc = _situation_mood_document(gender_key, situation, mood)
    if mood_doc:
        context["documents"].append(mood_doc)
        context["search_keywords"].extend(mood_doc["search_keywords"])

    season_doc = _season_document(gender_key, season_key, situation, mood) if season_key else None
    if season_doc:
        context["documents"].append(season_doc)
        context["season_label"] = season_doc["label"]
        context["recommended_season_keywords"].extend(season_doc["recommended"])
        context["avoid_season_keywords"].extend(season_doc["avoid"])
        context["search_keywords"].extend(season_doc["search_keywords"])

    ruleset_doc = _recommendation_ruleset_document(
        gender=gender_key,
        personal_color=personal_color,
        skeleton_type=skeleton_type,
        situation=situation,
        mood=mood,
    )
    if ruleset_doc:
        context["documents"].append(ruleset_doc)
        context["recommended_colors"].extend(ruleset_doc["recommended_colors"])
        context["recommended_fit"].extend(ruleset_doc["recommended_fit"])
        context["recommended_items"].extend(ruleset_doc["recommended_items"])
        context["avoid_skeleton_keywords"].extend(ruleset_doc["avoid"])
        context["search_keywords"].extend(ruleset_doc["search_keywords"])
        context["ruleset"] = ruleset_doc

    context["recommended_colors"] = _dedupe_keep_order(context["recommended_colors"])
    context["avoid_colors"] = _dedupe_keep_order(context["avoid_colors"])
    context["recommended_fit"] = _dedupe_keep_order(context["recommended_fit"])
    context["recommended_items"] = _dedupe_keep_order(context["recommended_items"])
    context["recommended_materials"] = _dedupe_keep_order(context["recommended_materials"])
    context["avoid_skeleton_keywords"] = _dedupe_keep_order(context["avoid_skeleton_keywords"])
    context["recommended_season_keywords"] = _dedupe_keep_order(context["recommended_season_keywords"])
    context["avoid_season_keywords"] = _dedupe_keep_order(context["avoid_season_keywords"])
    context["search_keywords"] = _dedupe_keep_order(context["search_keywords"])
    context["context_text"] = "\n".join(
        document["text"] for document in context["documents"]
    )
    return context


def _personal_color_document(gender: str, personal_color: str) -> Optional[dict]:
    if not personal_color:
        return None
    try:
        palette = get_personal_color_palette(personal_color, gender=gender)
    except KeyError:
        return None

    result = COLOR_RESULTS.get(personal_color, {})
    display_colors = list(result.get("recommended_colors", []))
    if gender == "male":
        display_colors = list(result.get("male_recommended_colors", display_colors))

    recommended_colors = _dedupe_keep_order([
        *display_colors,
        *palette["recommended"],
    ])
    avoid_colors = _dedupe_keep_order([
        *result.get("avoid_colors", []),
        *palette["avoid"],
    ])
    label = result.get("label", personal_color)
    return {
        "id": f"{gender}_{personal_color}",
        "type": "personal_color",
        "gender": gender,
        "personal_color": personal_color,
        "label": label,
        "display_colors": display_colors[:6],
        "best_hex_colors": palette["best_hex"][:6],
        "recommended_colors": recommended_colors,
        "avoid_colors": avoid_colors,
        "text": (
            f"{gender} {label} 퍼스널 컬러 기준. "
            f"추천 색상은 {', '.join(recommended_colors[:12])}. "
            f"피해야 할 색상은 {', '.join(avoid_colors[:10])}."
        ),
    }


def _skeleton_document(gender: str, skeleton_type: str) -> Optional[dict]:
    if not skeleton_type:
        return None
    try:
        rules = get_skeleton_style_rules(skeleton_type, gender=gender)
    except KeyError:
        return None

    recommended_items = _dedupe_keep_order([
        *rules["recommended_tops"],
        *rules["recommended_bottoms"],
    ])
    return {
        "id": f"{gender}_{skeleton_type}",
        "type": "skeleton",
        "gender": gender,
        "skeleton_type": skeleton_type,
        "recommended_fit": deepcopy(rules["recommended_fit"]),
        "recommended_tops": deepcopy(rules["recommended_tops"]),
        "recommended_bottoms": deepcopy(rules["recommended_bottoms"]),
        "recommended_items": recommended_items,
        "recommended_materials": deepcopy(rules["recommended_materials"]),
        "avoid": deepcopy(rules["avoid"]),
        "text": (
            f"{gender} {skeleton_type} 골격 기준. "
            f"추천 핏은 {', '.join(rules['recommended_fit'])}. "
            f"추천 상의는 {', '.join(rules['recommended_tops'])}. "
            f"추천 하의는 {', '.join(rules['recommended_bottoms'])}. "
            f"추천 소재는 {', '.join(rules['recommended_materials'])}. "
            f"피해야 할 요소는 {', '.join(rules['avoid'])}."
        ),
    }


def _situation_mood_document(gender: str, situation: str, mood: str) -> Optional[dict]:
    try:
        search_keywords = get_outfit_search_keywords(gender, situation, mood)
    except KeyError:
        search_keywords = [f"{_gender_label(gender)} {situation} {mood}"]

    return {
        "id": f"{gender}_{situation}_{mood}",
        "type": "situation_mood",
        "gender": gender,
        "situation": situation,
        "mood": mood,
        "search_keywords": search_keywords,
        "text": (
            f"{gender} {situation}/{mood} 상황 무드 기준. "
            f"네이버 쇼핑 검색어는 {', '.join(search_keywords)}."
        ),
    }


def _season_document(gender: str, season: str, situation: str, mood: str) -> dict:
    rules = get_season_style_rules(gender, season)
    gender_label = _gender_label(gender)
    search_keywords = [
        f"{gender_label} {keyword}"
        for keyword in get_season_search_keywords(gender, season, situation, mood)
    ]
    search_keywords.extend(
        f"{gender_label} {keyword}"
        for keyword in rules["recommended"]
    )
    return {
        "id": f"{gender}_{season}",
        "type": "season",
        "gender": gender,
        "season": season,
        "label": rules["label"],
        "recommended": rules["recommended"],
        "avoid": rules["avoid"],
        "search_keywords": search_keywords,
        "text": (
            f"{gender} {rules['label']} 계절 기준. "
            f"추천 키워드는 {', '.join(rules['recommended'])}. "
            f"피해야 할 키워드는 {', '.join(rules['avoid'])}."
        ),
    }


def _recommendation_ruleset_document(
    gender: str,
    personal_color: str,
    skeleton_type: str,
    situation: str,
    mood: str,
) -> Optional[dict]:
    rule = get_style_recommendation_rule(
        gender=gender,
        personal_color=personal_color,
        skeleton_type=skeleton_type,
        situation=situation,
        mood=mood,
    )
    if not rule:
        return None

    items = list(rule.get("recommended_items", []))
    grouped_items = rule.get("items", {})
    colors = list(rule.get("recommended_colors", []))
    fit = list(rule.get("recommended_fit", []))
    avoid = list(rule.get("avoid", []))
    description = str(rule.get("description", ""))
    search_keywords = _build_ruleset_search_keywords(
        items=items,
        grouped_items=grouped_items if isinstance(grouped_items, dict) else {},
        colors=colors,
        fit=fit,
        situation=situation,
        mood=mood,
    )

    return {
        "id": str(rule.get("id") or rule.get("key", "")),
        "type": "style_ruleset",
        "gender": gender,
        "personal_color": personal_color,
        "skeleton_type": skeleton_type,
        "situation": situation,
        "mood": mood,
        "items": grouped_items if isinstance(grouped_items, dict) else {},
        "recommended_items": items,
        "recommended_colors": colors,
        "recommended_fit": fit,
        "recommended_materials": [],
        "avoid": avoid,
        "description": description,
        "search_keywords": search_keywords,
        "text": (
            f"{gender} {personal_color} {skeleton_type} {situation}/{mood} 조합별 추천 룰셋. "
            f"추천 아이템은 {', '.join(items)}. "
            f"추천 색상은 {', '.join(colors)}. "
            f"추천 핏/실루엣은 {', '.join(fit)}. "
            f"피해야 할 요소는 {', '.join(avoid)}. "
            f"{description}"
        ),
    }


def _build_ruleset_search_keywords(
    items: list[str],
    grouped_items: dict[str, object],
    colors: list[str],
    fit: list[str],
    situation: str,
    mood: str,
) -> list[str]:
    search_items = _preferred_search_items(items, grouped_items)
    short_situation = "하객" if situation == "하객룩" else situation
    keywords = []

    for color, item in zip(colors[:5], search_items[:5]):
        keywords.append(f"{color} {_search_item_name(item)}")

    if search_items:
        keywords.append(f"{short_situation} {_search_item_name(search_items[0])}")
    if len(search_items) > 1:
        keywords.append(f"{mood} {_generic_item_name(search_items[1])}")

    for color in colors[:2]:
        for item in search_items[:2]:
            keywords.append(f"{color} {short_situation} {_generic_item_name(item)}")

    for color, fit_term, item in zip(colors[:3], fit[:3], search_items[:3]):
        keywords.append(f"{color} {fit_term} {_search_item_name(item)}")

    return _dedupe_keep_order(
        _compact_query(keyword)
        for keyword in keywords
        if keyword
    )[:18]


def _preferred_search_items(items: list[str], grouped_items: dict[str, object]) -> list[str]:
    ordered = []
    for section in ["onepiece", "tops", "bottoms", "outer"]:
        values = grouped_items.get(section, [])
        if isinstance(values, list):
            ordered.extend(str(value) for value in values)
    ordered.extend(items)
    return _dedupe_keep_order(item for item in ordered if item)


def _search_item_name(item: str) -> str:
    text = str(item or "").strip()
    replacements = {
        "플레어스커트": "플레어 스커트",
        "A라인스커트": "A라인 스커트",
        "H라인스커트": "H라인 스커트",
        "트위드재킷": "트위드 재킷",
        "트위드자켓": "트위드 자켓",
        "니트탑": "니트 탑",
        "데님팬츠": "데님 팬츠",
        "와이드팬츠": "와이드 팬츠",
        "슬림슬랙스": "슬림 슬랙스",
    }
    return replacements.get(text, text)


def _generic_item_name(item: str) -> str:
    text = _search_item_name(item)
    if "원피스" in text:
        return "원피스"
    if "스커트" in text:
        return "스커트"
    if "재킷" in text or "자켓" in text:
        return "재킷"
    if "블라우스" in text:
        return "블라우스"
    return text


def _compact_query(query: str) -> str:
    tokens = str(query or "").split()
    return " ".join(tokens[:4])


def _gender_label(gender: str) -> str:
    return "남자" if gender == "male" else "여성"


def _dedupe_keep_order(values) -> list[str]:
    seen = set()
    result = []
    for value in values:
        if value in seen:
            continue
        seen.add(value)
        result.append(value)
    return result
