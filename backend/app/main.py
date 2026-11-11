import os
import base64
import asyncio
import csv
import hashlib
import json
import random
import re
import unicodedata
from datetime import datetime, timedelta, timezone
from functools import lru_cache
from concurrent.futures import ThreadPoolExecutor
from html import unescape
from io import BytesIO
from pathlib import Path
from typing import Optional
from urllib.error import URLError, HTTPError
from urllib.parse import urlencode, urlparse
from urllib.request import Request, urlopen

from fastapi import FastAPI, UploadFile, File, Query, HTTPException, Response
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles
from fastapi.responses import JSONResponse
from dotenv import load_dotenv
from openai import OpenAI
from PIL import Image
from pydantic import BaseModel, Field
import requests

from app.personal_color_palette import get_personal_color_palette
from app.closet_image_processor import prepare_closet_image
from app.personal_color_model import COLOR_RESULTS, predict_personal_color
from app.season_style_rules import resolve_season
from app.skeleton_style_rules import get_skeleton_style_rules, score_skeleton_text
from app.style_rag_documents import retrieve_style_context
from app.vector_style_store import (
    DEFAULT_CHROMA_DIR,
    DEFAULT_COLLECTION_NAME,
    DEFAULT_EMBEDDING_MODEL,
    build_item_document,
    search_style_items,
)

load_dotenv()

app = FastAPI()
client = OpenAI(api_key=os.getenv("OPENAI_API_KEY")) if os.getenv("OPENAI_API_KEY") else None
OPENWEATHER_API_KEY = os.getenv("OPENWEATHER_API_KEY", "")
ROOT_DIR = Path(__file__).resolve().parents[1]
KFASHION_CSV = ROOT_DIR / "data" / "kfashion" / "kfashion_recommendation_data.csv"
KFASHION_CUTOUT_ROOT = ROOT_DIR / "data" / "kfashion" / "cutouts"
CHROMA_PERSIST_DIR = Path(os.getenv("CHROMA_PERSIST_DIR", str(DEFAULT_CHROMA_DIR)))
CHROMA_COLLECTION = os.getenv("CHROMA_COLLECTION", DEFAULT_COLLECTION_NAME)
OPENAI_EMBEDDING_MODEL = os.getenv("OPENAI_EMBEDDING_MODEL", DEFAULT_EMBEDDING_MODEL)
KFASHION_IMAGE_ROOT = Path(
    os.getenv(
        "KFASHION_IMAGE_ROOT",
        "/Users/seryeong/Downloads/New_sample/원천데이터/원천데이터_1",
    )
)
GLOBAL_BLOCK_KEYWORDS = [
    "가방", "백", "슈즈", "스니커즈", "운동화", "구두", "샌들", "로퍼",
    "양말", "스타킹", "속옷", "브라", "팬티", "잠옷", "키즈", "아동",
    "주니어", "코스프레", "앞치마", "모자", "볼캡", "벨트", "넥타이",
]
MALE_BLOCKED_ITEM_TERMS = ["원피스", "드레스", "스커트", "치마", "브라탑"]
FEMALE_BLOCKED_ITEM_TERMS = ["남성", "남자", "맨즈", "남아"]


class ProductRecommendationRequest(BaseModel):
    gender: str = Field(..., examples=["여자"])
    personalColor: str = Field("", examples=["봄웜"])
    personal_color: str = ""
    bodyType: str = Field("", examples=["웨이브"])
    skeleton_type: str = ""
    situation: str = Field(..., examples=["하객룩"])
    mood: str = Field(..., examples=["단아한"])
    limit: int = Field(8, ge=1, le=30)


class VirtualTryOnRequest(BaseModel):
    person_image: str = Field(..., description="아바타 이미지 data URI 또는 공개 URL")
    garment_image: str = Field(..., description="옷 이미지 data URI 또는 공개 URL")
    item_type: str = Field("", description="상의, 하의, 아우터, 원피스 등")
    preserve_pose: bool = True


class ClosetItemAnalysisRequest(BaseModel):
    image_data: str = Field(..., description="옷 사진 data URI")
    category: str = Field("", description="사용자가 고른 카테고리. 비우면 AI가 분류")


class ClosetRecommendationItem(BaseModel):
    id: str = Field(..., max_length=100)
    category: str = Field(..., max_length=20)
    name: str = Field(..., max_length=80)
    color: str = Field("", max_length=30)
    pattern: str = Field("", max_length=40)
    style_tags: list[str] = Field(default_factory=list, max_length=5)


class ClosetRecommendationRequest(BaseModel):
    situation: str = Field(..., max_length=40)
    mood: str = Field(..., max_length=40)
    gender: str = Field("", max_length=20)
    personal_color: str = Field("", max_length=40)
    skeleton_type: str = Field("", max_length=40)
    refresh_seed: int = Field(0, ge=0)
    items: list[ClosetRecommendationItem] = Field(..., min_length=1, max_length=100)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.middleware("http")
async def require_firebase_auth(request, call_next):
    protected = {
        "/generate-avatar", "/analyze-personal-color", "/virtual-try-on",
        "/recommend-outfits", "/api/recommend/products", "/api/recommend/closet",
        "/api/analyze-closet-item", "/api/weather",
    }
    if (os.getenv("REQUIRE_FIREBASE_AUTH", "false").lower() == "true"
            and request.url.path in protected and request.method != "OPTIONS"):
        authorization = request.headers.get("authorization", "")
        token = authorization.removeprefix("Bearer ") if authorization.startswith("Bearer ") else ""
        key = os.getenv("FIREBASE_API_KEY", "")
        if not token or not key:
            return JSONResponse(status_code=401, content={"detail": "로그인 후 이용해주세요."})
        try:
            response = await asyncio.to_thread(
                requests.post, "https://identitytoolkit.googleapis.com/v1/accounts:lookup",
                params={"key": key}, json={"idToken": token}, timeout=10,
            )
            users = response.json().get("users", []) if response.status_code == 200 else []
            if not users or users[0].get("disabled"):
                return JSONResponse(status_code=401, content={"detail": "다시 로그인해주세요."})
        except (requests.RequestException, ValueError):
            return JSONResponse(status_code=503, content={"detail": "로그인 확인에 실패했습니다. 잠시 후 다시 시도해주세요."})
    return await call_next(request)

if KFASHION_IMAGE_ROOT.exists():
    app.mount(
        "/kfashion-images",
        StaticFiles(directory=str(KFASHION_IMAGE_ROOT)),
        name="kfashion-images",
    )

if KFASHION_CUTOUT_ROOT.exists():
    app.mount(
        "/kfashion-cutouts",
        StaticFiles(directory=str(KFASHION_CUTOUT_ROOT)),
        name="kfashion-cutouts",
    )


@app.get("/api/weather")
def get_weather(lat: float = Query(..., ge=-90, le=90), lon: float = Query(..., ge=-180, le=180)):
    """Return current conditions and a compact 3-hour forecast for the mobile home card."""
    if not OPENWEATHER_API_KEY:
        raise HTTPException(status_code=503, detail="날씨 API 키가 서버에 설정되지 않았습니다.")

    params = {"lat": lat, "lon": lon, "appid": OPENWEATHER_API_KEY, "units": "metric", "lang": "kr"}
    try:
        current_response = requests.get(
            "https://api.openweathermap.org/data/2.5/weather", params=params, timeout=10
        )
        current_response.raise_for_status()
        forecast_response = requests.get(
            "https://api.openweathermap.org/data/2.5/forecast", params=params, timeout=10
        )
        forecast_response.raise_for_status()
        current_data = current_response.json()
        forecast_data = forecast_response.json()
    except requests.RequestException as exc:
        status = getattr(getattr(exc, "response", None), "status_code", None)
        if status == 401:
            raise HTTPException(status_code=502, detail="날씨 API 키를 확인해주세요.") from exc
        raise HTTPException(status_code=502, detail="날씨 정보를 가져오지 못했습니다.") from exc

    def condition_for(weather_items):
        item = (weather_items or [{}])[0]
        main = (item.get("main") or "Clouds").lower()
        code = int(item.get("id") or 0)
        if main == "snow":
            return "snow"
        if main in {"rain", "drizzle", "thunderstorm"}:
            return "rain"
        if main == "clear":
            return "clear"
        if main == "clouds" and code in {801, 802}:
            return "partly_cloudy"
        return "cloudy"

    timezone_offset = int((forecast_data.get("city") or {}).get("timezone") or 0)
    local_now = datetime.now(timezone.utc) + timedelta(seconds=timezone_offset)
    forecast_items = forecast_data.get("list") or []
    today_items = []
    hourly = []
    for entry in forecast_items:
        local_time = datetime.fromtimestamp(int(entry["dt"]), timezone.utc) + timedelta(seconds=timezone_offset)
        if local_time.date() == local_now.date():
            today_items.append(entry)
        if len(hourly) < 4 and local_time >= local_now:
            hourly.append({
                "time": local_time.strftime("%H:%M"),
                "temperature": round(float(entry["main"]["temp"])),
                "condition": condition_for(entry.get("weather")),
            })

    current_weather = (current_data.get("weather") or [{}])[0]
    current_main = current_data.get("main") or {}
    current_temp = round(float(current_main.get("temp") or 0))
    feels_like = round(float(current_main.get("feels_like") or current_temp))
    day_temps = [float((item.get("main") or {}).get("temp") or current_temp) for item in today_items]
    day_temps.append(current_temp)
    condition = condition_for(current_data.get("weather"))

    if condition == "snow":
        advice = "눈길이 미끄러울 수 있어요. 따뜻하고 편한 신발을 챙겨요."
    elif condition == "rain":
        advice = "비가 올 수 있어요. 우산과 가벼운 방수 아우터를 챙겨요."
    elif feels_like <= 8:
        advice = "체감 온도가 낮아요. 따뜻한 아우터를 챙겨요."
    elif feels_like <= 16:
        advice = "선선한 날씨예요. 가디건이나 얇은 아우터를 추천해요."
    else:
        advice = "가벼운 옷차림으로 산뜻하게 외출해보세요."

    return {
        "location": current_data.get("name") or "현재 위치",
        "temperature": current_temp,
        "feels_like": feels_like,
        "description": current_weather.get("description") or "날씨 정보",
        "condition": condition,
        "high": round(max(day_temps)),
        "low": round(min(day_temps)),
        "hourly": hourly,
        "advice": advice,
        "updated_at": current_data.get("dt"),
    }


