# Personal Color Model — 학습 과정 총정리

최초 작성: 2026-05-25 | 최종 업데이트: 2026-06-07  
작업 환경: RunPod GPU Pod / NVIDIA A40 48GB / PyTorch 2.4.1 / timm 1.0.27

---

## 1. 프로젝트 목표

얼굴 이미지 한 장으로 퍼스널컬러 4계절 유형을 분류하는 모델 개발.

| 레이블 | 한국어 | 설명 |
|---|---|---|
| `spring_warm` | 봄웜 | 밝고 선명한 웜톤 |
| `summer_cool` | 여쿨 | 밝고 부드러운 쿨톤 |
| `autumn_warm` | 가을웜 | 깊고 무거운 웜톤 |
| `winter_cool` | 겨울쿨 | 선명하고 강한 쿨톤 |

---

## 2. 학습 전략

```
ImageNet pretrained EfficientNet-B0
  → [Phase 1] Deep Armocromia base training  (소스 도메인: 유럽인 얼굴)
  → [Phase 2] Korean celebrity fine-tuning   (타겟 도메인: 한국 셀럽)
  → 최종 평가: Korean test split
```

**설계 이유:**
- Korean celeb 데이터셋(389장 원본)만으로 4-class 분류기를 처음부터 학습하기에는 데이터가 너무 적음
- Deep Armocromia(약 4,920장, 배경 제거 얼굴 이미지)로 계절 색상 지식을 먼저 학습한 뒤 도메인 적응

---

## 3. 데이터셋

### 3-1. Korean Celebrity Dataset

**v1 (초기, 실험 1~5)**

| 항목 | 수치 |
|---|---|
| 원본 이미지 | 389장 |
| Face crop 성공 | 379장 |
| Train / Val / Test | 262 / 54 / 63 |

**v2 (현재, 실험 6 — 데이터 추가 + BiSeNet 피부 마스킹)**

| 항목 | 수치 |
|---|---|
| 원본 이미지 | 2,384장 (중복 265장 제거 후) |
| Face crop 성공 | 2,368장 |
| Face crop 실패 | 2장 |
| BiSeNet 피부 마스킹 적용 | 2,366장 |
| Train / Val / Test | 1,656 / 356 / 356 |

**클래스 × 성별 분포 (v2 face crop 후):**

| 클래스 | female | male | 합계 |
|---|---|---|---|
| spring_warm | 298 | 298 | 596 |
| summer_cool | 296 | 298 | 594 |
| autumn_warm | 298 | 298 | 596 |
| winter_cool | 297 | 285 | 582 |
| **합계** | **1,189** | **1,179** | **2,368** |

> 같은 사람이 train/val/test에 분산되지 않도록 person_id 기반 group-aware split 적용  
> v2: BiSeNet(face-parsing.PyTorch)으로 머리카락·눈·입술·배경 제거 → 피부 영역만 학습

---

### 3-2. Deep Armocromia Dataset

- 출처: Deep Armocromia 공개 데이터셋 (배경 제거 얼굴 이미지, RGB-M 폴더)
- Google Drive에서 `gdown`으로 다운로드 후 비밀번호 보호 ZIP 해제

**클래스 매핑:**

| Deep Armocromia | Model label |
|---|---|
| primavera | spring_warm |
| estate | summer_cool |
| autunno | autumn_warm |
| inverno | winter_cool |

**데이터 분포:**

| split | autumn_warm | spring_warm | summer_cool | winter_cool | 합계 |
|---|---|---|---|---|---|
| train | 889 | 831 | 801 | 885 | **3,406** |
| val | 157 | 147 | 142 | 156 | **602** |
| test | 259 | 203 | 186 | 264 | **912** |

> `partition=train`에서 15%를 stratified sampling으로 val 분리 (`prepare_deep_armocromia.py`)

---

## 4. 모델 아키텍처

- **모델:** `efficientnet_b0.ra_in1k` (timm)
- **파라미터:** 약 5.3M
- **출력:** 4-class softmax
- **입력 크기:** 224 × 224

---

## 5. 학습 실험 기록

### 실험 1 — Base Training v1 (30 epochs, weak aug)

