# 퍼스널컬러 진단 모델 — 전체 파이프라인 설명서

> 작성 기준: 현재 코드베이스 (`src/`, `spaces/`, `lib/`) 기준.

---

## 1. 프로젝트 개요

한국인 얼굴 이미지에서 퍼스널컬러 4계절 유형을 분류하는 딥러닝 모델 파이프라인.

**4-class 분류 레이블**

| 레이블 | 한국어 | 특징 |
|---|---|---|
| `spring_warm` | 봄웜 | 밝고 선명한 웜톤. 복숭아·코랄·아이보리 계열 |
| `summer_cool` | 여쿨 | 밝고 부드러운 쿨톤. 라벤더·로즈·파우더 블루 계열 |
| `autumn_warm` | 가을웜 | 깊고 풍부한 웜톤. 카멜·머스타드·올리브 계열 |
| `winter_cool` | 겨울쿨 | 선명하고 강한 쿨톤. 버건디·네이비·퓨어 화이트 계열 |

**전체 학습 전략 (Source → Target Domain Transfer)**

```
ImageNet pretrained EfficientNet-B0
    ↓
Deep Armocromia base training  (대규모 소스 도메인)
    ↓  [deep_armocromia_efficientnet_b0_base.pt]
Korean celebrity fine-tuning   (소규모 타깃 도메인, 저-LR)
    ↓  [personal_color_korean_tuned.pt]
Korean test split 평가
```

---

## 2. 모델 아키텍처

### 2.1 backbone

- **라이브러리:** `timm`
- **기본 모델명:** `efficientnet_b0.ra_in1k`
  - RA (RandAugment) 레시피로 ImageNet 사전학습된 가중치 사용
  - `--model_name` 인수로 변경 가능 (예: `efficientnet_b2.ra_in1k`)
- **classifier head:** 원래 1000-class head → 4-class Linear head로 교체
  ```python
  model = timm.create_model("efficientnet_b0.ra_in1k", pretrained=True, num_classes=4)
  ```
- **입력 크기:** 224×224 (RGB)

### 2.2 두 가지 학습 모드

| 설정 | base (소스 도메인) | finetune (타깃 도메인) |
|---|---|---|
| 데이터 | Deep Armocromia | 한국 연예인 얼굴 |
| 초기 가중치 | ImageNet pretrained | base checkpoint |
| LR | `1e-4` | `2e-5` |
| weight decay | `5e-4` | `1e-4` |
| backbone freeze | 없음 | 첫 3 epoch freeze |
| warmup epoch | 5 | 2 |

---

## 3. 데이터셋

### 3.1 Deep Armocromia (소스 도메인)

이탈리아어 계절 레이블 → 영어 레이블 변환:

| Deep Armocromia | 모델 레이블 |
|---|---|
| `primavera` | `spring_warm` |
| `estate` | `summer_cool` |
| `autunno` | `autumn_warm` |
| `inverno` | `winter_cool` |

**이미지 경로 선택 우선순위 (`prepare_deep_armocromia.py`)**

1. `RGB-M/` (배경 마스킹된 얼굴 이미지) — **우선 사용**
2. `RGB/` (원본 이미지) — RGB-M 파일이 없을 때 fallback
3. 둘 다 없으면 해당 행 제외 (에러 아님, 경고만 출력)

**Split 생성**

- `annotations.csv`의 `partition` 컬럼에는 `train` / `test` 만 존재 (val 없음)
- train에서 15% stratified sampling → val 생성
- 최종 split 비율: train ≈ 85% of 원본 train / val ≈ 15% of 원본 train / test = 원본 test

### 3.2 한국 연예인 (타깃 도메인)

- 원본 경로: `data/korean_celeb_raw/{계절 성별}/`
- 총 이미지: 389장
- 폴더 → 레이블 매핑:

| 폴더명 | 레이블 | 성별 |
|---|---|---|
| 봄웜 여 | `spring_warm` | female |
| 봄웜 남 | `spring_warm` | male |
| 여쿨 여 | `summer_cool` | female |
| 여쿨 남 | `summer_cool` | male |
| 가을 여 | `autumn_warm` | female |
| 가을 남 | `autumn_warm` | male |
| 겨울 여 | `winter_cool` | female |
| 겨울 남 | `winter_cool` | male |

**Split 생성 (`make_splits.py`)**

