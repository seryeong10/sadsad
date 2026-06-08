# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

A-VATA is a Flutter + FastAPI avatar face-replacement and fashion recommendation MVP. Users select gender, upload a face photo, and receive an AI-generated full-body avatar. From there they can get outfit recommendations based on mood/situation, personal color analysis, and body-type (skeleton) diagnosis.

## Backend

### Setup & Run

```bash
cd backend
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
cp .env.example .env   # then fill in OPENAI_API_KEY
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

### Environment Variables

All vars live in `backend/.env` (see `.env.example`):

| Variable | Default | Purpose |
|---|---|---|
| `OPENAI_API_KEY` | — | Required for avatar generation & embeddings |
| `FAL_KEY` | — | Required for virtual try-on (fal.ai) |
| `MOCK_MODE` | `true` | Return mock responses without calling external APIs |
| `OPENAI_IMAGE_MODEL` | `gpt-image-1.5` | Avatar generation model |
| `CHROMA_PERSIST_DIR` | `backend/data/chroma` | ChromaDB storage path |
| `KFASHION_IMAGE_ROOT` | hardcoded path | Root dir of AI Hub K-Fashion images |

### API Endpoints (all in `app/main.py`)

- `POST /generate-avatar` — multipart `base_avatar` + `user_face` → base64 PNG
- `POST /analyze-personal-color` — multipart `user_face` + `gender` query → season/tone result
- `GET /recommend-outfits` — query params: `situation`, `style`, `gender`, `personal_color`, `skeleton_type`, `season`, `limit`
- `POST /api/recommend/products` — JSON body with profile fields → Naver Shopping products
- `GET /kfashion-options` — available filter tags from K-Fashion CSV
- `POST /virtual-try-on` — JSON body with avatar + garment image URIs → try-on image via fal.ai

### Data Pipeline (one-time scripts)

```bash
# Build K-Fashion recommendation CSV from AI Hub sample
python3 backend/app/build_kfashion_dataset.py
# KFASHION_SAMPLE_DIR env var overrides default input path

# Index CSV into ChromaDB (OpenAI embeddings)
python3 backend/app/build_chroma_store.py --reset --limit 500
```

### Recommendation Architecture

`GET /recommend-outfits` uses a two-stage fallback:
1. Query Naver Shopping API with rule-based keywords (`outfit_search_rules.py`)
2. If results are insufficient, fall back to ChromaDB K-Fashion vector search (`vector_style_store.py`)

`POST /api/recommend/products` adds a RAG layer: `style_rag_documents.py` retrieves style context from ChromaDB before building Naver search keywords.

Personal color prediction uses pre-trained sklearn models stored in `backend/models/` (`personal_color_model_female.joblib`, `personal_color_model_male.joblib`).

Style rules are split across: `season_style_rules.py`, `skeleton_style_rules.py`, `outfit_search_rules.py`, and the JSON ruleset at `backend/models/style_recommendation_ruleset.json`.

## Frontend (Flutter)

### Setup & Run

```bash
cd frontend
flutter pub get
flutter run
```

### Dev Flags (`--dart-define`)

Preview individual screens without going through the full auth/avatar flow:

```bash
flutter run --dart-define=MOCK_AVATAR_HOME=true --dart-define=MOCK_AVATAR_GENDER=female
flutter run --dart-define=MOCK_PERSONAL_COLOR=true
flutter run --dart-define=MOCK_SKELETON_DIAGNOSIS=true --dart-define=MOCK_SKELETON_GENDER=female
flutter run --dart-define=MOCK_RECOMMENDATION_TEST=true
```

### API Base URL

Hardcoded in `lib/services/avatar_api_service.dart` and `lib/services/outfit_recommendation_service.dart` as `http://10.0.2.2:8000` (Android emulator localhost). Change to `http://127.0.0.1:8000` for iOS simulator/desktop.

### App Flow

1. `AuthPage` (Firebase Auth) → `GenderSelectPage`
2. `PhotoUploadPage` → POST `/generate-avatar` → `AvatarResultPage` → `AvatarHomePage`
3. From avatar home: `MoodEntryPage` → `MoodPage` → `OutfitRecommendationPage`
4. Side flows: `PersonalColorPage` (POST `/analyze-personal-color`), `SkeletonDiagnosisPage`, `FittingFlowPage` (POST `/virtual-try-on`), `CommunityPage`

### Services

| File | Responsibility |
|---|---|
| `auth_store.dart` | Firebase Auth + SharedPreferences session |
| `avatar_api_service.dart` | `/generate-avatar` |
| `outfit_recommendation_service.dart` | `/recommend-outfits` |
| `personal_color_service.dart` | `/analyze-personal-color` |
| `virtual_try_on_service.dart` | `/virtual-try-on` |
| `community_store.dart` | Firestore community posts |
| `style_closet_store.dart` | Local wardrobe (captured photos) |

### Assets

- `frontend/assets/avatars/female_base.png` / `male_base.png` — base avatars sent to `/generate-avatar`
- `frontend/assets/skeleton/` — body type reference images
- If you add/change assets, update `frontend/pubspec.yaml` under `flutter.assets`
