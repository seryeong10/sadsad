import argparse
import json
import math
import re
import unicodedata
from pathlib import Path
from tempfile import NamedTemporaryFile

import joblib
import numpy as np
from PIL import Image, ImageOps
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import classification_report
from sklearn.model_selection import train_test_split
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler

from app.personal_color_palette import get_personal_color_palette

ROOT_DIR = Path(__file__).resolve().parents[1]
DEFAULT_DATASET_DIR = Path("/Users/seryeong/Desktop/퍼스널 ")
MODEL_DIR = ROOT_DIR / "models"
MODEL_PATH = MODEL_DIR / "personal_color_model.joblib"
GENDER_MODEL_PATHS = {
    "female": MODEL_DIR / "personal_color_model_female.joblib",
    "male": MODEL_DIR / "personal_color_model_male.joblib",
}
REPORT_PATH = MODEL_DIR / "personal_color_report.json"

IMAGE_SUFFIXES = {".jpg", ".jpeg", ".png", ".webp"}

FOLDER_LABELS = {
    "봄웜 여": ("spring_warm", "female"),
    "봄웜 남": ("spring_warm", "male"),
    "여쿨 여": ("summer_cool", "female"),
    "여쿨 남": ("summer_cool", "male"),
    "가을 여": ("autumn_warm", "female"),
    "가을 남": ("autumn_warm", "male"),
    "겨울 여": ("winter_cool", "female"),
    "겨울 남": ("winter_cool", "male"),
}

COLOR_RESULTS = {
    "spring_warm": {
        "label": "봄 웜",
        "summary": "밝고 따뜻한 색상이 얼굴 톤을 생기 있게 보이도록 도와줄 가능성이 있어요.",
        "recommended_colors": ["코랄", "피치", "오렌지", "크림", "애플그린", "살구"],
        "male_recommended_colors": ["크림", "라이트 베이지", "웜 그레이", "소프트 카키", "피치 베이지", "코랄 포인트"],
        "avoid_colors": ["차가운 회색", "딥 네이비"],
    },
    "summer_cool": {
        "label": "여름 쿨",
        "summary": "맑고 부드러운 쿨 계열 색상이 얼굴 톤을 안정적으로 살려줄 가능성이 있어요.",
        "recommended_colors": ["라벤더", "쿨핑크", "뮤트퍼플", "블루그레이", "소프트 네이비", "라이트 민트"],
        "male_recommended_colors": ["라이트 그레이", "블루그레이", "스카이블루", "소프트 네이비", "쿨 화이트", "더스티 블루"],
        "avoid_colors": ["강한 오렌지", "노란기 강한 베이지"],
    },
    "autumn_warm": {
        "label": "가을 웜",
        "summary": "차분하고 깊이 있는 웜 계열 색상이 분위기를 자연스럽게 살려줄 가능성이 있어요.",
        "recommended_colors": ["카멜", "브라운", "초콜릿", "머스타드", "올리브", "웜 베이지"],
        "male_recommended_colors": ["카멜", "브라운", "카키", "올리브", "딥 베이지", "초콜릿"],
        "avoid_colors": ["형광 핑크", "차가운 라벤더"],
    },
    "winter_cool": {
        "label": "겨울 쿨",
        "summary": "선명하고 대비감 있는 쿨 계열 색상이 인상을 또렷하게 보여줄 가능성이 있어요.",
        "recommended_colors": ["네이비", "블랙", "화이트", "로열 블루", "버건디", "실버"],
        "male_recommended_colors": ["네이비", "블랙", "화이트", "차콜", "딥 블루", "실버"],
        "avoid_colors": ["탁한 카멜", "노란기 강한 브라운"],
    },
}


def iter_dataset_images(dataset_dir: Path):
    for folder in sorted(dataset_dir.iterdir()):
        if not folder.is_dir():
            continue
        label_info = FOLDER_LABELS.get(_normalize_name(folder.name))
        if label_info is None:
            continue
        label, gender = label_info
        for path in sorted(folder.iterdir()):
            if path.suffix.lower() not in IMAGE_SUFFIXES:
                continue
            yield path, label, gender


