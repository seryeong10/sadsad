# 얼굴 전처리 업데이트 — BiSeNet 피부 마스킹 도입

작성일: 2026-06-07

---

## 왜 바꿨나

퍼스널컬러는 **피부색**으로 결정된다.
그런데 기존 전처리는 얼굴 박스 전체를 그대로 잘라서 저장했기 때문에,
모델이 피부 이외의 정보(머리카락 색, 입술 색, 배경, 옷)까지 학습하게 됐다.

```
기존: 얼굴 박스 crop → 저장
           ↑
       머리카락·입술·눈·옷 색상이 전부 포함됨
```

예를 들어 흑발과 금발의 차이, 짙은 립스틱 색이
퍼스널컬러 분류에 영향을 줄 수 있는 구조였다.

---

## 무엇이 달라졌나

### 기존 방식 vs 새 방식

| 항목 | 기존 | 변경 후 |
|---|---|---|
| 얼굴 검출 | MTCNN | MTCNN (유지) |
| 피부 분리 | 없음 (전체 crop) | **BiSeNet face parsing** |
| 저장 이미지 | 얼굴 전체 | **피부 영역만 남기고 나머지 회색** |
| 다중 얼굴 처리 | 이미지 스킵 | 가장 높은 confidence 얼굴 선택 |
| 메타데이터 | 기본 정보만 | `skin_masked`, `skin_ratio` 컬럼 추가 |

---

## BiSeNet이 뭔가

**BiSeNet** (Bilateral Segmentation Network) 은 얼굴 이미지를 픽셀 단위로 19개 영역으로 분류하는 딥러닝 모델이다.

- 학습 데이터: CelebAMask-HQ (고화질 유명인 얼굴 30,000장)
- GitHub: [face-parsing.PyTorch](https://github.com/zllrunning/face-parsing.PyTorch) (★ 2.5k)
- 입력: 512×512 RGB 이미지
- 출력: 각 픽셀이 어느 부위인지 나타내는 레이블 맵

### 19개 클래스 레이블

```
 0: background    1: skin ✓    2: l_brow       3: r_brow
 4: l_eye         5: r_eye     6: eye_g        7: l_ear ✓
 8: r_ear ✓       9: ear_r    10: nose ✓      11: mouth
12: u_lip        13: l_lip    14: neck ✓      15: neck_l
16: cloth        17: hair     18: hat
```

✓ 표시가 **피부 영역으로 유지하는 클래스** (skin, 귀, 코, 목)

---

## 새 파이프라인

```
원본 이미지
    │
    ▼
MTCNN 얼굴 검출
 → 여러 얼굴 있으면 confidence 최고 선택
 → 20% margin 추가해서 crop
    │
    ▼
BiSeNet face parsing (512×512 입력)
 → 픽셀별 19개 클래스 분류
    │
    ▼
피부 마스크 생성
 → skin(1), 코(10), 귀(7,8), 목(14) → 유지
 → 머리카락(17), 눈(4,5), 입술(12,13), 옷(16), 배경(0) → 회색(128)
 → 마스크 경계 약간 팽창 처리 (자연스러운 경계)
    │
    ▼
224×224 리사이즈 후 저장
```

### 실제 수치 예시 (한지민 이미지 기준)

| 클래스 | 비율 | 처리 |
|---|---|---|
| skin | 31.4% | ✓ 유지 |
| nose | 3.0% | ✓ 유지 |
| neck | 2.5% | ✓ 유지 |
| **피부 합계** | **36.9%** | **모델이 보는 영역** |
| hair | 34.9% | ✗ 회색 처리 |
| cloth | 10.6% | ✗ 회색 처리 |
| lips | 1.5% | ✗ 회색 처리 |
| eyes/brows | 1.7% | ✗ 회색 처리 |

---

## 사용 방법

```bash
python src/preprocess_faces.py \
  --input_dir data/korean_celeb_raw \
  --output_dir data/korean_celeb_faces \
  --img_size 224
```

### 주요 옵션

| 옵션 | 기본값 | 설명 |
|---|---|---|
| `--input_dir` | `data/korean_celeb_raw` | 원본 이미지 폴더 |
| `--output_dir` | `data/korean_celeb_faces` | 결과 저장 폴더 |
| `--img_size` | `224` | 최종 이미지 크기 (정사각형) |
| `--parsing_checkpoint` | `lib/face_parsing/res/cp/79999_iter.pth` | BiSeNet 모델 경로 |
| `--no_skin_mask` | (미사용) | 피부 마스킹 없이 기존 방식으로만 실행 |

### 결과 파일

```
outputs/reports/korean_faces_metadata.csv  ← 성공 목록 (skin_masked, skin_ratio 포함)
outputs/reports/failed_crop.csv            ← 실패 목록
data/korean_celeb_faces/
  female/spring_warm/  summer_cool/  autumn_warm/  winter_cool/
  male/  spring_warm/  summer_cool/  autumn_warm/  winter_cool/
```

---

## 의존 파일 구조

```
lib/
  face_parsing/            ← git clone face-parsing.PyTorch
    model.py               ← BiSeNet 모델 정의
    resnet.py              ← ResNet18 backbone
    res/cp/
      79999_iter.pth       ← pretrained weights (53MB, gdown으로 다운)
```

---

## 예외 처리

| 상황 | 동작 |
|---|---|
| 얼굴 미검출 | `failed_crop.csv`에 기록 후 스킵 |
| 여러 얼굴 감지 | confidence 최고 얼굴 선택 (기존: 스킵) |
| 피부 비율 < 10% | 마스킹 스킵, 원본 crop 저장 + 경고 출력 |
| BiSeNet 추론 에러 | 마스킹 스킵, 원본 crop 저장 + 경고 출력 |

---

## 기대 효과

- 모델이 **피부색 자체**에 집중하게 되어 퍼스널컬러 특징 학습에 유리
- 흑발/갈색머리 같은 **머리카락 색 편향 제거**
- 짙은 립스틱 등 **메이크업 색 편향 감소**
- 배경·의상 색상의 영향 차단
- 특히 기존 실험에서 약했던 **warm 계열(봄/가을) 분류 개선** 기대