@app.get("/api/product-image")
def product_image(url: str = Query(..., max_length=2048)):
    """Serve catalog images on the app origin so web fitting can read pixels."""
    parsed = urlparse(url)
    if (parsed.scheme != "https" or parsed.hostname != "shopping-phinf.pstatic.net"
            or parsed.username or parsed.password or parsed.port not in (None, 443)):
        raise HTTPException(status_code=400, detail="지원하지 않는 상품 이미지 주소입니다.")
    try:
        with requests.get(url, timeout=15, stream=True, allow_redirects=False) as upstream:
            if upstream.status_code != 200:
                raise HTTPException(status_code=502, detail="상품 이미지를 불러오지 못했습니다.")
            media_type = upstream.headers.get("content-type", "").split(";", 1)[0]
            if media_type not in {"image/jpeg", "image/png", "image/webp", "image/gif"}:
                raise HTTPException(status_code=502, detail="상품 이미지 형식이 올바르지 않습니다.")
            chunks, size = [], 0
            for chunk in upstream.iter_content(65536):
                size += len(chunk)
                if size > 12 * 1024 * 1024:
                    raise HTTPException(status_code=413, detail="상품 이미지가 너무 큽니다.")
                chunks.append(chunk)
    except requests.RequestException as exc:
        raise HTTPException(status_code=502, detail="상품 이미지 연결에 실패했습니다.") from exc
    content = b"".join(chunks)
    if media_type == "image/gif":
        # Use the first frame for fitting, which requires a still image.
        with Image.open(BytesIO(content)) as source:
            output = BytesIO()
            source.convert("RGB").save(output, format="JPEG", quality=92)
            content = output.getvalue()
            media_type = "image/jpeg"
    return Response(content, media_type=media_type,
                    headers={"Cache-Control": "public, max-age=3600"})


@app.get("/recommend-outfits")
async def recommend_outfits(
    situation: str = Query(..., description="선택한 상황. 예: 데일리, 데이트, 출근/면접"),
    style: str = Query(..., description="선택한 무드/스타일. 예: 캐주얼, 러블리, 미니멀"),
    gender: str = Query("female", description="성별 선택값. 예: female, male"),
    personal_color: str = Query("", description="퍼스널 컬러 타입. 예: spring_warm"),
    skeleton_type: str = Query("", description="골격 타입. 예: 스트레이트, 웨이브, 내추럴"),
    season: str = Query("", description="계절 필터. 비워두면 계절 조건 없이 추천"),
    limit: int = Query(8, ge=1, le=30),
):
    gender = _normalize_gender_input(gender)
    personal_color = _normalize_personal_color_input(personal_color)
    effective_limit = max(limit, 7)
    naver_items = _recommend_naver_outfits(
        situation=situation,
        style=style,
        gender=gender,
        personal_color=personal_color,
        skeleton_type=skeleton_type,
        season=season,
        limit=effective_limit,
    )
    if len(naver_items) >= effective_limit:
        return {
            "source": "product_catalog" if os.getenv("SHOPPING_PROVIDER") == "product_catalog" else "naver_shopping",
            "situation": situation,
            "style": style,
            "season": resolve_season(season) if season.strip() else "",
            "count": len(naver_items),
            "items": naver_items,
        }

    chroma_items = _recommend_chroma_outfits(
        situation=situation,
        style=style,
        gender=gender,
        personal_color=personal_color,
        skeleton_type=skeleton_type,
        season=season,
        limit=effective_limit,
    )
    merged_items = _merge_public_recommendation_items(naver_items, chroma_items)
    if merged_items:
        return {
            "source": "naver_shopping" if not chroma_items else "mixed",
            "situation": situation,
            "style": style,
            "season": resolve_season(season) if season.strip() else "",
            "count": len(merged_items[:effective_limit]),
            "items": merged_items[:effective_limit],
        }

    return {
        "source": "naver_shopping",
        "situation": situation,
        "style": style,
        "season": resolve_season(season) if season.strip() else "",
        "count": 0,
        "items": [],
    }


@app.post("/api/recommend/products")
async def recommend_products(request: ProductRecommendationRequest):
    effective_limit = max(request.limit, 7)
    gender = _normalize_gender_input(request.gender)
    personal_color = _normalize_personal_color_input(
        request.personalColor or request.personal_color
    )
    skeleton_type = request.bodyType or request.skeleton_type
    style_context = retrieve_style_context(
        gender=gender,
        personal_color=personal_color,
        skeleton_type=skeleton_type,
        situation=request.situation,
        mood=request.mood,
        season="",
    )
    queries = _build_naver_search_keywords(
        style_context.get("search_keywords", []),
        gender=gender,
        style=request.mood,
        skeleton_type=skeleton_type,
        style_context=style_context,
    )
    items = _recommend_naver_outfits(
        situation=request.situation,
        style=request.mood,
        gender=gender,
        personal_color=personal_color,
        skeleton_type=skeleton_type,
        season="",
        limit=effective_limit,
    )
    rule = style_context.get("ruleset", {})

    return {
        "ruleId": str(rule.get("id") or rule.get("key", "")) if isinstance(rule, dict) else "",
        "queries": queries,
        "products": [
            {
                "name": item.get("title", ""),
                "image": item.get("image_url", ""),
                "price": _parse_price(item.get("price", "")),
                "mallName": item.get("mall_name", ""),
                "link": item.get("link", ""),
                "category": item.get("category_path") or item.get("category", ""),
                "score": item.get("recommendation_score", 0),
                "matched": item.get("recommendation_reasons", []),
            }
            for item in items
        ],
    }


@app.get("/kfashion-options")
async def kfashion_options():
    rows = _load_kfashion_rows()
    situations = set()
    moods = set()
    styles = set()
    categories = set()

    for row in rows:
        situations.update(_split_tags(row.get("situation_tags", "")))
        moods.update(_split_tags(row.get("mood_tags", "")))
        styles.add(row.get("style", ""))
        categories.add(row.get("category", ""))

    return {
        "total": len(rows),
        "situations": sorted(tag for tag in situations if tag),
        "moods": sorted(tag for tag in moods if tag),
        "styles": sorted(tag for tag in styles if tag),
        "categories": sorted(tag for tag in categories if tag),
    }


@app.post("/analyze-personal-color")
async def analyze_personal_color(
    user_face: UploadFile = File(...),
    gender: str = Query("", description="성별 선택값. 예: female, male"),
):
    image_bytes = await user_face.read()
    try:
        return await asyncio.to_thread(predict_personal_color, image_bytes, gender=gender)
    except RuntimeError as exc:
        raise HTTPException(status_code=503, detail=str(exc)) from exc


@app.post("/api/analyze-closet-item")
async def analyze_closet_item(request: ClosetItemAnalysisRequest):
    """Clean a closet photo and identify its category and visible item details."""
    allowed_categories = {"상의", "하의", "아우터"}
    requested_category = request.category.strip()
    if requested_category and requested_category not in allowed_categories:
        raise HTTPException(status_code=400, detail="지원하지 않는 옷 카테고리입니다.")

    image_data = request.image_data.strip()
    if not image_data.startswith("data:image/") or "," not in image_data:
        raise HTTPException(status_code=400, detail="옷 사진 형식이 올바르지 않습니다.")

    try:
        encoded_image = image_data.split(",", 1)[1]
        original_bytes = base64.b64decode(encoded_image, validate=True)
        if len(original_bytes) > 12 * 1024 * 1024:
            raise HTTPException(status_code=413, detail="사진은 12MB 이하로 올려주세요.")
        cleaned_bytes = await asyncio.to_thread(prepare_closet_image, original_bytes)
    except HTTPException:
        raise
    except ValueError as exc:
        raise HTTPException(status_code=422, detail=str(exc)) from exc
    except Exception as exc:
        raise HTTPException(status_code=502, detail=f"사진 배경을 정리하지 못했습니다: {exc}") from exc

    cleaned_data_uri = "data:image/jpeg;base64," + base64.b64encode(cleaned_bytes).decode("ascii")
    # The same cleaned white-background photo is used for Vision and closet storage.
    vision_data_uri = cleaned_data_uri
    if client is None:
        raise HTTPException(status_code=503, detail="옷 분석 API 키가 서버에 설정되지 않았습니다.")

    try:
        result = await asyncio.to_thread(client.chat.completions.create,
            model=os.getenv("OPENAI_VISION_MODEL", "gpt-4o-mini"),
            response_format={"type": "json_object"},
            messages=[
                {
                    "role": "system",
                    "content": (
                        "옷 사진을 보고 한국어 JSON으로 분석하세요. "
                        "필드는 category, item, color, pattern, style_tags 입니다. "
                        "category는 상의/하의/아우터 중 하나, item은 짧은 옷 이름, "
                        "color는 대표 색상 한 가지, pattern은 무지/스트라이프/체크 등 짧은 무늬 정보, "
                        "style_tags는 상황·무드 코디에 쓸 수 있는 짧은 한국어 태그 1~3개 배열입니다. "
                        "확실하지 않은 소재를 추정하지 말고 신체나 사람을 분석하지 마세요."
                    ),
                },
                {
                    "role": "user",
                    "content": [
                        {"type": "text", "text": f"사용자가 선택한 카테고리: {requested_category or '선택 안 함. 사진을 보고 상의/하의/아우터 중 하나를 분류하세요.'}"},
                        {"type": "image_url", "image_url": {"url": vision_data_uri, "detail": "low"}},
                    ],
                },
            ],
        )
        content = result.choices[0].message.content or "{}"
        analysis = json.loads(content)
    except Exception as exc:
        raise HTTPException(status_code=502, detail=f"옷 분석에 실패했습니다: {exc}") from exc

    category = analysis.get("category", requested_category)
    if category not in allowed_categories:
        raise HTTPException(status_code=502, detail="옷 종류를 확인하지 못했습니다. 옷 한 벌이 잘 보이게 다시 촬영해주세요.")
    return {
        "category": category,
        "item": str(analysis.get("item") or "의류"),
        "color": str(analysis.get("color") or ""),
        "pattern": str(analysis.get("pattern") or ""),
        "style_tags": [
            str(tag)[:24]
            for tag in (analysis.get("style_tags") or [])[:3]
            if str(tag).strip()
        ] if isinstance(analysis.get("style_tags"), list) else [],
        "processed_image": cleaned_data_uri,
    }


