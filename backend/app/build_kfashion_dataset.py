import csv
import json
import os
import re
import unicodedata
from pathlib import Path
from typing import Optional

from PIL import Image, ImageDraw


ROOT_DIR = Path(__file__).resolve().parents[1]
DEFAULT_SAMPLE_DIR = Path("/Users/seryeong/Downloads/New_sample")
SAMPLE_DIR = Path(os.getenv("KFASHION_SAMPLE_DIR", DEFAULT_SAMPLE_DIR))
OUTPUT_CSV = ROOT_DIR / "data" / "kfashion" / "kfashion_recommendation_data.csv"
CUTOUT_DIR = ROOT_DIR / "data" / "kfashion" / "cutouts"

ITEM_TYPES = ["상의", "하의", "아우터", "원피스"]

STYLE_TAGS = {
    "로맨틱": {
        "situations": ["데이트", "카페", "하객"],
        "moods": ["러블리", "페미닌", "부드러운", "우아한"],
    },
    "레트로": {
        "situations": ["캠퍼스", "데일리", "카페"],
        "moods": ["빈티지", "스트릿", "유니크", "캐주얼"],
    },
    "리조트": {
        "situations": ["여행", "데이트", "데일리"],
        "moods": ["편안한", "내추럴", "캐주얼", "활동적"],
    },
}

SUB_STYLE_TAGS = {
    "스트리트": {
        "situations": ["캠퍼스", "데일리"],
        "moods": ["스트릿", "힙", "캐주얼"],
    },
    "페미닌": {
        "situations": ["데이트", "카페"],
        "moods": ["페미닌", "러블리", "부드러운"],
    },
    "모던": {
        "situations": ["출근", "면접", "데일리"],
        "moods": ["미니멀", "깔끔", "시크"],
    },
    "클래식": {
        "situations": ["면접", "출근", "하객"],
        "moods": ["클래식", "단정", "포멀"],
    },
    "스포티": {
        "situations": ["운동", "여행", "데일리"],
        "moods": ["스포티", "활동적", "편안한"],
    },
}

CATEGORY_TAGS = {
    "블라우스": {"situations": ["데이트", "카페", "출근"], "moods": ["러블리", "페미닌", "단정"]},
    "셔츠": {"situations": ["면접", "출근", "데일리"], "moods": ["깔끔", "미니멀", "단정"]},
    "티셔츠": {"situations": ["캠퍼스", "데일리", "운동"], "moods": ["캐주얼", "편안한", "스포티"]},
    "니트웨어": {"situations": ["데이트", "카페", "출근"], "moods": ["부드러운", "내추럴", "미니멀"]},
    "청바지": {"situations": ["캠퍼스", "데일리", "카페"], "moods": ["캐주얼", "스트릿", "편안한"]},
    "팬츠": {"situations": ["출근", "면접", "데일리"], "moods": ["깔끔", "미니멀", "캐주얼"]},
    "스커트": {"situations": ["데이트", "카페", "하객"], "moods": ["러블리", "페미닌", "우아한"]},
    "재킷": {"situations": ["출근", "면접", "하객"], "moods": ["시크", "포멀", "깔끔"]},
    "코트": {"situations": ["출근", "데이트", "하객"], "moods": ["클래식", "우아한", "시크"]},
    "점퍼": {"situations": ["캠퍼스", "여행", "데일리"], "moods": ["캐주얼", "스포티", "편안한"]},
    "드레스": {"situations": ["데이트", "하객"], "moods": ["로맨틱", "우아한", "페미닌"]},
}


def normalize(value: object) -> str:
    if value is None:
        return ""
    return unicodedata.normalize("NFC", str(value)).strip()


def add_tags(target: set[str], tags: list[str]) -> None:
    for tag in tags:
        if tag:
            target.add(tag)


def join_values(value: object) -> str:
    if isinstance(value, list):
        return ",".join(normalize(item) for item in value if normalize(item))
    return normalize(value)


