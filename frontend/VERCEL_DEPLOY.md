# Vercel 데모 배포

이 배포는 `MOCK_DEMO_MODE=true` 시연용 인증·아바타 흐름을 사용합니다.
**내 옷 코디 추천은 실제 OpenAI API를 호출**합니다. 웹에서는 동일 도메인의
`POST /api/recommend/closet` Vercel 서버 함수를 사용하므로 중단된 EC2 서버에 의존하지 않습니다.
Vercel Production 환경의 `OPENAI_API_KEY`가 필요하며, 브라우저 빌드에 키를 넣지 않습니다.
피팅룸의 내 옷장은 직접 등록한 옷만 표시하고, 쇼핑 위시 및 저장한 코디는 별도 목록으로 기기에 저장합니다.
저장한 코디는 아바타 화면에서 누르면 하단 미리보기 → 피팅하러가기 → 옷별 영역 보정 순서로 진행합니다.
`OPENAI_CLOSET_RECOMMENDATION_MODEL`은 선택 사항이며 기존 백엔드와 같은 모델을 기본으로 사용합니다.

PowerShell에서:

```powershell
cd frontend
.\prepare-vercel-demo.ps1
npx --yes vercel@latest .vercel-demo --prod
```

처음에는 Vercel 로그인을 진행하고 새 프로젝트를 연결합니다. Flutter 빌드 결과만
업로드하고 `frontend/api`의 추천 서버 함수를 함께 배포합니다. FastAPI 전체 소스와
`.env` 파일은 배포 폴더에 포함되지 않습니다.
이 방식은 로컬 빌드를 올리는 방식이며 Git push 자동 배포는 별도 설정이 필요합니다.

코드를 수정한 뒤 같은 명령을 실행하면 연결된 프로젝트에 다시 배포됩니다.
`.vercel-demo/.vercel`의 프로젝트 연결 정보를 유지하세요. 기존 URL을 계속 사용할 수 있습니다.

## 실제 기능으로 전환

- 백엔드를 HTTPS로 제공하고 프런트엔드의 API 주소를 해당 주소로 통일합니다.
- 백엔드 CORS에 Vercel 배포 도메인을 허용합니다.
- Firebase 웹 설정을 빌드에 전달하고 Firebase Auth 승인 도메인에 배포 도메인을 추가합니다.
- 웹 사진 업로드·옷장 저장·커뮤니티·가상 피팅을 실제 서버와 검증합니다.
- 데모 플래그를 제거한 빌드를 만들어 같은 Vercel 프로젝트로 배포합니다.

인증·아바타의 실제 서비스 전환 시 플래그와 Firebase 빌드 설정을
변경해야 합니다. OpenAI/FAL/Naver 비밀 키는 백엔드에만 설정합니다.