@app.post("/api/recommend/closet")
def recommend_closet_outfits(request: ClosetRecommendationRequest):
    """Recommend combinations using only clothing already in the user's closet."""
    allowed_categories = {"아우터", "상의", "하의"}
    closet_items = [
        item for item in request.items if item.category in allowed_categories
    ]
    if not closet_items:
        raise HTTPException(
            status_code=422,
            detail="옷장에서 아우터·상의·하의 아이템을 찾지 못했습니다. 옷을 먼저 등록해주세요.",
        )

    available_categories = {item.category for item in closet_items}
    missing_categories = {"상의", "하의"} - available_categories
    if missing_categories:
        missing_label = "·".join(category for category in ("상의", "하의") if category in missing_categories)
        raise HTTPException(
            status_code=422,
            detail=f"완성 코디 추천을 위해 {missing_label} 옷도 등록해주세요. 등록된 옷만 조합해 추천합니다.",
        )

    ai_enabled = os.getenv("CLOSET_RECOMMENDATION_AI_ENABLED", "false").lower() in {
        "1", "true", "yes", "on"
    }
    if not ai_enabled:
        raise HTTPException(
            status_code=503,
            detail="실제 AI 코디 추천이 아직 승인·활성화되지 않았습니다.",
        )
    if client is None:
        raise HTTPException(
            status_code=503,
            detail="백엔드에 OPENAI_API_KEY가 설정되지 않았습니다.",
        )

    model = os.getenv("OPENAI_CLOSET_RECOMMENDATION_MODEL", "gpt-5.4-mini")
    prompt_items = [item.model_dump() for item in closet_items]
    try:
        result = client.chat.completions.create(
            model=model,
            reasoning_effort="low",
            max_completion_tokens=800,
            response_format={"type": "json_object"},
            messages=[
                {
                    "role": "system",
                    "content": (
                        "당신은 사용자의 옷장 안에 실제로 저장된 옷만 조합하는 코디 추천기입니다. "
                        "요청된 상황과 무드, 선택적으로 퍼스널 컬러와 골격 유형을 고려하세요. "
                        "아이템을 새로 만들어내거나 옷장 밖 아이템을 추가하지 마세요. "
                        "한 코디에는 아우터/상의/하의 각 카테고리에서 최대 한 벌만 선택하고, "
                        "모든 코디에는 등록된 상의 한 벌과 하의 한 벌을 반드시 포함하세요. "
                        "아우터는 선택 사항이며 상의를 대신할 수 없습니다. 잡화와 신발은 추천하지 마세요. "
                        "한국어 JSON으로 최대 3개 코디를 반환하세요. "
                        '형식: {"outfits":[{"title":"짧은 코디명",'
                        '"item_ids":["옷장 id"],"reason":"짧은 추천 이유"}]}.'
                    ),
                },
                {
                    "role": "user",
                    "content": json.dumps(
                        {
                            "situation": request.situation,
                            "mood": request.mood,
                            "gender": request.gender,
                            "personal_color": request.personal_color,
                            "skeleton_type": request.skeleton_type,
                            "closet_items": prompt_items,
                        },
                        ensure_ascii=False,
                    ),
                },
            ],
        )
        data = json.loads(result.choices[0].message.content or "{}")
    except Exception as exc:
        raise HTTPException(status_code=502, detail=f"내 옷 코디 추천에 실패했습니다: {exc}") from exc

    items_by_id = {item.id: item for item in closet_items}
    outfits = []
    seen_combinations = set()
    for index, outfit in enumerate(data.get("outfits", [])[:3]):
        selected = []
        selected_categories = set()
        for item_id in outfit.get("item_ids", []):
            item = items_by_id.get(str(item_id))
            if item is None or item.category in selected_categories:
                continue
            selected.append(item.id)
            selected_categories.add(item.category)
        combination = tuple(sorted(selected))
        if not {"상의", "하의"}.issubset(selected_categories) or combination in seen_combinations:
            continue
        seen_combinations.add(combination)
        outfits.append(
            {
                "id": f"ai-{index}-{'-'.join(selected)}",
                "title": str(outfit.get("title") or "오늘의 코디"),
                "item_ids": selected,
                "reason": str(outfit.get("reason") or "선택한 상황과 무드에 맞춰 조합했어요."),
            }
        )

    if not outfits:
        raise HTTPException(status_code=502, detail="완성된 상의·하의 코디를 받지 못했습니다. 다시 추천해주세요.")
    return {"source": "openai", "outfits": outfits}


def _build_demo_closet_outfits(
    items,
    refresh_seed: int,
    situation: str = "데일리",
    mood: str = "캐주얼",
    gender: str = "",
) -> list[dict]:
    ordered_categories = ["아우터", "상의", "하의"]
    groups = [
        [item for item in items if item.category == category]
        for category in ordered_categories
    ]
    groups = [group for group in groups if group]
    # No-cost contextual ranking: use the selected occasion/mood and garment
    # labels/tags to rank combinations. Never invent items outside the closet.
    ranked_groups = []
    for group in groups:
        ranked = []
        for item in group:
            text = " ".join(
                [item.name, item.category, item.color, item.pattern, *item.style_tags]
            )
            fit = _score_situation_mood_fit(text, situation, mood, gender)
            ranked.append((item, int(fit["score"])))
        ranked.sort(key=lambda row: row[1], reverse=True)
        ranked_groups.append(ranked)

    candidates = []

    def collect(group_index: int, selected: list, score: int) -> None:
        if group_index == len(ranked_groups):
            candidates.append((list(selected), score))
            return
        for item, item_score in ranked_groups[group_index][:12]:
            selected.append(item)
            collect(group_index + 1, selected, score + item_score)
            selected.pop()

    collect(0, [], 0)
    candidates.sort(key=lambda row: row[1], reverse=True)
    if candidates and refresh_seed:
        # Keep the best contextual matches while allowing refresh to show
        # alternate combinations within that equally relevant band.
        best = candidates[0][1]
        candidates = [row for row in candidates if row[1] >= best - 16]
        offset = refresh_seed % max(1, len(candidates))
        candidates = candidates[offset:] + candidates[:offset]

    outfits = []
    seen = set()
    for selected, _score in candidates:
        ids = tuple(item.id for item in selected)
        if ids in seen:
            continue
        seen.add(ids)
        detail = ", ".join(item.name for item in selected if item.name)
        outfits.append(
            {
                "id": "demo-" + "-".join(ids),
                "title": f"{situation} {mood} 코디",
                "item_ids": list(ids),
                "reason": (
                    f"{situation} 상황과 {mood} 무드에 맞춰 "
                    f"옷장 아이템({detail})으로 조합했어요."
                ),
            }
        )
        if len(outfits) == 3:
            break
    return outfits


@app.post("/generate-avatar")
async def generate_avatar(
    base_avatar: UploadFile = File(...),
    user_face: UploadFile = File(...)
):
    if client is None:
        raise RuntimeError("OPENAI_API_KEY가 설정되어 있지 않습니다.")

    prompt = """
    Edit the first image using the second image as a face reference.

    The first image is the base full-body avatar already placed on the final canvas.
    The second image is the user's face reference.

    Your task is NOT to create a new avatar.
    Your task is to keep the first image almost identical and only replace the face and hairstyle.
    A mask is provided; edit only the transparent masked area around the head and hair.

    Strictly preserve the first image:
    - exact canvas dimensions
    - exact avatar scale and placement on the canvas
    - same full-body composition
    - same body shape
    - same pose
    - same clothing
    - same arms, hands, legs, and feet
    - same canvas size
    - same framing
    - same background style

    Do not crop the image.
    Do not zoom in.
    Do not shift the avatar up, down, left, or right.
    Do not cut off the feet.
    Do not cut off the top of the head or hair.
    Do not redraw the body.
    Do not change the outfit.
    Do not make the result look like a different person’s body.

    Only modify:
    - face shape
    - eyes
    - nose
    - lips
    - facial impression
    - hairstyle around the head

    Make the avatar's face naturally resemble the second image.
    Keep the result as a high-quality semi-realistic 3D avatar, not a real photograph.
    The final image must show the full body from head to feet.
    """

    base_bytes = await base_avatar.read()
    user_bytes = await user_face.read()
    output_size = _parse_image_size(os.getenv("OPENAI_IMAGE_SIZE", "1024x1536"))
    prepared_base_bytes, mask_bytes = _prepare_avatar_edit_inputs(
        base_bytes,
        output_size,
    )

    base_file = BytesIO(prepared_base_bytes)
    base_file.name = "base_avatar.png"

    mask_file = BytesIO(mask_bytes)
    mask_file.name = "avatar_head_mask.png"

    user_file = BytesIO(user_bytes)
    user_file.name = "user_face.png"

    result = await asyncio.to_thread(client.images.edit,
        model=os.getenv("OPENAI_IMAGE_MODEL", "gpt-image-1.5"),
        image=[base_file, user_file],
        mask=mask_file,
        prompt=prompt,
        size=f"{output_size[0]}x{output_size[1]}",
        quality="high",
        input_fidelity="high",
        output_format="png",
        background=os.getenv("OPENAI_IMAGE_BACKGROUND", "transparent"),
    )

    image_base64 = result.data[0].b64_json
    image_base64 = _remove_light_edge_background(image_base64)

    return {
        "image": f"data:image/png;base64,{image_base64}"
    }


@app.post("/virtual-try-on")
async def virtual_try_on(request: VirtualTryOnRequest):
    fal_key = os.getenv("FAL_KEY")
    if not fal_key:
        raise RuntimeError("FAL_KEY가 설정되어 있지 않습니다.")

    model = os.getenv("FAL_TRYON_MODEL", "fal-ai/fashn/tryon/v1.5")
    normalized_request = VirtualTryOnRequest(
        person_image=_normalize_fal_input_image(request.person_image),
        garment_image=request.garment_image,
        item_type=request.item_type,
        preserve_pose=request.preserve_pose,
    )
    payload = _build_fal_try_on_payload(
        model=model,
        request=normalized_request,
    )
    response = await asyncio.to_thread(requests.post,
        f"https://fal.run/{model}",
        headers={
            "Authorization": f"Key {fal_key}",
            "Content-Type": "application/json",
        },
        json=payload,
        timeout=120,
    )
    if response.status_code >= 400:
        raise RuntimeError(f"fal.ai 피팅 실패: {response.text}")

    data = response.json()
    result_image = _extract_fal_result_image(data)
    if not result_image:
        raise RuntimeError(f"fal.ai 결과 이미지가 없습니다: {data}")

    return {
        "image_url": result_image,
        "model": model,
        "raw": data,
    }


def _build_fal_try_on_payload(
    model: str,
    request: VirtualTryOnRequest,
) -> dict[str, object]:
    item_type = _normalize_try_on_item_type(request.item_type)
    if "leffa/virtual-tryon" in model:
        return {
            "human_image_url": request.person_image,
            "garment_image_url": request.garment_image,
            "garment_type": _leffa_garment_type(item_type),
            "output_format": "png",
        }
    if "cat-vton" in model:
        return {
            "human_image_url": request.person_image,
            "garment_image_url": request.garment_image,
            "cloth_type": _cat_vton_cloth_type(item_type),
        }
    if "fashn/tryon" in model:
        return {
            "model_image": request.person_image,
            "garment_image": request.garment_image,
            "category": _fashn_category(item_type),
            "mode": os.getenv("FAL_FASHN_MODE", "quality"),
            "garment_photo_type": os.getenv("FAL_GARMENT_PHOTO_TYPE", "auto"),
            "moderation_level": os.getenv("FAL_FASHN_MODERATION_LEVEL", "permissive"),
            "num_samples": 1,
            "segmentation_free": True,
            "output_format": "png",
        }
    return {
        "person_image_url": request.person_image,
        "clothing_image_url": request.garment_image,
        "preserve_pose": request.preserve_pose,
        "aspect_ratio": {"ratio": "3:4"},
    }


def _normalize_fal_input_image(image_value: str) -> str:
    if not image_value.startswith("data:image/"):
        return image_value

    try:
        _, encoded = image_value.split(",", 1)
        image = Image.open(BytesIO(base64.b64decode(encoded))).convert("RGBA")
    except Exception:
        return image_value

    background = Image.new("RGBA", image.size, (248, 247, 243, 255))
    background.alpha_composite(image)
    output = BytesIO()
    background.convert("RGB").save(output, format="PNG")
    return f"data:image/png;base64,{base64.b64encode(output.getvalue()).decode()}"