def extract_features_from_path(path: Path, gender: str = "") -> np.ndarray:
    with Image.open(path) as image:
        return extract_features_from_image(image, gender=gender)


def extract_features_from_bytes(image_bytes: bytes, gender: str = "") -> np.ndarray:
    with NamedTemporaryFile(suffix=".png") as temp_file:
        temp_file.write(image_bytes)
        temp_file.flush()
        return extract_features_from_path(Path(temp_file.name), gender=gender)


def extract_features_from_image(image: Image.Image, gender: str = "") -> np.ndarray:
    image = ImageOps.exif_transpose(image).convert("RGB")
    image.thumbnail((640, 640))
    arr = np.asarray(image).astype(np.float32) / 255.0
    height, width, _ = arr.shape

    face = _center_crop(arr, 0.64, 0.78)
    fh, fw, _ = face.shape
    regions = {
        "forehead": face[int(fh * 0.18): int(fh * 0.34), int(fw * 0.36): int(fw * 0.64)],
        "left_cheek": face[int(fh * 0.44): int(fh * 0.64), int(fw * 0.18): int(fw * 0.39)],
        "right_cheek": face[int(fh * 0.44): int(fh * 0.64), int(fw * 0.61): int(fw * 0.82)],
        "center_face": face[int(fh * 0.28): int(fh * 0.72), int(fw * 0.28): int(fw * 0.72)],
        "full_face": face,
    }

    feature_parts = []
    for region in regions.values():
        skin_pixels = _skin_like_pixels(region)
        if len(skin_pixels) < 30:
            skin_pixels = region.reshape(-1, 3)
        feature_parts.extend(_color_stats(skin_pixels))

    lab = _rgb_to_lab(face.reshape(-1, 3))
    lightness = lab[:, 0]
    chroma = np.sqrt(lab[:, 1] ** 2 + lab[:, 2] ** 2)
    feature_parts.extend([
        float(np.percentile(lightness, 10)),
        float(np.percentile(lightness, 90)),
        float(np.std(lightness)),
        float(np.mean(chroma)),
        float(np.std(chroma)),
    ])

    feature_parts.append(1.0 if gender == "male" else 0.0)
    feature_parts.append(1.0 if gender == "female" else 0.0)
    return np.asarray(feature_parts, dtype=np.float32)


def train_model(dataset_dir: Path = DEFAULT_DATASET_DIR) -> dict:
    rows = []
    failures = []
    for path, label, gender in iter_dataset_images(dataset_dir):
        try:
            features = extract_features_from_path(path, gender=gender)
            rows.append({
                "path": str(path),
                "person": _person_key(path),
                "label": label,
                "gender": gender,
                "features": features,
            })
        except Exception as error:
            failures.append({"path": str(path), "error": str(error)})

    if len(rows) < 16:
        raise RuntimeError(f"학습 가능한 이미지가 너무 적습니다: {len(rows)}장")

    MODEL_DIR.mkdir(parents=True, exist_ok=True)
    overall_summary = _train_rows(
        rows,
        model_path=MODEL_PATH,
        split_name="all_genders",
    )
    gender_summaries = {}
    for gender, model_path in GENDER_MODEL_PATHS.items():
        gender_rows = [row for row in rows if row["gender"] == gender]
        if len(gender_rows) < 16:
            continue
        gender_summaries[gender] = _train_rows(
            gender_rows,
            model_path=model_path,
            split_name=f"{gender}_only",
        )

    summary = {
        "dataset_dir": str(dataset_dir),
        "total_images": len(rows),
        "failed_images": failures,
        "labels": _count_values([row["label"] for row in rows]),
        "genders": _count_values([row["gender"] for row in rows]),
        "split_method": "stratified_by_personal_color_label",
        "overall_model": overall_summary,
        "gender_models": gender_summaries,
        "accuracy": overall_summary["accuracy"],
        "report": overall_summary["report"],
    }
    REPORT_PATH.write_text(
        json.dumps(summary, ensure_ascii=False, indent=2),
        encoding="utf-8",
    )
    return summary


