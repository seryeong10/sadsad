# 실제용 Vercel 배포

2026-11-11 실제 API 배포와 호출 검증을 완료했다. 데모 플래그는 사용하지 않는다.

- 기존 공개 앱: https://a-vata-demo.vercel.app
- 실제 FastAPI: https://a-vata-api.vercel.app
- 기존 배포는 Vercel `seryeong2001-6048` 계정/팀에 있다.
- GitHub 계정으로 새로 import한 프로젝트는 `seryeong10/sadsad`이다. 서로 다른 Vercel 계정의 프로젝트 목록은 합쳐지지 않는다.

## GitHub에서 앱 자동 빌드

저장소 최상위 `vercel.json`이 Flutter 빌드와 출력 폴더를 지정한다.

- Root Directory: 저장소 최상위 (`.`)
- Framework Preset: Other (설정 파일의 `framework: null`)
- Build Command: `bash deployment/build-frontend-vercel.sh`
- Output Directory: `frontend/build/web`
- Flutter: 검증한 3.47.2 커밋으로 고정
- API: 기본값 `https://a-vata-api.vercel.app`, `API_BASE_URL`로 변경 가능
- 인증: 기존 Firebase 프로젝트의 공개 클라이언트 키를 Android 구성 파일에서 읽고 REST 인증을 사용

OpenAI/FAL/OpenWeather 비밀 키를 프런트엔드 빌드에 넣지 않는다. 기존 공개 API를 연결하므로 새 프런트엔드 프로젝트에 이 비밀 키들을 복사할 필요는 없다.

## 기존 AI 백엔드 재현

```powershell
.\deployment\prepare-vercel-backend.ps1
```

결과는 git-ignored `.vercel-backend`다. Python 3.12와 `pyproject.toml`을 사용한다. CPU PyTorch/torchvision만 명시적인 PyTorch 저장소에서 설치하며 나머지는 PyPI에서 설치한다. Vercel의 Large Functions가 실제 빌드에서 활성화되어 배포됐다.

기존 BiRefNet 약 193MB와 BiSeNet 약 53MB는 승인받은 Vercel 모델 저장소에 보관한다. 얼굴·옷 사진을 이 모델 저장소에 보관하지 않는다. 모델 다운로드 후 원래 파일의 SHA-256을 검증하고 `/tmp`에 캐시한다. EfficientNet은 기존 `jiwoonkim00/personal-color-classifier`의 `personal_color_korean_tuned_v2.pt`를 사용한다.

서버 설정은 OpenAI/FAL/OpenWeather/Naver 키와 Firebase 공개 키, 다음 항목을 포함한다.

- `REQUIRE_FIREBASE_AUTH=true`
- `REQUIRE_DEEP_PERSONAL_COLOR=true`
- `CLOSET_RECOMMENDATION_AI_ENABLED=true`
- `BISENET_CKPT_PATH=models/79999_iter.pth`
- `BIREFNET_MODEL_URL`, `BISENET_MODEL_URL`: 업로드된 원래 체크포인트의 HTTPS 주소

기존 모델을 실행하지 못하면 RandomForest 결과로 감추지 않고 오류를 반환한다. 키 파일과 실제 환경 변수 값은 GitHub에 올리지 않는다.

## 실제 확인한 결과와 남은 제한

- 원래 EfficientNet + MTCNN + BiSeNet 추론: Vercel HTTP 200, `analysis_method=efficientnet_b0_huggingface`
- 기존 OpenAI 아바타 생성: Vercel HTTP 200, 약 52초
- 옷 사진 배경 정리·실제 분류: Vercel HTTP 200, 약 17초
- 등록한 옷으로 코디 추천: Vercel HTTP 200, 상의·하의를 모두 포함하는 결과 검증
- 기존 FAL 피팅: Vercel HTTP 200, 약 27초, 결과 이미지 확인
- 실제 날씨: Vercel HTTP 200, 비로그인 요청은 401
- 니트·청바지·코트의 실제 사진 분류 성공. 니트→청바지 순차 합성도 확인했다.
- 긴 코트를 추가하는 세 번째 피팅은 옷 길이나 기존 하의가 변형돼 품질 안정성이 확보되지 않았다. 실험 설정으로 모델을 바꾸지는 않았다.
- 네이버 쇼핑 검색 API는 2026-07-31 종료되어 실제 요청이 404다. 현재 쇼핑 추천은 명시적으로 수집된 실제 상품 카탈로그를 사용하며 가격·재고는 실시간이 아니다.
- 최종 아이패드의 본인 얼굴·직접 촬영한 옷·카메라 권한은 사용자 기기에서 확인해야 한다.

공식 종료 공지: https://developers.naver.com/notice/article/32564