def _extract_fal_result_image(data: dict) -> str:
    if isinstance(data.get("image"), dict):
        return str(data["image"].get("url") or "")
    images = data.get("images")
    if isinstance(images, list) and images:
        first = images[0]
        if isinstance(first, dict):
            return str(first.get("url") or "")
    return str(data.get("image_url") or data.get("url") or "")


def _normalize_try_on_item_type(value: str) -> str:
    text = (value or "").strip().lower()
    if any(token in text for token in ["아우터", "자켓", "재킷", "코트", "outer"]):
        return "outer"
    if any(token in text for token in ["하의", "바지", "팬츠", "스커트", "bottom", "lower"]):
        return "bottom"
    if any(token in text for token in ["원피스", "드레스", "dress", "one"]):
        return "onepiece"
    return "top"


def _leffa_garment_type(item_type: str) -> str:
    if item_type == "bottom":
        return "lower_body"
    if item_type == "onepiece":
        return "dresses"
    return "upper_body"


def _cat_vton_cloth_type(item_type: str) -> str:
    if item_type == "bottom":
        return "lower"
    if item_type == "onepiece":
        return "overall"
    return "upper"


def _fashn_category(item_type: str) -> str:
    if item_type == "bottom":
        return "bottoms"
    if item_type == "onepiece":
        return "one-pieces"
    return "tops"


def _parse_image_size(value: str) -> tuple[int, int]:
    match = re.fullmatch(r"\s*(\d+)x(\d+)\s*", value or "")
    if not match:
        return 1024, 1536
    width, height = int(match.group(1)), int(match.group(2))
    if width <= 0 or height <= 0:
        return 1024, 1536
    return width, height


def _prepare_avatar_edit_inputs(
    base_bytes: bytes,
    output_size: tuple[int, int],
) -> tuple[bytes, bytes]:
    canvas_width, canvas_height = output_size
    avatar = Image.open(BytesIO(base_bytes)).convert("RGBA")
    bbox = avatar.getchannel("A").getbbox() or (0, 0, avatar.width, avatar.height)
    avatar = avatar.crop(bbox)

    scale = min(
        canvas_width * 0.66 / avatar.width,
        canvas_height * 0.90 / avatar.height,
    )
    target_width = max(1, round(avatar.width * scale))
    target_height = max(1, round(avatar.height * scale))
    resampling = getattr(getattr(Image, "Resampling", Image), "LANCZOS")
    avatar = avatar.resize((target_width, target_height), resampling)

    left = round((canvas_width - target_width) / 2)
    top = round((canvas_height - target_height) / 2)
    canvas = Image.new("RGBA", output_size, (255, 255, 255, 0))
    canvas.alpha_composite(avatar, (left, top))

    mask = Image.new("RGBA", output_size, (0, 0, 0, 255))
    edit_left = max(0, round(left + target_width * 0.10))
    edit_top = max(0, round(top - target_height * 0.03))
    edit_right = min(canvas_width, round(left + target_width * 0.90))
    edit_bottom = min(canvas_height, round(top + target_height * 0.34))
    mask_pixels = mask.load()
    for y in range(edit_top, edit_bottom):
        for x in range(edit_left, edit_right):
            mask_pixels[x, y] = (0, 0, 0, 0)

    base_output = BytesIO()
    canvas.save(base_output, format="PNG")

    mask_output = BytesIO()
    mask.save(mask_output, format="PNG")
    return base_output.getvalue(), mask_output.getvalue()


def _remove_light_edge_background(image_base64: str) -> str:
    image_bytes = base64.b64decode(image_base64)
    image = Image.open(BytesIO(image_bytes)).convert("RGBA")
    pixels = image.load()
    width, height = image.size
    visited = set()
    stack = []

    for x in range(width):
        stack.append((x, 0))
        stack.append((x, height - 1))
    for y in range(height):
        stack.append((0, y))
        stack.append((width - 1, y))

    def is_background(pixel):
        red, green, blue, alpha = pixel
        if alpha == 0:
            return True
        is_light = red >= 235 and green >= 235 and blue >= 235
        is_neutral = max(red, green, blue) - min(red, green, blue) <= 24
        return is_light and is_neutral

    while stack:
        x, y = stack.pop()
        if (x, y) in visited or x < 0 or y < 0 or x >= width or y >= height:
            continue
        visited.add((x, y))

        if not is_background(pixels[x, y]):
            continue

        red, green, blue, _ = pixels[x, y]
        pixels[x, y] = (red, green, blue, 0)
        stack.extend(((x + 1, y), (x - 1, y), (x, y + 1), (x, y - 1)))

    output = BytesIO()
    image.save(output, format="PNG")
    return base64.b64encode(output.getvalue()).decode("utf-8")


def _recommend_naver_outfits(
    situation: str,
    style: str,
    gender: str,
    personal_color: str,
    skeleton_type: str,
    season: str,
    limit: int,
) -> list[dict[str, object]]:
    if os.getenv("SHOPPING_PROVIDER") == "product_catalog":
        return _recommend_catalog_outfits(situation, style, gender, personal_color,
                                          skeleton_type, season, limit)
    client_id = os.getenv("NAVER_CLIENT_ID")
    client_secret = os.getenv("NAVER_CLIENT_SECRET")
    if not client_id or not client_secret:
        return []

    style_context = retrieve_style_context(
        gender=gender,
        personal_color=personal_color,
        skeleton_type=skeleton_type,
        situation=situation,
        mood=style,
        season=season,
    )
    keywords = style_context["search_keywords"] or [
        f"{_gender_label(gender)} {situation} {style}"
    ]
    keywords = _build_naver_search_keywords(
        keywords,
        gender=gender,
        style=style,
        skeleton_type=skeleton_type,
        style_context=style_context,
    )

    headers = {
        "X-Naver-Client-Id": client_id,
        "X-Naver-Client-Secret": client_secret,
    }
    candidates = []
    relaxed_candidates = []
    seen_links = set()
    seen_products = set()
    minimum_items = min(max(limit, 7), 30)

    for keyword in keywords:
        expected_item_type = _expected_naver_item_type(keyword)
        if gender == "male" and expected_item_type == "원피스":
            continue
        if expected_item_type in {"신발", "잡화"}:
            continue

        try:
            query = urlencode(
                {
                    "query": keyword,
                    "display": 20,
                    "sort": "sim",
                }
            )
            request = Request(
                f"https://openapi.naver.com/v1/search/shop.json?{query}",
                headers=headers,
            )
            with urlopen(request, timeout=4) as response:
                payload = json.loads(response.read().decode("utf-8"))
            items = payload.get("items", [])
        except (URLError, HTTPError, TimeoutError, json.JSONDecodeError):
            continue

        for raw_item in items:
            link = raw_item.get("link", "")
            if link in seen_links:
                continue
            seen_links.add(link)

            item = _naver_public_item(raw_item, keyword)
            product_key = _stable_product_id(_product_signature(item.get("title", "")))
            if product_key in seen_products:
                continue
            seen_products.add(product_key)

            item_type = str(item.get("item_type", ""))
            if item_type in {"신발", "잡화", "기타"}:
                continue
            strict_type_match = not expected_item_type or item_type == expected_item_type
            if strict_type_match and _passes_naver_quality_filters(
                item,
                gender,
                personal_color,
                skeleton_type,
                style_context,
                situation=situation,
                style=style,
                require_item_match=True,
            ):
                score_info = _score_naver_item(
                    item=item,
                    situation=situation,
                    style=style,
                    gender=gender,
                    personal_color=personal_color,
                    skeleton_type=skeleton_type,
                    style_context=style_context,
                )
                item.update(score_info)
                candidates.append(item)
                continue

            if not _passes_naver_quality_filters(
                item,
                gender,
                personal_color,
                skeleton_type,
                style_context,
                situation=situation,
                style=style,
                require_item_match=False,
            ):
                continue

            score_info = _score_naver_item(
                item=item,
                situation=situation,
                style=style,
                gender=gender,
                personal_color=personal_color,
                skeleton_type=skeleton_type,
                style_context=style_context,
            )
            item.update(score_info)
            item["recommendation_score"] = int(item.get("recommendation_score", 0)) - 15
            item["recommendation_reasons"] = _dedupe_keep_order([
                *item.get("recommendation_reasons", []),
                "완화매칭",
            ])
            relaxed_candidates.append(item)

    if not candidates and not relaxed_candidates:
        return []

    if len(candidates) < minimum_items:
        candidates = _merge_naver_candidates(candidates, relaxed_candidates)

    candidates.sort(
        key=lambda item: (
            int(item.get("recommendation_score", 0)),
            random.random(),
        ),
        reverse=True,
    )
    return _pick_diverse_naver_items(candidates, limit)


def _recommend_catalog_outfits(situation, style, gender, personal_color,
                              skeleton_type, season, limit):
    """Rank collected real products; prices/availability are NOT live quotes."""
    path = ROOT_DIR / "structured_clothes_data.csv"
    if not path.is_file():
        raise HTTPException(status_code=503, detail="수집 상품 카탈로그가 없습니다.")
    context = retrieve_style_context(gender=gender, personal_color=personal_color,
                                    skeleton_type=skeleton_type, situation=situation,
                                    mood=style, season=season)
    candidates, seen = [], set()
    with path.open(encoding="utf-8-sig", newline="") as source:
        for row in csv.DictReader(source):
            if not _matches_requested_gender(" ".join([row.get("title", ""), row.get("category2", "")]), gender):
                continue
            row["lprice"] = row.get("price", "")
            item = _naver_public_item(row, row.get("query", ""))
            if item["item_type"] not in {"상의", "하의", "아우터", "원피스"} or item["image_id"] in seen:
                continue
            seen.add(item["image_id"])
            item.update(_score_naver_item(item, situation, style, gender,
                                          personal_color, skeleton_type, context))
            # Dataset tags are evidence from the collected product, not labels
            # invented from the current request.
            tags = " ".join(row.get(key, "") for key in ("situation_tags", "mood_tags", "style_tags", "season_tags"))
            for value in (situation, style):
                if value and value in tags:
                    item["recommendation_score"] += 15
            candidates.append(item)
    candidates.sort(key=lambda item: (-int(item["recommendation_score"]), str(item["image_id"])))
    # Collected listings can expire. Do not recommend items whose photo is no
    # longer available, and cache these checks for this server session.
    checked = candidates[:max(limit * 3, 45)]
    with ThreadPoolExecutor(max_workers=8) as pool:
        available = list(pool.map(_catalog_image_available,
                                  [str(item["image_url"]) for item in checked]))
    return _pick_diverse_naver_items(
        [item for item, valid in zip(checked, available) if valid], limit)


@lru_cache(maxsize=512)
def _catalog_image_available(url):
    try:
        with requests.get(url, stream=True, timeout=5, allow_redirects=False) as response:
            return (response.status_code == 200
                    and response.headers.get("content-type", "").startswith("image/"))
    except requests.RequestException:
        return False