| 항목 | 설정 |
|---|---|
| 데이터 | Deep Armocromia train 3,406 / val 602 |
| Epochs | 30 |
| LR | 1e-4, CosineAnnealingLR |
| Batch size | 32 |
| Augmentation | Resize(256) + RandomCrop + HorizontalFlip + Rotation(10) + ColorJitter(weak) |
| Regularization | weight_decay=1e-4 |

**결과:**

| 항목 | 수치 |
|---|---|
| Best val_acc | 56.98% (epoch 28) |
| Train acc (best epoch) | 98.24% |
| Train / Val 갭 | **0.4126** — 심각한 overfitting |

**문제:** train acc 98% vs val acc 57% → 극심한 overfitting. 모델이 훈련 데이터를 암기하는 수준.

---

### 실험 2 — Korean Fine-tuning v1 (Base v1 기반)

| 항목 | 설정 |
|---|---|
| 데이터 | Korean train 262 / val 54 |
| Init checkpoint | Base v1 |
| Epochs | 20 |
| LR | 3e-5, CosineAnnealingLR |
| Freeze backbone | 초반 3 epoch |
| Augmentation | weak |

**결과:**

| split | accuracy |
|---|---|
| Best val_acc | 37.0% (epoch 4) |
| **Korean test_acc** | **28.6%** |

**문제:** 4-class random baseline(25%)보다 3.6%p 높은 수준. 실질적 학습 미흡.

---

### 실험 3 — Korean Fine-tuning v2 (augmentation 강화)

| 항목 | 설정 |
|---|---|
| Init checkpoint | Base v1 |
| Epochs | 20 |
| LR | 1e-5 (↓) |
| Freeze backbone | 초반 5 epoch (↑) |
| Augmentation | **strong** (RandomResizedCrop + Perspective + Erasing) |
| Label smoothing | 0.1 |

**결과:**

| split | accuracy |
|---|---|
| Best val_acc | 42.6% (epoch 7) |
| **Korean test_acc** | **20.6%** |

**문제:** val_acc는 올랐으나 test_acc는 오히려 하락. val set이 54장으로 너무 작아 epoch 단위 노이즈가 큼. 베이스 모델 자체의 overfitting이 근본 원인.

---

### 실험 4 — Base Training v2 (50 epochs, mixup + warmup)

**핵심 변경:** Mixup으로 train/val 갭을 절반으로 줄임

| 항목 | v1 | v2 |
|---|---|---|
| Epochs | 30 | **50** |
| LR schedule | Cosine | **Warmup(5ep) + Cosine** |
| Augmentation | weak | **strong** (ResizedCrop + Perspective + Erasing) |
| Mixup | 없음 | **alpha=0.3** |
| Label smoothing | 없음 | **0.1** |
| Weight decay | 1e-4 | **5e-4** |

**결과:**

| 항목 | v1 | v2 |
|---|---|---|
| Best val_acc (Deep Armocromia) | 56.98% | **57.97%** |
| Train acc (best epoch) | 98.24% | **77.63%** |
| Train / Val 갭 | 0.4126 | **0.1966** (↓ 52%) |
| Korean test_acc (base 단독) | 25.4% | **30.2%** |

**분석:** Mixup + strong aug로 overfitting이 크게 줄어 Korean 도메인 전이 성능도 개선.

---

### 실험 5 — Korean Fine-tuning v3 (Base v2 기반)

| 항목 | 설정 |
|---|---|
| 데이터 | Korean train 262 / val 54 |
| Init checkpoint | **Base v2** |
| Epochs | 20 |
| LR | 1e-5, Warmup(2ep) + Cosine |
| Freeze backbone | 초반 5 epoch |
| Augmentation | strong |
| Label smoothing | 0.1 |
| Mixup | alpha=0.2 |

**결과:**

| 클래스 | Precision | Recall | F1 | Support |
|---|---|---|---|---|
| spring_warm | 0.20 | 0.12 | 0.15 | 16 |
| summer_cool | 0.38 | 0.62 | 0.48 | 16 |
| autumn_warm | 0.25 | 0.08 | 0.12 | 13 |
| winter_cool | 0.48 | 0.61 | 0.54 | 18 |
| **macro avg** | **0.33** | **0.36** | **0.32** | 63 |

| 항목 | 수치 |
|---|---|
| **Korean test_acc** | **38.1%** |
| Random baseline | 25.0% |
| 개선폭 | **+13.1%p** |

---