def get_description(data: dict) -> dict:
    return (
        data.get("데이터셋 정보", {})
        .get("데이터셋 상세설명", {})
    )


def get_detail(data: dict) -> dict:
    return get_description(data).get("라벨링", {})


def get_polygons(data: dict) -> dict:
    return get_description(data).get("폴리곤좌표", {})


def get_rects(data: dict) -> dict:
    return get_description(data).get("렉트좌표", {})


def first_filled_item(labeling: dict) -> tuple[str, dict]:
    for item_type in ITEM_TYPES:
        values = labeling.get(item_type, [])
        for value in values:
            if isinstance(value, dict) and value:
                return item_type, value
    return "", {}


def first_filled_geometry(values: object) -> dict:
    if not isinstance(values, list):
        return {}
    return next((value for value in values if isinstance(value, dict) and value), {})


def make_tags(style: str, sub_style: str, category: str) -> tuple[str, str]:
    situations: set[str] = set()
    moods: set[str] = set()

    for source, rules in [
        (style, STYLE_TAGS),
        (sub_style, SUB_STYLE_TAGS),
        (category, CATEGORY_TAGS),
    ]:
        rule = rules.get(source)
        if rule:
            add_tags(situations, rule["situations"])
            add_tags(moods, rule["moods"])

    if not situations:
        add_tags(situations, ["데일리"])
    if not moods:
        add_tags(moods, [style, sub_style])

    return ",".join(sorted(situations)), ",".join(sorted(moods))


def image_root() -> Path:
    return SAMPLE_DIR / "원천데이터" / "원천데이터_1"


def label_root() -> Path:
    return SAMPLE_DIR / "라벨링데이터"


def row_from_json(path: Path) -> Optional[dict[str, str]]:
    with path.open("r", encoding="utf-8") as file:
        data = json.load(file)

    labeling = get_detail(data)
    polygons = get_polygons(data)
    rects = get_rects(data)
    style_info = next(
        (item for item in labeling.get("스타일", []) if isinstance(item, dict) and item),
        {},
    )
    item_type, item = first_filled_item(labeling)
    if not item_type or not item:
        return None

    image_id = normalize(data.get("데이터셋 정보", {}).get("파일 번호") or path.stem)
    style_folder = normalize(path.parent.name)
    image_path = image_root() / style_folder / f"{image_id}.jpg"
    if not image_path.exists():
        return None

    cutout_path = create_cutout(
        image_path=image_path,
        style_folder=style_folder,
        image_id=image_id,
        item_type=item_type,
        polygon=first_filled_geometry(polygons.get(item_type)),
        rect=first_filled_geometry(rects.get(item_type)),
    )
    if not cutout_path:
        return None

    style = normalize(style_info.get("스타일") or style_folder)
    sub_style = normalize(style_info.get("서브스타일"))
    category = normalize(item.get("카테고리"))
    situation_tags, mood_tags = make_tags(style, sub_style, category)

    return {
        "image_id": image_id,
        "image_path": str(image_path),
        "original_image_url": f"/kfashion-images/{style_folder}/{image_id}.jpg",
        "image_url": f"/kfashion-cutouts/{style_folder}/{cutout_path.name}",
        "style": style,
        "sub_style": sub_style,
        "item_type": item_type,
        "category": category,
        "color": normalize(item.get("색상")),
        "sub_color": normalize(item.get("서브색상")),
        "fit": normalize(item.get("핏")),
        "material": join_values(item.get("소재")),
        "print": join_values(item.get("프린트")),
        "detail": join_values(item.get("디테일")),
        "situation_tags": situation_tags,
        "mood_tags": mood_tags,
    }


