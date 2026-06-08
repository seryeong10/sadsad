from __future__ import annotations

import argparse
import json
import re
from pathlib import Path

from dotenv import load_dotenv
from fastapi.testclient import TestClient

try:
    from app.main import app
    from app.outfit_search_rules import get_outfit_search_options
    from app.personal_color_model import COLOR_RESULTS
    from app.personal_color_palette import get_personal_color_palette
    from app.skeleton_style_rules import get_skeleton_style_rules
    from app.style_recommendation_ruleset import get_style_recommendation_rule
except ModuleNotFoundError:
    import sys

    sys.path.append(str(Path(__file__).resolve().parents[1]))
    from app.main import app
    from app.outfit_search_rules import get_outfit_search_options
    from app.personal_color_model import COLOR_RESULTS
    from app.personal_color_palette import get_personal_color_palette
    from app.skeleton_style_rules import get_skeleton_style_rules
    from app.style_recommendation_ruleset import get_style_recommendation_rule


DEFAULT_CASES = [
    {
        "name": "봄웜 스트레이트 데일리 캐주얼",
        "params": {
            "gender": "female",
            "personal_color": "spring_warm",
            "skeleton_type": "스트레이트",
            "situation": "데일리",
            "style": "캐주얼",
            "limit": 6,
        },
    },
    {
        "name": "봄웜 웨이브 데이트 러블리",
        "params": {
            "gender": "female",
            "personal_color": "spring_warm",
            "skeleton_type": "웨이브",
            "situation": "데이트",
            "style": "러블리",
            "limit": 6,
        },
    },
    {
        "name": "여쿨 웨이브 출근 미니멀",
        "params": {
            "gender": "female",
            "personal_color": "summer_cool",
            "skeleton_type": "웨이브",
            "situation": "출근/면접",
            "style": "미니멀",
            "limit": 6,
        },
    },
    {
        "name": "가을웜 내추럴 여행 내추럴",
        "params": {
            "gender": "female",
            "personal_color": "autumn_warm",
            "skeleton_type": "내추럴",
            "situation": "여행",
            "style": "내추럴",
            "limit": 6,
        },
    },
    {
        "name": "겨쿨 스트레이트 파티 시크",
        "params": {
            "gender": "female",
            "personal_color": "winter_cool",
            "skeleton_type": "스트레이트",
            "situation": "파티/모임",
            "style": "시크",
            "limit": 6,
        },
    },
    {
        "name": "가을웜 스트레이트 하객 클래식",
        "params": {
            "gender": "female",
            "personal_color": "autumn_warm",
            "skeleton_type": "스트레이트",
            "situation": "하객룩",
            "style": "클래식",
            "limit": 6,
        },
    },
]


def main() -> None:
    load_dotenv()
    parser = argparse.ArgumentParser(description="Evaluate outfit recommendation samples.")
    parser.add_argument("--all-cases", action="store_true", help="Evaluate every gender/color/skeleton/situation/mood combination.")
    parser.add_argument("--max-cases", type=int, default=0, help="Optional cap for quick all-case runs.")
    parser.add_argument("--limit", type=int, default=6, help="Recommendation count per case.")
    parser.add_argument("--threshold", type=float, default=0.8, help="Precision@K threshold for weak-case reporting.")
    parser.add_argument("--output", default="", help="Optional JSON output path.")
    parser.add_argument("--summary-output", default="", help="Optional Markdown summary output path.")
    parser.add_argument("--quiet", action="store_true", help="Print only final summary.")
    args = parser.parse_args()

    client = TestClient(app)
    results = []
    cases = _all_cases(limit=args.limit) if args.all_cases else DEFAULT_CASES
    if args.max_cases > 0:
        cases = cases[:args.max_cases]

    for index, case in enumerate(cases, start=1):
        if not args.quiet:
            print(f"\n[{index}/{len(cases)}] {case['name']}")
        response = client.get("/recommend-outfits", params=case["params"])
        response.raise_for_status()
        payload = response.json()
        result = {
            "case": case["name"],
            "params": case["params"],
            "source": payload.get("source", ""),
            "count": payload.get("count", 0),
            "items": payload.get("items", []),
        }
        relevance = _relevance_metrics(result)
        result["relevance"] = relevance
        result["metrics"] = _case_metrics(result)
        results.append(result)
        if not args.quiet:
            _print_case(result)

    summary = _summary_metrics(results, threshold=args.threshold)
    _print_summary(summary)

    if args.output:
        output_path = Path(args.output)
        output_path.parent.mkdir(parents=True, exist_ok=True)
        output_path.write_text(
            json.dumps(results, ensure_ascii=False, indent=2),
            encoding="utf-8",
        )
        print(f"\nSaved: {output_path}")

    if args.summary_output:
        summary_path = Path(args.summary_output)
        summary_path.parent.mkdir(parents=True, exist_ok=True)
        summary_path.write_text(_summary_markdown(results, summary), encoding="utf-8")
        print(f"Saved: {summary_path}")