- `person_id` 단위 stratified split (레이블 + 성별 기준)
- 동일 인물이 train/val/test에 걸치지 않도록 보장 (데이터 누수 방지)
- 비율: train 70% / val 15% / test 15%
- 결과: `data/splits/korean/{train,val,test}.csv`

---

## 4. 전처리 파이프라인 (`preprocess_faces.py`)

### 4.1 전체 흐름

```
원본 이미지 (BGR)
    ↓ MTCNN 얼굴 검출
얼굴 bbox (20% margin 확장)
    ↓ 얼굴 크롭
크롭 이미지 (H×W)
    ↓ BiSeNet face parsing
피부 마스크 (bool H×W)
    ↓ 비피부 영역 → 중립 회색 128 치환
마스킹된 얼굴 이미지
    ↓ Resize
224×224 저장
```

### 4.2 MTCNN 얼굴 검출

```python
detector = MTCNN(keep_all=True, device=device, min_face_size=20)
```

- 여러 얼굴이 검출되면 **confidence 최고** 얼굴 선택
- bbox 확장: 상하좌우 20% (`MARGIN = 0.20`)

### 4.3 BiSeNet 피부 마스킹

**모델:** BiSeNet (face-parsing.PyTorch), CelebAMask-HQ 19-class

**피부로 간주하는 클래스:**

| 클래스 번호 | 영역 | 포함 이유 |
|---|---|---|
| 1 | skin | 얼굴 피부 본체 |
| 7 | l_ear | 귀 피부 톤 포함 |
| 8 | r_ear | 귀 피부 톤 포함 |
| 10 | nose | 코 피부 톤 포함 |
| 14 | neck | 목 피부 톤 포함 |

**제외되는 영역 (배경 → 회색 128 대체):**

- 배경 (0), 눈썹 (2,3), 눈 (4,5), 안경 (6), 귀걸이 (9),
- 입술/입 (11,12,13), 목걸이 (15), 옷 (16), **머리카락 (17)**, 모자 (18)

**BiSeNet 입력 전처리:**

```python
BISENET_SIZE = 512
BISENET_MEAN = (0.485, 0.456, 0.406)
BISENET_STD  = (0.229, 0.224, 0.225)
```

- Resize → 512×512 → ToTensor → Normalize
- 예측 후 크롭 이미지 원본 크기로 `INTER_NEAREST` 리사이즈

**마스크 후처리:**

```python
kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (5, 5))
mask = cv2.dilate(mask, kernel, iterations=1)
```

- 경계 영역 1회 팽창(dilate)으로 경계선 부드럽게 처리

**마스킹 스킵 조건:**

```python
MIN_SKIN_RATIO = 0.10
```

- 피부 픽셀 비율이 10% 미만이면 마스킹 실패로 간주 → 원본 크롭 저장

### 4.4 핵심 설계 이유

> 퍼스널컬러는 피부 톤·언더톤이 핵심 정보이므로,
> 머리카락·눈·입술·배경 등 무관한 색상 정보를 제거하고
> 피부 영역만 남겨 모델이 색 편향 없이 학습하도록 설계.

---

## 5. 학습 설정 (`train_personal_color.py`)

### 5.1 이미지 정규화 (공통)

```python
MEAN = [0.485, 0.456, 0.406]   # ImageNet 통계
STD  = [0.229, 0.224, 0.225]
```

### 5.2 데이터 증강 전략

퍼스널컬러는 색상 정보가 핵심이므로 **hue/saturation 변화를 최소화**하고 기하학적 변환 위주로 증강.

**Strong augmentation (`--strong_aug`)**

```python
RandomResizedCrop(224, scale=(0.65, 1.0), ratio=(0.85, 1.15))
RandomHorizontalFlip(p=0.5)
RandomRotation(20)
RandomPerspective(distortion_scale=0.25, p=0.4)
ColorJitter(brightness=0.25, contrast=0.25, saturation=0.05, hue=0.02)  # 색조 최소
RandomErasing(p=0.3, scale=(0.02, 0.15))
```

**일반 augmentation**

```python
RandomResizedCrop(224, scale=(0.75, 1.0))
RandomHorizontalFlip(p=0.5)
RandomRotation(10)
ColorJitter(brightness=0.15, contrast=0.15, saturation=0.05)
```

**검증/추론 transform**