def _recommend_chroma_outfits(
    situation: str,
    style: str,
    gender: str,
    personal_color: str,
    skeleton_type: str,
    season: str,
    limit: int,
) -> list[dict[str, object]]:
    try:
        matches = search_style_items(
            gender=gender,
            personal_color=personal_color,
            skeleton_type=skeleton_type,
            situation=situation,
            mood=style,
            season=season,
            limit=limit,
            persist_dir=CHROMA_PERSIST_DIR,
            collection_name=CHROMA_COLLECTION,
            embedding_model=OPENAI_EMBEDDING_MODEL,
        )
    except RuntimeError:
        return []

    if not matches:
        return []

    scored_rows = []
    for row in matches:
        if not _passes_chroma_quality_filters(row, gender):
            continue
        score_info = _score_chroma_item(
            row=row,
            situation=situation,
            style=style,
            gender=gender,
            personal_color=personal_color,
            skeleton_type=skeleton_type,
        )
        row.update(score_info)
        scored_rows.append((int(row.get("recommendation_score", 0)), row))

    scored_rows.sort(
        key=lambda item: (
            item[0],
            random.random(),
        ),
        reverse=True,
    )
    preferred_rows = [
        row
        for score, row in scored_rows
        if score >= 20 and not _has_avoid_reason(row.get("recommendation_reasons", []))
    ]
    if len(preferred_rows) >= limit:
        return _pick_diverse_items(preferred_rows, limit)

    return _pick_diverse_items([row for _, row in scored_rows], limit)


def _score_chroma_item(
    row: dict[str, object],
    situation: str,
    style: str,
    gender: str,
    personal_color: str,
    skeleton_type: str,
) -> dict[str, object]:
    style_context = row.get("style_context") if isinstance(row.get("style_context"), dict) else {}
    document = str(row.get("rag_document") or build_item_document(row))
    search_text = " ".join([
        document,
        str(row.get("style", "")),
        str(row.get("sub_style", "")),
        str(row.get("category", "")),
        str(row.get("color", "")),
        str(row.get("sub_color", "")),
        str(row.get("fit", "")),
        str(row.get("material", "")),
        str(row.get("print", "")),
        str(row.get("detail", "")),
        str(row.get("situation_tags", "")),
        str(row.get("mood_tags", "")),
    ])

    distance = float(row.get("vector_distance", 1.0) or 1.0)
    vector_score = max(0, int(30 - distance * 20))
    score = vector_score + _recommendation_score(row, situation, style)
    reasons = [f"벡터유사도:{vector_score}"]

    if personal_color:
        color_score = _score_personal_color_text(
            search_text,
            personal_color,
            gender,
            style_context=style_context,
        )
        score += int(color_score["score"])
        reasons.extend(f"색상:{color}" for color in color_score["matched_colors"])
        reasons.extend(f"피하기색상:{color}" for color in color_score["avoid_colors"])

    if skeleton_type:
        skeleton_score = _score_skeleton_context_text(
            search_text,
            skeleton_type,
            gender=gender,
            style_context=style_context,
        )
        score += int(skeleton_score["score"])
        reasons.extend(f"골격:{keyword}" for keyword in skeleton_score["matched_keywords"])
        reasons.extend(f"피하기골격:{keyword}" for keyword in skeleton_score["avoid_keywords"])

    season_score = _score_season_context_text(search_text, style_context)
    score += int(season_score["score"])
    reasons.extend(f"계절:{keyword}" for keyword in season_score["matched_keywords"])
    reasons.extend(f"계절주의:{keyword}" for keyword in season_score["avoid_keywords"])

    ruleset_score = _score_ruleset_context_text(search_text, style_context)
    score += int(ruleset_score["score"])
    reasons.extend(f"룰셋:{keyword}" for keyword in ruleset_score["matched_keywords"])
    reasons.extend(f"룰셋주의:{keyword}" for keyword in ruleset_score["avoid_keywords"])

    return {
        "recommendation_score": score,
        "recommendation_reasons": _dedupe_keep_order(reason for reason in reasons if reason),
    }


def _has_avoid_reason(reasons: object) -> bool:
    if not isinstance(reasons, list):
        reason_text = str(reasons)
        return (
            "피하기:" in reason_text
            or "피하기색상:" in reason_text
            or "피하기골격:" in reason_text
            or "계절주의:" in reason_text
            or "룰셋주의:" in reason_text
        )
    return any(
        str(reason).startswith("피하기:")
        or str(reason).startswith("피하기색상:")
        or str(reason).startswith("피하기골격:")
        or str(reason).startswith("계절주의:")
        or str(reason).startswith("룰셋주의:")
        for reason in reasons
    )


def _passes_chroma_quality_filters(row: dict[str, object], gender: str) -> bool:
    search_text = " ".join([
        str(row.get("title", "")),
        str(row.get("style", "")),
        str(row.get("sub_style", "")),
        str(row.get("item_type", "")),
        str(row.get("category", "")),
        str(row.get("rag_document", "")),
    ])
    if not _matches_requested_gender(search_text, gender):
        return False
    item_type = _normalize(row.get("item_type", ""))
    category = _normalize(row.get("category", ""))
    blocked_terms = MALE_BLOCKED_ITEM_TERMS if gender == "male" else FEMALE_BLOCKED_ITEM_TERMS
    return not any(term in item_type or term in category for term in blocked_terms)


def _build_naver_search_keywords(
    base_keywords: list[str],
    gender: str,
    style: str,
    skeleton_type: str,
    style_context: Optional[dict] = None,
) -> list[str]:
    style_context = style_context or {}
    ruleset_keywords = _ruleset_product_search_keywords(style_context, style)
    fallback_keywords = _section_fallback_keywords(
        gender=gender,
        style=style,
        existing_keywords=base_keywords,
    )
    search_base_keywords = _dedupe_keep_order([*ruleset_keywords, *base_keywords, *fallback_keywords])
    keywords = list(search_base_keywords)

    try:
        rules = get_skeleton_style_rules(skeleton_type, gender=gender) if skeleton_type else {}
    except KeyError:
        rules = {}

    gender_label = _gender_label(gender)
    skeleton_items_by_type = {
        "상의": rules.get("recommended_tops", []),
        "하의": rules.get("recommended_bottoms", []),
        "원피스": [],
        "아우터": [],
    }
    skeleton_modifiers = [
        *style_context.get("recommended_fit", []),
        *style_context.get("recommended_materials", []),
    ]
    color_modifiers = style_context.get("recommended_colors", [])[:5]

    for keyword in search_base_keywords:
        expected_type = _expected_naver_item_type(keyword)
        if gender == "male" and expected_type == "원피스":
            continue
        if expected_type not in {"상의", "하의", "원피스", "아우터"}:
            continue
        for skeleton_term in skeleton_modifiers[:2]:
            if _normalize_compact(skeleton_term) in _normalize_compact(keyword):
                continue
            keywords.append(f"{keyword} {skeleton_term}")
        for color_term in color_modifiers[:1]:
            if _normalize_compact(color_term) in _normalize_compact(keyword):
                continue
            keywords.append(f"{keyword} {color_term}")

    for item_type, skeleton_terms in skeleton_items_by_type.items():
        if any(_expected_naver_item_type(keyword) == item_type for keyword in base_keywords):
            continue
        for skeleton_term in skeleton_terms[:2]:
            keywords.append(f"{gender_label} {style} {skeleton_term}")

    return _dedupe_keep_order(
        _short_naver_query(keyword)
        for keyword in keywords
        if keyword and not _is_blocked_male_keyword(keyword, gender)
    )[:32]


def _is_blocked_male_keyword(keyword: str, gender: str) -> bool:
    if gender != "male":
        return False
    normalized = _normalize_compact(keyword)
    return any(_normalize_compact(term) in normalized for term in MALE_BLOCKED_ITEM_TERMS)


def _ruleset_product_search_keywords(style_context: dict, style: str) -> list[str]:
    ruleset = style_context.get("ruleset")
    if not isinstance(ruleset, dict):
        return []

    query = style_context.get("query", {})
    situation = str(query.get("situation", ""))
    situation_term = "하객" if situation == "하객룩" else situation
    items = _ruleset_search_items(ruleset)
    colors = list(ruleset.get("recommended_colors", []))
    fits = list(ruleset.get("recommended_fit", []))
    keywords = []

    for color, item in zip(colors[:5], items[:5]):
        keywords.append(f"{color} {_product_item_query_name(item)}")
    for color in colors[:2]:
        for item in items[:2]:
            keywords.append(f"{color} {situation_term} {_generic_item_query_name(item)}")
    for color, fit, item in zip(colors[:3], fits[:3], items[:3]):
        keywords.append(f"{color} {fit} {_product_item_query_name(item)}")
    if items:
        keywords.append(f"{situation_term} {_generic_item_query_name(items[0])}")
    if len(items) > 1:
        keywords.append(f"{style} {_generic_item_query_name(items[1])}")

    return _dedupe_keep_order(keywords)


def _ruleset_search_items(ruleset: dict) -> list[str]:
    grouped = ruleset.get("items", {})
    ordered = []
    if isinstance(grouped, dict):
        for section in ["onepiece", "tops", "bottoms", "outer"]:
            values = grouped.get(section, [])
            if isinstance(values, list):
                ordered.extend(str(value) for value in values)
    ordered.extend(str(value) for value in ruleset.get("recommended_items", []))
    return _dedupe_keep_order(item for item in ordered if item)


def _section_fallback_keywords(
    gender: str,
    style: str,
    existing_keywords: list[str],
) -> list[str]:
    gender_label = _gender_label(gender)
    existing_types = {
        _expected_naver_item_type(keyword)
        for keyword in existing_keywords
    }
    if gender == "male":
        fallback = {
            "상의": [
                f"{gender_label} {style} 셔츠",
                f"{gender_label} {style} 반팔티",
                f"{gender_label} {style} 니트",
            ],
            "하의": [
                f"{gender_label} {style} 팬츠",
                f"{gender_label} {style} 슬랙스",
            ],
            "아우터": [
                f"{gender_label} {style} 자켓",
                f"{gender_label} {style} 블레이저",
            ],
            "원피스": [],
        }
        if style in {"고프코어", "아웃도어", "스포티", "액티브"}:
            fallback["상의"] = [
                f"{gender_label} {style} 기능성 티셔츠",
                f"{gender_label} {style} 반팔티",
                f"{gender_label} 아웃도어 티셔츠",
            ]
    else:
        fallback = {
            "상의": [
                f"{gender_label} {style} 블라우스",
                f"{gender_label} {style} 셔츠",
                f"{gender_label} {style} 니트",
            ],
            "하의": [
                f"{gender_label} {style} 팬츠",
                f"{gender_label} {style} 슬랙스",
                f"{gender_label} {style} 데님팬츠",
                f"{gender_label} {style} 스커트",
            ],
            "아우터": [
                f"{gender_label} {style} 자켓",
                f"{gender_label} {style} 가디건",
            ],
            "원피스": [
                f"{gender_label} {style} 원피스",
            ],
        }

    keywords = []
    for item_type, values in fallback.items():
        if item_type in existing_types:
            keywords.extend(values[:1])
        else:
            keywords.extend(values[:2])
    return keywords


