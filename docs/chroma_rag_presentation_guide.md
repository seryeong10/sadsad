# ChromaDB mini RAG 발표 가이드

## 한 줄 설명

A-VATA 추천 기능은 ChromaDB 기반 mini RAG로 사용자 조건과 유사한 의류 후보를 검색한 뒤, 퍼스널컬러와 골격 유형별 규칙 점수로 재정렬한다.

## 발표 흐름

1. 기존 추천 한계

   룰 기반 추천만 사용하면 색상, 핏, 소재, 상황, 무드의 전체적인 유사도를 함께 보기 어렵다.

2. RAG 적용 구조

   K-Fashion 의류 데이터를 설명 문장으로 변환하고 OpenAI 임베딩을 생성해 ChromaDB에 저장한다. 사용자 조건도 문장으로 변환해 ChromaDB에서 유사 의류 후보를 검색한다.

3. 퍼스널컬러/골격 재정렬

   검색된 후보를 그대로 반환하지 않고, 퍼스널컬러 추천 색상과 골격별 추천 핏/소재/아이템 기준으로 다시 점수화한다. 피해야 할 색상이나 핏은 감점한다.

4. 평가와 튜닝

   대표 6개 케이스를 만들어 추천 결과를 확인하고, 부적합 핏과 잘못된 키워드 매칭을 보정했다. 이후 퍼스널컬러와 골격 룰을 약식 정답셋으로 구성해 Precision@K를 계산했다.

## 코드에서 보여줄 부분

### 1. 의류 데이터를 ChromaDB에 저장

파일: `backend/app/vector_style_store.py`

- `build_chroma_store()`: CSV 행을 읽고 의류 설명 문장, 메타데이터, 임베딩을 ChromaDB에 저장
- `build_item_document()`: 스타일, 아이템, 색상, 핏, 소재, 상황, 무드를 하나의 설명 문장으로 변환

### 2. 사용자 조건으로 벡터 검색

파일: `backend/app/vector_style_store.py`

- `build_query_document()`: 퍼스널컬러, 골격, 상황, 무드, 추천/비추천 기준을 검색 문장으로 변환
- `search_style_items()`: 검색 문장을 임베딩한 뒤 ChromaDB에서 유사 의류 후보 검색

### 3. API에 RAG 추천 연결

파일: `backend/app/main.py`

- `/recommend-outfits`: ChromaDB 추천을 먼저 시도하고 실패하면 기존 추천으로 fallback
- `_recommend_chroma_outfits()`: 검색 후보를 점수화하고 상위 추천을 선택

### 4. 퍼스널컬러/골격 점수화

파일: `backend/app/main.py`

- `_score_chroma_item()`: 벡터 유사도, 퍼스널컬러 색상 점수, 골격 점수, 계절 점수를 합산
- `_skeleton_fit_penalties()`: 체형별로 피해야 할 핏을 추가 감점

### 5. 평가 스크립트

파일: `backend/app/evaluate_recommendations.py`

- 대표 6개 테스트 케이스 실행
- 추천 소스, 평균 점수, 긍정 이유 개수, 감점 이유 개수 출력
- 퍼스널컬러/골격 룰 기반 약식 정답셋으로 Precision@K 계산
- JSON과 Markdown 평가 결과 저장

## 정답셋 평가 방식

이번 구현에서는 별도의 사용자 라벨링 데이터가 없기 때문에, 퍼스널컬러와 골격 유형별 추천 규칙을 약식 정답셋으로 사용했다.

- 퍼스널컬러 기준: 추천 색상, 피해야 할 색상
- 골격 기준: 추천 핏, 추천 아이템, 추천 소재, 피해야 할 요소
- 상황/무드 기준: 추천 결과의 상황 태그와 무드 태그

각 추천 아이템이 위 기준 중 하나 이상을 만족하고, 피해야 할 색상/골격 요소에 걸리지 않으면 relevant로 판단한다. 이후 상위 K개 추천 중 relevant인 비율을 Precision@K로 계산한다.

현재 대표 6개 케이스 기준 결과:

- ChromaDB RAG cases: 6 / 6
- Average Precision@K: 0.83
- 평가 결과 파일: `docs/recommendation_eval_summary.md`

주의: 이 평가는 전문가가 직접 라벨링한 정답셋이 아니라, 프로젝트 내부 스타일 룰을 기준으로 한 약식 정량 평가다. 향후에는 사용자 피드백이나 전문가 라벨링을 추가해 더 엄밀하게 평가할 수 있다.

## 실행 명령

### ChromaDB 인덱스 생성

```bash
cd /Users/seryeong/capstone
source backend/.venv/bin/activate
python3 backend/app/build_chroma_store.py --reset
```

### 추천 평가 실행

```bash
python3 backend/app/evaluate_recommendations.py \
  --output backend/data/recommendation_eval_latest.json \
  --summary-output docs/recommendation_eval_summary.md
```

### API에서 확인

```bash
curl "http://127.0.0.1:8000/recommend-outfits?situation=데일리&style=캐주얼&gender=female&personal_color=spring_warm&skeleton_type=스트레이트&limit=6"
```

응답에서 `source`가 `chroma_style_rag`이면 ChromaDB 기반 RAG 추천이 사용된 것이다.

## 발표 문장

현재 추천 시스템은 K-Fashion 의류 메타데이터를 설명 문장으로 변환하고 OpenAI 임베딩을 생성해 ChromaDB에 저장합니다. 사용자의 퍼스널컬러, 골격, 상황, 무드를 검색 쿼리로 변환해 유사 의류 후보를 검색한 뒤, 퍼스널컬러 색상 적합도와 골격별 핏/소재 적합도 점수로 재정렬합니다. 또한 대표 6개 케이스에 대해 퍼스널컬러와 골격 룰 기반 약식 정답셋을 구성하고 Precision@K를 계산해 추천 적합도를 확인했습니다.

## 향후 고도화

- 사용자 좋아요/저장 데이터를 반영한 개인 취향 벡터 추가
- 색상, 핏, 소재 태그 정규화
- 부적합 아이템 필터링 강화
- 추천 결과에 대한 사용자 피드백 기반 가중치 조정
- 정답셋 기반 Precision@K, Recall@K 평가