```python
Resize(256) → CenterCrop(224) → ToTensor → Normalize
```

### 5.3 손실 함수

```python
CrossEntropyLoss(label_smoothing=args.label_smoothing, weight=class_weights)
```

- `--label_smoothing 0.1` 권장
- `--class_weights`: 클래스 불균형 시 역빈도 가중치 적용

### 5.4 Mixup

```python
# alpha=0.3 권장 (base training)
mixed_x = lam * x + (1 - lam) * x[shuffled]
loss = lam * CE(pred, y_a) + (1 - lam) * CE(pred, y_b)
```

base training에서 `--mixup 0.3` 권장 (finetune은 보통 off).

### 5.5 옵티마이저 & 스케줄러

```python
optimizer = AdamW(params, lr=lr, weight_decay=weight_decay)
```

**LR 스케줄: Linear Warmup + Cosine Decay**

```
epoch 0..warmup  → lr 선형 증가 (0 → max_lr)
epoch warmup..end → cosine annealing (max_lr → 0)
```

### 5.6 Backbone Freeze (finetune 모드)

```python
# 처음 freeze_epochs (기본 3) 동안 classifier만 학습
# 이후 전체 파라미터 학습
if epoch <= freeze_epochs:
    set_backbone_trainable(model, False)
else:
    set_backbone_trainable(model, True)
```

### 5.7 체크포인트 저장 형식

```python
{
    "model_state_dict": model.state_dict(),
    "optimizer_state_dict": optimizer.state_dict(),
    "epoch": epoch,
    "val_acc": val_acc,
    "label_map": LABEL2IDX,
}
```

---

## 6. 평가 (`evaluate_personal_color.py`)

### 6.1 TTA (Test Time Augmentation)

`--tta` 플래그 활성화 시 6-crop 앙상블 적용.
색상은 건드리지 않고 기하학적 변환만 사용:

| # | 변환 |
|---|---|
| 1 | Resize 256 → CenterCrop 224 (기본) |
| 2 | 기본 + HorizontalFlip |
| 3 | Resize 232 → CenterCrop 224 (zoom-in) |
| 4 | zoom-in + HorizontalFlip |
| 5 | Resize 280 → CenterCrop 224 (zoom-out) |
| 6 | zoom-out + HorizontalFlip |

6개 softmax 출력의 평균 → 최종 예측.

### 6.2 출력 결과물

| 파일 | 내용 |
|---|---|
| `outputs/reports/classification_report.txt` | precision/recall/f1 per class |
| `outputs/reports/confusion_matrix.png` | 4×4 confusion matrix |
| `outputs/reports/test_predictions.csv` | 샘플별 예측 결과 + 확률 |

### 6.3 예상 혼동 패턴

```
spring_warm ↔ autumn_warm   (같은 웜톤, 밝기/채도 차이)
summer_cool ↔ winter_cool   (같은 쿨톤, 명도/대비 차이)
```

---

## 7. 추론 (`infer_personal_color.py`)

### 7.1 단일 이미지 추론 흐름

```
입력 이미지
    ↓ MTCNN 얼굴 검출 (여러 얼굴 → 가장 큰 bbox 선택)
얼굴 크롭 (20% margin)
    ↓ VAL_TRANSFORM (Resize 256 → CenterCrop 224 → Normalize)
    ↓ EfficientNet-B0 forward
softmax 확률
    ↓ top-2 출력
```

### 7.2 확신도 정책

| 범위 | 레벨 | 대응 |
|---|---|---|
| ≥ 0.70 | 높음 | 결과 신뢰 |
| 0.55 ~ 0.70 | 보통 | 참고 수준 |
| < 0.55 | 낮음 | 정면 사진 재촬영 권장 |

---

## 8. Gradio 데모 (`spaces/app.py`)

### 8.1 모델 로드

```python
REPO_ID    = "jiwoonkim00/personal-color-classifier"
MODEL_FILE = "personal_color_korean_tuned_v2.pt"
```

HuggingFace Hub에서 가중치 다운로드 후 로드.

### 8.2 추론 방식

로컬 추론(`infer_personal_color.py`)과 차이점:

| 항목 | 로컬 추론 | Gradio 데모 |
|---|---|---|
| 얼굴 검출 | MTCNN | **없음** (square center crop만 적용) |
| TTA | 없음 | **6-crop TTA** |
| 다중 얼굴 처리 | 가장 큰 bbox | N/A |