def _print_case(result: dict[str, object]) -> None:
    print(f"\n## {result['case']}")
    print(f"source={result['source']} count={result['count']}")
    metrics = result.get("metrics", {})
    relevance = result.get("relevance", {})
    print(
        "metrics="
        f"positive={metrics.get('positive_reason_count', 0)} "
        f"avoid={metrics.get('avoid_reason_count', 0)} "
        f"avg_score={metrics.get('average_score', 0)} "
        f"precision@k={relevance.get('precision_at_k', 0)}"
    )
    for index, item in enumerate(result.get("items", []), start=1):
        reasons = item.get("recommendation_reasons", [])
        if isinstance(reasons, list):
            reason_text = ", ".join(str(reason) for reason in reasons[:5])
        else:
            reason_text = str(reasons)
        print(
            f"{index}. {item.get('image_id', '')} "
            f"score={item.get('recommendation_score', '')} "
            f"type={item.get('item_type', '')}/{item.get('category', '')} "
            f"color={item.get('color', '')} fit={item.get('fit', '')} "
            f"material={item.get('material', '')} "
            f"relevant={item.get('relevance', {}).get('is_relevant', '')} "
            f"reasons=[{reason_text}]"
        )


def _all_cases(limit: int) -> list[dict[str, object]]:
    colors = ["spring_warm", "summer_cool", "autumn_warm", "winter_cool"]
    skeletons = ["스트레이트", "웨이브", "내추럴"]
    genders = ["female", "male"]
    cases = []

    for gender in genders:
        options = get_outfit_search_options(gender)
        for personal_color in colors:
            for skeleton_type in skeletons:
                for situation, moods in options.items():
                    for mood in moods:
                        cases.append({
                            "name": " ".join([
                                gender,
                                personal_color,
                                skeleton_type,
                                situation,
                                mood,
                            ]),
                            "params": {
                                "gender": gender,
                                "personal_color": personal_color,
                                "skeleton_type": skeleton_type,
                                "situation": situation,
                                "style": mood,
                                "limit": limit,
                            },
                        })

    return cases


def _case_metrics(result: dict[str, object]) -> dict[str, object]:
    items = result.get("items", [])
    scores = [
        int(item.get("recommendation_score", 0) or 0)
        for item in items
        if isinstance(item, dict)
    ]
    avoid_count = 0
    positive_count = 0
    item_types = {}
    for item in items:
        if not isinstance(item, dict):
            continue
        item_type = str(item.get("item_type", "") or "기타")
        item_types[item_type] = item_types.get(item_type, 0) + 1
        reasons = item.get("recommendation_reasons", [])
        if not isinstance(reasons, list):
            reasons = [str(reasons)]
        for reason in reasons:
            reason_text = str(reason)
            if (
                reason_text.startswith("피하기:")
                or reason_text.startswith("피하기색상:")
                or reason_text.startswith("피하기골격:")
                or reason_text.startswith("계절주의:")
                or reason_text.startswith("룰셋주의:")
            ):
                avoid_count += 1
            elif not reason_text.startswith("벡터유사도:"):
                positive_count += 1

    average_score = round(sum(scores) / len(scores), 1) if scores else 0
    return {
        "average_score": average_score,
        "positive_reason_count": positive_count,
        "avoid_reason_count": avoid_count,
        "item_type_distribution": item_types,
    }