def _train_rows(
    rows: list[dict],
    model_path: Path,
    split_name: str,
) -> dict:
    labels = np.asarray([row["label"] for row in rows])
    features = np.vstack([row["features"] for row in rows])
    train_idx, test_idx = train_test_split(
        np.arange(len(rows)),
        test_size=0.25,
        random_state=42,
        stratify=labels,
    )

    model = Pipeline(
        steps=[
            ("scaler", StandardScaler()),
            (
                "classifier",
                RandomForestClassifier(
                    n_estimators=700,
                    class_weight="balanced_subsample",
                    random_state=42,
                    min_samples_leaf=1,
                    max_features="sqrt",
                ),
            ),
        ]
    )
    model.fit(features[train_idx], labels[train_idx])
    predictions = model.predict(features[test_idx])
    report = classification_report(
        labels[test_idx],
        predictions,
        output_dict=True,
        zero_division=0,
    )
    joblib.dump(model, model_path)
    return {
        "model_path": str(model_path),
        "split_name": split_name,
        "total_images": int(len(rows)),
        "labels": _count_values(labels),
        "train_images": int(len(train_idx)),
        "test_images": int(len(test_idx)),
        "accuracy": float(report.get("accuracy", 0.0)),
        "report": report,
    }


def predict_personal_color(image_bytes: bytes, gender: str = "") -> dict:
    model_path = _model_path_for_gender(gender)
    if not model_path.exists():
        raise FileNotFoundError(
            f"퍼스널 컬러 모델이 없습니다. 먼저 학습을 실행하세요: {model_path}"
        )

    model = joblib.load(model_path)
    features = extract_features_from_bytes(image_bytes, gender=gender).reshape(1, -1)
    label = str(model.predict(features)[0])
    probabilities = {}
    confidence = 0.0
    if hasattr(model, "predict_proba"):
        classes = list(model.classes_)
        proba = model.predict_proba(features)[0]
        probabilities = {
            str(class_name): float(probability)
            for class_name, probability in zip(classes, proba)
        }
        confidence = probabilities.get(label, 0.0)

    result = COLOR_RESULTS[label]
    palette = get_personal_color_palette(label, gender=gender)
    recommended_colors = result["recommended_colors"]
    if gender == "male":
        recommended_colors = result.get("male_recommended_colors", recommended_colors)
    return {
        "type": label,
        "label": result["label"],
        "summary": result["summary"],
        "recommended_colors": recommended_colors,
        "best_hex_colors": palette["best_hex"],
        "additional_recommended_colors": palette["recommended"],
        "avoid_colors": palette["avoid"],
        "confidence": round(confidence, 3),
        "probabilities": probabilities,
        "analysis_method": "skin_color_features_random_forest_by_gender",
        "model_path": str(model_path),
    }


def _model_path_for_gender(gender: str) -> Path:
    return GENDER_MODEL_PATHS.get(gender, MODEL_PATH)


def _normalize_name(value: str) -> str:
    return unicodedata.normalize("NFC", value).strip()


def _person_key(path: Path) -> str:
    stem = _normalize_name(path.stem)
    stem = re.sub(r"\d+", "", stem)
    stem = re.sub(r"[_\-\s]+", " ", stem).strip()
    return stem or path.stem