def _naver_public_item(raw_item: dict[str, object], query: str) -> dict[str, object]:
    title = _clean_html(raw_item.get("title", ""))
    category = _first_non_empty(
        raw_item.get("category4"),
        raw_item.get("category3"),
        raw_item.get("category2"),
        raw_item.get("category1"),
    )
    search_text = " ".join(
        _clean_html(value)
        for value in [
            query,
            title,
            raw_item.get("category1", ""),
            raw_item.get("category2", ""),
            raw_item.get("category3", ""),
            raw_item.get("category4", ""),
        ]
    )
    product_text = " ".join(
        _clean_html(value)
        for value in [
            title,
            raw_item.get("category1", ""),
            raw_item.get("category2", ""),
            raw_item.get("category3", ""),
            raw_item.get("category4", ""),
        ]
    )
    item_type = _infer_naver_item_type(product_text)
    color = _infer_color_name(search_text)

    return {
        "image_id": _stable_product_id(raw_item.get("link", title)),
        "title": title,
        "image_url": str(raw_item.get("image", "")),
        "link": str(raw_item.get("link", "")),
        "price": str(raw_item.get("lprice", "")),
        "mall_name": _clean_html(raw_item.get("mallName", "")),
        "style": "",
        "sub_style": "",
        "item_type": item_type,
        "category": category or item_type,
        "category1": _clean_html(raw_item.get("category1", "")),
        "category2": _clean_html(raw_item.get("category2", "")),
        "category3": _clean_html(raw_item.get("category3", "")),
        "category4": _clean_html(raw_item.get("category4", "")),
        "category_path": " > ".join(
            value
            for value in [
                _clean_html(raw_item.get("category1", "")),
                _clean_html(raw_item.get("category2", "")),
                _clean_html(raw_item.get("category3", "")),
                _clean_html(raw_item.get("category4", "")),
            ]
            if value
        ),
        "color": color,
        "sub_color": "",
        "fit": "",
        "material": "",
        "print": "",
        "detail": "",
        "situation_tags": "",
        "mood_tags": "",
        "source_query": query,
        "search_text": search_text,
        "product_text": product_text,
    }


def _score_naver_item(
    item: dict[str, object],
    situation: str,
    style: str,
    gender: str,
    personal_color: str,
    skeleton_type: str,
    style_context: Optional[dict] = None,
) -> dict[str, object]:
    text = str(item.get("search_text", ""))
    title_text = str(item.get("title", ""))
    normalized_title = _normalize_compact(title_text)
    score = 0
    reasons = []
    style_context = style_context or {}

    ruleset = style_context.get("ruleset", {})
    recommended_items = list(style_context.get("recommended_items", []))
    recommended_colors = list(style_context.get("recommended_colors", []))
    recommended_fit = list(style_context.get("recommended_fit", []))
    avoid_keywords = list(style_context.get("avoid_skeleton_keywords", []))
    if isinstance(ruleset, dict):
        recommended_items = _dedupe_keep_order([
            *_ruleset_search_items(ruleset),
            *recommended_items,
        ])
        recommended_colors = _dedupe_keep_order([
            *ruleset.get("recommended_colors", []),
            *recommended_colors,
        ])
        recommended_fit = _dedupe_keep_order([
            *ruleset.get("recommended_fit", []),
            *recommended_fit,
        ])
        avoid_keywords = _dedupe_keep_order([
            *ruleset.get("avoid", []),
            *avoid_keywords,
        ])

    matched_items = _matched_ruleset_terms(normalized_title, recommended_items)
    if matched_items:
        score += 40
        reasons.extend(matched_items[:3])

    matched_colors = _matched_ruleset_terms(normalized_title, recommended_colors)
    if matched_colors:
        score += 20
        reasons.extend(matched_colors[:3])

    if _contains_text(text, situation) or _contains_text(text, "하객" if situation == "하객룩" else situation):
        score += 15
        reasons.append(situation)
    if _contains_text(text, style):
        score += 10
        reasons.append(style)

    context_score = _score_situation_mood_fit(
        text=title_text,
        situation=situation,
        style=style,
        gender=gender,
    )
    score += int(context_score["score"])
    reasons.extend(context_score["matched_keywords"])
    reasons.extend(f"무드주의:{keyword}" for keyword in context_score["avoid_keywords"])

    if gender == "female" and item.get("item_type") == "하의":
        bottom_type = _bottom_subtype(title_text)
        if bottom_type in {"팬츠", "슬랙스", "데님"}:
            score += 8
            reasons.append(bottom_type)
        elif bottom_type == "스커트":
            score -= 4

    matched_fit = _matched_ruleset_terms(normalized_title, recommended_fit)
    if matched_fit:
        score += 10
        reasons.extend(matched_fit[:3])

    if item.get("item_type") in {"상의", "하의", "원피스", "아우터"}:
        score += 20

    avoid_matches = _matched_ruleset_terms(normalized_title, avoid_keywords)
    if avoid_matches:
        score -= 50
        reasons.extend(f"피하기:{keyword}" for keyword in avoid_matches[:3])

    if personal_color:
        color_score = _score_personal_color_text(
            text,
            personal_color,
            gender,
            style_context=style_context,
        )
        score += color_score["score"]
        reasons.extend(color_score["matched_colors"])
        if color_score["avoid_colors"]:
            reasons.extend(f"피하기:{color}" for color in color_score["avoid_colors"])

    if skeleton_type:
        skeleton_score = _score_skeleton_context_text(
            text,
            skeleton_type,
            gender=gender,
            style_context=style_context,
        )
        score += int(skeleton_score["score"])
        reasons.extend(skeleton_score["matched_keywords"])
        if skeleton_score["avoid_keywords"]:
            reasons.extend(f"피하기:{keyword}" for keyword in skeleton_score["avoid_keywords"])

    season_score = _score_season_context_text(text, style_context)
    score += int(season_score["score"])
    reasons.extend(season_score["matched_keywords"])
    if season_score["avoid_keywords"]:
        reasons.extend(f"계절주의:{keyword}" for keyword in season_score["avoid_keywords"])

    return {
        "recommendation_score": score,
        "recommendation_reasons": _dedupe_keep_order(reason for reason in reasons if reason)[:10],
        "situation_tags": situation,
        "mood_tags": style,
    }


def _score_personal_color_text(
    text: str,
    personal_color: str,
    gender: str,
    style_context: Optional[dict] = None,
) -> dict[str, object]:
    try:
        palette = get_personal_color_palette(personal_color, gender=gender)
    except KeyError:
        return {"score": 0, "matched_colors": [], "avoid_colors": []}

    style_context = style_context or {}
    normalized_text = _normalize_compact(text)
    base_result = COLOR_RESULTS.get(personal_color, {})
    base_colors = list(base_result.get("recommended_colors", []))
    if gender == "male":
        base_colors.extend(base_result.get("male_recommended_colors", []))
    recommended_colors = _dedupe_keep_order([
        *base_colors,
        *palette["recommended"],
        *style_context.get("recommended_colors", []),
    ])
    avoid_colors = _dedupe_keep_order([
        *base_result.get("avoid_colors", []),
        *palette["avoid"],
        *style_context.get("avoid_colors", []),
    ])
    matched = [
        color for color in recommended_colors
        if _normalize_compact(color) in normalized_text
    ]
    avoided = [
        color for color in avoid_colors
        if _normalize_compact(color) in normalized_text
    ]
    return {
        "score": len(matched) * 5 - len(avoided) * 10,
        "matched_colors": matched[:4],
        "avoid_colors": avoided[:3],
    }


def _score_skeleton_context_text(
    text: str,
    skeleton_type: str,
    gender: str,
    style_context: Optional[dict] = None,
) -> dict[str, object]:
    base_score = score_skeleton_text(text, skeleton_type, gender=gender)
    style_context = style_context or {}
    normalized_text = _normalize_compact(text)
    context_rules = {
        "recommended_fit": (style_context.get("recommended_fit", []), 4),
        "recommended_items": (style_context.get("recommended_items", []), 5),
        "recommended_materials": (style_context.get("recommended_materials", []), 3),
        "avoid_skeleton_keywords": (style_context.get("avoid_skeleton_keywords", []), -10),
    }
    score = int(base_score["score"])
    matched = list(base_score["matched_keywords"])
    avoided = list(base_score["avoid_keywords"])

    for key, (keywords, weight) in context_rules.items():
        for keyword in keywords:
            if not _keyword_in_text(keyword, normalized_text):
                continue
            score += weight
            if weight > 0:
                matched.append(keyword)
            else:
                avoided.append(keyword)

    penalty_keywords = _skeleton_fit_penalties(skeleton_type)
    for keyword in penalty_keywords:
        if not _keyword_in_text(keyword, normalized_text):
            continue
        score -= 12
        avoided.append(keyword)

    return {
        "score": score,
        "matched_keywords": _dedupe_keep_order(matched),
        "avoid_keywords": _dedupe_keep_order(avoided),
    }


def _passes_naver_quality_filters(
    item: dict[str, object],
    gender: str,
    personal_color: str,
    skeleton_type: str,
    style_context: Optional[dict] = None,
    situation: str = "",
    style: str = "",
    require_item_match: bool = True,
) -> bool:
    product_text = str(item.get("product_text", ""))
    title_text = str(item.get("title", ""))
    normalized_title = _normalize_compact(title_text)
    style_context = style_context or {}

    if not item.get("image_url"):
        return False
    price = _parse_price(item.get("price", ""))
    if price and price < 5000:
        return False
    if item.get("category1") and item.get("category1") != "패션의류":
        return False
    if _matched_ruleset_terms(normalized_title, GLOBAL_BLOCK_KEYWORDS):
        return False
    if not _matches_requested_gender(product_text, gender):
        return False
    if gender == "male" and _is_blocked_male_keyword(product_text, gender):
        return False
    if gender == "female" and _is_blocked_female_product(product_text):
        return False
    if _is_mixed_set_product(product_text):
        return False
    if situation or style:
        context_score = _score_situation_mood_fit(
            text=product_text,
            situation=situation,
            style=style,
            gender=gender,
        )
        if int(context_score["score"]) <= -30:
            return False
    recommended_items = list(style_context.get("recommended_items", []))
    ruleset = style_context.get("ruleset", {})
    if isinstance(ruleset, dict):
        recommended_items = _dedupe_keep_order([
            *_ruleset_search_items(ruleset),
            *recommended_items,
        ])
        avoid_matches = _matched_ruleset_terms(normalized_title, ruleset.get("avoid", []))
        if avoid_matches:
            return False
    if require_item_match and recommended_items and not _matched_ruleset_terms(normalized_title, recommended_items):
        return False
    season_score = _score_season_context_text(product_text, style_context)
    if season_score["avoid_keywords"] and int(season_score["score"]) <= -10:
        return False

    if skeleton_type:
        skeleton_score = score_skeleton_text(product_text, skeleton_type, gender=gender)
        if skeleton_score["avoid_keywords"] and int(skeleton_score["score"]) <= -10:
            return False

    return True