### 실험 6 — Korean Fine-tuning v4 (데이터 6배 확장 + BiSeNet 피부 마스킹)

| 항목 | 설정 |
|---|---|
| 데이터 | Korean train **1,656** / val **356** |
| Init checkpoint | **Base v2** |
| Epochs | 30 |
| LR | 3e-5, Warmup(2ep) + Cosine |
| Augmentation | strong |
| Label smoothing | 0.1 |
| Mixup | alpha=0.2 |
| 전처리 변경 | **BiSeNet 피부 마스킹** (머리카락·눈·입술 제거) |

**결과:**

| 클래스 | Precision | Recall | F1 | Support |
|---|---|---|---|---|
| spring_warm | 0.66 | 0.72 | 0.69 | 90 |
| summer_cool | **0.93** | **0.84** | **0.88** | 89 |
| autumn_warm | 0.53 | 0.47 | 0.49 | 90 |
| winter_cool | 0.56 | 0.62 | 0.59 | 87 |
| **macro avg** | **0.67** | **0.66** | **0.66** | 356 |

| 항목 | 수치 |
|---|---|
| Best val_acc | **62.4%** (epoch 22) |
| **Korean test_acc** | **66.3%** |
| Random baseline | 25.0% |
| 개선폭 (vs 실험5) | **+28.2%p** |

---

### 실험 7 — Base v3 + Korean Fine-tuning v5 (Deep Armocromia 피부 마스킹 + 클래스 가중치 + 75 epoch) ← 현재 최고

**Base v3 변경사항:**
- Deep Armocromia 이미지에 BiSeNet 피부 마스킹 적용 (`RGB-M-skin/`) → 베이스·파인튜닝 도메인 일치
- 클래스 가중치 (`--class_weights`) 적용 — summer_cool(801장) 에 높은 가중치
- Epochs 50 → **75**

| 항목 | Base v2 | Base v3 |
|---|---|---|
| Best val_acc (Deep Armocromia) | 57.97% | 51.99% |
| Train acc | 77.63% | 79.56% |
| Train/val 갭 | 0.197 | 0.267 |

> Base v3 val_acc가 v2보다 낮음 — BiSeNet 마스킹이 이미 배경이 제거된 Deep Armocromia 이미지에서 일부 과도하게 적용된 것으로 추정. 그러나 베이스와 파인튜닝이 동일한 마스킹 방식을 사용하므로 도메인 일치 효과 유효.

**Korean Fine-tuning v5:**

| 항목 | 설정 |
|---|---|
| 데이터 | Korean train 1,656 / val 356 (BiSeNet 마스킹) |
| Init checkpoint | **Base v3** |
| Epochs | 30 |
| LR | 3e-5, Warmup(2ep) + Cosine |
| Freeze backbone | 초반 3 epoch |
| Augmentation | strong |
| Label smoothing | 0.1 |
| Mixup | alpha=0.2 |

**결과:**

| 클래스 | Precision | Recall | F1 | Support | 실험6 F1 |
|---|---|---|---|---|---|
| spring_warm | 0.68 | 0.66 | 0.67 | 90 | 0.69 |
| summer_cool | 0.94 | 0.85 | **0.89** | 89 | 0.88 |
| autumn_warm | 0.54 | 0.54 | **0.54** | 90 | 0.49 ↑ |
| winter_cool | 0.59 | 0.66 | **0.62** | 87 | 0.59 ↑ |
| **macro avg** | **0.69** | **0.68** | **0.68** | 356 | 0.66 |

| 항목 | 수치 |
|---|---|
| Best val_acc | **63.76%** (epoch 24) |
| **Korean test_acc** | **67.7%** |
| 개선폭 (vs 실험6) | **+1.4%p** |

---

## 6. 전체 실험 결과 비교

| 실험 | 모델 | 데이터 | Korean test_acc | 비고 |
|---|---|---|---|---|
| - | Random baseline | - | 25.0% | 4-class |
| 실험 1+2 | Base v1 → Fine-tune v1 | 379장 | 28.6% | weak aug, overfitting 심각 |
| 실험 1+3 | Base v1 → Fine-tune v2 | 379장 | 20.6% | strong aug but base overfitting |
| 실험 4 | Base v2 단독 | 379장 | 30.2% | fine-tuning 없이 |
| 실험 4+5 | Base v2 → Fine-tune v3 | 379장 | 38.1% | 데이터 부족 한계 |
| 실험 6 | Base v2 → Fine-tune v4 | 2,368장 | 66.3% | 데이터 확장 + BiSeNet 마스킹 |
| **실험 7** | **Base v3 → Fine-tune v5** | **2,368장** | **67.7%** | **Deep Armocromia 마스킹 + 클래스 가중치 + 75ep** |

