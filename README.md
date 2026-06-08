# A-VATA

Flutter + FastAPI 기반 아바타 얼굴 교체 및 패션 추천 MVP.  
사용자가 성별과 정면 사진을 선택하면 AI가 전신 아바타를 생성하고, 퍼스널컬러·체형 진단을 통해 맞춤 스타일을 추천합니다.

> 퍼스널컬러 진단 AI 모델 상세 문서: [`docs/A_VATA_AI_MODEL_DOCUMENTATION.md`](docs/A_VATA_AI_MODEL_DOCUMENTATION.md)

---

## 프로젝트 구조

```
backend/
  app/
    main.py                    API 엔드포인트 전체
    personal_color_model.py    퍼스널컬러 추론 (EfficientNet-B0 + RandomForest 폴백)
    face_preprocess.py         BiSeNet 얼굴 피부 마스킹 전처리
  models/                      sklearn 모델 joblib 파일
  data/chroma/                 ChromaDB 벡터 스토어
frontend/
  lib/
    pages/                     화면 단위 코드
    services/                  백엔드 API 통신
    widgets/                   공통 UI 컴포넌트
  assets/avatars/              기본 아바타 이미지 (female_base.png, male_base.png)
docs/                          AI 모델 및 전처리 기술 문서
```

---

## 백엔드 실행

```bash
cd backend
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
cp .env.example .env   # OPENAI_API_KEY 등 입력
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

> **주의:** torch/timm/facenet-pytorch는 용량이 크므로 global pyenv 환경에 설치하는 것을 권장한다.  
> `which uvicorn`이 `~/.pyenv/shims/uvicorn`을 가리키면 global 환경으로 실행되어 EfficientNet 추론이 정상 동작한다.

### 환경변수 (`.env`)

| 변수 | 기본값 | 설명 |
|---|---|---|
| `OPENAI_API_KEY` | — | 아바타 생성 필수 |
| `FAL_KEY` | — | 가상 피팅 (fal.ai) |
| `MOCK_MODE` | `true` | 외부 API 없이 목 응답 반환 |
| `OPENAI_IMAGE_MODEL` | `gpt-image-1.5` | 아바타 생성 모델 |
| `OPENAI_IMAGE_SIZE` | `1024x1536` | 생성 이미지 크기 |
| `OPENAI_IMAGE_QUALITY` | `high` | 이미지 품질 |
| `BISENET_CKPT_PATH` | (미설정) | BiSeNet 체크포인트 경로 — 설정 시 피부 마스킹 전처리 활성화 |
| `NAVER_CLIENT_ID` | — | 네이버 쇼핑 API |
| `NAVER_CLIENT_SECRET` | — | 네이버 쇼핑 API |
| `CHROMA_PERSIST_DIR` | `backend/data/chroma` | ChromaDB 저장 경로 |

---

## API 엔드포인트

| 엔드포인트 | 설명 |
|---|---|
| `POST /generate-avatar` | 기본 아바타 + 사용자 얼굴 → base64 PNG |
| `POST /analyze-personal-color` | 얼굴 사진 + gender → 퍼스널컬러 4계절 분류 |
| `GET /recommend-outfits` | 상황/스타일/퍼스널컬러/체형 파라미터 → 의상 추천 |
| `POST /api/recommend/products` | 프로필 기반 → 네이버 쇼핑 상품 |
| `POST /virtual-try-on` | 아바타 + 의류 이미지 → 가상 피팅 (fal.ai) |
| `GET /kfashion-options` | K-Fashion 필터 태그 목록 |

---

## Flutter 실행

```bash
cd frontend
flutter pub get
flutter run
```

**미리보기 플래그 (`--dart-define`):**

```bash
flutter run --dart-define=MOCK_AVATAR_HOME=true --dart-define=MOCK_AVATAR_GENDER=female
flutter run --dart-define=MOCK_PERSONAL_COLOR=true
flutter run --dart-define=MOCK_SKELETON_DIAGNOSIS=true --dart-define=MOCK_SKELETON_GENDER=female
flutter run --dart-define=MOCK_RECOMMENDATION_TEST=true
```

**API 주소** (`lib/services/avatar_api_service.dart`, `outfit_recommendation_service.dart`):

| 환경 | 주소 |
|---|---|
| Android 에뮬레이터 | `http://10.0.2.2:8000` |
| iOS 시뮬레이터 / 데스크톱 | `http://127.0.0.1:8000` |
| 실제 기기 | 같은 네트워크의 개발 머신 IP |

---

## 앱 흐름

```
AuthPage (Firebase Auth)
    ↓
GenderSelectPage → PhotoUploadPage
    ↓
POST /generate-avatar → AvatarResultPage → AvatarHomePage
    ↓
MoodEntryPage → MoodPage → OutfitRecommendationPage
```

사이드 플로우: `PersonalColorPage`, `SkeletonDiagnosisPage`, `FittingFlowPage`, `CommunityPage`

---

## 퍼스널컬러 AI 모델

EfficientNet-B0 기반 4계절 분류 (봄웜 / 여름쿨 / 가을웜 / 겨울쿨).

**추론 파이프라인:**
1. MTCNN 얼굴 검출 + 20% margin crop
2. (선택) BiSeNet 피부 마스킹 — `BISENET_CKPT_PATH` 설정 시 활성화
3. EfficientNet-B0 (HuggingFace: `jiwoonkim00/personal-color-classifier`) + TTA (원본 + 수평 반전 평균)
4. 실패 시 sklearn RandomForest 폴백

**성능:** Test Accuracy **70.8%** (TTA 기준, Korean celebrity 356장 test set)

자세한 내용 → [`docs/A_VATA_AI_MODEL_DOCUMENTATION.md`](docs/A_VATA_AI_MODEL_DOCUMENTATION.md)

---

## K-Fashion 데이터 파이프라인 (최초 1회)

```bash
# K-Fashion 추천 CSV 생성
python3 backend/app/build_kfashion_dataset.py
# 다른 경로 사용 시
KFASHION_SAMPLE_DIR="/path/to/New_sample" python3 backend/app/build_kfashion_dataset.py

# ChromaDB 인덱싱 (OpenAI 임베딩)
python3 backend/app/build_chroma_store.py --reset --limit 500
```

---

## 기본 아바타 이미지

- `frontend/assets/avatars/male_base.png`
- `frontend/assets/avatars/female_base.png`

에셋 변경 시 `frontend/pubspec.yaml`의 `assets` 항목도 함께 업데이트.
