# 퍼스널컬러 모델 진행상황 스냅샷

최종 업데이트: 2026-06-07

---

## 현재 최고 성능

| 모델 | Test Accuracy | 비고 |
|---|---|---|
| **B0 fine-tune v7 + TTA** | **70.8%** | **현재 최고** |
| B0 fine-tune v6 + TTA | 69.9% | |
| B0 fine-tune v6 (TTA 없음) | 68.3% | |
| B2 fine-tune + TTA | 66.9% | B0보다 낮음 |

**최고 체크포인트:** `outputs/checkpoints/personal_color_korean_tuned_v2.pt`  
**이전 체크포인트:** `outputs/checkpoints/personal_color_korean_tuned.pt` (69.9%)

---

## 실험 히스토리 요약

| 실험 | Base | Fine-tune 데이터 | Test Acc | TTA |
|---|---|---|---|---|
| 1+2 | v1 (30ep, weak aug) | Korean 379장 | 28.6% | - |
| 1+3 | v1 | Korean 379장 | 20.6% | - |
| 4 | v2 단독 | - | 30.2% | - |
| 4+5 | v2 (50ep, mixup) | Korean 379장 | 38.1% | - |
| 6 | v2 | Korean 2,368장 + BiSeNet | 66.3% | - |
| 7 | v3 (masked DA) | Korean 2,368장 | 67.7% | - |
| 8 | v3 (masked DA) | Korean 2,368장 | 68.3% | - |
| 8+TTA | v3 (masked DA) | Korean 2,368장 | 69.9% | ✓ |
| B2+TTA | B2 (masked DA) | Korean 2,368장 | 66.9% | ✓ |
| **9+TTA** | **v4 (원본 RGB-M)** | **Korean 2,368장** | **70.8%** | ✓ |

---

## 베이스 모델 비교

| 버전 | 데이터 | Epochs | Best val_acc | 특이사항 |
|---|---|---|---|---|
| v1 | Deep Armocromia 원본 | 30 | 56.98% | weak aug, overfitting |
| v2 | Deep Armocromia 원본 | 50 | 57.97% | mixup 0.3, strong aug |
| v3 | Deep Armocromia 피부마스킹 | 75 | 51.99% | class_weights — base엔 역효과 |
| B2 | Deep Armocromia 피부마스킹 | 75 | 52.16% | B2 모델 |
| **v4** | **Deep Armocromia 원본** | 75 | **56.48%** | class_weights, fine-tune 최고 성능 |

> **결론: Deep Armocromia base는 원본 RGB-M으로 학습하는 것이 최적**  
> 체크포인트: `outputs/checkpoints/deep_armocromia_efficientnet_b0_base_rgb.pt`

---

## Fine-tune v7 결과 (현재 최고)

| 항목 | 설정 |
|---|---|
| Base | v4 (원본 RGB-M, 75ep, val 56.48%) |
| 데이터 | Korean train 1,656 / val 356 (BiSeNet 마스킹) |
| Epochs | 40 (best: ep ~13, val_acc 64.9%) |
| LR | 5e-5, warmup(2ep) + cosine |
| Freeze | 없음 |
| Augmentation | strong, mixup 0.2, label_smoothing 0.1 |
| Class weights | 적용 |

| 클래스 | Precision | Recall | F1 | 이전 (v6+TTA) |
|---|---|---|---|---|
| spring_warm | 0.69 | 0.80 | **0.74** | 0.72 ↑ |
| summer_cool | 0.97 | 0.84 | **0.90** | 0.91 ↓ |
| autumn_warm | 0.54 | 0.58 | **0.56** | 0.55 ↑ |
| winter_cool | 0.68 | 0.61 | **0.64** | 0.64 = |
| **macro avg** | **0.72** | **0.71** | **0.71** | 0.70 ↑ |
| **Test Acc (TTA)** | | | **70.8%** | 69.9% |

---

## 현재 체크포인트 목록

| 파일 | 내용 | Test Acc |
|---|---|---|
| `deep_armocromia_efficientnet_b0_base_rgb.pt` | Base v4 — 원본 RGB-M (56.48%) | - |
| `deep_armocromia_efficientnet_b0_base.pt` | Base v3 — 피부마스킹 (51.99%) | - |
| `deep_armocromia_efficientnet_b2_base.pt` | B2 base — 피부마스킹 (52.16%) | - |
| **`personal_color_korean_tuned_v2.pt`** | **현재 최고 fine-tune** | **70.8% (TTA)** |
| `personal_color_korean_tuned.pt` | 이전 최고 fine-tune | 69.9% (TTA) |
| `personal_color_korean_b2_tuned.pt` | B2 fine-tune | 66.9% (TTA) |

---

## 핵심 발견 정리

1. **데이터 규모가 가장 큰 요인**: 379장 → 2,368장 확장 시 +28%p
2. **BiSeNet 마스킹**: Korean fine-tuning엔 효과적, Deep Armocromia base엔 역효과
3. **TTA**: 추가 학습 없이 +1.7%p (공짜 개선)
4. **B2 > B0 아님**: 2,368장 규모에선 B0가 더 적합 (B2 오버피팅)
5. **Freeze 없애기 + LR 5e-5**: fine-tuning 수렴 속도 개선
6. **원본 RGB-M base > 마스킹 base**: Deep Armocromia는 마스킹 없이 학습해야 57%대 유지
7. **autumn_warm이 최약점**: F1 0.56, 봄웜과 혼동 지속

---

## 개선 여지 (미시도)

| 방법 | 예상 효과 | 난이도 |
|---|---|---|
| 2단계 분류 (warm/cool → 세부) | 구조적 혼동 해결 | 중 |
| autumn_warm 데이터 추가 수집 | F1 직접 개선 | 높음 |
| Focal loss | 어려운 샘플 집중 학습 | 낮음 |
| 색상 특징 (Lab 평균) concat | 명시적 색상 정보 추가 | 중 |
| HuggingFace Spaces 배포 | 데모 서비스 | 중 |
