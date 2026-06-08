# ChromaDB mini RAG Recommendation Evaluation

## Overall

- Test cases: 10
- Recommended items: 60
- ChromaDB RAG cases: 10 / 10
- Average case score: 37.2
- Average Precision@K: 0.55
- Cases below 0.8: 9
- Positive matched reasons: 112
- Avoid/penalty reasons: 8

## Low Precision Cases

| Case | Source | Precision@K | Relevant | Avg Score |
|---|---|---:|---:|---:|
| female spring_warm 스트레이트 여행 리조트 | `chroma_style_rag` | 0.0 | 0 / 6 | 38.5 |
| female spring_warm 스트레이트 데일리 미니멀 | `chroma_style_rag` | 0.5 | 3 / 6 | 31.5 |
| female spring_warm 스트레이트 데일리 내추럴 | `chroma_style_rag` | 0.5 | 3 / 6 | 35.2 |
| female spring_warm 스트레이트 데일리 캐주얼 | `chroma_style_rag` | 0.5 | 3 / 6 | 37.5 |
| female spring_warm 스트레이트 여행 내추럴 | `chroma_style_rag` | 0.5 | 3 / 6 | 39.7 |
| female spring_warm 스트레이트 여행 캐주얼 | `chroma_style_rag` | 0.5 | 3 / 6 | 40.3 |
| female spring_warm 스트레이트 데일리 시크 | `chroma_style_rag` | 0.67 | 4 / 6 | 35.3 |
| female spring_warm 스트레이트 여행 보헤미안 | `chroma_style_rag` | 0.67 | 4 / 6 | 35.7 |
| female spring_warm 스트레이트 데일리 러블리 | `chroma_style_rag` | 0.67 | 4 / 6 | 37.3 |

## Cases

### female spring_warm 스트레이트 데일리 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.5
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 22
- Avoid reasons: 8

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 60869 | 상의/셔츠 | 화이트 | 노멀 | 43 | False | 벡터유사도:21, 색상:브라운, 색상:화이트, 계절:셔츠, 룰셋:브라운 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 40 | True | 벡터유사도:22, 색상:브라운, 룰셋:코튼 팬츠, 룰셋:브라운, 룰셋:과하지 않은 와이드 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 40 | True | 벡터유사도:22, 색상:스카이 블루, 룰셋:코튼 팬츠, 룰셋:스카이 블루, 룰셋:과하지 않은 와이드 |
| 4 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 25 | True | 벡터유사도:22, 색상:브라운, 룰셋:브라운, 룰셋주의:워싱 강한 아이템 |
| 5 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 23 | False | 벡터유사도:22, 색상:브라운, 색상:화이트, 룰셋:브라운, 룰셋:화이트 |
| 6 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 18 | False | 벡터유사도:22, 색상:화이트, 룰셋:허니 베이지, 룰셋:화이트, 룰셋주의:허리선 없는 통짜 원피스 |

### female spring_warm 스트레이트 데일리 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 37.5
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 46 | True | 벡터유사도:22, 색상:스카이 블루, 룰셋:스카이 블루, 룰셋:자연스러운 와이드 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 46 | True | 벡터유사도:22, 색상:스카이 블루, 룰셋:스카이 블루, 룰셋:자연스러운 와이드 |
| 3 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 37 | False | 벡터유사도:22, 색상:오렌지 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 32 | False | 벡터유사도:22 |
| 5 | 296 | 원피스/드레스 | 네이비 | 타이트 | 32 | False | 벡터유사도:22 |
| 6 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22 |

### female spring_warm 스트레이트 데일리 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 40.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 18
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 51 | True | 벡터유사도:22, 색상:스카이 블루, 룰셋:코튼 팬츠, 룰셋:스카이 블루, 룰셋:자연스러운 와이드 |
| 2 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 50 | True | 벡터유사도:21, 색상:스카이 블루, 룰셋:코튼 팬츠, 룰셋:스카이 블루, 룰셋:자연스러운 와이드 |
| 3 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22 |
| 4 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 50 | True | 벡터유사도:21, 색상:스카이 블루, 룰셋:코튼 팬츠, 룰셋:스카이 블루, 룰셋:자연스러운 와이드 |
| 6 | 520062 | 하의/팬츠 | 레드 | 와이드 | 41 | True | 벡터유사도:22, 룰셋:코튼 팬츠, 룰셋:자연스러운 와이드, 룰셋:과하지 않은 와이드 |

### female spring_warm 스트레이트 데일리 러블리