def _relevance_metrics(result: dict[str, object]) -> dict[str, object]:
    params = result.get("params", {})
    relevance_set = _build_relevance_set(params)
    relevant_count = 0
    items = result.get("items", [])

    for item in items:
        if not isinstance(item, dict):
            continue
        item_relevance = _score_relevance(item, relevance_set)
        item["relevance"] = item_relevance
        if item_relevance["is_relevant"]:
            relevant_count += 1

    k = len(items)
    return {
        "precision_at_k": round(relevant_count / k, 2) if k else 0,
        "relevant_count": relevant_count,
        "k": k,
        "criteria": relevance_set,
    }


def _build_relevance_set(params: dict[str, object]) -> dict[str, object]:
    gender = str(params.get("gender", "female"))
    personal_color = str(params.get("personal_color", ""))
    skeleton_type = str(params.get("skeleton_type", ""))
    situation = str(params.get("situation", ""))
    style = str(params.get("style", ""))

    recommended_colors = []
    avoid_colors = []
    if personal_color:
        result = COLOR_RESULTS.get(personal_color, {})
        recommended_colors.extend(result.get("recommended_colors", []))
        if gender == "male":
            recommended_colors.extend(result.get("male_recommended_colors", []))
        avoid_colors.extend(result.get("avoid_colors", []))
        try:
            palette = get_personal_color_palette(personal_color, gender=gender)
            recommended_colors.extend(palette.get("recommended", []))
            avoid_colors.extend(palette.get("avoid", []))
        except KeyError:
            pass

    recommended_fit = []
    recommended_items = []
    recommended_materials = []
    avoid_skeleton = []
    if skeleton_type:
        try:
            rules = get_skeleton_style_rules(skeleton_type, gender=gender)
            recommended_fit.extend(rules.get("recommended_fit", []))
            recommended_items.extend(rules.get("recommended_tops", []))
            recommended_items.extend(rules.get("recommended_bottoms", []))
            recommended_materials.extend(rules.get("recommended_materials", []))
            avoid_skeleton.extend(rules.get("avoid", []))
        except KeyError:
            pass

    exact_rule = get_style_recommendation_rule(
        gender=gender,
        personal_color=personal_color,
        skeleton_type=skeleton_type,
        situation=situation,
        mood=style,
    )
    if exact_rule:
        recommended_colors.extend(exact_rule.get("recommended_colors", []))
        recommended_fit.extend(exact_rule.get("recommended_fit", []))
        recommended_items.extend(exact_rule.get("recommended_items", []))
        avoid_skeleton.extend(exact_rule.get("avoid", []))

    return {
        "recommended_colors": _dedupe(recommended_colors),
        "avoid_colors": _dedupe(avoid_colors),
        "recommended_fit": _dedupe(recommended_fit),
        "recommended_items": _dedupe(recommended_items),
        "recommended_materials": _dedupe(recommended_materials),
        "avoid_skeleton": _dedupe(avoid_skeleton),
        "situation": situation,
        "style": style,
        "gender": gender,
    }


def _score_relevance(item: dict[str, object], criteria: dict[str, object]) -> dict[str, object]:
    text = _item_text(item)
    matched = []
    penalties = []
    gender = str(criteria.get("gender", "female"))

    color_matches = _matched_terms(text, criteria.get("recommended_colors", []))
    fit_matches = _matched_terms(text, criteria.get("recommended_fit", []))
    item_matches = _matched_terms(text, criteria.get("recommended_items", []))
    material_matches = _matched_terms(text, criteria.get("recommended_materials", []))
    situation_match = _term_in_text(criteria.get("situation", ""), text)
    style_match = _term_in_text(criteria.get("style", ""), text)

    avoid_color_matches = _matched_terms(text, criteria.get("avoid_colors", []))
    avoid_skeleton_matches = _matched_terms(text, criteria.get("avoid_skeleton", []))

    if color_matches:
        matched.append(f"color:{color_matches[0]}")
    if fit_matches:
        matched.append(f"fit:{fit_matches[0]}")
    if item_matches:
        matched.append(f"item:{item_matches[0]}")
    if material_matches:
        matched.append(f"material:{material_matches[0]}")
    if situation_match:
        matched.append(f"situation:{criteria.get('situation', '')}")
    if style_match:
        matched.append(f"style:{criteria.get('style', '')}")

    penalties.extend(f"avoid_color:{term}" for term in avoid_color_matches[:2])
    penalties.extend(f"avoid_skeleton:{term}" for term in avoid_skeleton_matches[:2])
    if gender == "male" and _is_blocked_male_item(item):
        penalties.append("gender_category")

    score = len(matched) - len(penalties) * 2
    return {
        "is_relevant": score >= 1 and not penalties,
        "score": score,
        "matched": matched,
        "penalties": penalties,
    }


