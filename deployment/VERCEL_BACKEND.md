# 기존 AI를 Vercel에서 실행하는 배포 준비

현재 단계: 소스 패키지와 Linux 의존성 검증 완료. **이 백엔드는 아직 Vercel에 배포·실행 검증되지 않았다.**

Flutter 화면과 별도로 같은 Vercel 계정에 FastAPI 백엔드를 배포한다. 별도 PC/EC2 서버는 이 구성에 필요하지 않다. 기존 OpenAI/FAL 호출과 기존 EfficientNet/MTCNN/BiSeNet 코드를 사용한다.

## 준비한 소스

```powershell
.\deployment\prepare-vercel-backend.ps1
```

결과: `.vercel-backend` (git-ignored). 비밀 키 파일은 복사하지 않는다. 기존 `.venv`도 복사하지 않는다. CPU PyTorch와 MTCNN의 호환 버전을 별도 Linux 배포 의존성에 명시했다. 패키지 충돌 검사는 설치 없이 통과했으며, 실제 Linux 추론 성공은 배포 후 확인해야 한다.

## 원래 체크포인트

| 파일 | 크기 | 용도 |
|---|---:|---|
| birefnet-lite-512.onnx | 약 193 MB | 기존 옷 사진 배경 제거 |
| 79999_iter.pth | 약 53 MB | 원래 퍼스널 컬러의 피부 마스킹. 프로젝트 지정 Google Drive에서 다운로드 완료 |
| personal_color_korean_tuned_v2.pt | 약 49 MB | 기존 HuggingFace 저장소에서 런타임 캐시로 로드 |

모델을 다른 것으로 대체하지 않는다. 업로드할 BiRefNet/BiSeNet은 현재 로컬 파일의 SHA-256으로 검증하도록 구현했다. 서버리스 환경에서는 쓰기 가능한 `/tmp`에 캐시한다.

Vercel CLI Hobby 소스 업로드 제한은 100 MB이므로 큰 원래 모델 두 개는 모델 저장소에 보관하고 서버가 읽도록 준비했다. 모델 저장소 생성·업로드는 아직 수행하지 않았다. 저장소에는 모델 파일만 보관하고 사용자 얼굴/옷 사진을 넣는 구성은 아니다.

Python 함수 표준 번들 제한은 500 MB이며 PyTorch 묶음에는 Large Functions 지원이 필요할 수 있다. Vercel은 이를 Fluid Compute 공개 베타로 제공한다. 계정의 실제 빌드에서 적용 여부를 확인해야 하며 유료 요금제로 자동 전환하지 않는다.

## 서버 환경 변수

- 기존 OpenAI/FAL/OpenWeather/Naver 서버 키: Vercel 서버 환경 변수에만 설정, GitHub/Flutter에 넣지 않는다.
- `FIREBASE_API_KEY`: 기존 a-vata 프로젝트의 공개 클라이언트 키.
- `REQUIRE_FIREBASE_AUTH=true`
- `CLOSET_RECOMMENDATION_AI_ENABLED=true`
- `REQUIRE_DEEP_PERSONAL_COLOR=true`: 원래 EfficientNet+BiSeNet이 실패하면 성공한 대체 결과로 감추지 않고 오류를 반환한다.
- `BISENET_CKPT_PATH=models/79999_iter.pth`
- `BIREFNET_MODEL_URL`, `BISENET_MODEL_URL`: 승인 후 업로드한 원래 체크포인트의 HTTPS 주소.

배포 후 로그인된 요청에서 `analysis_method=efficientnet_b0_huggingface`와 피부 마스킹 활성 로그를 확인해야 원래 퍼스널 컬러 복구 성공으로 기록한다. 이미지 업로드와 응답이 Vercel 함수의 4.5 MB 제한 안에 들어오는지도 실제 아이패드 사진으로 확인해야 한다.

## 이번 실제 검증에서 드러난 제한

- 니트·청바지·코트 사진의 실제 분류 성공. 각각 상의/니트 계열, 하의/청바지, 아우터/코트.
- 코디 AI가 상의·하의를 누락한 결과를 반환해 프롬프트와 결과 검증을 수정했다. 재호출에서 완성 코디 두 개 반환 확인.
- 기존 FAL v1.5에서 니트 → 청바지 순차 합성은 시각 검증 성공.
- 다음 코트 합성은 길이가 셔츠처럼 짧아졌다. 자동 분류도 개선하지 못했고, 전신 카테고리 실험은 바지까지 변경했다. 따라서 아우터 카테고리를 실험 설정으로 변경하지 않았다. 3벌 순차 결과의 안정성은 미확보이다.
- 네이버 쇼핑 API는 공식적으로 2026-07-31 종료되어 현재 호출이 404이다. 기존 카탈로그 추천 성공은 원래 실시간 네이버 API 성공으로 기록하지 않는다.

공식 자료:
- https://vercel.com/docs/frameworks/backend/fastapi
- https://vercel.com/docs/functions/runtimes/python
- https://vercel.com/docs/functions/limitations
- https://vercel.com/docs/limits
- https://developers.naver.com/notice/article/32564
