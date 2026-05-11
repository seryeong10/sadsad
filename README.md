# A-VATA

Flutter + FastAPI 기반 아바타 얼굴 교체 MVP입니다. 사용자가 성별과 정면 사진을 선택하면, Flutter 앱이 기본 전신 아바타와 사용자 얼굴 사진을 FastAPI 서버로 전송하고 OpenAI Images edit API 결과를 앱에서 표시합니다.

## 프로젝트 구조

- `backend/`: FastAPI 서버. `/generate-avatar` 엔드포인트에서 기본 아바타 이미지와 사용자 얼굴 이미지를 받아 OpenAI 이미지 편집 API로 전달합니다.
- `backend/assets/`: 백엔드에서 참고할 수 있는 기본 아바타 PNG 보관 위치입니다.
- `frontend/`: Flutter 앱. 성별 선택, 사진 업로드, 아바타 생성 결과, 무드 선택, 추천 결과 화면을 포함합니다.
- `frontend/assets/avatars/`: Flutter 앱에서 전송하는 기본 아바타 에셋입니다.
- `frontend/lib/pages/`: Flutter 화면 단위 코드입니다.
- `frontend/lib/services/`: 백엔드 API 통신처럼 화면 밖 기능을 담당하는 코드입니다.
- `frontend/lib/widgets/`: 버튼, 하단 탭, 아바타 이미지 표시처럼 여러 화면에서 쓰는 공통 UI입니다.
- `docs/styleai/`: 기획서 DOCX/PDF와 문서 다듬기 작업 파일입니다.

## 주요 흐름

1. 앱에서 성별을 선택합니다.
2. 갤러리 또는 카메라로 정면 사진을 업로드합니다.
3. 앱이 선택한 성별에 맞는 기본 아바타 에셋과 사용자 사진을 `/generate-avatar`로 전송합니다.
4. 서버가 OpenAI Images edit API로 얼굴과 헤어 영역만 편집하도록 요청합니다.
5. 서버가 반환한 base64 PNG 이미지를 생성 완료 화면에 표시합니다.
6. 사용자가 `다음`을 누르면 사진 업로드 화면으로 다시 이동하고, 다시 생성한 아바타를 앱의 Avatar 탭 화면에 표시합니다.

## 기본 아바타 이미지

현재 Flutter 앱에서 사용하는 파일명은 아래와 같습니다.

- `frontend/assets/avatars/male_base.png`
- `frontend/assets/avatars/female_base.png`

같은 이미지를 백엔드 보관용으로 둘 경우 아래 위치를 사용합니다.

- `backend/assets/default_male.png`
- `backend/assets/default_female.png`

Flutter 에셋을 바꾸면 `frontend/pubspec.yaml`의 `assets` 항목도 함께 확인하세요.

## 백엔드 실행

```bash
cd backend
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
cp .env.example .env
```

`.env` 또는 셸 환경에 `OPENAI_API_KEY`를 설정한 뒤 실행합니다.

```bash
export OPENAI_API_KEY="sk-..."
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

현재 백엔드는 다음 환경변수를 사용합니다.

- `OPENAI_API_KEY`: OpenAI API 키
- `OPENAI_IMAGE_MODEL`: 이미지 편집 모델, 기본값 `gpt-image-1.5`
- `OPENAI_IMAGE_SIZE`: 생성 이미지 크기, 기본값 `1024x1536`
- `OPENAI_IMAGE_QUALITY`: 이미지 품질, 기본값 `medium`
- `OPENAI_IMAGE_BACKGROUND`: 배경 처리, 기본값 `transparent`

## Flutter 실행

```bash
cd frontend
flutter pub get
flutter run
```

현재 앱의 API 주소는 `frontend/lib/services/avatar_api_service.dart`에 `http://10.0.2.2:8000/generate-avatar`로 설정되어 있습니다. Android 에뮬레이터에서 로컬 백엔드를 호출할 때 사용하는 주소입니다.

iOS 시뮬레이터, 데스크톱, 웹에서 실행하려면 같은 파일의 URL을 실행 환경에 맞게 바꾸세요.

- iOS 시뮬레이터/데스크톱: `http://127.0.0.1:8000/generate-avatar`
- Android 에뮬레이터: `http://10.0.2.2:8000/generate-avatar`
- 실제 기기: 같은 네트워크에 있는 개발 머신의 IP 주소 사용

## API

### `POST /generate-avatar`

`multipart/form-data`로 두 파일을 전송합니다.

- `base_avatar`: 기본 전신 아바타 PNG
- `user_face`: 사용자 정면 얼굴 사진

응답은 data URL 형태의 PNG 문자열입니다.

```json
{
  "image": "data:image/png;base64,..."
}
```

서버는 결과 이미지의 가장자리에서 밝은 단색 배경을 탐색해 투명 처리한 뒤 반환합니다.