def _item_text(item: dict[str, object]) -> str:
    values = [
        item.get("style", ""),
        item.get("sub_style", ""),
        item.get("item_type", ""),
        item.get("category", ""),
        item.get("color", ""),
        item.get("sub_color", ""),
        item.get("fit", ""),
        item.get("material", ""),
        item.get("print", ""),
        item.get("detail", ""),
        item.get("situation_tags", ""),
        item.get("mood_tags", ""),
    ]
    return _normalize_compact(" ".join(str(value) for value in values if value))


def _is_blocked_male_item(item: dict[str, object]) -> bool:
    text = _normalize_compact(" ".join([
        str(item.get("item_type", "")),
        str(item.get("category", "")),
    ]))
    return any(term in text for term in ["원피스", "드레스", "스커트", "치마", "브라탑"])


def _matched_terms(text: str, terms: object) -> list[str]:
    if not isinstance(terms, list):
        return []
    return [str(term) for term in terms if _term_in_text(term, text)]


def _term_in_text(term: object, text: str) -> bool:
    normalized = _normalize_compact(term)
    if not normalized:
        return False
    if normalized == "셔츠":
        return "셔츠" in text and "티셔츠" not in text
    if normalized in text:
        return True
    tokens = [
        token
        for token in re.split(r"[\s,/·]+", str(term).strip())
        if len(_normalize_compact(token)) >= 2
        and _normalize_compact(token) != normalized
        and _normalize_compact(token) not in _RULESET_MATCH_STOPWORDS
    ]
    return any(_keyword_token_in_text(token, text) for token in tokens)


def _keyword_token_in_text(term: object, text: str) -> bool:
    normalized = _normalize_compact(term)
    if not normalized:
        return False
    if normalized == "셔츠":
        return "셔츠" in text and "티셔츠" not in text
    return normalized in text


def _normalize_compact(value: object) -> str:
    return "".join(str(value).strip().lower().split())


_RULESET_MATCH_STOPWORDS = {
    "너무",
    "과한",
    "많은",
    "없는",
    "있는",
    "느낌",
    "이상",
    "이하",
    "신발과",
    "연결되는",
    "캐주얼",
    "라인",
    "관리",
    "어려운",
    "고급",
    "소재",
    "계절감",
    "통풍",
    "되는",
    "따뜻한",
    "밝은",
    "포인트",
    "자연스러운",
    "불필요한",
    "장식",
    "최소화",
    "실루엣",
    "디테일",
}


def _dedupe(values: list[str]) -> list[str]:
    seen = set()
    result = []
    for value in values:
        if value in seen:
            continue
        seen.add(value)
        result.append(value)
    return result


def _summary_metrics(results: list[dict[str, object]], threshold: float = 0.8) -> dict[str, object]:
    total_cases = len(results)
    total_items = sum(int(result.get("count", 0) or 0) for result in results)
    chroma_cases = sum(1 for result in results if result.get("source") == "chroma_style_rag")
    avoid_reasons = sum(
        int(result.get("metrics", {}).get("avoid_reason_count", 0) or 0)
        for result in results
    )
    positive_reasons = sum(
        int(result.get("metrics", {}).get("positive_reason_count", 0) or 0)
        for result in results
    )
    average_scores = [
        float(result.get("metrics", {}).get("average_score", 0) or 0)
        for result in results
    ]
    precision_values = [
        float(result.get("relevance", {}).get("precision_at_k", 0) or 0)
        for result in results
    ]
    weak_cases = [
        {
            "case": result.get("case", ""),
            "source": result.get("source", ""),
            "precision_at_k": result.get("relevance", {}).get("precision_at_k", 0),
            "relevant_count": result.get("relevance", {}).get("relevant_count", 0),
            "k": result.get("relevance", {}).get("k", 0),
            "average_score": result.get("metrics", {}).get("average_score", 0),
        }
        for result in results
        if float(result.get("relevance", {}).get("precision_at_k", 0) or 0) < threshold
    ]
    weak_cases.sort(key=lambda item: (float(item["precision_at_k"]), float(item["average_score"])))
    return {
        "total_cases": total_cases,
        "total_items": total_items,
        "chroma_cases": chroma_cases,
        "chroma_case_ratio": round(chroma_cases / total_cases, 2) if total_cases else 0,
        "positive_reason_count": positive_reasons,
        "avoid_reason_count": avoid_reasons,
        "average_case_score": round(sum(average_scores) / len(average_scores), 1)
        if average_scores
        else 0,
        "average_precision_at_k": round(
            sum(precision_values) / len(precision_values),
            2,
        )
        if precision_values
        else 0,
        "threshold": threshold,
        "weak_case_count": len(weak_cases),
        "weak_case_ratio": round(len(weak_cases) / total_cases, 2) if total_cases else 0,
        "weak_cases": weak_cases[:30],
    }


