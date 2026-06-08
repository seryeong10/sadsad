# A-VATA 퍼스널컬러 AI 모델 — 통합 기술 문서

작성일: 2026-06-08 | 최종 수정: 2026-06-08  
대상: 모델 개발자, 앱 개발자, 기술 검토자

---

## 목차

1. [프로젝트 개요](#1-프로젝트-개요)
2. [AI 모델 아키텍처](#2-ai-모델-아키텍처)
3. [학습 데이터셋](#3-학습-데이터셋)
4. [학습 전처리 파이프라인](#4-학습-전처리-파이프라인)
5. [학습 실험 히스토리 및 최종 성능](#5-학습-실험-히스토리-및-최종-성능)
6. [현재 앱 추론 파이프라인](#6-현재-앱-추론-파이프라인)
7. [학습 전처리 vs 추론 전처리 비교](#7-학습-전처리-vs-추론-전처리-비교)
8. [FastAPI 백엔드 통합 구조](#8-fastapi-백엔드-통합-구조)
9. [핵심 발견 및 한계](#9-핵심-발견-및-한계)
10. [향후 개선 방향](#10-향후-개선-방향)

---

## 1. 프로젝트 개요

A-VATA는 Flutter(프론트엔드) + FastAPI(백엔드)로 구성된 모바일 앱이다. 사용자가 얼굴 사진을 촬영하면 AI가 퍼스널컬러 4계절 유형을 분류하고, 어울리는 색상 팔레트와 아바타를 생성해 제공한다.

**4-class 분류 레이블**

| 레이블 | 한국어 | 특징 |
|---|---|---|
| `spring_warm` | 봄 웜 | 밝고 선명한 웜톤. 복숭아·코랄·아이보리 계열 |
| `summer_cool` | 여름 쿨 | 밝고 부드러운 쿨톤. 라벤더·로즈·파우더블루 계열 |
| `autumn_warm` | 가을 웜 | 깊고 풍부한 웜톤. 카멜·머스타드·올리브 계열 |
| `winter_cool` | 겨울 쿨 | 선명하고 강한 쿨톤. 버건디·네이비·퓨어화이트 계열 |

**시스템 흐름 요약**

```
[Flutter 앱] 사진 촬영
    ↓  multipart/form-data
[FastAPI] POST /analyze-personal-color
    ↓
[personal_color_model.py] predict_personal_color()
    ↓
MTCNN 얼굴 검출 + 20% margin crop
    ↓
BiSeNet 피부 마스킹 (79999_iter.pth)  ← 현재 활성화됨
  skin/ear/nose/neck 유지, 나머지 → 회색(128)
    ↓
EfficientNet-B0 추론 (HuggingFace) + TTA
    ↓ 실패 시
RandomForest 폴백 (sklearn)
    ↓
{type, label, recommended_colors, palette, confidence, probabilities}
    ↓  JSON 응답
[Flutter 앱] 결과 화면 + 아바타 생성 흐름
```

---

## 2. AI 모델 아키텍처

### 2.1 모델 기본 정보

| 항목 | 값 |
|---|---|
| 라이브러리 | `timm` |
| 모델 ID | `efficientnet_b0.ra_in1k` |
| 파라미터 수 | 약 5.3M |
| 입력 크기 | 224 × 224 (RGB) |
| 출력 | 4-class softmax |
| 사전학습 | ImageNet (RandAugment 레시피) |

```python
model = timm.create_model("efficientnet_b0.ra_in1k", pretrained=True, num_classes=4)
```

원래 1000-class ImageNet head를 4-class Linear head로 교체. backbone은 그대로 유지.

### 2.2 2단계 전이학습 전략

```
ImageNet pretrained EfficientNet-B0
    ↓
[Phase 1] Deep Armocromia base training
          소스 도메인: 유럽인 얼굴 이미지 ~4,920장
          목적: 계절 색상 패턴에 대한 도메인 지식 학습
    ↓  [checkpoint: deep_armocromia_efficientnet_b0_base_rgb.pt]
[Phase 2] Korean celebrity fine-tuning
          타겟 도메인: 한국 연예인 얼굴 이미지 2,368장
          목적: 한국인 얼굴 특성에 도메인 적응
    ↓  [checkpoint: personal_color_korean_tuned_v2.pt]
최종 평가: Korean test split (356장)
```

**설계 이유:** 한국 연예인 데이터 원본이 389장으로 4-class 분류기를 처음부터 학습하기에는 너무 적다. Deep Armocromia(약 4,920장)로 계절 색상 지식을 먼저 학습한 뒤 도메인 적응하는 방식으로 데이터 부족 문제를 해결.

### 2.3 현재 배포 체크포인트

| 항목 | 값 |
|---|---|
| HuggingFace 레포 | `jiwoonkim00/personal-color-classifier` |
| 파일명 | `personal_color_korean_tuned_v2.pt` |
| 테스트 정확도 (TTA) | **70.8%** |
| 체크포인트 형식 | `{"model_state_dict": ..., "optimizer_state_dict": ..., "epoch": ..., "val_acc": ..., "label_map": ...}` |

---

## 3. 학습 데이터셋

### 3.1 Korean Celebrity Dataset (타겟 도메인)

최종 버전(v2) 기준:

| 항목 | 수치 |
|---|---|
| 원본 이미지 | 2,384장 (중복 265장 제거 후) |
| Face crop 성공 | 2,368장 |
| BiSeNet 피부 마스킹 적용 | 2,366장 |
| Train / Val / Test | 1,656 / 356 / 356 |

**클래스 × 성별 분포:**

| 클래스 | female | male | 합계 |
|---|---|---|---|
| spring_warm | 298 | 298 | 596 |
| summer_cool | 296 | 298 | 594 |
| autumn_warm | 298 | 298 | 596 |
| winter_cool | 297 | 285 | 582 |
| **합계** | **1,189** | **1,179** | **2,368** |

> 데이터 누수 방지: `person_id` 단위 group-aware split — 같은 인물이 train/val/test에 분산되지 않도록 보장.

### 3.2 Deep Armocromia Dataset (소스 도메인)

- 출처: Deep Armocromia 공개 데이터셋 (배경 제거 얼굴 이미지, RGB-M 폴더)
- 이탈리아어 → 영어 레이블 매핑:

| Deep Armocromia | 모델 레이블 |
|---|---|
| primavera | spring_warm |
| estate | summer_cool |
| autunno | autumn_warm |
| inverno | winter_cool |

**최종 분포:**

| split | autumn_warm | spring_warm | summer_cool | winter_cool | 합계 |
|---|---|---|---|---|---|
| train | 889 | 831 | 801 | 885 | **3,406** |
| val | 157 | 147 | 142 | 156 | **602** |
| test | 259 | 203 | 186 | 264 | **912** |

---

## 4. 학습 전처리 파이프라인

퍼스널컬러는 피부색과 언더톤이 핵심 정보다. 머리카락·눈·입술·배경 등 무관한 색상이 모델 학습에 개입하지 않도록 **MTCNN + BiSeNet 2단계 전처리**를 설계했다.

### 4.1 전체 흐름

```
원본 이미지
    ↓
MTCNN 얼굴 검출
 → 여러 얼굴이면 confidence 최고 선택
 → 20% margin 추가 crop
    ↓
BiSeNet face parsing (512×512 입력)
 → 픽셀별 19개 클래스 분류
    ↓
피부 마스크 생성
 → skin(1), 코(10), 귀(7,8), 목(14) → 유지
 → 머리카락(17), 눈(4,5), 입술(12,13), 옷(16), 배경(0) → 회색(128)
 → 경계 1회 dilate (자연스러운 경계 처리)
    ↓
224×224 리사이즈 후 저장
```

### 4.2 MTCNN 얼굴 검출

```python
detector = MTCNN(keep_all=True, device=device, min_face_size=20)
# 여러 얼굴 → confidence 최고 선택
# bbox 확장: 상하좌우 20% margin
MARGIN = 0.20
```

### 4.3 BiSeNet 피부 마스킹

**모델:** BiSeNet (face-parsing.PyTorch, MIT License), CelebAMask-HQ 19-class  
**체크포인트:** `backend/models/79999_iter.pth` (53MB, git 미추적)

**실제 아키텍처 (79999_iter.pth 기준):**  
체크포인트를 직접 분석한 결과, 이 체크포인트는 SpatialPath 없이 ContextPath 두 출력만 사용한다.
- `feat_cp16` (128ch, 1/8 scale) + `feat_cp32` (128ch, 1/16 scale) → concat 256ch → FFM
- FFM convblk: 1×1 conv (원본 face-parsing.PyTorch SpatialPath 버전과 상이)
- `cp.resnet.fc.*` 미포함 (forward에서 미사용, `strict=False`로 로드)

**19개 클래스 중 피부로 유지하는 클래스:**

| 클래스 번호 | 영역 | 포함 이유 |
|---|---|---|
| 1 | skin | 얼굴 피부 본체 |
| 7 | l_ear | 귀 피부 톤 포함 |
| 8 | r_ear | 귀 피부 톤 포함 |
| 10 | nose | 코 피부 톤 포함 |
| 14 | neck | 목 피부 톤 포함 |

**회색(128)으로 대체되는 영역:**

```
0: 배경    2,3: 눈썹    4,5: 눈    6: 안경    9: 귀걸이
11,12,13: 입술/입    15: 목걸이    16: 옷    17: 머리카락    18: 모자
```

**예시 수치 (한지민 이미지 기준):**

| 클래스 | 비율 | 처리 |
|---|---|---|
| skin | 31.4% | 유지 |
| nose | 3.0% | 유지 |
| neck | 2.5% | 유지 |
| **피부 합계** | **36.9%** | **모델이 보는 영역** |
| hair | 34.9% | 회색 처리 |
| cloth | 10.6% | 회색 처리 |
| lips | 1.5% | 회색 처리 |

**예외 처리:**
- 피부 픽셀 비율 < 10%: 마스킹 스킵, 원본 crop 저장
- 얼굴 미검출: `failed_crop.csv`에 기록 후 스킵

### 4.4 검증/추론 transform (공통)

```python
Resize(256) → CenterCrop(224) → ToTensor → Normalize(
    mean=[0.485, 0.456, 0.406],
    std=[0.229, 0.224, 0.225]
)
```

### 4.5 BiSeNet 입력 전처리

```python
Resize((512, 512)) → ToTensor → Normalize(
    mean=[0.485, 0.456, 0.406],
    std=[0.229, 0.224, 0.225]
)
```

---

## 5. 학습 실험 히스토리 및 최종 성능

### 5.1 전체 실험 요약

| 실험 | 모델 | 데이터 | Korean test_acc | 특이사항 |
|---|---|---|---|---|
| Random baseline | - | - | 25.0% | 4-class 무작위 |
| 1+2 | Base v1 → Fine-tune v1 | 379장 | 28.6% | weak aug, 심각한 overfitting |
| 1+3 | Base v1 → Fine-tune v2 | 379장 | 20.6% | strong aug지만 base overfitting이 한계 |
| 4 | Base v2 단독 | 379장 | 30.2% | fine-tuning 없이 |
| 4+5 | Base v2 → Fine-tune v3 | 379장 | 38.1% | Mixup + strong aug |
| 6 | Base v2 → Fine-tune v4 | 2,368장 | 66.3% | 데이터 6배 확장 + BiSeNet |
| 7 | Base v3 → Fine-tune v5 | 2,368장 | 67.7% | Deep Armocromia 마스킹 + 클래스 가중치 |
| 8 | Base v3 → Fine-tune v6 | 2,368장 | 68.3% (TTA: 69.9%) | freeze 없음, LR 5e-5 |
| **9** | **Base v4 → Fine-tune v7** | **2,368장** | **70.8% (TTA)** | **현재 최고** |

### 5.2 현재 최고 성능 (Fine-tune v7, personal_color_korean_tuned_v2.pt)

**학습 설정:**

| 항목 | 설정 |
|---|---|
| Base checkpoint | v4 (원본 RGB-M, 75ep, Deep Armocromia val 56.48%) |
| Fine-tuning 데이터 | Korean train 1,656 / val 356 (BiSeNet 마스킹) |
| Epochs | 40 (best: ep ~13, val_acc 64.9%) |
| LR | 5e-5, warmup(2ep) + cosine decay |
| Backbone freeze | 없음 (전체 파라미터 학습) |
| Augmentation | strong, mixup alpha=0.2, label_smoothing=0.1 |
| Class weights | 적용 |

**클래스별 성능:**

| 클래스 | Precision | Recall | F1 |
|---|---|---|---|
| spring_warm | 0.69 | 0.80 | **0.74** |
| summer_cool | 0.97 | 0.84 | **0.90** |
| autumn_warm | 0.54 | 0.58 | **0.56** |
| winter_cool | 0.68 | 0.61 | **0.64** |
| **macro avg** | **0.72** | **0.71** | **0.71** |
| **Test Acc (TTA)** | | | **70.8%** |

> **가장 어려운 클래스:** autumn_warm (F1 0.56). 봄웜과 warm↔warm 혼동이 지속됨.

### 5.3 핵심 발견

1. **데이터 규모가 가장 큰 단일 요인**: 379장 → 2,368장 확장 시 38.1% → 66.3%로 **+28.2%p**
2. **BiSeNet 마스킹**: Korean fine-tuning에 효과적 (특히 쿨톤 분류), Deep Armocromia base엔 역효과
3. **TTA**: 추가 학습 없이 **+1.7%p** (68.3% → 69.9%)
4. **B2 > B0 아님**: 2,368장 규모에서 B0가 더 적합 (B2는 오버피팅)
5. **Freeze 없애기 + LR 5e-5**: fine-tuning 수렴 속도 및 최종 성능 개선
6. **원본 RGB-M base > 마스킹 base**: Deep Armocromia는 마스킹 없이 학습해야 57%대 유지
7. **BiSeNet 쿨톤 개선 효과**: summer_cool F1 0.48 → 0.88, winter_cool F1 0.54 → 0.64

---

## 6. 현재 앱 추론 파이프라인

### 6.1 현재 추론 흐름 (BiSeNet 활성화, 학습 전처리 완전 일치)

> `.env`에 `BISENET_CKPT_PATH=models/79999_iter.pth` 설정됨 — **현재 기본 동작**

```
[입력] image_bytes (multipart upload)
    ↓
ImageOps.exif_transpose(image).convert("RGB")
    ↓
face_preprocess.preprocess_face_image(image_bytes, bisenet_ckpt)
  → MTCNN 얼굴 검출 (facenet-pytorch), 20% margin crop
  → BiSeNet 512×512 face parsing (79999_iter.pth)
  → 피부 마스크: skin(1)/ear(7,8)/nose(10)/neck(14) 유지, 나머지 → 회색(128)
  → Resize(256) → CenterCrop(224) → ToTensor → Normalize
  → 반환: (1, 3, 224, 224) tensor
    ↓
TTA — t_orig(BiSeNet 마스킹) + t_flip(원본 crop hflip) 평균
    ↓
EfficientNet-B0 forward (HuggingFace: personal_color_korean_tuned_v2.pt)
  logits = (model(t_orig) + model(t_flip)) / 2
  probs = softmax(logits)
    ↓
[출력] label, confidence, probabilities dict
```

서버 로그 확인:
```
[personal_color] torch 사용 → EfficientNet-B0 추론 시작
[personal_color] BiSeNet 피부 마스킹 활성화: models/79999_iter.pth
```

### 6.2 BiSeNet 미설정 시 추론 흐름 (BISENET_CKPT_PATH 없는 경우)

```
[입력] image_bytes
    ↓
MTCNN 얼굴 검출, 20% margin crop
    ↓
TTA — Resize(256) → CenterCrop(224) → Normalize (원본 + hflip)
    ↓
EfficientNet-B0 forward
```

> BiSeNet 없이도 EfficientNet은 정상 동작하지만, 학습 전처리와 불일치로 정확도가 다소 낮을 수 있다.

### 6.3 폴백 체인

```
torch 사용 가능?
    YES → EfficientNet-B0 추론
            성공 → 결과 반환
            실패 → RandomForest 폴백
    NO  → RandomForest 폴백

RandomForest: sklearn Pipeline (StandardScaler + RandomForestClassifier 700 trees)
  입력 피처: 얼굴 영역 5구역 × 색상 통계 (RGB/LAB/HSV) + LAB 분포 통계
  성별별 별도 모델: female, male, 통합
```

**로그로 확인 방법:**

```
# BiSeNet + EfficientNet 정상 동작 (현재 상태)
[personal_color] torch 사용 → EfficientNet-B0 추론 시작
[personal_color] BiSeNet 피부 마스킹 활성화: models/79999_iter.pth

# BiSeNet 미설정 시 (경로 없거나 파일 없을 때)
[personal_color] BiSeNet 미적용 (BISENET_CKPT_PATH=..., exists=False)

# 폴백 발생 시
[personal_color] EfficientNet 실패 → RandomForest 폴백: <오류 내용>

# torch 미설치 시
[personal_color] torch 없음 → RandomForest 사용
```

### 6.4 모델 캐싱

```python
@lru_cache(maxsize=1)
def _load_deep_model():
    # HuggingFace Hub에서 다운로드 후 캐시
    model_path = hf_hub_download(repo_id=DEEP_MODEL_REPO, filename=DEEP_MODEL_FILE)
    ...

@lru_cache(maxsize=1)
def _load_mtcnn():
    ...

@lru_cache(maxsize=4)  # 경로별 캐시
def _load_bisenet(ckpt_path: str):
    ...
```

서버 프로세스 내 `@lru_cache`로 첫 요청 시 1회 로드 후 메모리에 유지. 재시작 시 재로드.

### 6.5 체크포인트 로딩 키 해석

학습 스크립트가 체크포인트를 아래 형식으로 저장:

```python
{
    "model_state_dict": model.state_dict(),  # ← 실제 가중치
    "optimizer_state_dict": optimizer.state_dict(),
    "epoch": epoch,
    "val_acc": val_acc,
    "label_map": LABEL2IDX,
}
```

백엔드는 다음 순서로 state_dict를 추출:

```python
for key in ("model_state_dict", "state_dict", "model"):
    if key in state:
        state = state[key]
        break
```

`weights_only=False` 필수 — 체크포인트에 numpy scalar 타입이 포함되어 있어 `weights_only=True`로 로드하면 `WeightsUnpickler error` 발생.

---

## 7. 학습 전처리 vs 추론 전처리 비교

| 단계 | 학습 시 | 앱 추론 시 (현재, BiSeNet ON) | 앱 추론 시 (BiSeNet OFF) |
|---|---|---|---|
| 얼굴 검출 | MTCNN (keep_all=True, confidence 최고 선택) | MTCNN (keep_all=False) | MTCNN (keep_all=False) |
| Margin | 20% | 20% | 20% |
| BiSeNet 마스킹 | ✅ 적용 (512×512) | ✅ 적용 (512×512) | ❌ 미적용 |
| 피부 외 영역 | 회색(128) | 회색(128) | 그대로 포함 |
| Resize | 256 → CenterCrop 224 | 256 → CenterCrop 224 | 256 → CenterCrop 224 |
| Normalize | ImageNet 통계 | ImageNet 통계 | ImageNet 통계 |
| TTA | 6-crop (평가 시) | 원본(BiSeNet) + hflip 평균 | 원본 + hflip 평균 |
| 전처리 일치도 | — | **완전 일치** ✅ | 부분 불일치 |

> **현재 `BISENET_CKPT_PATH=models/79999_iter.pth` 설정으로 학습 전처리와 완전히 일치하는 상태로 동작 중이다.**  
> BiSeNet 체크포인트(`79999_iter.pth`)는 git에 포함되지 않으므로 새 환경 세팅 시 별도 다운로드 필요.

---

## 8. FastAPI 백엔드 통합 구조

### 8.1 관련 파일

```
backend/
├── app/
│   ├── personal_color_model.py   ← 메인 추론 로직 (EfficientNet + RandomForest)
│   ├── face_preprocess.py        ← BiSeNet 전처리 파이프라인
│   ├── personal_color_palette.py ← 색상 팔레트 데이터
│   └── routers/
│       └── personal_color.py     ← POST /analyze-personal-color 엔드포인트
└── requirements.txt
```

### 8.2 주요 의존성

```
torch>=2.0.0
torchvision>=0.15.0
timm>=0.9.0
huggingface_hub>=0.20.0
facenet-pytorch>=2.5.2
```

> **중요:** 패키지들은 pyenv global Python에 설치되어 있다. uvicorn이 global pyenv shims(`/Users/kimjiwoon/.pyenv/shims/uvicorn`)에서 실행되므로 torch를 인식한다. `.venv` 환경은 torch가 없으므로 `.venv`로 uvicorn을 실행하면 EfficientNet이 동작하지 않는다.

### 8.3 API 응답 형식

```json
{
  "type": "summer_cool",
  "label": "여름 쿨",
  "summary": "맑고 부드러운 쿨 계열 색상이 얼굴 톤을 안정적으로 살려줄 가능성이 있어요.",
  "recommended_colors": ["라벤더", "쿨핑크", "..."],
  "best_hex_colors": ["#..."],
  "additional_recommended_colors": [...],
  "avoid_colors": ["강한 오렌지", "..."],
  "confidence": 0.847,
  "probabilities": {
    "spring_warm": 0.05,
    "summer_cool": 0.85,
    "autumn_warm": 0.03,
    "winter_cool": 0.07
  },
  "analysis_method": "efficientnet_b0_huggingface"
}
```

`analysis_method` 값:
- `"efficientnet_b0_huggingface"`: EfficientNet 경로 (정상)
- `"skin_color_features_random_forest_by_gender"`: 폴백 경로

### 8.4 confidence 해석 기준

| 범위 | 신뢰도 | 권장 대응 |
|---|---|---|
| ≥ 0.70 | 높음 | 결과 신뢰 |
| 0.55 ~ 0.70 | 보통 | 참고 수준으로 제시 |
| < 0.55 | 낮음 | 정면 사진 재촬영 안내 |

---

## 9. 핵심 발견 및 한계

### 9.1 BiSeNet 마스킹의 실제 효과

- **쿨톤 개선이 두드러짐**: summer_cool F1 0.48 → 0.88 (+40%p), winter_cool 개선
- **머리카락 색 편향 제거**: 흑발·갈색머리·금발 차이가 퍼스널컬러 분류에 개입하는 것 차단
- **입술/메이크업 색 편향 감소**
- **warm↔warm 혼동은 여전히 최대 약점**: spring-autumn이 비슷한 따뜻한 피부 톤이라 BiSeNet으로도 해결 어려움

### 9.2 예상 혼동 패턴

```
spring_warm ↔ autumn_warm   (같은 웜톤, 밝기/채도 차이)
summer_cool ↔ winter_cool   (같은 쿨톤, 명도/대비 차이)
```

### 9.3 데이터 편향

- 한국 연예인 스크린샷 기반 → 메이크업, 조명, 이미지 편집 편향 존재
- 유명인 데이터로 일반인 얼굴 일반화에 한계
- 프로토타입·포트폴리오 수준이며 전문가 퍼스널컬러 진단을 대체하지 않음

### 9.4 현재 앱에서 실제 모델 동작 확인 방법

서버 터미널 로그에서 아래 메시지 확인 (현재 정상 상태):

```
[personal_color] torch 사용 → EfficientNet-B0 추론 시작
[personal_color] BiSeNet 피부 마스킹 활성화: models/79999_iter.pth
```

curl 테스트:

```bash
curl -s -X POST http://localhost:8000/analyze-personal-color \
  -F "file=@/path/to/face.jpg" \
  -F "gender=female" | python3 -m json.tool | grep analysis_method
# 기대 출력: "analysis_method": "efficientnet_b0_huggingface"
```

---

## 10. 향후 개선 방향

### 단기 (데이터 없이 가능)

| 방법 | 기대 효과 | 설명 | 상태 |
|---|---|---|---|
| BiSeNet 활성화 | ~1-2%p 향상 예상 | `BISENET_CKPT_PATH` 설정 + `79999_iter.pth` 배포 | ✅ **완료** |
| 6-crop TTA | +0.5~1%p | 현재 2-crop(orig+flip) → 6-crop으로 확장 | 미적용 |
| 2단계 분류 (warm/cool → 세부) | 구조적 혼동 해결 | autumn/spring 혼동 직접 해결 | 미적용 |
| Focal loss | 어려운 샘플 집중 | autumn_warm 성능 개선 | 미적용 |

### 중장기 (데이터 확보 필요)

| 방법 | 기대 효과 |
|---|---|
| autumn_warm 데이터 추가 수집 | F1 0.56 → 0.70 목표 |
| 일반인 얼굴 데이터셋 구축 | 메이크업·조명 편향 제거 |
| 전문가 라벨링 데이터 | 라벨 품질 개선 |

### 현재 체크포인트 목록 (RunPod 기준)

| 파일 | 내용 | Test Acc |
|---|---|---|
| `deep_armocromia_efficientnet_b0_base_rgb.pt` | Base v4 — 원본 RGB-M | — |
| **`personal_color_korean_tuned_v2.pt`** | **현재 최고 fine-tune** | **70.8% (TTA)** |
| `personal_color_korean_tuned.pt` | 이전 최고 fine-tune | 69.9% (TTA) |
| `personal_color_korean_b2_tuned.pt` | B2 fine-tune | 66.9% (TTA) |

---

*작성 기준: A-VATA 백엔드 `personal_color_model.py`, `face_preprocess.py` 및 MODEL_GUIDE.md, PREPROCESSING_UPDATE.md, PROGRESS_SNAPSHOT.md, TRAINING_SUMMARY.md 참조*