def _score_season_context_text(
    text: str,
    style_context: Optional[dict] = None,
) -> dict[str, object]:
    style_context = style_context or {}
    normalized_text = _normalize_compact(text)
    matched = [
        keyword
        for keyword in style_context.get("recommended_season_keywords", [])
        if _keyword_in_text(keyword, normalized_text)
    ]
    avoided = [
        keyword
        for keyword in style_context.get("avoid_season_keywords", [])
        if _keyword_in_text(keyword, normalized_text)
    ]
    return {
        "score": len(matched) * 4 - len(avoided) * 12,
        "matched_keywords": matched[:4],
        "avoid_keywords": avoided[:3],
    }


def _score_ruleset_context_text(
    text: str,
    style_context: Optional[dict] = None,
) -> dict[str, object]:
    style_context = style_context or {}
    ruleset = style_context.get("ruleset")
    if not isinstance(ruleset, dict):
        return {"score": 0, "matched_keywords": [], "avoid_keywords": []}

    normalized_text = _normalize_compact(text)
    score = 0
    matched = []
    avoided = []
    positive_groups = [
        ("recommended_items", 6),
        ("recommended_colors", 5),
        ("recommended_fit", 4),
    ]

    for key, weight in positive_groups:
        for keyword in ruleset.get(key, []):
            if not _ruleset_term_in_text(keyword, normalized_text):
                continue
            score += weight
            matched.append(str(keyword))

    for keyword in ruleset.get("avoid", []):
        if not _ruleset_term_in_text(keyword, normalized_text):
            continue
        score -= 12
        avoided.append(str(keyword))

    return {
        "score": score,
        "matched_keywords": _dedupe_keep_order(matched)[:6],
        "avoid_keywords": _dedupe_keep_order(avoided)[:4],
    }


def _keyword_in_text(keyword: object, normalized_text: str) -> bool:
    normalized_keyword = _normalize_compact(keyword)
    if not normalized_keyword:
        return False
    if normalized_keyword == "셔츠":
        return "셔츠" in normalized_text and "티셔츠" not in normalized_text
    return normalized_keyword in normalized_text


def _ruleset_term_in_text(keyword: object, normalized_text: str) -> bool:
    normalized_keyword = _normalize_compact(keyword)
    if not normalized_keyword:
        return False
    if _keyword_in_text(normalized_keyword, normalized_text):
        return True

    tokens = [
        token
        for token in re.split(r"[\s,/·]+", str(keyword).strip())
        if len(_normalize_compact(token)) >= 2
        and _normalize_compact(token) not in _RULESET_MATCH_STOPWORDS
    ]
    return any(_keyword_in_text(token, normalized_text) for token in tokens)


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


def _skeleton_fit_penalties(skeleton_type: str) -> list[str]:
    if skeleton_type == "스트레이트":
        return ["오버사이즈", "오버핏", "루즈", "박시", "스키니"]
    if skeleton_type == "웨이브":
        return ["오버사이즈", "오버핏", "루즈", "박시", "로우라이즈"]
    if skeleton_type == "내추럴":
        return ["타이트", "스키니", "초슬림"]
    return []


def _is_mixed_set_product(text: str) -> bool:
    normalized_text = _normalize(text)
    return any(keyword in normalized_text for keyword in ["투피스", "세트", "셋업", "코디세트"])


def _matches_requested_gender(text: str, gender: str) -> bool:
    normalized_text = _normalize(text)
    if any(keyword in normalized_text for keyword in ["남녀공용", "공용", "유니섹스", "unisex"]):
        return True
    female_keywords = ["여성", "여자", "여아", "우먼", "레이디", "레이디스", "woman", "women"]
    male_keywords = ["남성", "남자", "남아", "맨즈", "맨투맨즈", "man", "men"]
    if gender == "male":
        return not _contains_gender_keyword(normalized_text, female_keywords)
    return not _contains_gender_keyword(normalized_text, male_keywords)


def _contains_gender_keyword(normalized_text: str, keywords: list[str]) -> bool:
    for keyword in keywords:
        if keyword in {"man", "men", "woman", "women"}:
            if re.search(rf"\b{keyword}\b", normalized_text):
                return True
            continue
        if keyword in normalized_text:
            return True
    return False


def _is_blocked_female_product(text: str) -> bool:
    normalized = _normalize(text)
    return any(keyword in normalized for keyword in FEMALE_BLOCKED_ITEM_TERMS)


def _score_situation_mood_fit(
    text: str,
    situation: str,
    style: str,
    gender: str,
) -> dict[str, object]:
    normalized_text = _normalize_compact(text)
    situation_key = re.sub(r"[^0-9a-z가-힣]+", "", _normalize_compact(situation))
    style_key = re.sub(r"[^0-9a-z가-힣]+", "", _normalize_compact(style))
    positive, negative = _context_keywords_for(situation_key, style_key, gender)
    matched = [
        keyword for keyword in positive
        if _keyword_in_text(keyword, normalized_text)
    ]
    avoided = [
        keyword for keyword in negative
        if _keyword_in_text(keyword, normalized_text)
    ]
    return {
        "score": len(matched) * 8 - len(avoided) * 18,
        "matched_keywords": matched[:4],
        "avoid_keywords": avoided[:4],
    }


def _context_keywords_for(
    situation_key: str,
    style_key: str,
    gender: str,
) -> tuple[list[str], list[str]]:
    common_negative = ["잠옷", "파자마", "홈웨어", "수영복", "비키니", "속옷"]
    situation_rules = {
        "하객룩": (
            ["원피스", "블라우스", "스커트", "슬랙스", "자켓", "재킷", "트위드", "니트"],
            ["트레이닝", "츄리닝", "조거", "카고", "후드", "맨투맨", "레깅스", "운동복", "민소매", "크롭"],
        ),
        "출근면접": (
            ["셔츠", "블라우스", "슬랙스", "자켓", "재킷", "블레이저", "니트", "가디건", "일자"],
            ["트레이닝", "츄리닝", "조거", "후드", "맨투맨", "레깅스", "미니스커트", "크롭", "찢청"],
        ),
        "데이트": (
            ["블라우스", "니트", "가디건", "스커트", "원피스", "슬랙스", "데님", "셔츠"],
            ["트레이닝", "츄리닝", "운동복", "등산", "작업복"],
        ),
        "데일리": (
            ["셔츠", "티셔츠", "니트", "가디건", "데님", "팬츠", "슬랙스", "자켓"],
            ["정장세트", "드레스", "파티", "웨딩"],
        ),
        "오피스룩": (
            ["셔츠", "블라우스", "슬랙스", "자켓", "재킷", "블레이저", "니트", "가디건"],
            ["트레이닝", "츄리닝", "후드", "맨투맨", "조거", "레깅스", "미니", "크롭"],
        ),
    }
    style_rules = {
        "미니멀": (
            ["셔츠", "슬랙스", "니트", "자켓", "재킷", "블라우스", "일자", "베이직"],
            ["프릴", "레이스", "리본", "샤", "스팽글", "그래픽", "체크"],
        ),
        "클래식": (
            ["셔츠", "블라우스", "슬랙스", "자켓", "재킷", "트위드", "가디건", "니트"],
            ["트레이닝", "후드", "맨투맨", "조거", "카고", "크롭"],
        ),
        "러블리": (
            ["블라우스", "가디건", "니트", "스커트", "원피스", "리본", "플레어"],
            ["카고", "테크", "등산", "고프", "밀리터리"],
        ),
        "캐주얼": (
            ["티셔츠", "셔츠", "니트", "데님", "팬츠", "가디건", "자켓"],
            ["드레스", "웨딩", "파티", "정장세트"],
        ),
        "댄디": (
            ["셔츠", "슬랙스", "니트", "가디건", "자켓", "블레이저", "치노"],
            ["트레이닝", "조거", "후드", "민소매", "나시"],
        ),
        "시크": (
            ["셔츠", "슬랙스", "자켓", "재킷", "블랙", "데님", "니트"],
            ["러플", "리본", "프릴", "샤"],
        ),
        "스포티": (
            ["티셔츠", "조거", "트레이닝", "집업", "바람막이", "나일론"],
            ["하객", "웨딩", "트위드", "드레스"],
        ),
        "고프코어": (
            ["바람막이", "아노락", "카고", "나일론", "조거", "아웃도어"],
            ["하객", "웨딩", "트위드", "드레스"],
        ),
    }
    positive = []
    negative = list(common_negative)
    for key, (good, bad) in situation_rules.items():
        if key in situation_key:
            positive.extend(good)
            negative.extend(bad)
    for key, (good, bad) in style_rules.items():
        if key in style_key:
            positive.extend(good)
            negative.extend(bad)
    if gender == "male":
        negative.extend(["원피스", "스커트", "치마", "블라우스"])
    return _dedupe_keep_order(positive), _dedupe_keep_order(negative)