def _print_summary(summary: dict[str, object]) -> None:
    print("\n## Summary")
    print(
        f"cases={summary['total_cases']} "
        f"items={summary['total_items']} "
        f"chroma_cases={summary['chroma_cases']} "
        f"avg_case_score={summary['average_case_score']} "
        f"avg_precision@k={summary['average_precision_at_k']} "
        f"below_{summary['threshold']}={summary['weak_case_count']} "
        f"positive_reasons={summary['positive_reason_count']} "
        f"avoid_reasons={summary['avoid_reason_count']}"
    )


def _summary_markdown(
    results: list[dict[str, object]],
    summary: dict[str, object],
) -> str:
    lines = [
        "# ChromaDB mini RAG Recommendation Evaluation",
        "",
        "## Overall",
        "",
        f"- Test cases: {summary['total_cases']}",
        f"- Recommended items: {summary['total_items']}",
        f"- ChromaDB RAG cases: {summary['chroma_cases']} / {summary['total_cases']}",
        f"- Average case score: {summary['average_case_score']}",
        f"- Average Precision@K: {summary['average_precision_at_k']}",
        f"- Cases below {summary['threshold']}: {summary['weak_case_count']}",
        f"- Positive matched reasons: {summary['positive_reason_count']}",
        f"- Avoid/penalty reasons: {summary['avoid_reason_count']}",
        "",
        "## Low Precision Cases",
        "",
    ]

    weak_cases = summary.get("weak_cases", [])
    if weak_cases:
        lines.extend([
            "| Case | Source | Precision@K | Relevant | Avg Score |",
            "|---|---|---:|---:|---:|",
        ])
        for case in weak_cases:
            lines.append(
                f"| {case['case']} | `{case['source']}` | "
                f"{case['precision_at_k']} | "
                f"{case['relevant_count']} / {case['k']} | "
                f"{case['average_score']} |"
            )
    else:
        lines.append("No cases below threshold.")

    lines.extend([
        "",
        "## Cases",
        "",
    ])

    for result in results:
        metrics = result.get("metrics", {})
        relevance = result.get("relevance", {})
        lines.extend([
            f"### {result['case']}",
            "",
            f"- Source: `{result['source']}`",
            f"- Count: {result['count']}",
            f"- Average score: {metrics.get('average_score', 0)}",
            f"- Precision@K: {relevance.get('precision_at_k', 0)} "
            f"({relevance.get('relevant_count', 0)} / {relevance.get('k', 0)})",
            f"- Positive reasons: {metrics.get('positive_reason_count', 0)}",
            f"- Avoid reasons: {metrics.get('avoid_reason_count', 0)}",
            "",
            "| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |",
            "|---:|---|---|---|---|---:|---|---|",
        ])
        for index, item in enumerate(result.get("items", []), start=1):
            reasons = item.get("recommendation_reasons", [])
            if isinstance(reasons, list):
                reason_text = ", ".join(str(reason) for reason in reasons[:5])
            else:
                reason_text = str(reasons)
            lines.append(
                f"| {index} | {item.get('image_id', '')} | "
                f"{item.get('item_type', '')}/{item.get('category', '')} | "
                f"{item.get('color', '')} | {item.get('fit', '')} | "
                f"{item.get('recommendation_score', '')} | "
                f"{item.get('relevance', {}).get('is_relevant', '')} | "
                f"{reason_text} |"
            )
        lines.append("")

    return "\n".join(lines)


if __name__ == "__main__":
    main()
