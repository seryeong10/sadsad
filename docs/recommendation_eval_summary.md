# ChromaDB mini RAG Recommendation Evaluation

## Overall

- Test cases: 6
- Recommended items: 36
- ChromaDB RAG cases: 6 / 6
- Average case score: 30.0
- Average Precision@K: 0.83
- Positive matched reasons: 19
- Avoid/penalty reasons: 0

## Cases

### 봄웜 스트레이트 데일리 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 37 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 60869 | 상의/셔츠 | 화이트 | 노멀 | 36 | True | 벡터유사도:22, 계절:셔츠 |
| 3 | 22928 | 하의/청바지 | 블루 | 와이드 | 32 | True | 벡터유사도:22 |
| 4 | 1159618 | 원피스/드레스 | 골드 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22 |
| 6 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 32 | True | 벡터유사도:22 |

### 봄웜 웨이브 데이트 러블리

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 계절:가디건 |
| 2 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 3 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 296 | 원피스/드레스 | 네이비 | 타이트 | 32 | True | 벡터유사도:22 |
| 5 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22 |

### 여쿨 웨이브 출근 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### 가을웜 내추럴 여행 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76427 | 원피스/드레스 | 브라운 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 7597 | 원피스/드레스 | 브라운 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 505044 | 하의/스커트 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 27246 | 상의/티셔츠 | 그레이 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 69329 | 하의/스커트 | 오렌지 | 벨보텀 | 32 | True | 벡터유사도:22 |

### 겨쿨 스트레이트 파티 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |

### 가을웜 스트레이트 하객 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 29 | True | 벡터유사도:21 |
| 2 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 21 | False | 벡터유사도:21 |
