import csv
import re
from pathlib import Path


ROOT_DIR = Path(__file__).resolve().parents[1]
INPUT_CSV = ROOT_DIR / "naver_clothes_data.csv"
OUTPUT_CSV = ROOT_DIR / "naver_clothes_tagged.csv"


TAG_RULES = {
    "item_type": {
        "상의": ["후드", "후디", "맨투맨", "티셔츠", "셔츠", "블라우스", "니트", "가디건"],
        "하의": ["청바지", "데님", "팬츠", "슬랙스", "스커트", "치마"],
        "원피스": ["원피스"],
        "아우터": ["코트", "패딩", "점퍼", "블레이저", "자켓", "재킷"],
        "신발": ["스니커즈", "운동화", "구두", "로퍼", "부츠"],
        "가방": ["백", "가방", "토트", "숄더", "크로스"],
    },
    "situation": {
        "캠퍼스": ["캠퍼스", "대학생", "학교", "데일리"],
        "데이트": ["데이트"],
        "면접": ["면접", "오피스", "출근", "정장"],
        "하객룩": ["하객", "결혼식", "웨딩"],
        "데일리": ["데일리", "일상", "기본"],
        "운동": ["운동", "헬스", "트레이닝", "조거"],
    },
    "style": {
        "캐주얼": ["후드", "후디", "맨투맨", "데님", "청바지", "캠퍼스", "데일리"],
        "러블리": ["러블리", "프릴", "플라워", "리본", "데이트"],
        "세련": ["세련", "자켓", "재킷", "블레이저", "슬랙스"],
        "깔끔": ["무지", "기본", "슬랙스", "니트"],
        "우아": ["하객", "원피스", "블라우스", "스커트"],
        "미니멀": ["미니멀", "무지", "심플", "기본"],
        "스트릿": ["스트릿", "오버핏", "와이드", "카고"],
        "힙": ["힙", "크롭", "와이드", "카고", "스트릿"],
    },
    "season": {
        "봄": ["봄", "간절기", "가디건", "블라우스"],
        "여름": ["여름", "반팔", "민소매", "린넨"],
        "가을": ["가을", "간절기", "니트", "자켓", "재킷"],
        "겨울": ["겨울", "기모", "패딩", "코트", "울"],
    },
    "color": {
        "블랙": ["블랙", "검정", "black"],
        "화이트": ["화이트", "흰", "아이보리", "white", "ivory"],
        "네이비": ["네이비", "navy"],
        "블루": ["블루", "blue", "데님", "청"],
        "그레이": ["그레이", "gray", "grey", "회색"],
        "베이지": ["베이지", "beige"],
        "핑크": ["핑크", "pink"],
    },
    "fit": {
        "오버핏": ["오버핏", "루즈핏", "박시"],
        "슬림핏": ["슬림", "타이트"],
        "와이드핏": ["와이드"],
        "크롭": ["크롭"],
    },
}

CATEGORY_ITEM_TYPE_RULES = {
    "원피스": "원피스",
    "바지": "하의",
    "청바지": "하의",
    "스커트": "하의",
    "레깅스": "하의",
    "티셔츠": "상의",
    "블라우스": "상의",
    "셔츠": "상의",
    "니트": "상의",
    "카디건": "상의",
    "가디건": "상의",
    "아우터": "아우터",
    "재킷": "아우터",
    "자켓": "아우터",
    "점퍼": "아우터",
    "코트": "아우터",
    "패딩": "아우터",
    "신발": "신발",
    "운동화": "신발",
    "스니커즈": "신발",
    "구두": "신발",
    "가방": "가방",
}


def normalize_text(value: object) -> str:
    text = "" if value is None else str(value)
    text = re.sub(r"<[^>]+>", " ", text)
    text = re.sub(r"\s+", " ", text)
    return text.strip()


def match_tags(text: str, rules: dict[str, list[str]]) -> list[str]:
    text_lower = text.lower()
    matched = []

    for tag, keywords in rules.items():
        if any(keyword.lower() in text_lower for keyword in keywords):
            matched.append(tag)

    return matched