- Source: `chroma_style_rag`
- Count: 6
- Average score: 37.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 505044 | 하의/스커트 | 베이지 | 노멀 | 47 | True | 벡터유사도:21, 룰셋:리본 블라우스, 룰셋:캉캉 스커트, 룰셋:플레어 라인 |
| 2 | 1162756 | 하의/스커트 | 블루 | 와이드 | 38 | True | 벡터유사도:22, 룰셋:캉캉 스커트 |
| 3 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 38 | False | 벡터유사도:22, 색상:오렌지, 룰셋:리본 블라우스 |
| 4 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 36 | False | 벡터유사도:22, 룰셋:플레어 라인 |
| 5 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22 |
| 6 | 219658 | 하의/스커트 | 골드 | 와이드 | 38 | True | 벡터유사도:22, 룰셋:캉캉 스커트 |

### female spring_warm 스트레이트 데일리 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 10
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 296 | 원피스/드레스 | 네이비 | 타이트 | 37 | False | 벡터유사도:22, 색상:네이비, 룰셋:네이비 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 37 | True | 벡터유사도:22, 색상:카키, 룰셋:카키 |
| 3 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 37 | True | 벡터유사도:22, 색상:브라운, 룰셋:브라운 |
| 4 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 37 | True | 벡터유사도:22, 색상:브라운, 룰셋:브라운 |
| 5 | 80007 | 원피스/드레스 | 베이지 | 노멀 | 32 | False | 벡터유사도:22, 룰셋:허니 베이지 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22, 룰셋:허니 베이지 |

### female spring_warm 스트레이트 데일리 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.2
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 46 | True | 벡터유사도:22, 색상:스카이 블루, 룰셋:스카이 블루, 룰셋:자연스러운 와이드 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 46 | True | 벡터유사도:22, 색상:스카이 블루, 룰셋:스카이 블루, 룰셋:자연스러운 와이드 |
| 3 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 33 | False | 벡터유사도:22, 룰셋:카라 니트 |
| 4 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 32 | False | 벡터유사도:22, 색상:오렌지 |
| 5 | 296 | 원피스/드레스 | 네이비 | 타이트 | 27 | False | 벡터유사도:22 |
| 6 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22 |

### female spring_warm 스트레이트 여행 리조트

- Source: `chroma_style_rag`
- Count: 6
- Average score: 38.5
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 46 | False | 벡터유사도:23, 색상:오렌지, 색상:네이비, 룰셋:네이비 |
| 2 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 41 | False | 벡터유사도:23, 색상:오렌지, 룰셋:오션 블루 |
| 3 | 86973 | 원피스/드레스 | 브라운 | 타이트 | 36 | False | 벡터유사도:23, 룰셋:세이지 그린 |
| 4 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 36 | False | 벡터유사도:23, 룰셋:오션 블루 |
| 5 | 84869 | 원피스/드레스 | 블루 | 노멀 | 36 | False | 벡터유사도:23, 룰셋:오션 블루 |
| 6 | 535619 | 원피스/드레스 | 민트 | 노멀 | 36 | False | 벡터유사도:23, 룰셋:웜 민트 |

### female spring_warm 스트레이트 여행 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 40.3
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 11
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 47 | False | 벡터유사도:22, 색상:오렌지, 색상:네이비, 룰셋:네이비 |
| 2 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 42 | False | 벡터유사도:22, 색상:오렌지, 색상:네이비, 룰셋:네이비 |
| 3 | 1083499 | 하의/팬츠 | 블루 | 노멀 | 37 | True | 벡터유사도:22, 룰셋:오션 블루 |
| 4 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 룰셋:오션 블루 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 룰셋:오션 블루 |
| 6 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 42 | False | 벡터유사도:22, 색상:오렌지, 룰셋:오션 블루 |

### female spring_warm 스트레이트 여행 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 39.7
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 47 | False | 벡터유사도:22, 색상:오렌지, 색상:네이비, 룰셋:네이비 |
| 2 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 42 | False | 벡터유사도:22, 색상:오렌지, 룰셋:오션 블루 |
| 3 | 505044 | 하의/스커트 | 베이지 | 노멀 | 38 | True | 벡터유사도:22, 룰셋:롱 스커트 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 룰셋:오션 블루 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 룰셋:오션 블루 |
| 6 | 86973 | 원피스/드레스 | 브라운 | 타이트 | 37 | False | 벡터유사도:22, 룰셋:세이지 그린 |

### female spring_warm 스트레이트 여행 보헤미안

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.7
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 10
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 42 | False | 벡터유사도:22, 색상:오렌지, 색상:네이비, 룰셋:네이비 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 38 | True | 벡터유사도:22, 룰셋:로우라이즈 팬츠, 룰셋:코발트 블루 |
| 3 | 1083499 | 하의/팬츠 | 블루 | 노멀 | 38 | True | 벡터유사도:22, 룰셋:로우라이즈 팬츠, 룰셋:코발트 블루 |
| 4 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 37 | False | 벡터유사도:22, 색상:오렌지, 룰셋:코발트 블루 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 룰셋:코발트 블루 |
| 6 | 74368 | 아우터/재킷 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