def _center_crop(arr: np.ndarray, width_ratio: float, height_ratio: float) -> np.ndarray:
    height, width, _ = arr.shape
    crop_w = max(12, int(width * width_ratio))
    crop_h = max(12, int(height * height_ratio))
    left = max(0, (width - crop_w) // 2)
    top = max(0, int(height * 0.08))
    if top + crop_h > height:
        top = max(0, (height - crop_h) // 2)
    return arr[top: top + crop_h, left: left + crop_w]


def _skin_like_pixels(region: np.ndarray) -> np.ndarray:
    pixels = region.reshape(-1, 3)
    red, green, blue = pixels[:, 0], pixels[:, 1], pixels[:, 2]
    max_rgb = np.max(pixels, axis=1)
    min_rgb = np.min(pixels, axis=1)
    mask = (
        (red > 0.22)
        & (green > 0.18)
        & (blue > 0.13)
        & (red > blue * 0.95)
        & (green > blue * 0.75)
        & ((max_rgb - min_rgb) > 0.035)
        & (max_rgb < 0.98)
        & (min_rgb > 0.06)
    )
    return pixels[mask]


def _color_stats(rgb_pixels: np.ndarray) -> list[float]:
    rgb_pixels = np.clip(rgb_pixels, 0, 1)
    lab = _rgb_to_lab(rgb_pixels)
    hsv = _rgb_to_hsv(rgb_pixels)
    stats = []
    for values in [
        rgb_pixels[:, 0],
        rgb_pixels[:, 1],
        rgb_pixels[:, 2],
        lab[:, 0],
        lab[:, 1],
        lab[:, 2],
        hsv[:, 1],
        hsv[:, 2],
    ]:
        stats.extend([
            float(np.mean(values)),
            float(np.std(values)),
            float(np.median(values)),
        ])
    warm_cool = lab[:, 2] - lab[:, 1]
    stats.extend([
        float(np.mean(warm_cool)),
        float(np.std(warm_cool)),
        float(np.mean(lab[:, 2])),
        float(np.mean(lab[:, 1])),
    ])
    return stats


def _rgb_to_hsv(rgb: np.ndarray) -> np.ndarray:
    red, green, blue = rgb[:, 0], rgb[:, 1], rgb[:, 2]
    max_rgb = np.max(rgb, axis=1)
    min_rgb = np.min(rgb, axis=1)
    delta = max_rgb - min_rgb
    hue = np.zeros_like(max_rgb)
    saturation = np.where(max_rgb == 0, 0, delta / np.maximum(max_rgb, 1e-6))
    value = max_rgb

    red_mask = (max_rgb == red) & (delta != 0)
    green_mask = (max_rgb == green) & (delta != 0)
    blue_mask = (max_rgb == blue) & (delta != 0)
    hue[red_mask] = ((green[red_mask] - blue[red_mask]) / delta[red_mask]) % 6
    hue[green_mask] = ((blue[green_mask] - red[green_mask]) / delta[green_mask]) + 2
    hue[blue_mask] = ((red[blue_mask] - green[blue_mask]) / delta[blue_mask]) + 4
    hue = hue / 6.0
    return np.stack([hue, saturation, value], axis=1)


def _rgb_to_lab(rgb: np.ndarray) -> np.ndarray:
    linear = np.where(rgb > 0.04045, ((rgb + 0.055) / 1.055) ** 2.4, rgb / 12.92)
    matrix = np.array(
        [
            [0.4124564, 0.3575761, 0.1804375],
            [0.2126729, 0.7151522, 0.0721750],
            [0.0193339, 0.1191920, 0.9503041],
        ],
        dtype=np.float32,
    )
    xyz = linear @ matrix.T
    xyz = xyz / np.array([0.95047, 1.00000, 1.08883], dtype=np.float32)
    epsilon = 216 / 24389
    kappa = 24389 / 27
    f = np.where(xyz > epsilon, np.cbrt(xyz), (kappa * xyz + 16) / 116)
    lightness = 116 * f[:, 1] - 16
    a = 500 * (f[:, 0] - f[:, 1])
    b = 200 * (f[:, 1] - f[:, 2])
    return np.stack([lightness, a, b], axis=1)


def _count_values(values) -> dict[str, int]:
    result = {}
    for value in values:
        key = str(value)
        result[key] = result.get(key, 0) + 1
    return dict(sorted(result.items()))


def main():
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(dest="command", required=True)

    train_parser = subparsers.add_parser("train")
    train_parser.add_argument(
        "--dataset-dir",
        type=Path,
        default=DEFAULT_DATASET_DIR,
    )

    predict_parser = subparsers.add_parser("predict")
    predict_parser.add_argument("image", type=Path)
    predict_parser.add_argument("--gender", default="")

    args = parser.parse_args()
    if args.command == "train":
        print(json.dumps(train_model(args.dataset_dir), ensure_ascii=False, indent=2))
    elif args.command == "predict":
        print(
            json.dumps(
                predict_personal_color(args.image.read_bytes(), gender=args.gender),
                ensure_ascii=False,
                indent=2,
            )
        )


if __name__ == "__main__":
    main()