def create_cutout(
    image_path: Path,
    style_folder: str,
    image_id: str,
    item_type: str,
    polygon: dict,
    rect: dict,
) -> Optional[Path]:
    output_dir = CUTOUT_DIR / style_folder
    output_dir.mkdir(parents=True, exist_ok=True)
    output_path = output_dir / f"{image_id}_{item_type}.png"

    if output_path.exists():
        return output_path

    points = polygon_points(polygon)
    with Image.open(image_path).convert("RGBA") as source:
        if len(points) >= 3:
            mask = Image.new("L", source.size, 0)
            ImageDraw.Draw(mask).polygon(points, fill=255)
            alpha_source = Image.new("RGBA", source.size, (255, 255, 255, 0))
            alpha_source.paste(source, (0, 0), mask)
            crop_box = padded_bbox(points, source.size, padding=18)
            cropped = alpha_source.crop(crop_box)
        else:
            crop_box = rect_bbox(rect, source.size, padding=18)
            if crop_box is None:
                return None
            cropped = source.crop(crop_box)

        canvas = Image.new("RGBA", (512, 512), (255, 255, 255, 255))
        cropped.thumbnail((430, 430), Image.Resampling.LANCZOS)
        left = (512 - cropped.width) // 2
        top = (512 - cropped.height) // 2
        canvas.alpha_composite(cropped, (left, top))
        canvas.convert("RGB").save(output_path, format="PNG", optimize=True)

    return output_path


def polygon_points(polygon: dict) -> list[tuple[float, float]]:
    xs: dict[int, float] = {}
    ys: dict[int, float] = {}

    for key, value in polygon.items():
        match = re.match(r"([XY])좌표(\d+)", normalize(key))
        if not match:
            continue
        axis, index = match.groups()
        try:
            number = float(value)
        except (TypeError, ValueError):
            continue
        if axis == "X":
            xs[int(index)] = number
        else:
            ys[int(index)] = number

    return [
        (xs[index], ys[index])
        for index in sorted(set(xs) & set(ys))
    ]


def padded_bbox(
    points: list[tuple[float, float]],
    size: tuple[int, int],
    padding: int,
) -> tuple[int, int, int, int]:
    width, height = size
    xs = [point[0] for point in points]
    ys = [point[1] for point in points]
    return (
        max(0, int(min(xs)) - padding),
        max(0, int(min(ys)) - padding),
        min(width, int(max(xs)) + padding),
        min(height, int(max(ys)) + padding),
    )


def rect_bbox(
    rect: dict,
    size: tuple[int, int],
    padding: int,
) -> Optional[tuple[int, int, int, int]]:
    try:
        x = float(rect["X좌표"])
        y = float(rect["Y좌표"])
        width = float(rect["가로"])
        height = float(rect["세로"])
    except (KeyError, TypeError, ValueError):
        return None

    image_width, image_height = size
    return (
        max(0, int(x) - padding),
        max(0, int(y) - padding),
        min(image_width, int(x + width) + padding),
        min(image_height, int(y + height) + padding),
    )


def main() -> None:
    if not label_root().exists():
        raise FileNotFoundError(f"K-Fashion 라벨 폴더가 없습니다: {label_root()}")

    rows = []
    for path in sorted(label_root().glob("*/*.json")):
        row = row_from_json(path)
        if row:
            rows.append(row)

    OUTPUT_CSV.parent.mkdir(parents=True, exist_ok=True)
    fieldnames = [
        "image_id",
        "image_path",
        "original_image_url",
        "image_url",
        "style",
        "sub_style",
        "item_type",
        "category",
        "color",
        "sub_color",
        "fit",
        "material",
        "print",
        "detail",
        "situation_tags",
        "mood_tags",
    ]
    with OUTPUT_CSV.open("w", encoding="utf-8-sig", newline="") as file:
        writer = csv.DictWriter(file, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)

    print(f"저장 완료: {OUTPUT_CSV}")
    print(f"총 {len(rows)}개 K-Fashion 추천 데이터 생성")


if __name__ == "__main__":
    main()