**Square Center Crop (Gradio 전용):**

```python
side = min(width, height)
# 중앙 정사각형 크롭 → 이후 TTA 적용
```

MTCNN을 생략하므로 사용자가 얼굴이 중앙에 오는 정면 사진을 제공해야 정확함.

---

## 9. 파일 구조 요약

```
personal_color/
├── src/
│   ├── preprocess_faces.py       # MTCNN + BiSeNet 피부 마스킹 전처리
│   ├── prepare_deep_armocromia.py # Deep Armocromia 데이터 ingestion
│   ├── make_splits.py            # person-level stratified split
│   ├── train_personal_color.py   # base / finetune 통합 학습 스크립트
│   ├── evaluate_personal_color.py # TTA 평가 + confusion matrix
│   └── infer_personal_color.py   # 단일 이미지 추론
├── spaces/
│   └── app.py                    # Gradio HuggingFace Spaces 데모
├── lib/
│   └── face_parsing/             # BiSeNet (face-parsing.PyTorch)
│       └── res/cp/79999_iter.pth # BiSeNet pretrained checkpoint
├── data/
│   ├── korean_celeb_raw/         # 원본 이미지 (수정 금지)
│   ├── korean_celeb_faces/       # 전처리된 얼굴 크롭
│   ├── deep_armocromia/          # Deep Armocromia release
│   └── splits/
│       ├── korean/               # train/val/test CSV
│       └── deep_armocromia/      # train/val/test CSV
└── outputs/
    ├── checkpoints/
    │   ├── deep_armocromia_efficientnet_b0_base.pt   # base 체크포인트
    │   └── personal_color_korean_tuned.pt            # 최종 체크포인트
    └── reports/
        ├── korean_faces_metadata.csv
        ├── deep_armocromia_metadata.csv
        ├── classification_report.txt
        ├── confusion_matrix.png
        └── test_predictions.csv
```

---

## 10. 주요 실행 명령어

### 전처리

```bash
# MTCNN + BiSeNet 피부 마스킹 전처리
python src/preprocess_faces.py \
  --input_dir data/korean_celeb_raw \
  --output_dir data/korean_celeb_faces \
  --img_size 224 \
  --parsing_checkpoint lib/face_parsing/res/cp/79999_iter.pth

# 피부 마스킹 없이 MTCNN crop만 사용
python src/preprocess_faces.py --no_skin_mask
```

### Split 생성

```bash
python src/make_splits.py
python src/prepare_deep_armocromia.py --data_root data/deep_armocromia --val_ratio 0.15
```

### 학습

```bash
# base training (Deep Armocromia)
python src/train_personal_color.py \
  --mode base \
  --train_csv data/splits/deep_armocromia/train.csv \
  --val_csv data/splits/deep_armocromia/val.csv \
  --output_checkpoint outputs/checkpoints/deep_armocromia_efficientnet_b0_base.pt \
  --epochs 50 --mixup 0.3 --label_smoothing 0.1 --strong_aug

# fine-tuning (Korean)
python src/train_personal_color.py \
  --mode finetune \
  --train_csv data/splits/korean/train.csv \
  --val_csv data/splits/korean/val.csv \
  --init_checkpoint outputs/checkpoints/deep_armocromia_efficientnet_b0_base.pt \
  --output_checkpoint outputs/checkpoints/personal_color_korean_tuned.pt \
  --lr 1e-5 --epochs 20 --strong_aug --label_smoothing 0.1
```

### 평가 / 추론

```bash
# TTA 포함 평가
python src/evaluate_personal_color.py \
  --test_csv data/splits/korean/test.csv \
  --checkpoint outputs/checkpoints/personal_color_korean_tuned.pt \
  --tta

# 단일 이미지 추론
python src/infer_personal_color.py \
  --image path/to/photo.jpg \
  --checkpoint outputs/checkpoints/personal_color_korean_tuned.pt \
  --save-viz
```

---

## 11. 주의사항

- 이 데이터셋은 한국 연예인 스크린샷 기반으로, 메이크업/조명/편집 편향이 존재함.
- 프로토타입·포트폴리오 수준이며 전문가 퍼스널컬러 진단을 대체하지 않음.
- 프로덕션 사용 시 사용자 동의를 받은 이미지와 전문가 레이블링 데이터 필요.