def _pick_diverse_naver_items(
    items: list[dict[str, object]],
    limit: int,
) -> list[dict[str, object]]:
    selected = []
    item_type_counts: dict[str, int] = {}
    bottom_subtype_counts: dict[str, int] = {}
    source_query_counts: dict[str, int] = {}

    for item in items:
        item_type = str(item.get("item_type", "기타"))
        source_query = str(item.get("source_query", ""))
        if item_type_counts.get(item_type, 0) >= max(4, limit // 3):
            continue
        if item_type == "하의":
            subtype = _bottom_subtype(str(item.get("title", "")))
            if bottom_subtype_counts.get(subtype, 0) >= 2:
                continue
        if source_query_counts.get(source_query, 0) >= 2:
            continue
        selected.append(_public_naver_item(item))
        item_type_counts[item_type] = item_type_counts.get(item_type, 0) + 1
        if item_type == "하의":
            subtype = _bottom_subtype(str(item.get("title", "")))
            bottom_subtype_counts[subtype] = bottom_subtype_counts.get(subtype, 0) + 1
        source_query_counts[source_query] = source_query_counts.get(source_query, 0) + 1
        if len(selected) >= limit:
            return selected

    for item in items:
        product_id = item.get("image_id", "")
        if any(selected_item.get("image_id") == product_id for selected_item in selected):
            continue
        selected.append(_public_naver_item(item))
        if len(selected) >= limit:
            break

    return selected


def _merge_naver_candidates(
    strict_items: list[dict[str, object]],
    relaxed_items: list[dict[str, object]],
) -> list[dict[str, object]]:
    merged = []
    seen = set()
    for item in [*strict_items, *relaxed_items]:
        product_id = str(item.get("image_id") or item.get("link") or item.get("title"))
        if product_id in seen:
            continue
        seen.add(product_id)
        merged.append(item)
    return merged


def _merge_public_recommendation_items(
    primary_items: list[dict[str, object]],
    fallback_items: list[dict[str, object]],
) -> list[dict[str, object]]:
    merged = []
    seen = set()
    for item in [*primary_items, *fallback_items]:
        product_id = str(
            item.get("image_id")
            or item.get("link")
            or item.get("image_url")
            or item.get("title")
        )
        if not product_id or product_id in seen:
            continue
        seen.add(product_id)
        merged.append(item)
    return merged


def _public_naver_item(item: dict[str, object]) -> dict[str, object]:
    return {
        key: item.get(key, "")
        for key in [
            "image_id",
            "title",
            "image_url",
            "link",
            "price",
            "mall_name",
            "style",
            "sub_style",
            "item_type",
            "category",
            "category_path",
            "color",
            "sub_color",
            "fit",
            "material",
            "print",
            "detail",
            "situation_tags",
            "mood_tags",
            "source_query",
            "recommendation_score",
            "recommendation_reasons",
        ]
    }


@lru_cache(maxsize=1)
def _load_kfashion_rows() -> list[dict[str, str]]:
    if not KFASHION_CSV.exists():
        raise FileNotFoundError(
            f"K-Fashion 추천 CSV가 없습니다. 먼저 build_kfashion_dataset.py를 실행하세요: {KFASHION_CSV}"
        )

    with KFASHION_CSV.open("r", encoding="utf-8-sig", newline="") as file:
        return list(csv.DictReader(file))


def _normalize(value: object) -> str:
    if value is None:
        return ""
    return unicodedata.normalize("NFC", str(value)).strip().lower()


def _normalize_compact(value: object) -> str:
    return re.sub(r"\s+", "", _normalize(value))


def _clean_html(value: object) -> str:
    text = "" if value is None else str(value)
    text = unescape(re.sub(r"<[^>]+>", " ", text))
    return re.sub(r"\s+", " ", text).strip()


def _first_non_empty(*values: object) -> str:
    for value in values:
        text = _clean_html(value)
        if text:
            return text
    return ""


def _stable_product_id(value: object) -> str:
    key = _normalize_compact(value)
    return hashlib.sha1(key.encode("utf-8")).hexdigest()[:16]


def _product_signature(value: object) -> str:
    text = _normalize_compact(value)
    text = re.sub(r"[\[\]\(\){}<>/\\|·,._+~!@#$%^&*=:'\"-]", "", text)
    text = re.sub(r"\d+", "", text)
    return text[:28]


def _normalize_gender_input(value: str) -> str:
    normalized = _normalize_compact(value)
    if normalized in {"male", "남자", "남성"}:
        return "male"
    return "female"


def _normalize_personal_color_input(value: str) -> str:
    normalized = _normalize_compact(value)
    return {
        "봄웜": "spring_warm",
        "springwarm": "spring_warm",
        "spring_warm": "spring_warm",
        "여쿨": "summer_cool",
        "여름쿨": "summer_cool",
        "summercool": "summer_cool",
        "summer_cool": "summer_cool",
        "가을웜": "autumn_warm",
        "autumnwarm": "autumn_warm",
        "autumn_warm": "autumn_warm",
        "겨쿨": "winter_cool",
        "겨울쿨": "winter_cool",
        "wintercool": "winter_cool",
        "winter_cool": "winter_cool",
    }.get(normalized, value)


def _parse_price(value: object) -> int:
    digits = re.sub(r"\D+", "", str(value or ""))
    return int(digits) if digits else 0


def _matched_ruleset_terms(normalized_text: str, keywords: object) -> list[str]:
    if not isinstance(keywords, list):
        return []
    matched = []
    for keyword in keywords:
        if _ruleset_term_in_text(keyword, normalized_text):
            matched.append(str(keyword))
    return _dedupe_keep_order(matched)


def _product_item_query_name(item: object) -> str:
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


def _generic_item_query_name(item: object) -> str:
    text = _product_item_query_name(item)
    if "원피스" in text:
        return "원피스"
    if "스커트" in text:
        return "스커트"
    if "재킷" in text or "자켓" in text:
        return "재킷"
    if "블라우스" in text:
        return "블라우스"
    return text


def _bottom_subtype(text: object) -> str:
    normalized = _normalize_compact(text)
    if any(keyword in normalized for keyword in ["슬랙스", "정장바지"]):
        return "슬랙스"
    if any(keyword in normalized for keyword in ["데님", "청바지"]):
        return "데님"
    if any(keyword in normalized for keyword in ["스커트", "치마"]):
        return "스커트"
    if any(keyword in normalized for keyword in ["팬츠", "바지", "와이드", "일자", "치노", "면바지", "카고"]):
        return "팬츠"
    return "하의"


def _short_naver_query(query: object) -> str:
    return " ".join(str(query or "").split()[:4])


def _gender_label(gender: str) -> str:
    return "남자" if gender == "male" else "여성"


def _infer_naver_item_type(text: str) -> str:
    normalized_text = _normalize(text)
    if any(keyword in normalized_text for keyword in ["원피스", "드레스"]):
        return "원피스"
    if any(keyword in normalized_text for keyword in ["운동화", "스니커즈", "구두", "로퍼", "부츠", "샌들", "러닝화", "트레킹화", "슈즈"]):
        return "신발"
    if any(keyword in normalized_text for keyword in ["가방", "백", "볼캡", "모자", "라탄백", "크로스백", "양말", "삭스", "스타킹", "벨트", "넥타이", "타이"]):
        return "잡화"
    if any(keyword in normalized_text for keyword in ["자켓", "재킷", "코트", "점퍼", "블레이저", "가디건", "집업", "바람막이", "아노락", "윈드브레이커", "트렌치", "야상", "패딩", "베스트"]):
        return "아우터"
    if any(keyword in normalized_text for keyword in ["팬츠", "슬랙스", "데님", "청바지", "스커트", "치마", "반바지", "레깅스", "조거", "카고", "면바지", "치노"]):
        return "하의"
    if any(keyword in normalized_text for keyword in ["셔츠", "티셔츠", "반팔", "맨투맨", "후드", "후드티", "니트", "블라우스", "브라탑", "탑", "카라티", "폴로"]):
        return "상의"
    return "기타"


def _expected_naver_item_type(query: str) -> str:
    normalized_text = _normalize(query)
    if any(keyword in normalized_text for keyword in ["원피스", "드레스"]):
        return "원피스"
    if any(keyword in normalized_text for keyword in ["운동화", "스니커즈", "구두", "로퍼", "부츠", "샌들", "러닝화", "트레킹화", "슈즈"]):
        return "신발"
    if any(keyword in normalized_text for keyword in ["가방", "백", "볼캡", "모자", "라탄백", "크로스백", "양말", "삭스", "스타킹", "벨트", "넥타이", "타이"]):
        return "잡화"
    if any(keyword in normalized_text for keyword in ["자켓", "재킷", "코트", "점퍼", "블레이저", "가디건", "집업", "바람막이", "아노락", "윈드브레이커", "트렌치", "야상", "패딩", "베스트"]):
        return "아우터"
    if any(keyword in normalized_text for keyword in ["팬츠", "슬랙스", "데님", "청바지", "스커트", "치마", "반바지", "레깅스", "조거", "카고", "면바지", "치노"]):
        return "하의"
    if any(keyword in normalized_text for keyword in ["셔츠", "티셔츠", "반팔", "맨투맨", "후드", "후드티", "니트", "블라우스", "브라탑", "탑", "카라티", "폴로"]):
        return "상의"
    return ""


def _infer_color_name(text: str) -> str:
    color_rules = {
        "블랙": ["블랙", "검정", "black"],
        "화이트": ["화이트", "흰색", "white", "스노우화이트"],
        "아이보리": ["아이보리", "크림", "바닐라"],
        "베이지": ["베이지", "카멜", "샌드", "오트밀"],
        "브라운": ["브라운", "갈색", "초콜릿", "모카", "카라멜", "에스프레소"],
        "그레이": ["그레이", "회색", "차콜", "gray", "grey"],
        "네이비": ["네이비", "navy", "미드나잇"],
        "블루": ["블루", "파랑", "데님", "청", "blue"],
        "핑크": ["핑크", "로즈", "pink"],
        "레드": ["레드", "빨강", "버건디", "와인", "체리", "크림슨"],
        "옐로우": ["옐로우", "노랑", "머스타드", "멜론"],
        "그린": ["그린", "초록", "카키", "올리브", "민트"],
        "퍼플": ["퍼플", "보라", "라벤더", "바이올렛", "플럼"],
        "오렌지": ["오렌지", "코랄", "테라코타", "살구", "피치"],
        "실버": ["실버", "은색"],
    }
    normalized_text = _normalize(text)
    for color, keywords in color_rules.items():
        if any(keyword in normalized_text for keyword in keywords):
            return color
    return ""


def _dedupe_keep_order(values) -> list[str]:
    seen = set()
    result = []
    for value in values:
        if value in seen:
            continue
        seen.add(value)
        result.append(value)
    return result


def _split_tags(value: str) -> set[str]:
    return {
        tag.strip()
        for tag in value.split(",")
        if tag.strip()
    }


def _contains_tag(tags: str, target: str) -> bool:
    normalized_target = _normalize(target)
    return any(_normalize(tag) == normalized_target for tag in _split_tags(tags))


def _contains_text(value: str, target: str) -> bool:
    normalized_value = _normalize(value)
    normalized_target = _normalize(target)
    return bool(normalized_target and normalized_target in normalized_value)


def _recommendation_score(row: dict[str, object], situation: str, style: str) -> int:
    score = 0
    if _contains_tag(row.get("situation_tags", ""), situation):
        score += 5
    if _contains_tag(row.get("mood_tags", ""), style):
        score += 5
    if _contains_text(row.get("style", ""), style):
        score += 3
    if _contains_text(row.get("sub_style", ""), style):
        score += 3
    if _contains_text(row.get("category", ""), style):
        score += 1
    if _contains_text(row.get("color", ""), style):
        score += 1
    return score


def _pick_diverse_items(rows: list[dict[str, str]], limit: int) -> list[dict[str, str]]:
    selected = []
    seen_ids = set()
    item_type_counts: dict[str, int] = {}

    for row in rows:
        image_id = row.get("image_id", "")
        item_type = row.get("item_type", "기타")
        if image_id in seen_ids:
            continue
        if item_type_counts.get(item_type, 0) >= max(2, limit // 3):
            continue

        selected.append(_public_outfit_row(row))
        seen_ids.add(image_id)
        item_type_counts[item_type] = item_type_counts.get(item_type, 0) + 1

        if len(selected) >= limit:
            return selected

    for row in rows:
        image_id = row.get("image_id", "")
        if image_id in seen_ids:
            continue
        selected.append(_public_outfit_row(row))
        seen_ids.add(image_id)
        if len(selected) >= limit:
            break

    return selected


def _public_outfit_row(row: dict[str, str]) -> dict[str, str]:
    return {
        "image_id": row.get("image_id", ""),
        "original_image_url": row.get("original_image_url", ""),
        "image_url": row.get("image_url", ""),
        "style": row.get("style", ""),
        "sub_style": row.get("sub_style", ""),
        "item_type": row.get("item_type", ""),
        "category": row.get("category", ""),
        "color": row.get("color", ""),
        "sub_color": row.get("sub_color", ""),
        "fit": row.get("fit", ""),
        "material": row.get("material", ""),
        "print": row.get("print", ""),
        "detail": row.get("detail", ""),
        "situation_tags": row.get("situation_tags", ""),
        "mood_tags": row.get("mood_tags", ""),
        "recommendation_score": row.get("recommendation_score", ""),
        "recommendation_reasons": row.get("recommendation_reasons", []),
    }