---

## 7. 핵심 발견

1. **Mixup이 가장 효과적인 regularization이었다**  
   train/val 갭을 0.41 → 0.20으로 절반으로 줄였고, Korean 도메인 전이 성능도 개선됨

2. **베이스 모델 품질이 fine-tuning 결과를 결정한다**  
   Base v1(overfitting)으로 아무리 fine-tuning을 개선해도 한계가 있었음.  
   Base v2로 교체 후 fine-tuning도 자동으로 개선됨

3. **데이터 규모가 가장 큰 단일 요인이었다**  
   379장(실험5) → 2,368장(실험6)으로 6배 확장 시 38.1% → 66.3%로 +28.2%p 상승.  
   val set 54장 → 356장으로 안정화되어 모델 선택 신뢰도도 함께 올라감

4. **BiSeNet 피부 마스킹이 쿨톤 분류에 특히 효과적이었다**  
   summer_cool F1 0.48 → 0.88, winter_cool F1 0.54 → 0.59.  
   머리카락·입술 색 편향을 제거하자 피부 색조 차이가 더 뚜렷하게 학습됨

5. **가을웜이 여전히 가장 어렵다, 개선 중**  
   autumn_warm F1 0.49 → 0.54 (실험 7). 봄웜과의 혼동은 여전하지만 클래스 가중치 + 도메인 일치로 개선.  
   CLAUDE.md에서 예상한 warm↔warm 혼동이 완전히 해소되지는 않음

6. **Deep Armocromia 마스킹은 제한적 효과**  
   Base v3 val_acc가 오히려 낮아졌으나 (57.97% → 51.99%) fine-tuning 결과는 개선됨 (66.3% → 67.7%).  
   이미 배경이 제거된 Deep Armocromia RGB-M 이미지에 BiSeNet을 추가 적용하면 일부 과도한 마스킹이 발생할 수 있음.

---

## 8. 저장 파일 위치

| 파일 | 경로 |
|---|---|
| Base 체크포인트 (v2) | `outputs/checkpoints/deep_armocromia_efficientnet_b0_base.pt` |
| 최종 체크포인트 | `outputs/checkpoints/personal_color_korean_tuned.pt` |
| Base 학습 로그 | `outputs/reports/train_log_base.csv` |
| Fine-tune 학습 로그 | `outputs/reports/train_log_finetune.csv` |
| Deep Armocromia 메타데이터 | `outputs/reports/deep_armocromia_metadata.csv` |
| Korean 얼굴 메타데이터 | `outputs/reports/korean_faces_metadata.csv` |
| Face crop 실패 목록 | `outputs/reports/failed_crop.csv` |

---

## 9. 향후 개선 방향

### 단기 (데이터 없이 가능)

| 방법 | 기대 효과 |
|---|---|
| Test Time Augmentation (TTA) | 추론 시 multi-crop 평균으로 1~3%p 개선 |
| Warm 계열 focal loss 가중치 | spring/autumn 분류 개선 |
| 2단계 분류 (warm/cool → 세부) | warm/cool 혼동 구조적 해결 |
| Base 모델 재학습 (피부 마스킹 이미지로) | Deep Armocromia도 마스킹 적용 시 도메인 일치 효과 |

### 중장기 (데이터 확보 필요)

| 방법 | 기대 효과 |
|---|---|
| Korean 퍼스널컬러 데이터 추가 수집 | 근본적 성능 개선 |
| 전문가 라벨링 데이터셋 구축 | 라벨 품질 개선 |
| 가을웜 전용 데이터 보강 | 봄/가을 혼동 감소 |

---

## 10. 주의사항

- 이 모델은 한국 셀럽 스크린샷 기반으로 메이크업·조명·편집 편향이 존재함
- 프로토타입/포트폴리오 실험 목적으로만 사용
- 임상·전문가 수준의 퍼스널컬러 진단 도구로 제시하지 말 것