def first_or_unknown(tags: list[str], fallback: str = "미분류") -> str:
    return tags[0] if tags else fallback


def dedupe_key(title: str) -> str:
    key = title.lower()
    key = re.sub(r"\([^)]*\)", " ", key)
    key = re.sub(r"\[[^]]*\]", " ", key)
    key = re.sub(r"[^0-9a-z가-힣]+", "", key)
    return key


def infer_item_type(row: dict[str, str], text: str) -> str:
    category_text = " ".join(
        normalize_text(row.get(column))
        for column in ["category3", "category4", "category2"]
    )

    for keyword, item_type in CATEGORY_ITEM_TYPE_RULES.items():
        if keyword in category_text:
            return item_type

    # 제목 기반 보정: 원피스는 "데님 원피스"처럼 하의 키워드와 같이 나올 수 있어 우선 처리합니다.
    if "원피스" in text:
        return "원피스"

    return first_or_unknown(match_tags(text, TAG_RULES["item_type"]))


def price_bucket(price: object) -> str:
    try:
        value = int(price)
    except (TypeError, ValueError):
        return "가격미상"

    if value < 30000:
        return "3만원 이하"
    if value < 50000:
        return "3~5만원"
    if value < 100000:
        return "5~10만원"
    if value < 200000:
        return "10~20만원"
    return "20만원 이상"


def infer_gender(text: str, category2: object) -> str:
    source = f"{text} {normalize_text(category2)}"
    if any(keyword in source for keyword in ["남자", "남성", "남성의류"]):
        return "남성"
    if any(keyword in source for keyword in ["여자", "여성", "여성의류"]):
        return "여성"
    return "공용"


def main() -> None:
    if not INPUT_CSV.exists():
        raise FileNotFoundError(f"입력 파일이 없습니다: {INPUT_CSV}")

    with INPUT_CSV.open("r", encoding="utf-8-sig", newline="") as file:
        rows = list(csv.DictReader(file))

    tagged_rows = []
    seen_titles = set()
    for row in rows:
        title = normalize_text(row.get("title"))
        title_key = dedupe_key(title)
        if title_key in seen_titles:
            continue
        seen_titles.add(title_key)

        query = normalize_text(row.get("query"))
        categories = " ".join(
            normalize_text(row.get(column))
            for column in ["category1", "category2", "category3", "category4"]
        )
        text = f"{query} {title} {categories}"

        situation_tags = match_tags(text, TAG_RULES["situation"])
        style_tags = match_tags(text, TAG_RULES["style"])
        season_tags = match_tags(text, TAG_RULES["season"])
        color_tags = match_tags(text, TAG_RULES["color"])
        fit_tags = match_tags(text, TAG_RULES["fit"])

        tagged_rows.append(
            {
                **row,
                "clean_title": title,
                "gender": infer_gender(text, row.get("category2")),
                "item_type": infer_item_type(row, text),
                "situation_tags": ",".join(situation_tags) or "미분류",
                "style_tags": ",".join(style_tags) or "미분류",
                "season_tags": ",".join(season_tags) or "미분류",
                "color_tags": ",".join(color_tags) or "미분류",
                "fit_tags": ",".join(fit_tags) or "미분류",
                "price_bucket": price_bucket(row.get("price")),
                "search_text": text,
            }
        )

    fieldnames = list(tagged_rows[0].keys()) if tagged_rows else []
    with OUTPUT_CSV.open("w", encoding="utf-8-sig", newline="") as file:
        writer = csv.DictWriter(file, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(tagged_rows)

    print(f"저장 완료: {OUTPUT_CSV}")
    print(f"원본 {len(rows)}개 -> 중복 제거 후 {len(tagged_rows)}개 상품 태깅 완료")
    for row in tagged_rows[:10]:
        print(
            row["title"],
            row["item_type"],
            row["situation_tags"],
            row["style_tags"],
            sep=" | ",
        )


if __name__ == "__main__":
    main()
