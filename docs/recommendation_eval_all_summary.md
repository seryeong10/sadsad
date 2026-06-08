# ChromaDB mini RAG Recommendation Evaluation

## Overall

- Test cases: 1008
- Recommended items: 6046
- ChromaDB RAG cases: 1008 / 1008
- Average case score: 29.2
- Average Precision@K: 0.83
- Cases below 0.8: 270
- Positive matched reasons: 4186
- Avoid/penalty reasons: 4

## Low Precision Cases

| Case | Source | Precision@K | Relevant | Avg Score |
|---|---|---:|---:|---:|
| female spring_warm 웨이브 운동/활동 액티브 | `chroma_style_rag` | 0.0 | 0 / 6 | 21.0 |
| male spring_warm 웨이브 운동/활동 고프코어 | `chroma_style_rag` | 0.0 | 0 / 6 | 21.2 |
| female spring_warm 웨이브 하객룩 단아한 | `chroma_style_rag` | 0.0 | 0 / 6 | 21.3 |
| male spring_warm 내추럴 운동/활동 고프코어 | `chroma_style_rag` | 0.0 | 0 / 6 | 21.5 |
| male spring_warm 내추럴 파티/모임 트렌디 | `chroma_style_rag` | 0.0 | 0 / 6 | 21.5 |
| male spring_warm 내추럴 파티/모임 세미포멀 | `chroma_style_rag` | 0.0 | 0 / 6 | 21.5 |
| female spring_warm 웨이브 하객룩 세미포멀 | `chroma_style_rag` | 0.0 | 0 / 6 | 21.7 |
| male spring_warm 웨이브 하객룩 포멀 | `chroma_style_rag` | 0.0 | 0 / 6 | 21.7 |
| male spring_warm 웨이브 운동/활동 애슬레저 | `chroma_style_rag` | 0.0 | 0 / 6 | 21.7 |
| male spring_warm 웨이브 운동/활동 액티브 | `chroma_style_rag` | 0.0 | 0 / 6 | 21.7 |
| male spring_warm 웨이브 파티/모임 트렌디 | `chroma_style_rag` | 0.0 | 0 / 6 | 21.7 |
| male spring_warm 내추럴 운동/활동 애슬레저 | `chroma_style_rag` | 0.0 | 0 / 6 | 21.7 |
| male spring_warm 내추럴 파티/모임 댄디 | `chroma_style_rag` | 0.0 | 0 / 6 | 21.7 |
| male spring_warm 내추럴 하객룩 세미포멀 | `chroma_style_rag` | 0.0 | 0 / 6 | 21.8 |
| female spring_warm 웨이브 파티/모임 시크 | `chroma_style_rag` | 0.0 | 0 / 6 | 22.0 |
| male spring_warm 스트레이트 출근/면접 포멀 | `chroma_style_rag` | 0.0 | 0 / 6 | 22.0 |
| male spring_warm 스트레이트 출근/면접 클래식 | `chroma_style_rag` | 0.0 | 0 / 6 | 22.0 |
| male spring_warm 스트레이트 출근/면접 댄디 | `chroma_style_rag` | 0.0 | 0 / 6 | 22.0 |
| male spring_warm 스트레이트 출근/면접 스마트 캐주얼 | `chroma_style_rag` | 0.0 | 0 / 6 | 22.0 |
| male spring_warm 스트레이트 하객룩 클래식 | `chroma_style_rag` | 0.0 | 0 / 6 | 22.0 |
| male spring_warm 스트레이트 하객룩 포멀 | `chroma_style_rag` | 0.0 | 0 / 6 | 22.0 |
| male spring_warm 스트레이트 하객룩 댄디 | `chroma_style_rag` | 0.0 | 0 / 6 | 22.0 |
| male spring_warm 스트레이트 하객룩 세미포멀 | `chroma_style_rag` | 0.0 | 0 / 6 | 22.0 |
| male spring_warm 스트레이트 운동/활동 애슬레저 | `chroma_style_rag` | 0.0 | 0 / 6 | 22.0 |
| male spring_warm 스트레이트 운동/활동 액티브 | `chroma_style_rag` | 0.0 | 0 / 6 | 22.0 |
| male spring_warm 스트레이트 운동/활동 고프코어 | `chroma_style_rag` | 0.0 | 0 / 6 | 22.0 |
| male spring_warm 스트레이트 파티/모임 댄디 | `chroma_style_rag` | 0.0 | 0 / 6 | 22.0 |
| male spring_warm 스트레이트 파티/모임 트렌디 | `chroma_style_rag` | 0.0 | 0 / 6 | 22.0 |
| male spring_warm 스트레이트 파티/모임 세미포멀 | `chroma_style_rag` | 0.0 | 0 / 6 | 22.0 |
| male spring_warm 웨이브 하객룩 댄디 | `chroma_style_rag` | 0.0 | 0 / 6 | 22.0 |

## Cases

### female spring_warm 스트레이트 데일리 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 920572 | 상의/셔츠 | 레드 | 노멀 | 36 | True | 벡터유사도:22, 계절:셔츠 |
| 2 | 60869 | 상의/셔츠 | 화이트 | 노멀 | 36 | True | 벡터유사도:22, 계절:셔츠 |
| 3 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 32 | True | 벡터유사도:22 |
| 5 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 6 | 296 | 원피스/드레스 | 네이비 | 타이트 | 27 | True | 벡터유사도:22 |

### female spring_warm 스트레이트 데일리 캐주얼

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
| 3 | 219658 | 하의/스커트 | 골드 | 와이드 | 32 | True | 벡터유사도:22 |
| 4 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 32 | True | 벡터유사도:22 |
| 6 | 1159618 | 원피스/드레스 | 골드 | 노멀 | 32 | True | 벡터유사도:22 |

### female spring_warm 스트레이트 데일리 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 27 | True | 벡터유사도:22 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 4 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22 |
| 5 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female spring_warm 스트레이트 데일리 러블리

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 2 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 3 | 1162756 | 하의/스커트 | 블루 | 와이드 | 32 | True | 벡터유사도:22 |
| 4 | 521648 | 상의/니트웨어 | 오렌지 | 타이트 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 5 | 219658 | 하의/스커트 | 골드 | 와이드 | 32 | True | 벡터유사도:22 |
| 6 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |

### female spring_warm 스트레이트 데일리 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 1083499 | 하의/팬츠 | 블루 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 27 | True | 벡터유사도:22 |
| 5 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22 |
| 6 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |

### female spring_warm 스트레이트 데일리 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 32 | True | 벡터유사도:22 |
| 3 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21 |
| 6 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22 |

### female spring_warm 스트레이트 여행 리조트

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 36 | True | 벡터유사도:23, 색상:오렌지 |
| 2 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 36 | True | 벡터유사도:23, 색상:오렌지 |
| 3 | 86973 | 원피스/드레스 | 브라운 | 타이트 | 31 | True | 벡터유사도:23 |
| 4 | 536150 | 원피스/드레스 | 베이지 | 노멀 | 31 | True | 벡터유사도:23 |
| 5 | 97911 | 원피스/드레스 | 레드 | 타이트 | 31 | True | 벡터유사도:23 |
| 6 | 97884 | 원피스/드레스 | 블루 | 타이트 | 31 | True | 벡터유사도:23 |

### female spring_warm 스트레이트 여행 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 37 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 37 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22 |
| 4 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |

### female spring_warm 스트레이트 여행 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 37 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 37 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 1083499 | 하의/팬츠 | 블루 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 536323 | 원피스/드레스 | 핑크 | 노멀 | 32 | True | 벡터유사도:22 |

### female spring_warm 스트레이트 여행 보헤미안

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 88397 | 하의/스커트 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 5 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 514904 | 상의/니트웨어 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female spring_warm 스트레이트 여행 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 33 | True | 벡터유사도:23, 색상:오렌지 |
| 2 | 81956 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22 |
| 3 | 112153 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |

### female spring_warm 스트레이트 여행 포토제닉

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 4 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 536150 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female spring_warm 스트레이트 데이트 러블리

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 11746 | 원피스/드레스 | 그린 | 노멀 | 32 | True | 벡터유사도:22 |
| 2 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 3 | 1162756 | 하의/스커트 | 블루 | 와이드 | 32 | True | 벡터유사도:22 |
| 4 | 219658 | 하의/스커트 | 골드 | 와이드 | 32 | True | 벡터유사도:22 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |

### female spring_warm 스트레이트 데이트 페미닌

- Source: `chroma_style_rag`
- Count: 6
- Average score: 36.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 510906 | 상의/셔츠 | 화이트 | 노멀 | 39 | True | 벡터유사도:22, 계절:셔츠 |
| 2 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 37 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 37 | True | 벡터유사도:22, 색상:오렌지 |
| 4 | 505044 | 하의/스커트 | 베이지 | 노멀 | 35 | True | 벡터유사도:22 |
| 5 | 88397 | 하의/스커트 | 베이지 | 노멀 | 35 | True | 벡터유사도:22 |
| 6 | 27246 | 상의/티셔츠 | 그레이 | 노멀 | 35 | True | 벡터유사도:22 |

### female spring_warm 스트레이트 데이트 로맨틱

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 37 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 37 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 30 | True | 벡터유사도:22 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 1083499 | 하의/팬츠 | 블루 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 219658 | 하의/스커트 | 골드 | 와이드 | 27 | True | 벡터유사도:22 |

### female spring_warm 스트레이트 데이트 청순

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 82058 | 상의/셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:22, 계절:셔츠 |
| 4 | 122430 | 상의/셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:22, 계절:셔츠 |
| 5 | 506307 | 하의/스커트 | 레드 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 27 | True | 벡터유사도:22 |

### female spring_warm 스트레이트 데이트 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 506307 | 하의/스커트 | 레드 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 19327 | 하의/팬츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female spring_warm 스트레이트 데이트 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 122430 | 상의/셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:22, 계절:셔츠 |
| 4 | 82058 | 상의/셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:22, 계절:셔츠 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 27 | True | 벡터유사도:22 |

### female spring_warm 스트레이트 출근/면접 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.8
- Precision@K: 0.17 (1 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 920572 | 상의/셔츠 | 레드 | 노멀 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 3 | 60869 | 상의/셔츠 | 화이트 | 노멀 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 4 | 501339 | 하의/청바지 | 네이비 | 와이드 | 22 | False | 벡터유사도:22 |
| 5 | 219658 | 하의/스커트 | 골드 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female spring_warm 스트레이트 출근/면접 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.2
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 82058 | 상의/셔츠 | 화이트 | 노멀 | 30 | True | 벡터유사도:21, 계절:셔츠 |
| 2 | 60869 | 상의/셔츠 | 화이트 | 노멀 | 30 | True | 벡터유사도:21, 계절:셔츠 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 4 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 5 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 22 | False | 벡터유사도:22 |

### female spring_warm 스트레이트 출근/면접 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.5
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 3 | 920572 | 상의/셔츠 | 레드 | 노멀 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 4 | 60869 | 상의/셔츠 | 화이트 | 노멀 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 5 | 219658 | 하의/스커트 | 골드 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |

### female spring_warm 스트레이트 출근/면접 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.0
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 29 | True | 벡터유사도:22, 계절:셔츠 |
| 2 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 920572 | 상의/셔츠 | 레드 | 노멀 | 26 | False | 벡터유사도:22, 계절:셔츠 |
| 4 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 24 | True | 벡터유사도:21 |
| 5 | 11746 | 원피스/드레스 | 그린 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 22928 | 하의/청바지 | 블루 | 와이드 | 22 | False | 벡터유사도:22 |

### female spring_warm 스트레이트 출근/면접 단정한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.5
- Precision@K: 0.17 (1 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 920572 | 상의/셔츠 | 레드 | 노멀 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 3 | 60869 | 상의/셔츠 | 화이트 | 노멀 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 4 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 22928 | 하의/청바지 | 블루 | 와이드 | 21 | False | 벡터유사도:21 |
| 6 | 1041004 | 하의/청바지 | 블루 | 벨보텀 | 21 | False | 벡터유사도:21 |

### female spring_warm 스트레이트 출근/면접 소프트 오피스

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.7
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 22 | False | 벡터유사도:22 |
| 5 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 22 | False | 벡터유사도:22 |
| 6 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |

### female spring_warm 스트레이트 하객룩 우아한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.7
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 22 | False | 벡터유사도:22 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 31 | True | 벡터유사도:21, 색상:오렌지 |

### female spring_warm 스트레이트 하객룩 페미닌

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 510906 | 상의/셔츠 | 화이트 | 노멀 | 34 | True | 벡터유사도:22, 계절:셔츠 |
| 2 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 31 | True | 벡터유사도:21, 색상:오렌지 |
| 4 | 505044 | 하의/스커트 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |
| 5 | 27246 | 상의/티셔츠 | 그레이 | 노멀 | 30 | True | 벡터유사도:22 |
| 6 | 219658 | 하의/스커트 | 골드 | 와이드 | 30 | True | 벡터유사도:22 |

### female spring_warm 스트레이트 하객룩 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.0
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 30 | True | 벡터유사도:22 |
| 2 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 22 | False | 벡터유사도:22 |

### female spring_warm 스트레이트 하객룩 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.8
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 29 | True | 벡터유사도:22, 계절:셔츠 |
| 2 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 4 | 99214 | 하의/팬츠 | 화이트 | 와이드 | 25 | True | 벡터유사도:22 |
| 5 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 25 | True | 벡터유사도:22 |
| 6 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 22 | False | 벡터유사도:22 |

### female spring_warm 스트레이트 하객룩 단아한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.5
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 3 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 22 | False | 벡터유사도:22 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |

### female spring_warm 스트레이트 하객룩 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.5
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 3 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 22 | False | 벡터유사도:22 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 5 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |

### female spring_warm 스트레이트 운동/활동 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.5
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 36555 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 2 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 27 | True | 벡터유사도:22 |
| 3 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 4 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 520062 | 하의/팬츠 | 레드 | 와이드 | 22 | False | 벡터유사도:22 |

### female spring_warm 스트레이트 운동/활동 애슬레저

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.7
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 120140 | 상의/티셔츠 | 그레이 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 36555 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 19327 | 하의/팬츠 | 카키 | 노멀 | 22 | False | 벡터유사도:22 |

### female spring_warm 스트레이트 운동/활동 액티브

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.8
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 2 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 3 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 22 | False | 벡터유사도:22 |
| 4 | 520062 | 하의/팬츠 | 레드 | 와이드 | 21 | False | 벡터유사도:21 |
| 5 | 120140 | 상의/티셔츠 | 그레이 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 1083499 | 하의/팬츠 | 블루 | 노멀 | 21 | False | 벡터유사도:21 |

### female spring_warm 스트레이트 운동/활동 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 520010 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 1083499 | 하의/팬츠 | 블루 | 노멀 | 27 | True | 벡터유사도:22 |

### female spring_warm 스트레이트 운동/활동 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 37991 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 36547 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 506307 | 하의/스커트 | 레드 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 535619 | 원피스/드레스 | 민트 | 노멀 | 27 | True | 벡터유사도:22 |

### female spring_warm 스트레이트 운동/활동 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.8
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 2 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 3 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 22 | False | 벡터유사도:22 |
| 4 | 539812 | 상의/티셔츠 | 화이트 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 21 | False | 벡터유사도:21 |
| 6 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 21 | False | 벡터유사도:21 |

### female spring_warm 스트레이트 파티/모임 글램

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.7
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 5 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 22 | False | 벡터유사도:22 |
| 6 | 219658 | 하의/스커트 | 골드 | 와이드 | 22 | False | 벡터유사도:22 |

### female spring_warm 스트레이트 파티/모임 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.7
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 4 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 22 | False | 벡터유사도:22 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |

### female spring_warm 스트레이트 파티/모임 트렌디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.7
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 5 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 22 | False | 벡터유사도:22 |
| 6 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |

### female spring_warm 스트레이트 파티/모임 로맨틱

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.8
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 25 | True | 벡터유사도:22 |
| 4 | 1083499 | 하의/팬츠 | 블루 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |

### female spring_warm 스트레이트 파티/모임 키치

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.0
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 30 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 4 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 5 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 22 | False | 벡터유사도:22 |
| 6 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 21 | False | 벡터유사도:21 |

### female spring_warm 스트레이트 파티/모임 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.7
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 22 | False | 벡터유사도:22 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 1083499 | 하의/팬츠 | 블루 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 505044 | 하의/스커트 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female spring_warm 웨이브 데일리 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 521251 | 하의/팬츠 | 오렌지 | 와이드 | 37 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 3 | 296 | 원피스/드레스 | 네이비 | 타이트 | 27 | True | 벡터유사도:22 |
| 4 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 26 | True | 벡터유사도:21 |
| 6 | 19327 | 하의/팬츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22 |

### female spring_warm 웨이브 데일리 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 37 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22 |
| 4 | 87522 | 하의/팬츠 | 카키 | 와이드 | 32 | True | 벡터유사도:22 |
| 5 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 32 | True | 벡터유사도:22 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 31 | True | 벡터유사도:21 |

### female spring_warm 웨이브 데일리 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 31 | True | 벡터유사도:21, 색상:오렌지 |
| 2 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 296 | 원피스/드레스 | 네이비 | 타이트 | 27 | True | 벡터유사도:22 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 5 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 26 | True | 벡터유사도:21 |
| 6 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 26 | True | 벡터유사도:21 |

### female spring_warm 웨이브 데일리 러블리

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 2 | 296 | 원피스/드레스 | 네이비 | 타이트 | 32 | True | 벡터유사도:22 |
| 3 | 1162756 | 하의/스커트 | 블루 | 와이드 | 32 | True | 벡터유사도:22 |
| 4 | 505044 | 하의/스커트 | 베이지 | 노멀 | 31 | True | 벡터유사도:21 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 31 | True | 벡터유사도:21 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 31 | True | 벡터유사도:21 |

### female spring_warm 웨이브 데일리 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 31 | True | 벡터유사도:21 |
| 2 | 521251 | 하의/팬츠 | 오렌지 | 와이드 | 31 | True | 벡터유사도:21, 색상:오렌지 |
| 3 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 5 | 1083499 | 하의/팬츠 | 블루 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 517744 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |

### female spring_warm 웨이브 데일리 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 521251 | 하의/팬츠 | 오렌지 | 와이드 | 36 | True | 벡터유사도:21, 색상:오렌지 |
| 2 | 1083499 | 하의/팬츠 | 블루 | 노멀 | 32 | True | 벡터유사도:22 |
| 3 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 31 | True | 벡터유사도:21, 색상:오렌지 |
| 5 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 26 | True | 벡터유사도:21 |
| 6 | 520062 | 하의/팬츠 | 레드 | 와이드 | 32 | True | 벡터유사도:22 |

### female spring_warm 웨이브 여행 리조트

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 36 | True | 벡터유사도:23, 색상:오렌지 |
| 2 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 36 | True | 벡터유사도:23, 색상:오렌지 |
| 3 | 80007 | 원피스/드레스 | 베이지 | 노멀 | 31 | True | 벡터유사도:23 |
| 4 | 536073 | 원피스/드레스 | 베이지 | 노멀 | 31 | True | 벡터유사도:23 |
| 5 | 86973 | 원피스/드레스 | 브라운 | 타이트 | 31 | True | 벡터유사도:23 |
| 6 | 12340 | 원피스/드레스 | 베이지 | 노멀 | 31 | True | 벡터유사도:23 |

### female spring_warm 웨이브 여행 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 37 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 37 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 32 | True | 벡터유사도:22 |
| 4 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 536150 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 97884 | 원피스/드레스 | 블루 | 타이트 | 32 | True | 벡터유사도:22 |

### female spring_warm 웨이브 여행 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 37 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 37 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 4 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 32 | True | 벡터유사도:22 |
| 5 | 535765 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 536073 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |

### female spring_warm 웨이브 여행 보헤미안

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 505044 | 하의/스커트 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 2 | 70089 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 80007 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 75776 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female spring_warm 웨이브 여행 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 2 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 4 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 84869 | 원피스/드레스 | 블루 | 노멀 | 27 | True | 벡터유사도:22 |

### female spring_warm 웨이브 여행 포토제닉

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 4 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 27 | True | 벡터유사도:22 |
| 5 | 68688 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 70089 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female spring_warm 웨이브 데이트 러블리

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 계절:가디건 |
| 2 | 77580 | 하의/스커트 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 3 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 4 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |

### female spring_warm 웨이브 데이트 페미닌

- Source: `chroma_style_rag`
- Count: 6
- Average score: 36.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 510906 | 상의/셔츠 | 화이트 | 노멀 | 39 | True | 벡터유사도:22, 계절:셔츠 |
| 2 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 37 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 35 | True | 벡터유사도:22 |
| 4 | 76331 | 원피스/드레스 | 베이지 | 노멀 | 35 | True | 벡터유사도:22 |
| 5 | 91356 | 하의/스커트 | 화이트 | 와이드 | 35 | True | 벡터유사도:22 |
| 6 | 219658 | 하의/스커트 | 골드 | 와이드 | 35 | True | 벡터유사도:22 |

### female spring_warm 웨이브 데이트 로맨틱

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 624902 | 원피스/드레스 | 화이트 | 노멀 | 35 | True | 벡터유사도:22 |
| 2 | 120403 | 원피스/드레스 | 베이지 | 노멀 | 35 | True | 벡터유사도:22 |
| 3 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 34 | True | 벡터유사도:22, 계절:가디건 |
| 4 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 30 | True | 벡터유사도:22 |
| 5 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |

### female spring_warm 웨이브 데이트 청순

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 31 | True | 벡터유사도:21, 색상:오렌지 |
| 2 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 27 | True | 벡터유사도:22 |
| 3 | 535765 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 520062 | 하의/팬츠 | 레드 | 와이드 | 27 | True | 벡터유사도:22 |
| 5 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female spring_warm 웨이브 데이트 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22 |
| 3 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 31 | True | 벡터유사도:22, 계절:가디건 |
| 4 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 1162756 | 하의/스커트 | 블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |

### female spring_warm 웨이브 데이트 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 31 | True | 벡터유사도:22, 계절:가디건 |
| 3 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 535765 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 1162756 | 하의/스커트 | 블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 505044 | 하의/스커트 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female spring_warm 웨이브 출근/면접 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.2
- Precision@K: 0.17 (1 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 3 | 296 | 원피스/드레스 | 네이비 | 타이트 | 22 | False | 벡터유사도:22 |
| 4 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 21 | False | 벡터유사도:21 |
| 5 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 21 | False | 벡터유사도:21 |
| 6 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 21 | False | 벡터유사도:21 |

### female spring_warm 웨이브 출근/면접 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.0
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 3 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 4 | 296 | 원피스/드레스 | 네이비 | 타이트 | 22 | False | 벡터유사도:22 |
| 5 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 21 | False | 벡터유사도:21 |
| 6 | 1082517 | 하의/팬츠 | 네온 | 와이드 | 27 | True | 벡터유사도:22 |

### female spring_warm 웨이브 출근/면접 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.7
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 523354 | 하의/팬츠 | 화이트 | 와이드 | 29 | True | 벡터유사도:21 |
| 2 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 29 | True | 벡터유사도:21 |
| 3 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 4 | 296 | 원피스/드레스 | 네이비 | 타이트 | 22 | False | 벡터유사도:22 |
| 5 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 21 | False | 벡터유사도:21 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female spring_warm 웨이브 출근/면접 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.7
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 28 | True | 벡터유사도:21, 계절:셔츠 |
| 2 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 3 | 99214 | 하의/팬츠 | 화이트 | 와이드 | 25 | True | 벡터유사도:22 |
| 4 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 25 | True | 벡터유사도:22 |
| 5 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 22 | False | 벡터유사도:22 |
| 6 | 296 | 원피스/드레스 | 네이비 | 타이트 | 22 | False | 벡터유사도:22 |

### female spring_warm 웨이브 출근/면접 단정한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 21.8
- Precision@K: 0.17 (1 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 2 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 3 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 4 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 21 | False | 벡터유사도:21 |
| 5 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 21 | False | 벡터유사도:21 |

### female spring_warm 웨이브 출근/면접 소프트 오피스

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.5
- Precision@K: 0.17 (1 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 2 | 296 | 원피스/드레스 | 네이비 | 타이트 | 22 | False | 벡터유사도:22 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 5 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 21 | False | 벡터유사도:21 |
| 6 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female spring_warm 웨이브 하객룩 우아한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 31 | True | 벡터유사도:21, 색상:오렌지 |
| 2 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 31 | True | 벡터유사도:21, 색상:오렌지 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 5 | 535765 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 6 | 76427 | 원피스/드레스 | 브라운 | 노멀 | 26 | True | 벡터유사도:21 |

### female spring_warm 웨이브 하객룩 페미닌

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 31 | True | 벡터유사도:21, 색상:오렌지 |
| 2 | 296 | 원피스/드레스 | 네이비 | 타이트 | 30 | True | 벡터유사도:22 |
| 3 | 505044 | 하의/스커트 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |
| 4 | 219658 | 하의/스커트 | 골드 | 와이드 | 29 | True | 벡터유사도:21 |
| 5 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 29 | True | 벡터유사도:21 |
| 6 | 27246 | 상의/티셔츠 | 그레이 | 노멀 | 29 | True | 벡터유사도:21 |

### female spring_warm 웨이브 하객룩 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.7
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 30 | True | 벡터유사도:22 |
| 2 | 523354 | 하의/팬츠 | 화이트 | 와이드 | 30 | True | 벡터유사도:22 |
| 3 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 21 | False | 벡터유사도:21 |
| 6 | 523220 | 하의/팬츠 | 그레이 | 와이드 | 29 | True | 벡터유사도:21 |

### female spring_warm 웨이브 하객룩 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.5
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 99215 | 하의/팬츠 | 화이트 | 와이드 | 25 | True | 벡터유사도:22 |
| 2 | 99214 | 하의/팬츠 | 화이트 | 와이드 | 25 | True | 벡터유사도:22 |
| 3 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 296 | 원피스/드레스 | 네이비 | 타이트 | 22 | False | 벡터유사도:22 |
| 5 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 22 | False | 벡터유사도:22 |
| 6 | 120658 | 하의/팬츠 | 화이트 | 벨보텀 | 25 | True | 벡터유사도:22 |

### female spring_warm 웨이브 하객룩 단아한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 21.3
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 2 | 1082517 | 하의/팬츠 | 네온 | 와이드 | 22 | False | 벡터유사도:22 |
| 3 | 1159618 | 원피스/드레스 | 골드 | 노멀 | 21 | False | 벡터유사도:21 |
| 4 | 97884 | 원피스/드레스 | 블루 | 타이트 | 21 | False | 벡터유사도:21 |
| 5 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 21 | False | 벡터유사도:21 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female spring_warm 웨이브 하객룩 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 21.7
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 2 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 296 | 원피스/드레스 | 네이비 | 타이트 | 22 | False | 벡터유사도:22 |
| 5 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 21 | False | 벡터유사도:21 |

### female spring_warm 웨이브 운동/활동 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.2
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083725 | 하의/팬츠 | 오렌지 | 노멀 | 34 | True | 벡터유사도:21, 색상:오렌지 |
| 2 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 112153 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 5 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 535765 | 원피스/드레스 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female spring_warm 웨이브 운동/활동 애슬레저

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.7
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083725 | 하의/팬츠 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 2 | 69329 | 하의/스커트 | 오렌지 | 벨보텀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 3 | 80007 | 원피스/드레스 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 4 | 12340 | 원피스/드레스 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 539812 | 상의/티셔츠 | 화이트 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female spring_warm 웨이브 운동/활동 액티브

- Source: `chroma_style_rag`
- Count: 6
- Average score: 21.0
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 505044 | 하의/스커트 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 2 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 3 | 1082517 | 하의/팬츠 | 네온 | 와이드 | 21 | False | 벡터유사도:21 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 21 | False | 벡터유사도:21 |
| 5 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female spring_warm 웨이브 운동/활동 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 2 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22 |
| 3 | 1082517 | 하의/팬츠 | 네온 | 와이드 | 27 | True | 벡터유사도:22 |
| 4 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 6 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |

### female spring_warm 웨이브 운동/활동 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 2 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22 |
| 3 | 520062 | 하의/팬츠 | 레드 | 와이드 | 27 | True | 벡터유사도:22 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 26 | True | 벡터유사도:21 |
| 5 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female spring_warm 웨이브 운동/활동 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 21.8
- Precision@K: 0.17 (1 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 2 | 536073 | 원피스/드레스 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 21 | False | 벡터유사도:21 |
| 4 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 21 | False | 벡터유사도:21 |
| 5 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 21 | False | 벡터유사도:21 |

### female spring_warm 웨이브 파티/모임 글램

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.5
- Precision@K: 0.17 (1 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 2 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 296 | 원피스/드레스 | 네이비 | 타이트 | 22 | False | 벡터유사도:22 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 5 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female spring_warm 웨이브 파티/모임 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.0
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 296 | 원피스/드레스 | 네이비 | 타이트 | 22 | False | 벡터유사도:22 |
| 2 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 5 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |

### female spring_warm 웨이브 파티/모임 트렌디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.3
- Precision@K: 0.17 (1 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 2 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 4 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female spring_warm 웨이브 파티/모임 로맨틱

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536073 | 원피스/드레스 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |
| 2 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |
| 3 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 29 | True | 벡터유사도:22, 계절:가디건 |
| 4 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 25 | True | 벡터유사도:22 |
| 5 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 25 | True | 벡터유사도:22 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 25 | True | 벡터유사도:22 |

### female spring_warm 웨이브 파티/모임 키치

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.8
- Precision@K: 0.17 (1 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 30 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 25 | False | 벡터유사도:21, 계절:가디건 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 4 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female spring_warm 웨이브 파티/모임 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.3
- Precision@K: 0.17 (1 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 2 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 4 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female spring_warm 내추럴 데일리 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 406434 | 상의/셔츠 | 레드 | 루즈 | 35 | True | 벡터유사도:21, 계절:셔츠 |
| 2 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 35 | True | 벡터유사도:21, 계절:셔츠 |
| 3 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 32 | True | 벡터유사도:22 |
| 4 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22 |
| 5 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 31 | True | 벡터유사도:21, 색상:오렌지 |
| 6 | 38252 | 원피스/드레스 | 베이지 | 루즈 | 26 | True | 벡터유사도:21 |

### female spring_warm 내추럴 데일리 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 22928 | 하의/청바지 | 블루 | 와이드 | 41 | True | 벡터유사도:21, 골격:와이드 데님 |
| 2 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 37 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 37 | True | 벡터유사도:22, 색상:오렌지 |
| 4 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 35 | True | 벡터유사도:21, 계절:셔츠 |
| 5 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 32 | True | 벡터유사도:22 |
| 6 | 1148 | 상의/티셔츠 | 화이트 | 루즈 | 31 | True | 벡터유사도:21 |

### female spring_warm 내추럴 데일리 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 22928 | 하의/청바지 | 블루 | 와이드 | 36 | True | 벡터유사도:21, 골격:와이드 데님 |
| 2 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 31 | True | 벡터유사도:21, 색상:오렌지 |
| 3 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 31 | True | 벡터유사도:21, 색상:오렌지 |
| 4 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |
| 5 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21 |
| 6 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 26 | True | 벡터유사도:21 |

### female spring_warm 내추럴 데일리 러블리

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 534970 | 원피스/드레스 | 베이지 | 루즈 | 32 | True | 벡터유사도:22 |
| 2 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 32 | True | 벡터유사도:22 |
| 4 | 1162756 | 하의/스커트 | 블루 | 와이드 | 31 | True | 벡터유사도:21 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 31 | True | 벡터유사도:21 |
| 6 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |

### female spring_warm 내추럴 데일리 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 31 | True | 벡터유사도:21, 색상:오렌지 |
| 2 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 31 | True | 벡터유사도:21, 색상:오렌지 |
| 3 | 115954 | 상의/셔츠 | 스카이블루 | 오버사이즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |
| 4 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |
| 5 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22 |
| 6 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |

### female spring_warm 내추럴 데일리 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 36 | True | 벡터유사도:21, 색상:오렌지 |
| 2 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 36 | True | 벡터유사도:21, 색상:오렌지 |
| 3 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 35 | True | 벡터유사도:21, 계절:셔츠 |
| 4 | 115954 | 상의/셔츠 | 스카이블루 | 오버사이즈 | 35 | True | 벡터유사도:21, 계절:셔츠 |
| 5 | 520062 | 하의/팬츠 | 레드 | 와이드 | 31 | True | 벡터유사도:21 |
| 6 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 31 | True | 벡터유사도:21 |

### female spring_warm 내추럴 여행 리조트

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 36 | True | 벡터유사도:23, 색상:오렌지 |
| 2 | 131849 | 원피스/드레스 | 오렌지 | 루즈 | 36 | True | 벡터유사도:23, 색상:오렌지 |
| 3 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 36 | True | 벡터유사도:23, 색상:오렌지 |
| 4 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 31 | True | 벡터유사도:23 |
| 5 | 536089 | 원피스/드레스 | 베이지 | 루즈 | 31 | True | 벡터유사도:23 |
| 6 | 22177 | 원피스/드레스 | 베이지 | 오버사이즈 | 31 | True | 벡터유사도:23 |

### female spring_warm 내추럴 여행 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 37 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 37 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 36 | True | 벡터유사도:22, 계절:셔츠 |
| 4 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22 |
| 6 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 32 | True | 벡터유사도:22 |

### female spring_warm 내추럴 여행 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 37 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 69329 | 하의/스커트 | 오렌지 | 벨보텀 | 37 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 131849 | 원피스/드레스 | 오렌지 | 루즈 | 37 | True | 벡터유사도:22, 색상:오렌지 |
| 4 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 36 | True | 벡터유사도:22, 계절:셔츠 |
| 5 | 505044 | 하의/스커트 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 32 | True | 벡터유사도:22 |

### female spring_warm 내추럴 여행 보헤미안

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22 |
| 4 | 111561 | 하의/스커트 | 베이지 |  | 27 | True | 벡터유사도:22 |
| 5 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 75776 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female spring_warm 내추럴 여행 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22 |
| 2 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 4 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 32 | True | 벡터유사도:22 |
| 5 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22 |
| 6 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |

### female spring_warm 내추럴 여행 포토제닉

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 31 | True | 벡터유사도:22, 계절:셔츠 |
| 4 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22 |
| 5 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 27 | True | 벡터유사도:22 |
| 6 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |

### female spring_warm 내추럴 데이트 러블리

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 74422 | 상의/블라우스 | 네온 | 노멀 | 32 | True | 벡터유사도:22 |
| 2 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 3 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 130247 | 하의/스커트 | 베이지 | 루즈 | 32 | True | 벡터유사도:22 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 32 | True | 벡터유사도:22 |

### female spring_warm 내추럴 데이트 페미닌

- Source: `chroma_style_rag`
- Count: 6
- Average score: 36.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 510906 | 상의/셔츠 | 화이트 | 노멀 | 39 | True | 벡터유사도:22, 계절:셔츠 |
| 2 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 37 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 36 | True | 벡터유사도:21, 색상:오렌지 |
| 4 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 35 | True | 벡터유사도:22 |
| 5 | 27246 | 상의/티셔츠 | 그레이 | 노멀 | 35 | True | 벡터유사도:22 |
| 6 | 219658 | 하의/스커트 | 골드 | 와이드 | 35 | True | 벡터유사도:22 |

### female spring_warm 내추럴 데이트 로맨틱

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 37 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 37 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 30 | True | 벡터유사도:22 |
| 4 | 130247 | 하의/스커트 | 베이지 | 루즈 | 30 | True | 벡터유사도:22 |
| 5 | 105679 | 아우터/코트 | 핑크 | 루즈 | 29 | True | 벡터유사도:21 |
| 6 | 74422 | 상의/블라우스 | 네온 | 노멀 | 29 | True | 벡터유사도:21 |

### female spring_warm 내추럴 데이트 청순

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 1085552 | 상의/티셔츠 | 스카이블루 | 루즈 | 26 | True | 벡터유사도:21 |

### female spring_warm 내추럴 데이트 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 31 | True | 벡터유사도:22, 계절:셔츠 |
| 5 | 130247 | 하의/스커트 | 베이지 | 루즈 | 27 | True | 벡터유사도:22 |
| 6 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 27 | True | 벡터유사도:22 |

### female spring_warm 내추럴 데이트 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |
| 4 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 74422 | 상의/블라우스 | 네온 | 노멀 | 26 | True | 벡터유사도:21 |

### female spring_warm 내추럴 출근/면접 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.7
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 22928 | 하의/청바지 | 블루 | 와이드 | 31 | True | 벡터유사도:21, 골격:와이드 데님 |
| 2 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 3 | 976976 | 아우터/재킷 | 스카이블루 | 루즈 | 26 | True | 벡터유사도:21 |
| 4 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 5 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 26 | True | 벡터유사도:21 |
| 6 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |

### female spring_warm 내추럴 출근/면접 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.5
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 22928 | 하의/청바지 | 블루 | 와이드 | 31 | True | 벡터유사도:21, 골격:와이드 데님 |
| 2 | 48753 | 상의/셔츠 | 블루 | 루즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |
| 3 | 115954 | 상의/셔츠 | 스카이블루 | 오버사이즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |
| 4 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 27 | True | 벡터유사도:22 |
| 5 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 6 | 113901 | 원피스/드레스 | 베이지 | 루즈 | 21 | False | 벡터유사도:21 |

### female spring_warm 내추럴 출근/면접 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.8
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 976976 | 아우터/재킷 | 스카이블루 | 루즈 | 29 | True | 벡터유사도:21 |
| 2 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 29 | True | 벡터유사도:21 |
| 3 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 29 | True | 벡터유사도:21 |
| 4 | 38216 | 원피스/드레스 | 브라운 | 오버사이즈 | 29 | True | 벡터유사도:21 |
| 5 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 6 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |

### female spring_warm 내추럴 출근/면접 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.2
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 28 | True | 벡터유사도:21, 계절:셔츠 |
| 2 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 3 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 4 | 120658 | 하의/팬츠 | 화이트 | 벨보텀 | 24 | True | 벡터유사도:21 |
| 5 | 105006 | 하의/팬츠 | 화이트 | 와이드 | 24 | True | 벡터유사도:21 |
| 6 | 46709 | 원피스/드레스 | 골드 | 루즈 | 24 | True | 벡터유사도:21 |

### female spring_warm 내추럴 출근/면접 단정한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.7
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 22928 | 하의/청바지 | 블루 | 와이드 | 31 | True | 벡터유사도:21, 골격:와이드 데님 |
| 2 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 3 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 4 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 5 | 115954 | 상의/셔츠 | 스카이블루 | 오버사이즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 6 | 520188 | 하의/팬츠 | 블루 | 루즈 | 21 | False | 벡터유사도:21 |

### female spring_warm 내추럴 출근/면접 소프트 오피스

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.0
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 5 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 22 | False | 벡터유사도:22 |
| 6 | 502955 | 상의/티셔츠 | 그레이 | 오버사이즈 | 21 | False | 벡터유사도:21 |

### female spring_warm 내추럴 하객룩 우아한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.0
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 32 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 31 | True | 벡터유사도:21, 색상:오렌지 |
| 3 | 130247 | 하의/스커트 | 베이지 | 루즈 | 26 | True | 벡터유사도:21 |
| 4 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 5 | 1083499 | 하의/팬츠 | 블루 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 21 | False | 벡터유사도:21 |

### female spring_warm 내추럴 하객룩 페미닌

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 510906 | 상의/셔츠 | 화이트 | 노멀 | 33 | True | 벡터유사도:21, 계절:셔츠 |
| 2 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 31 | True | 벡터유사도:21, 색상:오렌지 |
| 3 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 31 | True | 벡터유사도:21, 색상:오렌지 |
| 4 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 30 | True | 벡터유사도:22 |
| 5 | 505044 | 하의/스커트 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |
| 6 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 29 | True | 벡터유사도:21 |

### female spring_warm 내추럴 하객룩 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 30 | True | 벡터유사도:22 |
| 2 | 523354 | 하의/팬츠 | 화이트 | 와이드 | 29 | True | 벡터유사도:21 |
| 3 | 38216 | 원피스/드레스 | 브라운 | 오버사이즈 | 29 | True | 벡터유사도:21 |
| 4 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 29 | True | 벡터유사도:21 |
| 5 | 976976 | 아우터/재킷 | 스카이블루 | 루즈 | 29 | True | 벡터유사도:21 |
| 6 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |

### female spring_warm 내추럴 하객룩 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 28 | True | 벡터유사도:21, 계절:셔츠 |
| 2 | 121307 | 아우터/가디건 | 카키 | 루즈 | 28 | True | 벡터유사도:21, 계절:가디건 |
| 3 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 4 | 99187 | 상의/티셔츠 | 골드 | 루즈 | 25 | True | 벡터유사도:22 |
| 5 | 99214 | 하의/팬츠 | 화이트 | 와이드 | 25 | True | 벡터유사도:22 |
| 6 | 99215 | 하의/팬츠 | 화이트 | 와이드 | 25 | True | 벡터유사도:22 |

### female spring_warm 내추럴 하객룩 단아한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.3
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 2 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 3 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 4 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 21 | False | 벡터유사도:21 |
| 5 | 505044 | 하의/스커트 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 74422 | 상의/블라우스 | 네온 | 노멀 | 21 | False | 벡터유사도:21 |

### female spring_warm 내추럴 하객룩 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.0
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 2 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 3 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 22 | False | 벡터유사도:22 |
| 4 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 22 | False | 벡터유사도:22 |
| 5 | 1148 | 상의/티셔츠 | 화이트 | 루즈 | 21 | False | 벡터유사도:21 |
| 6 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 21 | False | 벡터유사도:21 |

### female spring_warm 내추럴 운동/활동 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083725 | 하의/팬츠 | 오렌지 | 노멀 | 34 | True | 벡터유사도:21, 색상:오렌지 |
| 2 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 27 | True | 벡터유사도:22 |
| 4 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 69329 | 하의/스커트 | 오렌지 | 벨보텀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 6 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |

### female spring_warm 내추럴 운동/활동 애슬레저

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.2
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 2 | 1083725 | 하의/팬츠 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 3 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 4 | 69329 | 하의/스커트 | 오렌지 | 벨보텀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 5 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 6 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 22 | False | 벡터유사도:22 |

### female spring_warm 내추럴 운동/활동 액티브

- Source: `chroma_style_rag`
- Count: 6
- Average score: 21.8
- Precision@K: 0.17 (1 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 69329 | 하의/스커트 | 오렌지 | 벨보텀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 21 | False | 벡터유사도:21 |
| 3 | 81956 | 상의/티셔츠 | 화이트 | 노멀 | 21 | False | 벡터유사도:21 |
| 4 | 522113 | 상의/티셔츠 | 화이트 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 22177 | 원피스/드레스 | 베이지 | 오버사이즈 | 21 | False | 벡터유사도:21 |
| 6 | 468 | 원피스/드레스 | 베이지 | 루즈 | 21 | False | 벡터유사도:21 |

### female spring_warm 내추럴 운동/활동 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 31 | True | 벡터유사도:21, 색상:오렌지 |
| 2 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 31 | True | 벡터유사도:21, 색상:오렌지 |
| 3 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |
| 4 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 27 | True | 벡터유사도:22 |
| 5 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 26 | True | 벡터유사도:21 |
| 6 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21 |

### female spring_warm 내추럴 운동/활동 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 31 | True | 벡터유사도:22, 계절:셔츠 |
| 2 | 120140 | 상의/티셔츠 | 그레이 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 27 | True | 벡터유사도:22 |
| 4 | 501923 | 하의/팬츠 | 화이트 | 루즈 | 27 | True | 벡터유사도:22 |
| 5 | 536260 | 원피스/드레스 | 베이지 | 오버사이즈 | 27 | True | 벡터유사도:22 |
| 6 | 96419 | 원피스/드레스 | 베이지 | 루즈 | 27 | True | 벡터유사도:22 |

### female spring_warm 내추럴 운동/활동 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.3
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 2 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 3 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 4 | 539812 | 상의/티셔츠 | 화이트 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 21 | False | 벡터유사도:21 |
| 6 | 1083499 | 하의/팬츠 | 블루 | 노멀 | 21 | False | 벡터유사도:21 |

### female spring_warm 내추럴 파티/모임 글램

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.0
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 4 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 22 | False | 벡터유사도:22 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 38046 | 상의/티셔츠 | 스카이블루 | 루즈 | 21 | False | 벡터유사도:21 |

### female spring_warm 내추럴 파티/모임 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.7
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 4 | 115954 | 상의/셔츠 | 스카이블루 | 오버사이즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 22 | False | 벡터유사도:22 |

### female spring_warm 내추럴 파티/모임 트렌디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.0
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 3 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 4 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 22 | False | 벡터유사도:22 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 21 | False | 벡터유사도:21 |

### female spring_warm 내추럴 파티/모임 로맨틱

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 31 | True | 벡터유사도:21, 색상:오렌지 |
| 2 | 468 | 원피스/드레스 | 베이지 | 루즈 | 30 | True | 벡터유사도:22 |
| 3 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 28 | True | 벡터유사도:21, 계절:가디건 |
| 4 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 25 | True | 벡터유사도:22 |
| 5 | 130247 | 하의/스커트 | 베이지 | 루즈 | 25 | True | 벡터유사도:22 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 24 | True | 벡터유사도:21 |

### female spring_warm 내추럴 파티/모임 키치

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.5
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 30 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 26 | True | 벡터유사도:21, 색상:오렌지 |
| 3 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 4 | 1155667 | 하의/스커트 | 레드 | 루즈 | 24 | True | 벡터유사도:21 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 21 | False | 벡터유사도:21 |
| 6 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 21 | False | 벡터유사도:21 |

### female spring_warm 내추럴 파티/모임 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.5
- Precision@K: 0.17 (1 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22, 색상:오렌지 |
| 2 | 82239 | 원피스/드레스 | 골드 | 루즈 | 22 | False | 벡터유사도:22 |
| 3 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 22 | False | 벡터유사도:22 |
| 4 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 22 | False | 벡터유사도:22 |
| 5 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 21 | False | 벡터유사도:21 |
| 6 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 21 | False | 벡터유사도:21 |

### female summer_cool 스트레이트 데일리 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 32 | True | 벡터유사도:22, 색상:라벤더 |
| 6 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |

### female summer_cool 스트레이트 데일리 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 37 | True | 벡터유사도:22, 색상:라벤더 |
| 4 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 32 | True | 벡터유사도:22 |
| 6 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 32 | True | 벡터유사도:22 |

### female summer_cool 스트레이트 데일리 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 32 | True | 벡터유사도:22, 색상:라벤더 |
| 5 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female summer_cool 스트레이트 데일리 러블리

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 120403 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 2 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 32 | True | 벡터유사도:22, 색상:라벤더 |
| 5 | 1162756 | 하의/스커트 | 블루 | 와이드 | 32 | True | 벡터유사도:22 |
| 6 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |

### female summer_cool 스트레이트 데일리 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 32 | True | 벡터유사도:22, 색상:라벤더 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 27 | True | 벡터유사도:22 |

### female summer_cool 스트레이트 데일리 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 36.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 37 | True | 벡터유사도:22, 색상:라벤더 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 36 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |

### female summer_cool 스트레이트 여행 리조트

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 36 | True | 벡터유사도:23, 색상:스카이블루 |
| 2 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 36 | True | 벡터유사도:23, 색상:라벤더 |
| 3 | 76331 | 원피스/드레스 | 베이지 | 노멀 | 31 | True | 벡터유사도:23 |
| 4 | 536150 | 원피스/드레스 | 베이지 | 노멀 | 31 | True | 벡터유사도:23 |
| 5 | 86973 | 원피스/드레스 | 브라운 | 타이트 | 31 | True | 벡터유사도:23 |
| 6 | 79124 | 원피스/드레스 | 네이비 | 노멀 | 31 | True | 벡터유사도:23 |

### female summer_cool 스트레이트 여행 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 38 | True | 벡터유사도:23, 색상:라벤더 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 536150 | 원피스/드레스 | 베이지 | 노멀 | 33 | True | 벡터유사도:23 |
| 6 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 33 | True | 벡터유사도:23 |

### female summer_cool 스트레이트 여행 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 36.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 37 | True | 벡터유사도:22, 색상:라벤더 |
| 5 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22 |

### female summer_cool 스트레이트 여행 보헤미안

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 32 | True | 벡터유사도:22, 색상:라벤더 |
| 3 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 28 | True | 벡터유사도:23 |
| 4 | 1084969 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female summer_cool 스트레이트 여행 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 33 | True | 벡터유사도:23, 색상:스카이블루 |
| 3 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 33 | True | 벡터유사도:23, 색상:라벤더 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |

### female summer_cool 스트레이트 여행 포토제닉

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 32 | True | 벡터유사도:22, 색상:라벤더 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 124638 | 상의/티셔츠 | 핑크 | 노멀 | 27 | True | 벡터유사도:22 |

### female summer_cool 스트레이트 데이트 러블리

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 75586 | 원피스/드레스 | 퍼플 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |

### female summer_cool 스트레이트 데이트 페미닌

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 35 | True | 벡터유사도:22 |
| 3 | 505044 | 하의/스커트 | 베이지 | 노멀 | 35 | True | 벡터유사도:22 |
| 4 | 88397 | 하의/스커트 | 베이지 | 노멀 | 35 | True | 벡터유사도:22 |
| 5 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 35 | True | 벡터유사도:22 |
| 6 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 35 | True | 벡터유사도:22 |

### female summer_cool 스트레이트 데이트 로맨틱

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 78876 | 원피스/드레스 | 스카이블루 | 노멀 | 40 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 78932 | 원피스/드레스 | 스카이블루 | 노멀 | 40 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 35 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 35 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |

### female summer_cool 스트레이트 데이트 청순

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 32 | True | 벡터유사도:22, 색상:라벤더 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 125049 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |

### female summer_cool 스트레이트 데이트 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 32 | True | 벡터유사도:22, 색상:라벤더 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 37991 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |

### female summer_cool 스트레이트 데이트 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 32 | True | 벡터유사도:22, 색상:라벤더 |
| 4 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 12572 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22 |

### female summer_cool 스트레이트 출근/면접 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 27 | True | 벡터유사도:22, 색상:라벤더 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 22 | False | 벡터유사도:22 |
| 6 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 22 | False | 벡터유사도:22 |

### female summer_cool 스트레이트 출근/면접 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 27 | True | 벡터유사도:22, 색상:라벤더 |
| 6 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |

### female summer_cool 스트레이트 출근/면접 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 27 | True | 벡터유사도:22, 색상:라벤더 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 22 | False | 벡터유사도:22 |
| 6 | 536150 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 스트레이트 출근/면접 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.5
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 536343 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 22 | False | 벡터유사도:22 |
| 6 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 22 | False | 벡터유사도:22 |

### female summer_cool 스트레이트 출근/면접 단정한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.2
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 26 | True | 벡터유사도:21, 색상:라벤더 |
| 5 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 22 | False | 벡터유사도:22 |
| 6 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |

### female summer_cool 스트레이트 출근/면접 소프트 오피스

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 27 | True | 벡터유사도:22, 색상:라벤더 |
| 3 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 22 | False | 벡터유사도:22 |
| 6 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 스트레이트 하객룩 우아한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 32 | True | 벡터유사도:22, 색상:라벤더 |
| 2 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 536150 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female summer_cool 스트레이트 하객룩 페미닌

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 32 | True | 벡터유사도:22, 색상:라벤더 |
| 3 | 505044 | 하의/스커트 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |
| 4 | 27246 | 상의/티셔츠 | 그레이 | 노멀 | 30 | True | 벡터유사도:22 |
| 5 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 30 | True | 벡터유사도:22 |
| 6 | 88397 | 하의/스커트 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |

### female summer_cool 스트레이트 하객룩 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.7
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 30 | True | 벡터유사도:22 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 27 | True | 벡터유사도:22, 색상:라벤더 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 12340 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 스트레이트 하객룩 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 27 | True | 벡터유사도:22, 색상:라벤더 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 25 | True | 벡터유사도:22 |
| 6 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 25 | True | 벡터유사도:22 |

### female summer_cool 스트레이트 하객룩 단아한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 27 | True | 벡터유사도:22, 색상:라벤더 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 1083499 | 하의/팬츠 | 블루 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 스트레이트 하객룩 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 27 | True | 벡터유사도:22, 색상:라벤더 |
| 4 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 505044 | 하의/스커트 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 스트레이트 운동/활동 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.8
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 521930 | 상의/티셔츠 | 라벤더 | 타이트 | 32 | True | 벡터유사도:22, 색상:라벤더 |
| 2 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 27 | True | 벡터유사도:22, 색상:라벤더 |
| 4 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 520062 | 하의/팬츠 | 레드 | 와이드 | 22 | False | 벡터유사도:22 |

### female summer_cool 스트레이트 운동/활동 애슬레저

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.2
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 27 | True | 벡터유사도:22, 색상:라벤더 |
| 4 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 6416 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 스트레이트 운동/활동 액티브

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.2
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 521930 | 상의/티셔츠 | 라벤더 | 타이트 | 27 | True | 벡터유사도:22, 색상:라벤더 |
| 3 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 27 | True | 벡터유사도:22, 색상:라벤더 |
| 4 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 22 | False | 벡터유사도:22 |

### female summer_cool 스트레이트 운동/활동 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 32 | True | 벡터유사도:22, 색상:라벤더 |
| 4 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 1083499 | 하의/팬츠 | 블루 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 536343 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female summer_cool 스트레이트 운동/활동 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 125097 | 상의/티셔츠 | 라벤더 | 노멀 | 32 | True | 벡터유사도:22, 색상:라벤더 |
| 3 | 521930 | 상의/티셔츠 | 라벤더 | 타이트 | 32 | True | 벡터유사도:22, 색상:라벤더 |
| 4 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 27 | True | 벡터유사도:22 |
| 5 | 75680 | 원피스/점프수트 | 그레이 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 535619 | 원피스/드레스 | 민트 | 노멀 | 27 | True | 벡터유사도:22 |

### female summer_cool 스트레이트 운동/활동 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.0
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 27 | True | 벡터유사도:22, 색상:라벤더 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 124638 | 상의/티셔츠 | 핑크 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 스트레이트 파티/모임 글램

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.2
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 27 | True | 벡터유사도:22, 색상:라벤더 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 124638 | 상의/티셔츠 | 핑크 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 스트레이트 파티/모임 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.2
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 27 | True | 벡터유사도:22, 색상:라벤더 |
| 6 | 124638 | 상의/티셔츠 | 핑크 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 스트레이트 파티/모임 트렌디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.2
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 27 | True | 벡터유사도:22, 색상:라벤더 |
| 6 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 스트레이트 파티/모임 로맨틱

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 78932 | 원피스/드레스 | 스카이블루 | 노멀 | 35 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 78876 | 원피스/드레스 | 스카이블루 | 노멀 | 35 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 30 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 136931 | 상의/티셔츠 | 핑크 | 노멀 | 25 | True | 벡터유사도:22 |

### female summer_cool 스트레이트 파티/모임 키치

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.2
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 27 | True | 벡터유사도:22, 색상:라벤더 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 124638 | 상의/티셔츠 | 핑크 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 스트레이트 파티/모임 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.2
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 27 | True | 벡터유사도:22, 색상:라벤더 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 27246 | 상의/티셔츠 | 그레이 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 웨이브 데일리 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female summer_cool 웨이브 데일리 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 86973 | 원피스/드레스 | 브라운 | 타이트 | 32 | True | 벡터유사도:22 |
| 5 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |

### female summer_cool 웨이브 데일리 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 166265 | 원피스/드레스 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 536150 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female summer_cool 웨이브 데일리 러블리

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 2 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 3 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 166265 | 원피스/드레스 | 화이트 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |

### female summer_cool 웨이브 데일리 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 3 | 535765 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 86973 | 원피스/드레스 | 브라운 | 타이트 | 27 | True | 벡터유사도:22 |
| 5 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |

### female summer_cool 웨이브 데일리 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 536148 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female summer_cool 웨이브 여행 리조트

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 36 | True | 벡터유사도:23, 색상:라벤더 |
| 2 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 36 | True | 벡터유사도:23, 색상:스카이블루 |
| 3 | 523287 | 하의/팬츠 | 퍼플 | 와이드 | 31 | True | 벡터유사도:23 |
| 4 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 31 | True | 벡터유사도:23 |
| 5 | 79124 | 원피스/드레스 | 네이비 | 노멀 | 31 | True | 벡터유사도:23 |
| 6 | 80007 | 원피스/드레스 | 베이지 | 노멀 | 31 | True | 벡터유사도:23 |

### female summer_cool 웨이브 여행 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 37 | True | 벡터유사도:22, 색상:라벤더 |
| 5 | 536150 | 원피스/드레스 | 베이지 | 노멀 | 33 | True | 벡터유사도:23 |
| 6 | 536148 | 원피스/드레스 | 베이지 | 노멀 | 33 | True | 벡터유사도:23 |

### female summer_cool 웨이브 여행 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 37 | True | 벡터유사도:22, 색상:라벤더 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 76331 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |

### female summer_cool 웨이브 여행 보헤미안

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 32 | True | 벡터유사도:22, 색상:라벤더 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 517899 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female summer_cool 웨이브 여행 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 32 | True | 벡터유사도:22, 색상:라벤더 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 536150 | 원피스/드레스 | 베이지 | 노멀 | 28 | True | 벡터유사도:23 |

### female summer_cool 웨이브 여행 포토제닉

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 32 | True | 벡터유사도:22, 색상:라벤더 |
| 2 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 80007 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 70089 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female summer_cool 웨이브 데이트 러블리

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 78876 | 원피스/드레스 | 스카이블루 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 78932 | 원피스/드레스 | 스카이블루 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 계절:가디건 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 1217241 | 하의/스커트 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |

### female summer_cool 웨이브 데이트 페미닌

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 35 | True | 벡터유사도:22 |
| 2 | 223136 | 원피스/드레스 | 브라운 | 노멀 | 35 | True | 벡터유사도:22 |
| 3 | 111749 | 상의/티셔츠 | 와인 | 타이트 | 35 | True | 벡터유사도:22 |
| 4 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 35 | True | 벡터유사도:22 |
| 5 | 219658 | 하의/스커트 | 골드 | 와이드 | 35 | True | 벡터유사도:22 |
| 6 | 505044 | 하의/스커트 | 베이지 | 노멀 | 35 | True | 벡터유사도:22 |

### female summer_cool 웨이브 데이트 로맨틱

- Source: `chroma_style_rag`
- Count: 6
- Average score: 36.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 78932 | 원피스/드레스 | 스카이블루 | 노멀 | 40 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 78876 | 원피스/드레스 | 스카이블루 | 노멀 | 40 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 35 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 35 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 34 | True | 벡터유사도:22, 계절:가디건 |
| 6 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |

### female summer_cool 웨이브 데이트 청순

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 31 | True | 벡터유사도:22, 계절:가디건 |
| 5 | 536150 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 535765 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female summer_cool 웨이브 데이트 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 536073 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 80007 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female summer_cool 웨이브 데이트 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 31 | True | 벡터유사도:22, 계절:가디건 |
| 5 | 75586 | 원피스/드레스 | 퍼플 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 536150 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female summer_cool 웨이브 출근/면접 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.5
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female summer_cool 웨이브 출근/면접 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 웨이브 출근/면접 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.0
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 29 | True | 벡터유사도:21 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 535765 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 웨이브 출근/면접 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.7
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 166265 | 원피스/드레스 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 536150 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 웨이브 출근/면접 단정한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.0
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female summer_cool 웨이브 출근/면접 소프트 오피스

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.7
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 26 | True | 벡터유사도:21, 색상:라벤더 |
| 5 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 웨이브 하객룩 우아한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 31 | True | 벡터유사도:21, 색상:라벤더 |
| 2 | 535765 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 97884 | 원피스/드레스 | 블루 | 타이트 | 27 | True | 벡터유사도:22 |
| 6 | 86973 | 원피스/드레스 | 브라운 | 타이트 | 27 | True | 벡터유사도:22 |

### female summer_cool 웨이브 하객룩 페미닌

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |
| 2 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |
| 3 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |
| 4 | 505044 | 하의/스커트 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |
| 5 | 88397 | 하의/스커트 | 베이지 | 노멀 | 29 | True | 벡터유사도:21 |
| 6 | 508511 | 상의/블라우스 | 퍼플 | 노멀 | 29 | True | 벡터유사도:21 |

### female summer_cool 웨이브 하객룩 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.7
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 523354 | 하의/팬츠 | 화이트 | 와이드 | 30 | True | 벡터유사도:22 |
| 2 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 30 | True | 벡터유사도:22 |
| 3 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 70089 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 536073 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 웨이브 하객룩 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.7
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 99410 | 원피스/드레스 | 퍼플 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 535765 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 웨이브 하객룩 단아한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.0
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 536148 | 원피스/드레스 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 4 | 535765 | 원피스/드레스 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 523287 | 하의/팬츠 | 퍼플 | 와이드 | 22 | False | 벡터유사도:22 |

### female summer_cool 웨이브 하객룩 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.7
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 536150 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 536073 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 웨이브 운동/활동 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.8
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 30 | True | 벡터유사도:22 |
| 2 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 517899 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 86973 | 원피스/드레스 | 브라운 | 타이트 | 22 | False | 벡터유사도:22 |
| 6 | 536150 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 웨이브 운동/활동 애슬레저

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.7
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 26 | True | 벡터유사도:21, 색상:라벤더 |
| 4 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |

### female summer_cool 웨이브 운동/활동 액티브

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.7
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 536148 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 웨이브 운동/활동 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 12373 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 536150 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 517899 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female summer_cool 웨이브 운동/활동 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.5
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 521940 | 하의/팬츠 | 블랙 | 와이드 | 27 | True | 벡터유사도:22 |
| 3 | 1086120 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 75776 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 536150 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 536148 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 웨이브 운동/활동 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.5
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 536148 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 웨이브 파티/모임 글램

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.3
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 웨이브 파티/모임 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.2
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 27 | True | 벡터유사도:22, 색상:라벤더 |
| 5 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 86973 | 원피스/드레스 | 브라운 | 타이트 | 22 | False | 벡터유사도:22 |

### female summer_cool 웨이브 파티/모임 트렌디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.0
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 26 | True | 벡터유사도:21, 색상:라벤더 |
| 5 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 웨이브 파티/모임 로맨틱

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 78932 | 원피스/드레스 | 스카이블루 | 노멀 | 35 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 78876 | 원피스/드레스 | 스카이블루 | 노멀 | 35 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 30 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 29 | True | 벡터유사도:22, 계절:가디건 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |

### female summer_cool 웨이브 파티/모임 키치

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.5
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 535765 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 웨이브 파티/모임 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.5
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 536073 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 내추럴 데일리 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 36 | True | 벡터유사도:22, 계절:셔츠 |
| 4 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 96419 | 원피스/드레스 | 베이지 | 루즈 | 27 | True | 벡터유사도:22 |
| 6 | 81941 | 상의/티셔츠 | 퍼플 | 오버사이즈 | 27 | True | 벡터유사도:22 |

### female summer_cool 내추럴 데일리 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 38179 | 원피스/드레스 | 브라운 | 오버사이즈 | 32 | True | 벡터유사도:22 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |

### female summer_cool 내추럴 데일리 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 70071 | 원피스/드레스 | 베이지 | 루즈 | 27 | True | 벡터유사도:22 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 81941 | 상의/티셔츠 | 퍼플 | 오버사이즈 | 27 | True | 벡터유사도:22 |

### female summer_cool 내추럴 데일리 러블리

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1217241 | 하의/스커트 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 3 | 534970 | 원피스/드레스 | 베이지 | 루즈 | 32 | True | 벡터유사도:22 |
| 4 | 11497 | 원피스/드레스 | 베이지 | 루즈 | 32 | True | 벡터유사도:22 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |

### female summer_cool 내추럴 데일리 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 31 | True | 벡터유사도:22, 계절:셔츠 |
| 5 | 82239 | 원피스/드레스 | 골드 | 루즈 | 27 | True | 벡터유사도:22 |
| 6 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 27 | True | 벡터유사도:22 |

### female summer_cool 내추럴 데일리 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 36 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 35 | True | 벡터유사도:21, 계절:셔츠 |
| 5 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 32 | True | 벡터유사도:22 |
| 6 | 130932 | 원피스/드레스 | 블루 | 오버사이즈 | 32 | True | 벡터유사도:22 |

### female summer_cool 내추럴 여행 리조트

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 36 | True | 벡터유사도:23, 색상:라벤더 |
| 2 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 36 | True | 벡터유사도:23, 색상:스카이블루 |
| 3 | 523287 | 하의/팬츠 | 퍼플 | 와이드 | 31 | True | 벡터유사도:23 |
| 4 | 81941 | 상의/티셔츠 | 퍼플 | 오버사이즈 | 31 | True | 벡터유사도:23 |
| 5 | 125890 | 원피스/드레스 | 그레이 | 루즈 | 31 | True | 벡터유사도:23 |
| 6 | 105301 | 원피스/드레스 | 핑크 | 루즈 | 31 | True | 벡터유사도:23 |

### female summer_cool 내추럴 여행 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 37 | True | 벡터유사도:22, 색상:라벤더 |
| 3 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 502955 | 상의/티셔츠 | 그레이 | 오버사이즈 | 32 | True | 벡터유사도:22 |

### female summer_cool 내추럴 여행 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 37 | True | 벡터유사도:22, 색상:라벤더 |
| 2 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 105199 | 상의/티셔츠 | 베이지 | 루즈 | 32 | True | 벡터유사도:22 |
| 6 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 32 | True | 벡터유사도:22 |

### female summer_cool 내추럴 여행 보헤미안

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 32 | True | 벡터유사도:22, 색상:라벤더 |
| 3 | 522243 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 4 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 503188 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female summer_cool 내추럴 여행 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 105199 | 상의/티셔츠 | 베이지 | 루즈 | 32 | True | 벡터유사도:22 |
| 4 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 81941 | 상의/티셔츠 | 퍼플 | 오버사이즈 | 32 | True | 벡터유사도:22 |
| 6 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 32 | True | 벡터유사도:22, 색상:라벤더 |

### female summer_cool 내추럴 여행 포토제닉

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 32 | True | 벡터유사도:22, 색상:라벤더 |
| 3 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 502955 | 상의/티셔츠 | 그레이 | 오버사이즈 | 27 | True | 벡터유사도:22 |

### female summer_cool 내추럴 데이트 러블리

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 11497 | 원피스/드레스 | 베이지 | 루즈 | 32 | True | 벡터유사도:22 |
| 2 | 113901 | 원피스/드레스 | 베이지 | 루즈 | 32 | True | 벡터유사도:22 |
| 3 | 130247 | 하의/스커트 | 베이지 | 루즈 | 32 | True | 벡터유사도:22 |
| 4 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 32 | True | 벡터유사도:22 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |

### female summer_cool 내추럴 데이트 페미닌

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 68688 | 원피스/드레스 | 베이지 | 노멀 | 35 | True | 벡터유사도:22 |
| 3 | 122940 | 상의/티셔츠 | 화이트 | 노멀 | 35 | True | 벡터유사도:22 |
| 4 | 505044 | 하의/스커트 | 베이지 | 노멀 | 35 | True | 벡터유사도:22 |
| 5 | 88397 | 하의/스커트 | 베이지 | 노멀 | 35 | True | 벡터유사도:22 |
| 6 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 35 | True | 벡터유사도:22 |

### female summer_cool 내추럴 데이트 로맨틱

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 78876 | 원피스/드레스 | 스카이블루 | 노멀 | 40 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 78932 | 원피스/드레스 | 스카이블루 | 노멀 | 40 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 35 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 1214644 | 상의/티셔츠 | 화이트 | 노멀 | 30 | True | 벡터유사도:22 |

### female summer_cool 내추럴 데이트 청순

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 32 | True | 벡터유사도:22, 색상:라벤더 |
| 5 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 31 | True | 벡터유사도:22, 계절:셔츠 |
| 6 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female summer_cool 내추럴 데이트 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 31 | True | 벡터유사도:22, 계절:셔츠 |
| 5 | 536073 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 81941 | 상의/티셔츠 | 퍼플 | 오버사이즈 | 27 | True | 벡터유사도:22 |

### female summer_cool 내추럴 데이트 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 32 | True | 벡터유사도:22, 색상:라벤더 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female summer_cool 내추럴 출근/면접 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.0
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 5 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 105199 | 상의/티셔츠 | 베이지 | 루즈 | 22 | False | 벡터유사도:22 |

### female summer_cool 내추럴 출근/면접 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.2
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |
| 4 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 99187 | 상의/티셔츠 | 골드 | 루즈 | 26 | True | 벡터유사도:21 |
| 6 | 535619 | 원피스/드레스 | 민트 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 내추럴 출근/면접 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 29 | True | 벡터유사도:21 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 26 | True | 벡터유사도:21, 색상:라벤더 |
| 5 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 22 | False | 벡터유사도:22 |
| 6 | 105199 | 상의/티셔츠 | 베이지 | 루즈 | 21 | False | 벡터유사도:21 |

### female summer_cool 내추럴 출근/면접 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.8
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 46676 | 원피스/드레스 | 베이지 | 노멀 | 25 | True | 벡터유사도:22 |
| 5 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 6 | 99187 | 상의/티셔츠 | 골드 | 루즈 | 25 | True | 벡터유사도:22 |

### female summer_cool 내추럴 출근/면접 단정한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 26 | True | 벡터유사도:21, 색상:라벤더 |
| 4 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 6 | 81941 | 상의/티셔츠 | 퍼플 | 오버사이즈 | 22 | False | 벡터유사도:22 |

### female summer_cool 내추럴 출근/면접 소프트 오피스

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 27 | True | 벡터유사도:22, 색상:라벤더 |
| 4 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 502955 | 상의/티셔츠 | 그레이 | 오버사이즈 | 22 | False | 벡터유사도:22 |
| 6 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 내추럴 하객룩 우아한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.0
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 32 | True | 벡터유사도:22, 색상:라벤더 |
| 2 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 81941 | 상의/티셔츠 | 퍼플 | 오버사이즈 | 22 | False | 벡터유사도:22 |
| 6 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 22 | False | 벡터유사도:22 |

### female summer_cool 내추럴 하객룩 페미닌

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 68688 | 원피스/드레스 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |
| 3 | 505044 | 하의/스커트 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |
| 4 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |
| 5 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 30 | True | 벡터유사도:22 |
| 6 | 88397 | 하의/스커트 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |

### female summer_cool 내추럴 하객룩 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 38216 | 원피스/드레스 | 브라운 | 오버사이즈 | 30 | True | 벡터유사도:22 |
| 2 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 30 | True | 벡터유사도:22 |
| 3 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 27 | True | 벡터유사도:22, 색상:라벤더 |
| 4 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 502955 | 상의/티셔츠 | 그레이 | 오버사이즈 | 22 | False | 벡터유사도:22 |
| 6 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 22 | False | 벡터유사도:22 |

### female summer_cool 내추럴 하객룩 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 46676 | 원피스/드레스 | 베이지 | 노멀 | 25 | True | 벡터유사도:22 |
| 5 | 86573 | 상의/티셔츠 | 화이트 | 오버사이즈 | 25 | True | 벡터유사도:22 |
| 6 | 99187 | 상의/티셔츠 | 골드 | 루즈 | 25 | True | 벡터유사도:22 |

### female summer_cool 내추럴 하객룩 단아한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.7
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 26 | True | 벡터유사도:21, 색상:라벤더 |
| 4 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 81941 | 상의/티셔츠 | 퍼플 | 오버사이즈 | 22 | False | 벡터유사도:22 |
| 6 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 21 | False | 벡터유사도:21 |

### female summer_cool 내추럴 하객룩 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.0
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 26 | True | 벡터유사도:21, 색상:라벤더 |
| 5 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 22 | False | 벡터유사도:22 |
| 6 | 502955 | 상의/티셔츠 | 그레이 | 오버사이즈 | 21 | False | 벡터유사도:21 |

### female summer_cool 내추럴 운동/활동 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.7
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 12572 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22 |
| 2 | 44037 | 상의/티셔츠 | 베이지 | 루즈 | 27 | True | 벡터유사도:22 |
| 3 | 46446 | 원피스/드레스 | 퍼플 | 루즈 | 22 | False | 벡터유사도:22 |
| 4 | 536073 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 22 | False | 벡터유사도:22 |

### female summer_cool 내추럴 운동/활동 애슬레저

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.2
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 27 | True | 벡터유사도:22, 색상:라벤더 |
| 2 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 124638 | 상의/티셔츠 | 핑크 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 내추럴 운동/활동 액티브

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.5
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 130942 | 원피스/드레스 | 옐로우 | 오버사이즈 | 22 | False | 벡터유사도:22 |
| 5 | 43144 | 원피스/점프수트 | 베이지 | 루즈 | 22 | False | 벡터유사도:22 |
| 6 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 22 | False | 벡터유사도:22 |

### female summer_cool 내추럴 운동/활동 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536073 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 2 | 536148 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 523287 | 하의/팬츠 | 퍼플 | 와이드 | 27 | True | 벡터유사도:22 |
| 5 | 124638 | 상의/티셔츠 | 핑크 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 27 | True | 벡터유사도:22 |

### female summer_cool 내추럴 운동/활동 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 36547 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 70071 | 원피스/드레스 | 베이지 | 루즈 | 27 | True | 벡터유사도:22 |
| 6 | 82239 | 원피스/드레스 | 골드 | 루즈 | 27 | True | 벡터유사도:22 |

### female summer_cool 내추럴 운동/활동 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.2
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 46365 | 원피스/드레스 | 베이지 | 루즈 | 22 | False | 벡터유사도:22 |
| 5 | 81941 | 상의/티셔츠 | 퍼플 | 오버사이즈 | 22 | False | 벡터유사도:22 |
| 6 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 내추럴 파티/모임 글램

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 27 | True | 벡터유사도:22, 색상:라벤더 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 22 | False | 벡터유사도:22 |
| 6 | 81941 | 상의/티셔츠 | 퍼플 | 오버사이즈 | 22 | False | 벡터유사도:22 |

### female summer_cool 내추럴 파티/모임 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 27 | True | 벡터유사도:22, 색상:라벤더 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 502955 | 상의/티셔츠 | 그레이 | 오버사이즈 | 22 | False | 벡터유사도:22 |
| 6 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 내추럴 파티/모임 트렌디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.0
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 27 | True | 벡터유사도:22, 색상:라벤더 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 81941 | 상의/티셔츠 | 퍼플 | 오버사이즈 | 22 | False | 벡터유사도:22 |

### female summer_cool 내추럴 파티/모임 로맨틱

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 535765 | 원피스/드레스 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 25 | True | 벡터유사도:22 |
| 6 | 128763 | 상의/블라우스 | 퍼플 | 루즈 | 25 | True | 벡터유사도:22 |

### female summer_cool 내추럴 파티/모임 키치

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 536200 | 원피스/드레스 | 라벤더 | 노멀 | 27 | True | 벡터유사도:22, 색상:라벤더 |
| 3 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 22 | False | 벡터유사도:22 |

### female summer_cool 내추럴 파티/모임 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.5
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 81221 | 원피스/드레스 | 블랙 | 루즈 | 22 | False | 벡터유사도:22 |
| 5 | 105199 | 상의/티셔츠 | 베이지 | 루즈 | 22 | False | 벡터유사도:22 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female autumn_warm 스트레이트 데일리 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 60869 | 상의/셔츠 | 화이트 | 노멀 | 40 | True | 벡터유사도:21, 색상:브라운, 계절:셔츠 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 36 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 5 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 6 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female autumn_warm 스트레이트 데일리 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 5 | 22928 | 하의/청바지 | 블루 | 와이드 | 32 | True | 벡터유사도:22 |
| 6 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 32 | True | 벡터유사도:22 |

### female autumn_warm 스트레이트 데일리 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 27 | True | 벡터유사도:22 |

### female autumn_warm 스트레이트 데일리 러블리

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 505044 | 하의/스커트 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 219658 | 하의/스커트 | 골드 | 와이드 | 32 | True | 벡터유사도:22 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 31 | True | 벡터유사도:21 |
| 6 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 31 | True | 벡터유사도:21, 색상:브라운 |

### female autumn_warm 스트레이트 데일리 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 219658 | 하의/스커트 | 골드 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 27 | True | 벡터유사도:22 |

### female autumn_warm 스트레이트 데일리 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 36 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22 |
| 4 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 6 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 27 | True | 벡터유사도:22 |

### female autumn_warm 스트레이트 여행 리조트

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 86973 | 원피스/드레스 | 브라운 | 타이트 | 36 | True | 벡터유사도:23, 색상:브라운 |
| 2 | 7597 | 원피스/드레스 | 브라운 | 노멀 | 36 | True | 벡터유사도:23, 색상:브라운 |
| 3 | 76427 | 원피스/드레스 | 브라운 | 노멀 | 36 | True | 벡터유사도:23, 색상:브라운 |
| 4 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 31 | True | 벡터유사도:23 |
| 5 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 31 | True | 벡터유사도:23 |
| 6 | 535765 | 원피스/드레스 | 베이지 | 노멀 | 31 | True | 벡터유사도:23 |

### female autumn_warm 스트레이트 여행 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 86973 | 원피스/드레스 | 브라운 | 타이트 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 76427 | 원피스/드레스 | 브라운 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 505044 | 하의/스커트 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 7597 | 원피스/드레스 | 브라운 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |

### female autumn_warm 스트레이트 여행 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76427 | 원피스/드레스 | 브라운 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 7597 | 원피스/드레스 | 브라운 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22 |
| 6 | 508511 | 상의/블라우스 | 퍼플 | 노멀 | 32 | True | 벡터유사도:22 |

### female autumn_warm 스트레이트 여행 보헤미안

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 28 | True | 벡터유사도:23 |
| 2 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 76331 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 505044 | 하의/스커트 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 508965 | 상의/블라우스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |

### female autumn_warm 스트레이트 여행 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 86973 | 원피스/드레스 | 브라운 | 타이트 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 27246 | 상의/티셔츠 | 그레이 | 노멀 | 32 | True | 벡터유사도:22 |
| 3 | 7597 | 원피스/드레스 | 브라운 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 27 | True | 벡터유사도:22 |

### female autumn_warm 스트레이트 여행 포토제닉

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 86973 | 원피스/드레스 | 브라운 | 타이트 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 505044 | 하의/스커트 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 129229 | 원피스/드레스 | 레드 | 노멀 | 27 | True | 벡터유사도:22 |

### female autumn_warm 스트레이트 데이트 러블리

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 1214644 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 1162756 | 하의/스커트 | 블루 | 와이드 | 32 | True | 벡터유사도:22 |

### female autumn_warm 스트레이트 데이트 페미닌

- Source: `chroma_style_rag`
- Count: 6
- Average score: 37.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 240574 | 원피스/드레스 | 브라운 | 노멀 | 40 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 40 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 510906 | 상의/셔츠 | 화이트 | 노멀 | 39 | True | 벡터유사도:22, 계절:셔츠 |
| 4 | 111749 | 상의/티셔츠 | 와인 | 타이트 | 35 | True | 벡터유사도:22 |
| 5 | 219658 | 하의/스커트 | 골드 | 와이드 | 35 | True | 벡터유사도:22 |
| 6 | 91356 | 하의/스커트 | 화이트 | 와이드 | 35 | True | 벡터유사도:22 |

### female autumn_warm 스트레이트 데이트 로맨틱

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 40 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 30 | True | 벡터유사도:22 |
| 4 | 1240280 | 상의/티셔츠 | 핑크 | 노멀 | 30 | True | 벡터유사도:22 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 30 | True | 벡터유사도:22 |
| 6 | 219658 | 하의/스커트 | 골드 | 와이드 | 27 | True | 벡터유사도:22 |

### female autumn_warm 스트레이트 데이트 청순

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22 |

### female autumn_warm 스트레이트 데이트 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22 |
| 2 | 86973 | 원피스/드레스 | 브라운 | 타이트 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |

### female autumn_warm 스트레이트 데이트 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 86973 | 원피스/드레스 | 브라운 | 타이트 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 219658 | 하의/스커트 | 골드 | 와이드 | 27 | True | 벡터유사도:22 |
| 5 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |

### female autumn_warm 스트레이트 출근/면접 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.3
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 5 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female autumn_warm 스트레이트 출근/면접 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.0
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 60869 | 상의/셔츠 | 화이트 | 노멀 | 35 | True | 벡터유사도:21, 색상:브라운, 계절:셔츠 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 5 | 506200 | 상의/니트웨어 | 화이트 | 노멀 | 26 | True | 벡터유사도:21 |
| 6 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female autumn_warm 스트레이트 출근/면접 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.2
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 219658 | 하의/스커트 | 골드 | 와이드 | 22 | False | 벡터유사도:22 |
| 5 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female autumn_warm 스트레이트 출근/면접 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.7
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 28 | True | 벡터유사도:21, 계절:셔츠 |
| 2 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 24 | True | 벡터유사도:21 |
| 6 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |

### female autumn_warm 스트레이트 출근/면접 단정한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.7
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 1083499 | 하의/팬츠 | 블루 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 1041004 | 하의/청바지 | 블루 | 벨보텀 | 21 | False | 벡터유사도:21 |

### female autumn_warm 스트레이트 출근/면접 소프트 오피스

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.5
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 5 | 219658 | 하의/스커트 | 골드 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |

### female autumn_warm 스트레이트 하객룩 우아한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.8
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 219658 | 하의/스커트 | 골드 | 와이드 | 26 | True | 벡터유사도:21 |
| 4 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 21 | False | 벡터유사도:21 |
| 5 | 86973 | 원피스/드레스 | 브라운 | 타이트 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 6 | 7597 | 원피스/드레스 | 브라운 | 노멀 | 31 | True | 벡터유사도:21, 색상:브라운 |

### female autumn_warm 스트레이트 하객룩 페미닌

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 35 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 510906 | 상의/셔츠 | 화이트 | 노멀 | 33 | True | 벡터유사도:21, 계절:셔츠 |
| 3 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |
| 4 | 27246 | 상의/티셔츠 | 그레이 | 노멀 | 30 | True | 벡터유사도:22 |
| 5 | 219658 | 하의/스커트 | 골드 | 와이드 | 30 | True | 벡터유사도:22 |
| 6 | 505044 | 하의/스커트 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |

### female autumn_warm 스트레이트 하객룩 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 29 | True | 벡터유사도:21 |
| 2 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 21 | False | 벡터유사도:21 |

### female autumn_warm 스트레이트 하객룩 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 28 | True | 벡터유사도:21, 계절:셔츠 |
| 2 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 25 | True | 벡터유사도:22 |
| 6 | 99215 | 하의/팬츠 | 화이트 | 와이드 | 25 | True | 벡터유사도:22 |

### female autumn_warm 스트레이트 하객룩 단아한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.7
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 219658 | 하의/스커트 | 골드 | 와이드 | 21 | False | 벡터유사도:21 |
| 5 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 21 | False | 벡터유사도:21 |

### female autumn_warm 스트레이트 하객룩 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.7
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 219658 | 하의/스커트 | 골드 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 21 | False | 벡터유사도:21 |

### female autumn_warm 스트레이트 운동/활동 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.2
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 112153 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 5 | 535619 | 원피스/드레스 | 민트 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female autumn_warm 스트레이트 운동/활동 애슬레저

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.8
- Precision@K: 0.17 (1 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 80007 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 505044 | 하의/스커트 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 124638 | 상의/티셔츠 | 핑크 | 노멀 | 22 | False | 벡터유사도:22 |

### female autumn_warm 스트레이트 운동/활동 액티브

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.0
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 296 | 원피스/드레스 | 네이비 | 타이트 | 22 | False | 벡터유사도:22 |
| 5 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 21 | False | 벡터유사도:21 |

### female autumn_warm 스트레이트 운동/활동 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 520010 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 80007 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female autumn_warm 스트레이트 운동/활동 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 296 | 원피스/드레스 | 네이비 | 타이트 | 27 | True | 벡터유사도:22 |
| 4 | 36547 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 535619 | 원피스/드레스 | 민트 | 노멀 | 27 | True | 벡터유사도:22 |

### female autumn_warm 스트레이트 운동/활동 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.5
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 219658 | 하의/스커트 | 골드 | 와이드 | 22 | False | 벡터유사도:22 |
| 4 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 22 | False | 벡터유사도:22 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female autumn_warm 스트레이트 파티/모임 글램

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.7
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 505044 | 하의/스커트 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |

### female autumn_warm 스트레이트 파티/모임 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.8
- Precision@K: 0.17 (1 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 535056 | 원피스/드레스 | 오렌지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 22 | False | 벡터유사도:22 |
| 5 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female autumn_warm 스트레이트 파티/모임 트렌디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.5
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 1159618 | 원피스/드레스 | 골드 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 508511 | 상의/블라우스 | 퍼플 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 219658 | 하의/스커트 | 골드 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female autumn_warm 스트레이트 파티/모임 로맨틱

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.3
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 35 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 25 | True | 벡터유사도:22 |
| 4 | 86054 | 상의/티셔츠 | 화이트 | 노멀 | 25 | True | 벡터유사도:22 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 25 | True | 벡터유사도:22 |
| 6 | 219658 | 하의/스커트 | 골드 | 와이드 | 22 | False | 벡터유사도:22 |

### female autumn_warm 스트레이트 파티/모임 키치

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.0
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 536008 | 원피스/드레스 | 오렌지 | 노멀 | 25 | True | 벡터유사도:22 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 22 | False | 벡터유사도:22 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |

### female autumn_warm 스트레이트 파티/모임 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.3
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 505044 | 하의/스커트 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female autumn_warm 웨이브 데일리 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 36 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 1082517 | 하의/팬츠 | 네온 | 와이드 | 32 | True | 벡터유사도:22 |
| 3 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |

### female autumn_warm 웨이브 데일리 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 5 | 505044 | 하의/스커트 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |

### female autumn_warm 웨이브 데일리 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21 |
| 6 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |

### female autumn_warm 웨이브 데일리 러블리

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |

### female autumn_warm 웨이브 데일리 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22 |
| 2 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 31 | True | 벡터유사도:21 |
| 3 | 14795 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |

### female autumn_warm 웨이브 데일리 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 36 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 3 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 535765 | 원피스/드레스 | 베이지 | 노멀 | 31 | True | 벡터유사도:21 |
| 5 | 122940 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |

### female autumn_warm 웨이브 여행 리조트

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 86973 | 원피스/드레스 | 브라운 | 타이트 | 36 | True | 벡터유사도:23, 색상:브라운 |
| 2 | 76427 | 원피스/드레스 | 브라운 | 노멀 | 36 | True | 벡터유사도:23, 색상:브라운 |
| 3 | 7597 | 원피스/드레스 | 브라운 | 노멀 | 36 | True | 벡터유사도:23, 색상:브라운 |
| 4 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 31 | True | 벡터유사도:23 |
| 5 | 12340 | 원피스/드레스 | 베이지 | 노멀 | 31 | True | 벡터유사도:23 |
| 6 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 31 | True | 벡터유사도:23 |

### female autumn_warm 웨이브 여행 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76427 | 원피스/드레스 | 브라운 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 86973 | 원피스/드레스 | 브라운 | 타이트 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 505044 | 하의/스커트 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 74422 | 상의/블라우스 | 네온 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 7597 | 원피스/드레스 | 브라운 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |

### female autumn_warm 웨이브 여행 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76427 | 원피스/드레스 | 브라운 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 86973 | 원피스/드레스 | 브라운 | 타이트 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 4 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 7597 | 원피스/드레스 | 브라운 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 6 | 68688 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |

### female autumn_warm 웨이브 여행 보헤미안

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 14795 | 하의/팬츠 | 브라운 | 와이드 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 536148 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 508965 | 상의/블라우스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female autumn_warm 웨이브 여행 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 86973 | 원피스/드레스 | 브라운 | 타이트 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 76427 | 원피스/드레스 | 브라운 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 5 | 7597 | 원피스/드레스 | 브라운 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 6 | 97884 | 원피스/드레스 | 블루 | 타이트 | 27 | True | 벡터유사도:22 |

### female autumn_warm 웨이브 여행 포토제닉

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 86973 | 원피스/드레스 | 브라운 | 타이트 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 76427 | 원피스/드레스 | 브라운 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 505044 | 하의/스커트 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 7446 | 원피스/드레스 | 네이비 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 12340 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female autumn_warm 웨이브 데이트 러블리

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 계절:가디건 |
| 4 | 111749 | 상의/티셔츠 | 와인 | 타이트 | 32 | True | 벡터유사도:22 |
| 5 | 1217241 | 하의/스커트 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 1214644 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22 |

### female autumn_warm 웨이브 데이트 페미닌

- Source: `chroma_style_rag`
- Count: 6
- Average score: 36.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 59073 | 원피스/드레스 | 브라운 | 노멀 | 40 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 117544 | 원피스/드레스 | 베이지 | 노멀 | 40 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 35 | True | 벡터유사도:22 |
| 4 | 122940 | 상의/티셔츠 | 화이트 | 노멀 | 35 | True | 벡터유사도:22 |
| 5 | 91356 | 하의/스커트 | 화이트 | 와이드 | 35 | True | 벡터유사도:22 |
| 6 | 219658 | 하의/스커트 | 골드 | 와이드 | 35 | True | 벡터유사도:22 |

### female autumn_warm 웨이브 데이트 로맨틱

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 40 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 108003 | 원피스/드레스 | 브라운 | 노멀 | 40 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 34 | True | 벡터유사도:22, 계절:가디건 |
| 4 | 1214644 | 상의/티셔츠 | 화이트 | 노멀 | 30 | True | 벡터유사도:22 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |
| 6 | 1217241 | 하의/스커트 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |

### female autumn_warm 웨이브 데이트 청순

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 31 | True | 벡터유사도:22, 계절:가디건 |
| 5 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female autumn_warm 웨이브 데이트 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22 |
| 2 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 31 | True | 벡터유사도:22, 계절:가디건 |
| 5 | 78876 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female autumn_warm 웨이브 데이트 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 31 | True | 벡터유사도:22, 계절:가디건 |
| 5 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 122940 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |

### female autumn_warm 웨이브 출근/면접 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female autumn_warm 웨이브 출근/면접 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female autumn_warm 웨이브 출근/면접 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.8
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 29 | True | 벡터유사도:21 |
| 2 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 25 | False | 벡터유사도:21, 계절:가디건 |
| 5 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female autumn_warm 웨이브 출근/면접 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.2
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 25 | True | 벡터유사도:22 |
| 6 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female autumn_warm 웨이브 출근/면접 단정한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.5
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 21 | False | 벡터유사도:21 |
| 6 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female autumn_warm 웨이브 출근/면접 소프트 오피스

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.2
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |

### female autumn_warm 웨이브 하객룩 우아한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 7597 | 원피스/드레스 | 브라운 | 노멀 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 4 | 505044 | 하의/스커트 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 5 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |

### female autumn_warm 웨이브 하객룩 페미닌

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 35 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 59073 | 원피스/드레스 | 브라운 | 노멀 | 34 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 505044 | 하의/스커트 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |
| 4 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |
| 5 | 219658 | 하의/스커트 | 골드 | 와이드 | 29 | True | 벡터유사도:21 |
| 6 | 122940 | 상의/티셔츠 | 화이트 | 노멀 | 29 | True | 벡터유사도:21 |

### female autumn_warm 웨이브 하객룩 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.5
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 30 | True | 벡터유사도:22 |
| 2 | 523354 | 하의/팬츠 | 화이트 | 와이드 | 29 | True | 벡터유사도:21 |
| 3 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 108003 | 원피스/드레스 | 브라운 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 26 | False | 벡터유사도:22, 계절:가디건 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 21 | False | 벡터유사도:21 |

### female autumn_warm 웨이브 하객룩 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 108003 | 원피스/드레스 | 브라운 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 99215 | 하의/팬츠 | 화이트 | 와이드 | 25 | True | 벡터유사도:22 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female autumn_warm 웨이브 하객룩 단아한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.2
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 108003 | 원피스/드레스 | 브라운 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 25 | False | 벡터유사도:21, 계절:가디건 |
| 5 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female autumn_warm 웨이브 하객룩 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.8
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 505044 | 하의/스커트 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female autumn_warm 웨이브 운동/활동 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.5
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083725 | 하의/팬츠 | 오렌지 | 노멀 | 29 | True | 벡터유사도:21 |
| 2 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female autumn_warm 웨이브 운동/활동 애슬레저

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.8
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 4 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female autumn_warm 웨이브 운동/활동 액티브

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.7
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 21 | False | 벡터유사도:21 |
| 6 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female autumn_warm 웨이브 운동/활동 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 517744 | 하의/팬츠 | 베이지 | 와이드 | 26 | True | 벡터유사도:21 |

### female autumn_warm 웨이브 운동/활동 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.0
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 520062 | 하의/팬츠 | 레드 | 와이드 | 27 | True | 벡터유사도:22 |
| 3 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 86054 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21 |
| 5 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female autumn_warm 웨이브 운동/활동 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.5
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76427 | 원피스/드레스 | 브라운 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 505044 | 하의/스커트 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female autumn_warm 웨이브 파티/모임 글램

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.8
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 26 | False | 벡터유사도:22, 계절:가디건 |
| 4 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 22 | False | 벡터유사도:22 |

### female autumn_warm 웨이브 파티/모임 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.0
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 26 | False | 벡터유사도:22, 계절:가디건 |
| 5 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |

### female autumn_warm 웨이브 파티/모임 트렌디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.7
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 505044 | 하의/스커트 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female autumn_warm 웨이브 파티/모임 로맨틱

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 35 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 117544 | 원피스/드레스 | 베이지 | 노멀 | 34 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 29 | True | 벡터유사도:22, 계절:가디건 |
| 4 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 25 | True | 벡터유사도:22 |
| 5 | 136931 | 상의/티셔츠 | 핑크 | 노멀 | 25 | True | 벡터유사도:22 |
| 6 | 77580 | 하의/스커트 | 베이지 | 와이드 | 25 | True | 벡터유사도:22 |

### female autumn_warm 웨이브 파티/모임 키치

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.2
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 505044 | 하의/스커트 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 111749 | 상의/티셔츠 | 와인 | 타이트 | 21 | False | 벡터유사도:21 |

### female autumn_warm 웨이브 파티/모임 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.3
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 26 | False | 벡터유사도:22, 계절:가디건 |
| 4 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 505044 | 하의/스커트 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female autumn_warm 내추럴 데일리 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 412009 | 상의/셔츠 | 퍼플 | 오버사이즈 | 40 | True | 벡터유사도:21, 색상:브라운, 계절:셔츠 |
| 2 | 113955 | 하의/팬츠 | 브라운 | 루즈 | 36 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 36 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 411391 | 상의/셔츠 | 퍼플 | 루즈 | 35 | True | 벡터유사도:21, 계절:셔츠 |
| 5 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 6 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 31 | True | 벡터유사도:21, 색상:브라운 |

### female autumn_warm 내추럴 데일리 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 412009 | 상의/셔츠 | 퍼플 | 오버사이즈 | 41 | True | 벡터유사도:22, 색상:브라운, 계절:셔츠 |
| 2 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 933014 | 원피스/드레스 | 브라운 | 루즈 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 411391 | 상의/셔츠 | 퍼플 | 루즈 | 36 | True | 벡터유사도:22, 계절:셔츠 |
| 5 | 105679 | 아우터/코트 | 핑크 | 루즈 | 32 | True | 벡터유사도:22 |
| 6 | 219658 | 하의/스커트 | 골드 | 와이드 | 32 | True | 벡터유사도:22 |

### female autumn_warm 내추럴 데일리 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 412009 | 상의/셔츠 | 퍼플 | 오버사이즈 | 35 | True | 벡터유사도:21, 색상:브라운, 계절:셔츠 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 6 | 505044 | 하의/스커트 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female autumn_warm 내추럴 데일리 러블리

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 130247 | 하의/스커트 | 베이지 | 루즈 | 32 | True | 벡터유사도:22 |
| 4 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 32 | True | 벡터유사도:22 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |

### female autumn_warm 내추럴 데일리 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 76427 | 원피스/드레스 | 브라운 | 노멀 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 31 | True | 벡터유사도:21 |
| 5 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 6 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |

### female autumn_warm 내추럴 데일리 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76427 | 원피스/드레스 | 브라운 | 노멀 | 36 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 38179 | 원피스/드레스 | 브라운 | 오버사이즈 | 36 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 32 | True | 벡터유사도:22 |
| 4 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 32 | True | 벡터유사도:22 |
| 5 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 6 | 105679 | 아우터/코트 | 핑크 | 루즈 | 26 | True | 벡터유사도:21 |

### female autumn_warm 내추럴 여행 리조트

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 7597 | 원피스/드레스 | 브라운 | 노멀 | 36 | True | 벡터유사도:23, 색상:브라운 |
| 2 | 38179 | 원피스/드레스 | 브라운 | 오버사이즈 | 36 | True | 벡터유사도:23, 색상:브라운 |
| 3 | 76427 | 원피스/드레스 | 브라운 | 노멀 | 36 | True | 벡터유사도:23, 색상:브라운 |
| 4 | 1167 | 원피스/드레스 | 브라운 | 루즈 | 36 | True | 벡터유사도:23, 색상:브라운 |
| 5 | 535205 | 원피스/드레스 | 화이트 | 루즈 | 31 | True | 벡터유사도:23 |
| 6 | 38252 | 원피스/드레스 | 베이지 | 루즈 | 31 | True | 벡터유사도:23 |

### female autumn_warm 내추럴 여행 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 38179 | 원피스/드레스 | 브라운 | 오버사이즈 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 76427 | 원피스/드레스 | 브라운 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 32 | True | 벡터유사도:22 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22 |
| 6 | 27246 | 상의/티셔츠 | 그레이 | 노멀 | 32 | True | 벡터유사도:22 |

### female autumn_warm 내추럴 여행 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76427 | 원피스/드레스 | 브라운 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 7597 | 원피스/드레스 | 브라운 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 27246 | 상의/티셔츠 | 그레이 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 32 | True | 벡터유사도:22 |
| 6 | 505044 | 하의/스커트 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |

### female autumn_warm 내추럴 여행 보헤미안

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 38179 | 원피스/드레스 | 브라운 | 오버사이즈 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 7597 | 원피스/드레스 | 브라운 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 56602 | 상의/블라우스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female autumn_warm 내추럴 여행 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 7597 | 원피스/드레스 | 브라운 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 38179 | 원피스/드레스 | 브라운 | 오버사이즈 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 27 | True | 벡터유사도:22 |

### female autumn_warm 내추럴 여행 포토제닉

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 7597 | 원피스/드레스 | 브라운 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 76427 | 원피스/드레스 | 브라운 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 88397 | 하의/스커트 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22 |
| 6 | 27246 | 상의/티셔츠 | 그레이 | 노멀 | 27 | True | 벡터유사도:22 |

### female autumn_warm 내추럴 데이트 러블리

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 계절:가디건 |
| 3 | 55772 | 원피스/드레스 | 블루 | 루즈 | 32 | True | 벡터유사도:22 |
| 4 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 32 | True | 벡터유사도:22 |
| 5 | 1214644 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 1217241 | 하의/스커트 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |

### female autumn_warm 내추럴 데이트 페미닌

- Source: `chroma_style_rag`
- Count: 6
- Average score: 37.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 40 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 240574 | 원피스/드레스 | 브라운 | 노멀 | 40 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 510906 | 상의/셔츠 | 화이트 | 노멀 | 39 | True | 벡터유사도:22, 계절:셔츠 |
| 4 | 91356 | 하의/스커트 | 화이트 | 와이드 | 35 | True | 벡터유사도:22 |
| 5 | 122940 | 상의/티셔츠 | 화이트 | 노멀 | 35 | True | 벡터유사도:22 |
| 6 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 35 | True | 벡터유사도:22 |

### female autumn_warm 내추럴 데이트 로맨틱

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 40 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 136931 | 상의/티셔츠 | 핑크 | 노멀 | 30 | True | 벡터유사도:22 |
| 4 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 30 | True | 벡터유사도:22 |
| 5 | 130247 | 하의/스커트 | 베이지 | 루즈 | 30 | True | 벡터유사도:22 |
| 6 | 105679 | 아우터/코트 | 핑크 | 루즈 | 30 | True | 벡터유사도:22 |

### female autumn_warm 내추럴 데이트 청순

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 1215905 | 상의/티셔츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 5 | 38046 | 상의/티셔츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22 |
| 6 | 1217241 | 하의/스커트 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female autumn_warm 내추럴 데이트 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 105679 | 아우터/코트 | 핑크 | 루즈 | 32 | True | 벡터유사도:22 |
| 2 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 76427 | 원피스/드레스 | 브라운 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 6 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 31 | True | 벡터유사도:22, 계절:셔츠 |

### female autumn_warm 내추럴 데이트 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 1231798 | 상의/티셔츠 | 화이트 | 루즈 | 27 | True | 벡터유사도:22 |
| 4 | 77580 | 하의/스커트 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 5 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 1215905 | 상의/티셔츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22 |

### female autumn_warm 내추럴 출근/면접 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.7
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 412009 | 상의/셔츠 | 퍼플 | 오버사이즈 | 30 | True | 벡터유사도:21, 색상:브라운, 계절:셔츠 |
| 2 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 933014 | 원피스/드레스 | 브라운 | 루즈 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 26 | True | 벡터유사도:21 |
| 5 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 26 | True | 벡터유사도:21 |
| 6 | 411391 | 상의/셔츠 | 퍼플 | 루즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |

### female autumn_warm 내추럴 출근/면접 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 412009 | 상의/셔츠 | 퍼플 | 오버사이즈 | 35 | True | 벡터유사도:21, 색상:브라운, 계절:셔츠 |
| 2 | 113955 | 하의/팬츠 | 브라운 | 루즈 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 411391 | 상의/셔츠 | 퍼플 | 루즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |
| 4 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22 |
| 5 | 46676 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 6 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |

### female autumn_warm 내추럴 출근/면접 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.5
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 114069 | 아우터/재킷 | 브라운 | 루즈 | 34 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 412009 | 상의/셔츠 | 퍼플 | 오버사이즈 | 30 | True | 벡터유사도:21, 색상:브라운, 계절:셔츠 |
| 3 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 29 | True | 벡터유사도:21 |
| 4 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 5 | 933014 | 원피스/드레스 | 브라운 | 루즈 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 6 | 411391 | 상의/셔츠 | 퍼플 | 루즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |

### female autumn_warm 내추럴 출근/면접 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 412009 | 상의/셔츠 | 퍼플 | 오버사이즈 | 30 | True | 벡터유사도:21, 색상:브라운, 계절:셔츠 |
| 2 | 96027 | 원피스/드레스 | 브라운 | 루즈 | 29 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 28 | True | 벡터유사도:21, 계절:셔츠 |
| 4 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 5 | 99215 | 하의/팬츠 | 화이트 | 와이드 | 25 | True | 벡터유사도:22 |
| 6 | 99214 | 하의/팬츠 | 화이트 | 와이드 | 25 | True | 벡터유사도:22 |

### female autumn_warm 내추럴 출근/면접 단정한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.8
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 412009 | 상의/셔츠 | 퍼플 | 오버사이즈 | 30 | True | 벡터유사도:21, 색상:브라운, 계절:셔츠 |
| 2 | 76427 | 원피스/드레스 | 브라운 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 411391 | 상의/셔츠 | 퍼플 | 루즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 5 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 21 | False | 벡터유사도:21 |
| 6 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 21 | False | 벡터유사도:21 |

### female autumn_warm 내추럴 출근/면접 소프트 오피스

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.5
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 7597 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 76427 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 130247 | 하의/스커트 | 베이지 | 루즈 | 22 | False | 벡터유사도:22 |
| 4 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 27246 | 상의/티셔츠 | 그레이 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |

### female autumn_warm 내추럴 하객룩 우아한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 38179 | 원피스/드레스 | 브라운 | 오버사이즈 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 4 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 5 | 130247 | 하의/스커트 | 베이지 | 루즈 | 26 | True | 벡터유사도:21 |
| 6 | 505044 | 하의/스커트 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |

### female autumn_warm 내추럴 하객룩 페미닌

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 35 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 117544 | 원피스/드레스 | 베이지 | 노멀 | 34 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 510906 | 상의/셔츠 | 화이트 | 노멀 | 33 | True | 벡터유사도:21, 계절:셔츠 |
| 4 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 30 | True | 벡터유사도:22 |
| 5 | 505044 | 하의/스커트 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |
| 6 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 30 | True | 벡터유사도:22 |

### female autumn_warm 내추럴 하객룩 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.8
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 114069 | 아우터/재킷 | 브라운 | 루즈 | 34 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 38216 | 원피스/드레스 | 브라운 | 오버사이즈 | 34 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 29 | True | 벡터유사도:21 |
| 4 | 38179 | 원피스/드레스 | 브라운 | 오버사이즈 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 5 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 22 | False | 벡터유사도:22 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female autumn_warm 내추럴 하객룩 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 96027 | 원피스/드레스 | 브라운 | 루즈 | 29 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 25 | True | 벡터유사도:22 |
| 4 | 99187 | 상의/티셔츠 | 골드 | 루즈 | 25 | True | 벡터유사도:22 |
| 5 | 99215 | 하의/팬츠 | 화이트 | 와이드 | 25 | True | 벡터유사도:22 |
| 6 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female autumn_warm 내추럴 하객룩 단아한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.3
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 412009 | 상의/셔츠 | 퍼플 | 오버사이즈 | 30 | True | 벡터유사도:21, 색상:브라운, 계절:셔츠 |
| 2 | 76427 | 원피스/드레스 | 브라운 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 7597 | 원피스/드레스 | 브라운 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 22 | False | 벡터유사도:22 |
| 5 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 21 | False | 벡터유사도:21 |
| 6 | 130247 | 하의/스커트 | 베이지 | 루즈 | 21 | False | 벡터유사도:21 |

### female autumn_warm 내추럴 하객룩 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.3
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 76427 | 원피스/드레스 | 브라운 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 22 | False | 벡터유사도:22 |
| 4 | 505044 | 하의/스커트 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 1116 | 상의/티셔츠 |  | 루즈 | 21 | False | 벡터유사도:21 |

### female autumn_warm 내추럴 운동/활동 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.5
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 1083725 | 하의/팬츠 | 오렌지 | 노멀 | 30 | True | 벡터유사도:22 |
| 3 | 539812 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 38179 | 원피스/드레스 | 브라운 | 오버사이즈 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 5 | 76427 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 6 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |

### female autumn_warm 내추럴 운동/활동 애슬레저

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 38179 | 원피스/드레스 | 브라운 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 76427 | 원피스/드레스 | 브라운 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 6 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 22 | False | 벡터유사도:22 |

### female autumn_warm 내추럴 운동/활동 액티브

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.2
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 38179 | 원피스/드레스 | 브라운 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 76427 | 원피스/드레스 | 브라운 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 130247 | 하의/스커트 | 베이지 | 루즈 | 22 | False | 벡터유사도:22 |
| 6 | 505044 | 하의/스커트 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female autumn_warm 내추럴 운동/활동 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 38179 | 원피스/드레스 | 브라운 | 오버사이즈 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 76427 | 원피스/드레스 | 브라운 | 노멀 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 122940 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22 |
| 6 | 523287 | 하의/팬츠 | 퍼플 | 와이드 | 27 | True | 벡터유사도:22 |

### female autumn_warm 내추럴 운동/활동 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 113955 | 하의/팬츠 | 브라운 | 루즈 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 31 | True | 벡터유사도:22, 계절:셔츠 |
| 5 | 82239 | 원피스/드레스 | 골드 | 루즈 | 27 | True | 벡터유사도:22 |
| 6 | 536260 | 원피스/드레스 | 베이지 | 오버사이즈 | 27 | True | 벡터유사도:22 |

### female autumn_warm 내추럴 운동/활동 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.0
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 38179 | 원피스/드레스 | 브라운 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 27246 | 상의/티셔츠 | 그레이 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 523287 | 하의/팬츠 | 퍼플 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 505044 | 하의/스커트 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female autumn_warm 내추럴 파티/모임 글램

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.7
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 505044 | 하의/스커트 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 22 | False | 벡터유사도:22 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female autumn_warm 내추럴 파티/모임 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22 |
| 2 | 76427 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 105679 | 아우터/코트 | 핑크 | 루즈 | 27 | True | 벡터유사도:22 |
| 5 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 22 | False | 벡터유사도:22 |
| 6 | 130247 | 하의/스커트 | 베이지 | 루즈 | 22 | False | 벡터유사도:22 |

### female autumn_warm 내추럴 파티/모임 트렌디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.7
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 74422 | 상의/블라우스 | 네온 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 88397 | 하의/스커트 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 505044 | 하의/스커트 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 508511 | 상의/블라우스 | 퍼플 | 노멀 | 22 | False | 벡터유사도:22 |

### female autumn_warm 내추럴 파티/모임 로맨틱

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 35 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 117544 | 원피스/드레스 | 베이지 | 노멀 | 35 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 1214644 | 상의/티셔츠 | 화이트 | 노멀 | 25 | True | 벡터유사도:22 |
| 4 | 122940 | 상의/티셔츠 | 화이트 | 노멀 | 25 | True | 벡터유사도:22 |
| 5 | 105679 | 아우터/코트 | 핑크 | 루즈 | 25 | True | 벡터유사도:22 |
| 6 | 130247 | 하의/스커트 | 베이지 | 루즈 | 25 | True | 벡터유사도:22 |

### female autumn_warm 내추럴 파티/모임 키치

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.0
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 38179 | 원피스/드레스 | 브라운 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 1155667 | 하의/스커트 | 레드 | 루즈 | 25 | True | 벡터유사도:22 |
| 4 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 88397 | 하의/스커트 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female autumn_warm 내추럴 파티/모임 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.2
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 974418 | 원피스/드레스 | 브라운 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 126784 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 25 | False | 벡터유사도:21, 계절:가디건 |
| 4 | 130247 | 하의/스커트 | 베이지 | 루즈 | 22 | False | 벡터유사도:22 |
| 5 | 27246 | 상의/티셔츠 | 그레이 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 219658 | 하의/스커트 | 골드 | 와이드 | 22 | False | 벡터유사도:22 |

### female winter_cool 스트레이트 데일리 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 36.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 41 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 4 | 41256 | 상의/니트웨어 | 화이트 | 타이트 | 36 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |

### female winter_cool 스트레이트 데일리 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 38.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 67243 | 원피스/드레스 | 베이지 | 노멀 | 37 | True | 벡터유사도:22, 색상:플럼 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 37 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 37 | True | 벡터유사도:22, 색상:화이트 |

### female winter_cool 스트레이트 데일리 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 36 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 4 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 32 | True | 벡터유사도:22, 색상:블랙 |

### female winter_cool 스트레이트 데일리 러블리

- Source: `chroma_style_rag`
- Count: 6
- Average score: 37.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 37 | True | 벡터유사도:22, 색상:블랙 |
| 3 | 296 | 원피스/드레스 | 네이비 | 타이트 | 37 | True | 벡터유사도:22, 색상:네이비 |
| 4 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 5 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 37 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 36 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |

### female winter_cool 스트레이트 데일리 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 296 | 원피스/드레스 | 네이비 | 타이트 | 32 | True | 벡터유사도:22, 색상:네이비 |
| 5 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 32 | True | 벡터유사도:22, 색상:블랙 |

### female winter_cool 스트레이트 데일리 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 36.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 3 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 36 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 32 | True | 벡터유사도:22, 색상:화이트 |

### female winter_cool 스트레이트 여행 리조트

- Source: `chroma_style_rag`
- Count: 6
- Average score: 36.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 41 | True | 벡터유사도:23, 색상:블랙, 색상:화이트 |
| 2 | 97884 | 원피스/드레스 | 블루 | 타이트 | 36 | True | 벡터유사도:23, 색상:화이트 |
| 3 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 36 | True | 벡터유사도:23, 색상:화이트 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 36 | True | 벡터유사도:23, 색상:화이트 |
| 5 | 509020 | 상의/블라우스 | 베이지 | 노멀 | 36 | True | 벡터유사도:23, 색상:화이트 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 31 | True | 벡터유사도:23 |

### female winter_cool 스트레이트 여행 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 37.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 509020 | 상의/블라우스 | 베이지 | 노멀 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |

### female winter_cool 스트레이트 여행 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 37.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 509020 | 상의/블라우스 | 베이지 | 노멀 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 3 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 535619 | 원피스/드레스 | 민트 | 노멀 | 32 | True | 벡터유사도:22 |

### female winter_cool 스트레이트 여행 보헤미안

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 509020 | 상의/블라우스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 3 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 28 | True | 벡터유사도:23 |
| 6 | 522243 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |

### female winter_cool 스트레이트 여행 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 37 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22 |

### female winter_cool 스트레이트 여행 포토제닉

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 3 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 509020 | 상의/블라우스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 12340 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female winter_cool 스트레이트 데이트 러블리

- Source: `chroma_style_rag`
- Count: 6
- Average score: 39.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 10
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 284 | 원피스/드레스 | 베이지 | 노멀 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:플럼 |
| 2 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 1162923 | 하의/스커트 | 블랙 | 노멀 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 4 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 37 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 6 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 37 | True | 벡터유사도:22, 색상:블랙 |

### female winter_cool 스트레이트 데이트 페미닌

- Source: `chroma_style_rag`
- Count: 6
- Average score: 41.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 332 | 원피스/드레스 | 블랙 | 노멀 | 45 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 45 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 510906 | 상의/셔츠 | 화이트 | 노멀 | 44 | True | 벡터유사도:22, 색상:화이트, 계절:셔츠 |
| 4 | 506200 | 상의/니트웨어 | 화이트 | 노멀 | 40 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 91356 | 하의/스커트 | 화이트 | 와이드 | 40 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 505044 | 하의/스커트 | 베이지 | 노멀 | 35 | True | 벡터유사도:22 |

### female winter_cool 스트레이트 데이트 로맨틱

- Source: `chroma_style_rag`
- Count: 6
- Average score: 36.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 166265 | 원피스/드레스 | 화이트 | 노멀 | 40 | True | 벡터유사도:22, 색상:화이트 |
| 3 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 4 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 35 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:화이트 |

### female winter_cool 스트레이트 데이트 청순

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 296 | 원피스/드레스 | 네이비 | 타이트 | 32 | True | 벡터유사도:22, 색상:네이비 |
| 4 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 32 | True | 벡터유사도:22, 색상:블랙 |

### female winter_cool 스트레이트 데이트 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 1162923 | 하의/스커트 | 블랙 | 노멀 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |

### female winter_cool 스트레이트 데이트 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 10
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 284 | 원피스/드레스 | 베이지 | 노멀 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:플럼 |
| 4 | 1162923 | 하의/스커트 | 블랙 | 노멀 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 5 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 32 | True | 벡터유사도:22, 색상:블랙 |

### female winter_cool 스트레이트 출근/면접 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 296 | 원피스/드레스 | 네이비 | 타이트 | 27 | True | 벡터유사도:22, 색상:네이비 |
| 6 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |

### female winter_cool 스트레이트 출근/면접 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 36 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 1174459 | 상의/셔츠 | 레드 | 노멀 | 35 | True | 벡터유사도:21, 색상:네이비, 계절:셔츠 |
| 3 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 4 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 296 | 원피스/드레스 | 네이비 | 타이트 | 27 | True | 벡터유사도:22, 색상:네이비 |

### female winter_cool 스트레이트 출근/면접 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 26 | True | 벡터유사도:21, 색상:화이트 |

### female winter_cool 스트레이트 출근/면접 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 35 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 4 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 29 | True | 벡터유사도:22, 계절:셔츠 |
| 5 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 296 | 원피스/드레스 | 네이비 | 타이트 | 27 | True | 벡터유사도:22, 색상:네이비 |

### female winter_cool 스트레이트 출근/면접 단정한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 296 | 원피스/드레스 | 네이비 | 타이트 | 27 | True | 벡터유사도:22, 색상:네이비 |
| 5 | 501339 | 하의/청바지 | 네이비 | 와이드 | 26 | True | 벡터유사도:21, 색상:네이비 |
| 6 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 26 | True | 벡터유사도:21, 색상:화이트 |

### female winter_cool 스트레이트 출근/면접 소프트 오피스

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 27 | True | 벡터유사도:22, 색상:화이트 |

### female winter_cool 스트레이트 하객룩 우아한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 3 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 4 | 505044 | 하의/스커트 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 6 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 26 | True | 벡터유사도:21, 색상:블랙 |

### female winter_cool 스트레이트 하객룩 페미닌

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 40 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 510906 | 상의/셔츠 | 화이트 | 노멀 | 38 | True | 벡터유사도:21, 색상:화이트, 계절:셔츠 |
| 3 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 35 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 35 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 6 | 219658 | 하의/스커트 | 골드 | 와이드 | 30 | True | 벡터유사도:22 |

### female winter_cool 스트레이트 하객룩 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 34 | True | 벡터유사도:21, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 4 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |

### female winter_cool 스트레이트 하객룩 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 35 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 4 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 29 | True | 벡터유사도:22, 계절:셔츠 |
| 5 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |

### female winter_cool 스트레이트 하객룩 단아한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 296 | 원피스/드레스 | 네이비 | 타이트 | 27 | True | 벡터유사도:22, 색상:네이비 |
| 4 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 5 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 6 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |

### female winter_cool 스트레이트 하객룩 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 296 | 원피스/드레스 | 네이비 | 타이트 | 27 | True | 벡터유사도:22, 색상:네이비 |
| 4 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 501339 | 하의/청바지 | 네이비 | 와이드 | 26 | True | 벡터유사도:21, 색상:네이비 |

### female winter_cool 스트레이트 운동/활동 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 2 | 81956 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 3 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 4 | 296 | 원피스/드레스 | 네이비 | 타이트 | 27 | True | 벡터유사도:22, 색상:네이비 |
| 5 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 117821 | 원피스/드레스 | 스카이블루 | 노멀 | 22 | False | 벡터유사도:22 |

### female winter_cool 스트레이트 운동/활동 애슬레저

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.0
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 90054 | 하의/팬츠 | 블랙 | 벨보텀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 80007 | 원피스/드레스 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### female winter_cool 스트레이트 운동/활동 액티브

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 296 | 원피스/드레스 | 네이비 | 타이트 | 27 | True | 벡터유사도:22, 색상:네이비 |
| 6 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 26 | True | 벡터유사도:21, 색상:화이트 |

### female winter_cool 스트레이트 운동/활동 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 36 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 520010 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 296 | 원피스/드레스 | 네이비 | 타이트 | 32 | True | 벡터유사도:22, 색상:네이비 |

### female winter_cool 스트레이트 운동/활동 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 112153 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 3 | 6416 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 1084451 | 하의/팬츠 | 그레이 | 노멀 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 296 | 원피스/드레스 | 네이비 | 타이트 | 32 | True | 벡터유사도:22, 색상:네이비 |
| 6 | 80007 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female winter_cool 스트레이트 운동/활동 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 296 | 원피스/드레스 | 네이비 | 타이트 | 27 | True | 벡터유사도:22, 색상:네이비 |
| 5 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 26 | True | 벡터유사도:21, 색상:화이트 |

### female winter_cool 스트레이트 파티/모임 글램

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 26 | True | 벡터유사도:21, 색상:화이트 |

### female winter_cool 스트레이트 파티/모임 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 296 | 원피스/드레스 | 네이비 | 타이트 | 27 | True | 벡터유사도:22, 색상:네이비 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 27 | True | 벡터유사도:22, 색상:화이트 |

### female winter_cool 스트레이트 파티/모임 트렌디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.7
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 296 | 원피스/드레스 | 네이비 | 타이트 | 27 | True | 벡터유사도:22, 색상:네이비 |
| 5 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 219658 | 하의/스커트 | 골드 | 와이드 | 22 | False | 벡터유사도:22 |

### female winter_cool 스트레이트 파티/모임 로맨틱

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.0
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 166265 | 원피스/드레스 | 화이트 | 노멀 | 35 | True | 벡터유사도:22, 색상:화이트 |
| 3 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |

### female winter_cool 스트레이트 파티/모임 키치

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 501339 | 하의/청바지 | 네이비 | 와이드 | 26 | True | 벡터유사도:21, 색상:네이비 |

### female winter_cool 스트레이트 파티/모임 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.7
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 296 | 원피스/드레스 | 네이비 | 타이트 | 27 | True | 벡터유사도:22, 색상:네이비 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 219658 | 하의/스커트 | 골드 | 와이드 | 22 | False | 벡터유사도:22 |

### female winter_cool 웨이브 데일리 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 41 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 41 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 4 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 5 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 6 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |

### female winter_cool 웨이브 데일리 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 39.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 42 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 41 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 4 | 296 | 원피스/드레스 | 네이비 | 타이트 | 37 | True | 벡터유사도:22, 색상:네이비 |
| 5 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 36 | True | 벡터유사도:21, 색상:블랙 |
| 6 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 36 | True | 벡터유사도:21, 색상:블랙 |

### female winter_cool 웨이브 데일리 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 36 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 9130 | 하의/팬츠 | 블랙 | 와이드 | 36 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 166265 | 원피스/드레스 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:화이트 |
| 4 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 5 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |

### female winter_cool 웨이브 데일리 러블리

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 99679 | 원피스/드레스 | 네이비 | 노멀 | 36 | True | 벡터유사도:21, 색상:네이비 |
| 4 | 166265 | 원피스/드레스 | 화이트 | 노멀 | 36 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 31 | True | 벡터유사도:21 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 31 | True | 벡터유사도:21 |

### female winter_cool 웨이브 데일리 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 36 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 4 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 5 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |

### female winter_cool 웨이브 데일리 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 41 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 41 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 31 | True | 벡터유사도:21, 색상:화이트 |
| 4 | 166265 | 원피스/드레스 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |

### female winter_cool 웨이브 여행 리조트

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 40 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 36 | True | 벡터유사도:23, 색상:화이트 |
| 3 | 97884 | 원피스/드레스 | 블루 | 타이트 | 36 | True | 벡터유사도:23, 색상:화이트 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 30 | True | 벡터유사도:22 |
| 5 | 79124 | 원피스/드레스 | 네이비 | 노멀 | 35 | True | 벡터유사도:22, 색상:네이비 |
| 6 | 535765 | 원피스/드레스 | 베이지 | 노멀 | 31 | True | 벡터유사도:23 |

### female winter_cool 웨이브 여행 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 37.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 42 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 97884 | 원피스/드레스 | 블루 | 타이트 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |

### female winter_cool 웨이브 여행 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 38.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 42 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 97884 | 원피스/드레스 | 블루 | 타이트 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 75776 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 42 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |

### female winter_cool 웨이브 여행 보헤미안

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 2 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 3 | 1086120 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 111561 | 하의/스커트 | 베이지 |  | 27 | True | 벡터유사도:22 |
| 5 | 1084973 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 80007 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female winter_cool 웨이브 여행 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 75776 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 97884 | 원피스/드레스 | 블루 | 타이트 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |

### female winter_cool 웨이브 여행 포토제닉

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 97884 | 원피스/드레스 | 블루 | 타이트 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 6 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:화이트 |

### female winter_cool 웨이브 데이트 러블리

- Source: `chroma_style_rag`
- Count: 6
- Average score: 37.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 99679 | 원피스/드레스 | 네이비 | 노멀 | 37 | True | 벡터유사도:22, 색상:네이비 |
| 3 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 37 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 5 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 6 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 37 | True | 벡터유사도:22, 색상:블랙 |

### female winter_cool 웨이브 데이트 페미닌

- Source: `chroma_style_rag`
- Count: 6
- Average score: 40.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 45 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 510906 | 상의/셔츠 | 화이트 | 노멀 | 43 | True | 벡터유사도:21, 색상:화이트, 계절:셔츠 |
| 3 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 40 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 40 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 91356 | 하의/스커트 | 화이트 | 와이드 | 39 | True | 벡터유사도:21, 색상:화이트 |
| 6 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 36 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |

### female winter_cool 웨이브 데이트 로맨틱

- Source: `chroma_style_rag`
- Count: 6
- Average score: 37.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 624902 | 원피스/드레스 | 화이트 | 노멀 | 40 | True | 벡터유사도:22, 색상:화이트 |
| 3 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 4 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 5 | 122940 | 상의/티셔츠 | 화이트 | 노멀 | 35 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 35 | True | 벡터유사도:22, 색상:화이트 |

### female winter_cool 웨이브 데이트 청순

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 166265 | 원피스/드레스 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:화이트 |
| 4 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 31 | True | 벡터유사도:22, 계절:가디건 |
| 5 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 31 | True | 벡터유사도:21, 색상:화이트 |
| 6 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 31 | True | 벡터유사도:21, 색상:블랙 |

### female winter_cool 웨이브 데이트 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 166265 | 원피스/드레스 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### female winter_cool 웨이브 데이트 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 3 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 31 | True | 벡터유사도:21, 색상:블랙 |
| 5 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 31 | True | 벡터유사도:22, 계절:가디건 |
| 6 | 166265 | 원피스/드레스 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:화이트 |

### female winter_cool 웨이브 출근/면접 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 4 | 296 | 원피스/드레스 | 네이비 | 타이트 | 26 | True | 벡터유사도:21, 색상:네이비 |
| 5 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 6 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |

### female winter_cool 웨이브 출근/면접 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.3
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 36 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 36 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 5 | 296 | 원피스/드레스 | 네이비 | 타이트 | 26 | True | 벡터유사도:21, 색상:네이비 |
| 6 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female winter_cool 웨이브 출근/면접 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.5
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 34 | True | 벡터유사도:21, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 166265 | 원피스/드레스 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 4 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female winter_cool 웨이브 출근/면접 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.0
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 34 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 70819 | 상의/티셔츠 | 블랙 | 노멀 | 29 | True | 벡터유사도:21, 색상:블랙 |
| 4 | 166265 | 원피스/드레스 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female winter_cool 웨이브 출근/면접 단정한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.8
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 166265 | 원피스/드레스 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 4 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 25 | False | 벡터유사도:21, 계절:가디건 |
| 5 | 535765 | 원피스/드레스 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female winter_cool 웨이브 출근/면접 소프트 오피스

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 10
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 4 | 166265 | 원피스/드레스 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 6 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |

### female winter_cool 웨이브 하객룩 우아한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 166265 | 원피스/드레스 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 97884 | 원피스/드레스 | 블루 | 타이트 | 31 | True | 벡터유사도:21, 색상:화이트 |
| 4 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |

### female winter_cool 웨이브 하객룩 페미닌

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 39 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 296 | 원피스/드레스 | 네이비 | 타이트 | 35 | True | 벡터유사도:22, 색상:네이비 |
| 3 | 122940 | 상의/티셔츠 | 화이트 | 노멀 | 34 | True | 벡터유사도:21, 색상:화이트 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 34 | True | 벡터유사도:21, 색상:블랙 |
| 5 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 6 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |

### female winter_cool 웨이브 하객룩 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.0
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 34 | True | 벡터유사도:21, 색상:화이트 |
| 2 | 523354 | 하의/팬츠 | 화이트 | 와이드 | 34 | True | 벡터유사도:21, 색상:화이트 |
| 3 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 4 | 166265 | 원피스/드레스 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female winter_cool 웨이브 하객룩 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 35 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 166265 | 원피스/드레스 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 4 | 46676 | 원피스/드레스 | 베이지 | 노멀 | 24 | True | 벡터유사도:21 |
| 5 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female winter_cool 웨이브 하객룩 단아한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.2
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 2 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 166265 | 원피스/드레스 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 4 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female winter_cool 웨이브 하객룩 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.0
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 4 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female winter_cool 웨이브 운동/활동 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.2
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 40 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 31 | True | 벡터유사도:21, 색상:블랙 |
| 4 | 69367 | 상의/티셔츠 | 네이비 | 노멀 | 31 | True | 벡터유사도:21, 색상:네이비 |
| 5 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female winter_cool 웨이브 운동/활동 애슬레저

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.0
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 4 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 5 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female winter_cool 웨이브 운동/활동 액티브

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.8
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 4 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 5 | 296 | 원피스/드레스 | 네이비 | 타이트 | 26 | True | 벡터유사도:21, 색상:네이비 |
| 6 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female winter_cool 웨이브 운동/활동 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 36 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 1082406 | 상의/티셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:화이트 |
| 4 | 69367 | 상의/티셔츠 | 네이비 | 노멀 | 31 | True | 벡터유사도:21, 색상:네이비 |
| 5 | 79148 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 6 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |

### female winter_cool 웨이브 운동/활동 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.0
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 69367 | 상의/티셔츠 | 네이비 | 노멀 | 27 | True | 벡터유사도:22, 색상:네이비 |
| 4 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 5 | 114998 | 원피스/드레스 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:화이트 |

### female winter_cool 웨이브 운동/활동 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.8
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 2 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 4 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 539812 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 6 | 536150 | 원피스/드레스 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female winter_cool 웨이브 파티/모임 글램

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.8
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 2 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 4 | 166265 | 원피스/드레스 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female winter_cool 웨이브 파티/모임 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female winter_cool 웨이브 파티/모임 트렌디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 4 | 296 | 원피스/드레스 | 네이비 | 타이트 | 27 | True | 벡터유사도:22, 색상:네이비 |
| 5 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 6 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |

### female winter_cool 웨이브 파티/모임 로맨틱

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 36 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 166265 | 원피스/드레스 | 화이트 | 노멀 | 34 | True | 벡터유사도:21, 색상:화이트 |
| 3 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 4 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 5 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 29 | True | 벡터유사도:22, 계절:가디건 |
| 6 | 122940 | 상의/티셔츠 | 화이트 | 노멀 | 29 | True | 벡터유사도:21, 색상:화이트 |

### female winter_cool 웨이브 파티/모임 키치

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.8
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 4 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### female winter_cool 웨이브 파티/모임 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 2 | 451000 | 원피스/드레스 | 블랙 | 타이트 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 4 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 6 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |

### female winter_cool 내추럴 데일리 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 41 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 2 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 41 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 35 | True | 벡터유사도:21, 계절:셔츠 |
| 4 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 46365 | 원피스/드레스 | 베이지 | 루즈 | 31 | True | 벡터유사도:21, 색상:네이비 |
| 6 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 31 | True | 벡터유사도:21, 색상:블랙 |

### female winter_cool 내추럴 데일리 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 38.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 42 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 3 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 37 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 70071 | 원피스/드레스 | 베이지 | 루즈 | 37 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 1148 | 상의/티셔츠 | 화이트 | 루즈 | 36 | True | 벡터유사도:21, 색상:화이트 |

### female winter_cool 내추럴 데일리 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 36 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 2 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 36 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 80309 | 원피스/드레스 | 네이비 | 루즈 | 31 | True | 벡터유사도:21, 색상:네이비 |
| 4 | 78954 | 원피스/드레스 | 베이지 | 루즈 | 31 | True | 벡터유사도:21, 색상:블랙 |
| 5 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 31 | True | 벡터유사도:21, 색상:블랙 |
| 6 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:화이트 |

### female winter_cool 내추럴 데일리 러블리

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 78954 | 원피스/드레스 | 베이지 | 루즈 | 36 | True | 벡터유사도:21, 색상:블랙 |
| 2 | 80309 | 원피스/드레스 | 네이비 | 루즈 | 36 | True | 벡터유사도:21, 색상:네이비 |
| 3 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 36 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 4 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 36 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 5 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 36 | True | 벡터유사도:21, 색상:블랙 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 31 | True | 벡터유사도:21 |

### female winter_cool 내추럴 데일리 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 41 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 70071 | 원피스/드레스 | 베이지 | 루즈 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 31 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 31 | True | 벡터유사도:21, 색상:블랙 |
| 6 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:화이트 |

### female winter_cool 내추럴 데일리 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 37.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 41 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 2 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 41 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 130916 | 원피스/드레스 | 블루 | 오버사이즈 | 36 | True | 벡터유사도:21, 색상:화이트 |
| 4 | 46365 | 원피스/드레스 | 베이지 | 루즈 | 36 | True | 벡터유사도:21, 색상:네이비 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 36 | True | 벡터유사도:21, 색상:화이트 |
| 6 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 36 | True | 벡터유사도:21, 색상:블랙 |

### female winter_cool 내추럴 여행 리조트

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 131956 | 원피스/드레스 | 네이비 | 루즈 | 41 | True | 벡터유사도:23, 색상:네이비, 색상:화이트 |
| 2 | 120932 | 원피스/드레스 | 블랙 | 루즈 | 41 | True | 벡터유사도:23, 색상:블랙, 색상:화이트 |
| 3 | 81941 | 상의/티셔츠 | 퍼플 | 오버사이즈 | 36 | True | 벡터유사도:23, 색상:화이트 |
| 4 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 31 | True | 벡터유사도:23 |
| 5 | 523287 | 하의/팬츠 | 퍼플 | 와이드 | 31 | True | 벡터유사도:23 |
| 6 | 74368 | 아우터/재킷 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |

### female winter_cool 내추럴 여행 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 37.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 38223 | 원피스/드레스 | 블랙 | 루즈 | 37 | True | 벡터유사도:22, 색상:블랙 |
| 3 | 130932 | 원피스/드레스 | 블루 | 오버사이즈 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 37 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 130247 | 하의/스커트 | 베이지 | 루즈 | 32 | True | 벡터유사도:22 |

### female winter_cool 내추럴 여행 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 37.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 38223 | 원피스/드레스 | 블랙 | 루즈 | 37 | True | 벡터유사도:22, 색상:블랙 |
| 3 | 130745 | 상의/티셔츠 | 화이트 | 오버사이즈 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 99696 | 원피스/드레스 | 네이비 | 오버사이즈 | 37 | True | 벡터유사도:22, 색상:네이비 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 32 | True | 벡터유사도:22 |

### female winter_cool 내추럴 여행 보헤미안

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 2 | 81221 | 원피스/드레스 | 블랙 | 루즈 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 3 | 46365 | 원피스/드레스 | 베이지 | 루즈 | 32 | True | 벡터유사도:22, 색상:네이비 |
| 4 | 69367 | 상의/티셔츠 | 네이비 | 노멀 | 32 | True | 벡터유사도:22, 색상:네이비 |
| 5 | 509020 | 상의/블라우스 | 베이지 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 111561 | 하의/스커트 | 베이지 |  | 27 | True | 벡터유사도:22 |

### female winter_cool 내추럴 여행 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 2 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 37 | True | 벡터유사도:22, 색상:블랙 |
| 3 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 4 | 70071 | 원피스/드레스 | 베이지 | 루즈 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 46365 | 원피스/드레스 | 베이지 | 루즈 | 32 | True | 벡터유사도:22, 색상:네이비 |
| 6 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:화이트 |

### female winter_cool 내추럴 여행 포토제닉

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 70071 | 원피스/드레스 | 베이지 | 루즈 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 3 | 99696 | 원피스/드레스 | 네이비 | 오버사이즈 | 32 | True | 벡터유사도:22, 색상:네이비 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 32 | True | 벡터유사도:22, 색상:블랙 |

### female winter_cool 내추럴 데이트 러블리

- Source: `chroma_style_rag`
- Count: 6
- Average score: 37.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 71432 | 상의/티셔츠 | 네이비 | 노멀 | 42 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 78876 | 원피스/드레스 | 스카이블루 | 노멀 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 37 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 99679 | 원피스/드레스 | 네이비 | 노멀 | 37 | True | 벡터유사도:22, 색상:네이비 |
| 6 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |

### female winter_cool 내추럴 데이트 페미닌

- Source: `chroma_style_rag`
- Count: 6
- Average score: 41.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 510906 | 상의/셔츠 | 화이트 | 노멀 | 44 | True | 벡터유사도:22, 색상:화이트, 계절:셔츠 |
| 2 | 86316 | 아우터/가디건 | 블랙 | 루즈 | 43 | True | 벡터유사도:21, 색상:블랙, 계절:가디건 |
| 3 | 86312 | 아우터/가디건 | 블랙 | 루즈 | 43 | True | 벡터유사도:21, 색상:블랙, 계절:가디건 |
| 4 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 40 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 91356 | 하의/스커트 | 화이트 | 와이드 | 40 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 40 | True | 벡터유사도:22, 색상:화이트 |

### female winter_cool 내추럴 데이트 로맨틱

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 78932 | 원피스/드레스 | 스카이블루 | 노멀 | 40 | True | 벡터유사도:22, 색상:화이트 |
| 2 | 78954 | 원피스/드레스 | 베이지 | 루즈 | 40 | True | 벡터유사도:22, 색상:블랙 |
| 3 | 1214644 | 상의/티셔츠 | 화이트 | 노멀 | 35 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 35 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 34 | True | 벡터유사도:22, 계절:가디건 |
| 6 | 1217241 | 하의/스커트 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |

### female winter_cool 내추럴 데이트 청순

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 36 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 46365 | 원피스/드레스 | 베이지 | 루즈 | 32 | True | 벡터유사도:22, 색상:네이비 |
| 4 | 70071 | 원피스/드레스 | 베이지 | 루즈 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 31 | True | 벡터유사도:22, 계절:셔츠 |

### female winter_cool 내추럴 데이트 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 12523 | 하의/팬츠 | 블랙 | 루즈 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 3 | 38223 | 원피스/드레스 | 블랙 | 루즈 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 81221 | 원피스/드레스 | 블랙 | 루즈 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 130745 | 상의/티셔츠 | 화이트 | 오버사이즈 | 32 | True | 벡터유사도:22, 색상:화이트 |

### female winter_cool 내추럴 데이트 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 36 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 46365 | 원피스/드레스 | 베이지 | 루즈 | 32 | True | 벡터유사도:22, 색상:네이비 |
| 4 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 70071 | 원피스/드레스 | 베이지 | 루즈 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:화이트 |

### female winter_cool 내추럴 출근/면접 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 31 | True | 벡터유사도:21, 색상:화이트 |
| 4 | 81941 | 상의/티셔츠 | 퍼플 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 6 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |

### female winter_cool 내추럴 출근/면접 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 10
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 36 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 2 | 86573 | 상의/티셔츠 | 화이트 | 오버사이즈 | 36 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 36 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 4 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 35 | True | 벡터유사도:21, 색상:화이트, 계절:셔츠 |
| 5 | 46651 | 원피스/드레스 | 네이비 | 루즈 | 31 | True | 벡터유사도:21, 색상:네이비 |
| 6 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |

### female winter_cool 내추럴 출근/면접 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 34 | True | 벡터유사도:21, 색상:화이트 |
| 2 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 34 | True | 벡터유사도:21, 색상:화이트 |
| 3 | 1088635 | 원피스/점프수트 | 네이비 | 루즈 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 4 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 5 | 86573 | 상의/티셔츠 | 화이트 | 오버사이즈 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 6 | 976976 | 아우터/재킷 | 스카이블루 | 루즈 | 29 | True | 벡터유사도:21 |

### female winter_cool 내추럴 출근/면접 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 86573 | 상의/티셔츠 | 화이트 | 오버사이즈 | 35 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 35 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 4 | 38001 | 원피스/드레스 | 베이지 | 루즈 | 29 | True | 벡터유사도:21, 색상:블랙 |
| 5 | 46651 | 원피스/드레스 | 네이비 | 루즈 | 29 | True | 벡터유사도:21, 색상:네이비 |
| 6 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 28 | True | 벡터유사도:21, 계절:셔츠 |

### female winter_cool 내추럴 출근/면접 단정한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 4 | 78954 | 원피스/드레스 | 베이지 | 루즈 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 5 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 6 | 80309 | 원피스/드레스 | 네이비 | 루즈 | 26 | True | 벡터유사도:21, 색상:네이비 |

### female winter_cool 내추럴 출근/면접 소프트 오피스

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1088635 | 원피스/점프수트 | 네이비 | 루즈 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 501923 | 하의/팬츠 | 화이트 | 루즈 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 6 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 26 | True | 벡터유사도:21, 색상:화이트 |

### female winter_cool 내추럴 하객룩 우아한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.3
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 70071 | 원피스/드레스 | 베이지 | 루즈 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 2 | 166265 | 원피스/드레스 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:화이트 |
| 3 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 4 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 5 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 6 | 92156 | 아우터/가디건 | 네온 | 노멀 | 25 | False | 벡터유사도:21, 계절:가디건 |

### female winter_cool 내추럴 하객룩 페미닌

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 510906 | 상의/셔츠 | 화이트 | 노멀 | 38 | True | 벡터유사도:21, 색상:화이트, 계절:셔츠 |
| 2 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 35 | True | 벡터유사도:22, 색상:화이트 |
| 3 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 34 | True | 벡터유사도:21, 색상:블랙 |
| 4 | 34079 | 원피스/드레스 | 블랙 | 루즈 | 34 | True | 벡터유사도:21, 색상:블랙 |
| 5 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 6 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 30 | True | 벡터유사도:22 |

### female winter_cool 내추럴 하객룩 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 34 | True | 벡터유사도:21, 색상:화이트 |
| 2 | 86573 | 상의/티셔츠 | 화이트 | 오버사이즈 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 4 | 130932 | 원피스/드레스 | 블루 | 오버사이즈 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 46365 | 원피스/드레스 | 베이지 | 루즈 | 27 | True | 벡터유사도:22, 색상:네이비 |
| 6 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |

### female winter_cool 내추럴 하객룩 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 35 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 86573 | 상의/티셔츠 | 화이트 | 오버사이즈 | 35 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 4 | 46651 | 원피스/드레스 | 네이비 | 루즈 | 30 | True | 벡터유사도:22, 색상:네이비 |
| 5 | 116026 | 원피스/드레스 | 화이트 | 루즈 | 29 | True | 벡터유사도:21, 색상:화이트 |
| 6 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 28 | True | 벡터유사도:21, 계절:셔츠 |

### female winter_cool 내추럴 하객룩 단아한

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 70071 | 원피스/드레스 | 베이지 | 루즈 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 4 | 130916 | 원피스/드레스 | 블루 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 6 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |

### female winter_cool 내추럴 하객룩 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 70071 | 원피스/드레스 | 베이지 | 루즈 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 6 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |

### female winter_cool 내추럴 운동/활동 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083548 | 상의/티셔츠 | 화이트 | 루즈 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 2 | 69367 | 상의/티셔츠 | 네이비 | 노멀 | 32 | True | 벡터유사도:22, 색상:네이비 |
| 3 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 4 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 5 | 99696 | 원피스/드레스 | 네이비 | 오버사이즈 | 27 | True | 벡터유사도:22, 색상:네이비 |
| 6 | 70071 | 원피스/드레스 | 베이지 | 루즈 | 27 | True | 벡터유사도:22, 색상:블랙 |

### female winter_cool 내추럴 운동/활동 애슬레저

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 70071 | 원피스/드레스 | 베이지 | 루즈 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 81941 | 상의/티셔츠 | 퍼플 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 99696 | 원피스/드레스 | 네이비 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:네이비 |
| 6 | 17194 | 상의/티셔츠 | 네이비 | 루즈 | 26 | True | 벡터유사도:21, 색상:네이비 |

### female winter_cool 내추럴 운동/활동 액티브

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.0
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083548 | 상의/티셔츠 | 화이트 | 루즈 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 4 | 70071 | 원피스/드레스 | 베이지 | 루즈 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 5 | 99696 | 원피스/드레스 | 네이비 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:네이비 |
| 6 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 22 | False | 벡터유사도:22 |

### female winter_cool 내추럴 운동/활동 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 10
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 36 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 2 | 86573 | 상의/티셔츠 | 화이트 | 오버사이즈 | 36 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 36 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 4 | 1083548 | 상의/티셔츠 | 화이트 | 루즈 | 36 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 5 | 70071 | 원피스/드레스 | 베이지 | 루즈 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 130932 | 원피스/드레스 | 블루 | 오버사이즈 | 31 | True | 벡터유사도:21, 색상:화이트 |

### female winter_cool 내추럴 운동/활동 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 105573 | 상의/티셔츠 | 화이트 | 루즈 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 3 | 522113 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 70071 | 원피스/드레스 | 베이지 | 루즈 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 82239 | 원피스/드레스 | 골드 | 루즈 | 27 | True | 벡터유사도:22 |

### female winter_cool 내추럴 운동/활동 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 130916 | 원피스/드레스 | 블루 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 4 | 130902 | 원피스/드레스 | 레드 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 520214 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 6 | 130745 | 상의/티셔츠 | 화이트 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:화이트 |

### female winter_cool 내추럴 파티/모임 글램

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 70071 | 원피스/드레스 | 베이지 | 루즈 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 6 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |

### female winter_cool 내추럴 파티/모임 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 70071 | 원피스/드레스 | 베이지 | 루즈 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 6 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |

### female winter_cool 내추럴 파티/모임 트렌디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.2
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 70071 | 원피스/드레스 | 베이지 | 루즈 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 2 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 3 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 509020 | 상의/블라우스 | 베이지 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 22 | False | 벡터유사도:22 |

### female winter_cool 내추럴 파티/모임 로맨틱

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 99696 | 원피스/드레스 | 네이비 | 오버사이즈 | 35 | True | 벡터유사도:22, 색상:네이비 |
| 2 | 78954 | 원피스/드레스 | 베이지 | 루즈 | 35 | True | 벡터유사도:22, 색상:블랙 |
| 3 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 29 | True | 벡터유사도:21, 색상:화이트 |
| 4 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 29 | True | 벡터유사도:22, 계절:가디건 |
| 5 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 25 | True | 벡터유사도:22 |

### female winter_cool 내추럴 파티/모임 키치

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 81221 | 원피스/드레스 | 블랙 | 루즈 | 30 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 70071 | 원피스/드레스 | 베이지 | 루즈 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 6 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |

### female winter_cool 내추럴 파티/모임 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 7492 | 원피스/드레스 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 536132 | 원피스/드레스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |

### male spring_warm 스트레이트 데일리 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1085815 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 2 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 3 | 70375 | 상의/니트웨어 | 베이지 | 타이트 | 32 | True | 벡터유사도:22 |
| 4 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22 |
| 5 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22 |
| 6 | 104948 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |

### male spring_warm 스트레이트 데일리 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22 |
| 2 | 522243 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 3 | 526164 | 상의/티셔츠 | 그린 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 70375 | 상의/니트웨어 | 베이지 | 타이트 | 32 | True | 벡터유사도:22 |
| 5 | 27749 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 1041004 | 하의/청바지 | 블루 | 벨보텀 | 32 | True | 벡터유사도:22 |

### male spring_warm 스트레이트 데일리 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 70375 | 상의/니트웨어 | 베이지 | 타이트 | 27 | True | 벡터유사도:22 |
| 2 | 517744 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 3 | 19327 | 하의/팬츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22 |
| 5 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 27749 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male spring_warm 스트레이트 데일리 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 33 | True | 벡터유사도:23 |
| 2 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 3 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 32 | True | 벡터유사도:22 |
| 4 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 520062 | 하의/팬츠 | 레드 | 와이드 | 32 | True | 벡터유사도:22 |
| 6 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |

### male spring_warm 스트레이트 데일리 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 34 | True | 벡터유사도:22, 계절:셔츠 |
| 2 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 30 | True | 벡터유사도:22 |
| 3 | 69475 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 4 | 70375 | 상의/니트웨어 | 베이지 | 타이트 | 27 | True | 벡터유사도:22 |
| 5 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 522106 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |

### male spring_warm 스트레이트 데일리 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 22576 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 2 | 522106 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 3 | 70375 | 상의/니트웨어 | 베이지 | 타이트 | 32 | True | 벡터유사도:22 |
| 4 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 130431 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 6 | 1085815 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |

### male spring_warm 스트레이트 여행 리조트

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 69475 | 하의/팬츠 | 베이지 | 와이드 | 31 | True | 벡터유사도:23 |
| 2 | 1086120 | 상의/티셔츠 | 베이지 | 노멀 | 31 | True | 벡터유사도:23 |
| 3 | 1086194 | 하의/팬츠 | 베이지 | 와이드 | 31 | True | 벡터유사도:23 |
| 4 | 74368 | 아우터/재킷 | 베이지 | 노멀 | 31 | True | 벡터유사도:23 |
| 5 | 1084969 | 상의/티셔츠 | 베이지 | 노멀 | 31 | True | 벡터유사도:23 |
| 6 | 51751 | 하의/팬츠 | 베이지 | 와이드 | 31 | True | 벡터유사도:23 |

### male spring_warm 스트레이트 여행 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 33 | True | 벡터유사도:23 |
| 2 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 33 | True | 벡터유사도:23 |
| 3 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 69475 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 5 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |

### male spring_warm 스트레이트 여행 아웃도어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19327 | 하의/팬츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22 |
| 2 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 27 | True | 벡터유사도:22 |
| 4 | 51751 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 5 | 522106 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 27 | True | 벡터유사도:22 |

### male spring_warm 스트레이트 여행 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 2 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 4 | 517744 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 5 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male spring_warm 스트레이트 여행 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 2 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 28 | True | 벡터유사도:23 |
| 3 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 28 | True | 벡터유사도:23 |
| 4 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 28 | True | 벡터유사도:23 |
| 5 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 28 | True | 벡터유사도:23 |
| 6 | 51751 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |

### male spring_warm 스트레이트 여행 시티보이

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 69475 | 하의/팬츠 | 베이지 | 와이드 | 28 | True | 벡터유사도:23 |
| 2 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 28 | True | 벡터유사도:23 |
| 3 | 517899 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 1086120 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 28 | True | 벡터유사도:23 |
| 6 | 522243 | 하의/팬츠 | 베이지 | 와이드 | 28 | True | 벡터유사도:23 |

### male spring_warm 스트레이트 데이트 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 27 | True | 벡터유사도:22 |
| 2 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 70375 | 상의/니트웨어 | 베이지 | 타이트 | 27 | True | 벡터유사도:22 |
| 4 | 27749 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 517744 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 51751 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |

### male spring_warm 스트레이트 데이트 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 2 | 22576 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 3 | 70375 | 상의/니트웨어 | 베이지 | 타이트 | 32 | True | 벡터유사도:22 |
| 4 | 514904 | 상의/니트웨어 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 14795 | 하의/팬츠 | 브라운 | 와이드 | 32 | True | 벡터유사도:22 |
| 6 | 1086194 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |

### male spring_warm 스트레이트 데이트 남친룩

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1086194 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 2 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 69475 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 4 | 34247 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 5 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 14795 | 하의/팬츠 | 브라운 | 와이드 | 27 | True | 벡터유사도:22 |

### male spring_warm 스트레이트 데이트 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 2 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 70375 | 상의/니트웨어 | 베이지 | 타이트 | 27 | True | 벡터유사도:22 |
| 4 | 130431 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 5 | 1085815 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |

### male spring_warm 스트레이트 데이트 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 522243 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 2 | 27749 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 3 | 70375 | 상의/니트웨어 | 베이지 | 타이트 | 32 | True | 벡터유사도:22 |
| 4 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 5 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22 |

### male spring_warm 스트레이트 데이트 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 2 | 69475 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 3 | 70375 | 상의/니트웨어 | 베이지 | 타이트 | 27 | True | 벡터유사도:22 |
| 4 | 1085815 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 5 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 522243 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |

### male spring_warm 스트레이트 출근/면접 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.0
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 526164 | 상의/티셔츠 | 그린 | 노멀 | 22 | False | 벡터유사도:22 |
| 2 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 3 | 22928 | 하의/청바지 | 블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 4 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 69475 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 51751 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |

### male spring_warm 스트레이트 출근/면접 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 31 | True | 벡터유사도:22, 계절:셔츠 |
| 2 | 27749 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 70375 | 상의/니트웨어 | 베이지 | 타이트 | 27 | True | 벡터유사도:22 |
| 5 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |

### male spring_warm 스트레이트 출근/면접 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.0
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1046476 | 상의/티셔츠 | 스카이블루 | 노멀 | 22 | False | 벡터유사도:22 |
| 2 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 356906 | 하의/청바지 | 블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 4 | 526164 | 상의/티셔츠 | 그린 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 522243 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |

### male spring_warm 스트레이트 출근/면접 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.7
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 29 | True | 벡터유사도:22, 계절:셔츠 |
| 2 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 25 | True | 벡터유사도:22 |
| 3 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 22 | False | 벡터유사도:22 |
| 4 | 1041004 | 하의/청바지 | 블루 | 벨보텀 | 22 | False | 벡터유사도:22 |
| 5 | 1086194 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 22 | False | 벡터유사도:22 |

### male spring_warm 스트레이트 출근/면접 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.0
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 69475 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 2 | 22576 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 22 | False | 벡터유사도:22 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 22 | False | 벡터유사도:22 |
| 5 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### male spring_warm 스트레이트 출근/면접 스마트 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.0
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 2 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 526164 | 상의/티셔츠 | 그린 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 22928 | 하의/청바지 | 블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### male spring_warm 스트레이트 하객룩 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.0
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 2 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 22 | False | 벡터유사도:22 |
| 5 | 22576 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |

### male spring_warm 스트레이트 하객룩 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.0
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 501339 | 하의/청바지 | 네이비 | 와이드 | 22 | False | 벡터유사도:22 |
| 2 | 51751 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 3 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 22 | False | 벡터유사도:22 |
| 5 | 27749 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 69475 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |

### male spring_warm 스트레이트 하객룩 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.0
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 522243 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 2 | 51751 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 3 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 22 | False | 벡터유사도:22 |
| 4 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 1085815 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |

### male spring_warm 스트레이트 하객룩 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.7
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 29 | True | 벡터유사도:22, 계절:셔츠 |
| 2 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 25 | True | 벡터유사도:22 |
| 3 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 22 | False | 벡터유사도:22 |
| 4 | 22576 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 522106 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |

### male spring_warm 스트레이트 하객룩 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 22576 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 2 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 22 | False | 벡터유사도:22 |
| 4 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 69475 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |

### male spring_warm 스트레이트 하객룩 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.0
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 526164 | 상의/티셔츠 | 그린 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 22 | False | 벡터유사도:22 |
| 5 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |

### male spring_warm 스트레이트 운동/활동 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 503188 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 2 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 4 | 130431 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 5 | 12373 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 1086120 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male spring_warm 스트레이트 운동/활동 애슬레저

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.0
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 51751 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 2 | 517899 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 130431 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 1086194 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### male spring_warm 스트레이트 운동/활동 액티브

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.0
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 522243 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 2 | 69475 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 3 | 75776 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 12373 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |

### male spring_warm 스트레이트 운동/활동 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 522243 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 2 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 1046476 | 상의/티셔츠 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 27749 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male spring_warm 스트레이트 운동/활동 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 2 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 3 | 1046476 | 상의/티셔츠 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 520062 | 하의/팬츠 | 레드 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male spring_warm 스트레이트 운동/활동 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.0
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 2 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 22 | False | 벡터유사도:22 |
| 4 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |

### male spring_warm 스트레이트 파티/모임 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.8
- Precision@K: 0.17 (1 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 2 | 51751 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 3 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 22 | False | 벡터유사도:22 |
| 5 | 27749 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 1086194 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |

### male spring_warm 스트레이트 파티/모임 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.0
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 522243 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 2 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 22 | False | 벡터유사도:22 |
| 5 | 27749 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 69475 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |

### male spring_warm 스트레이트 파티/모임 트렌디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.0
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 2 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 4 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 22 | False | 벡터유사도:22 |
| 5 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 22576 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### male spring_warm 스트레이트 파티/모임 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 526164 | 상의/티셔츠 | 그린 | 노멀 | 27 | True | 벡터유사도:22 |
| 2 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 27 | True | 벡터유사도:22 |
| 3 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 27 | True | 벡터유사도:22 |
| 5 | 19327 | 하의/팬츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 522243 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |

### male spring_warm 스트레이트 파티/모임 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.7
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 29 | True | 벡터유사도:22, 계절:셔츠 |
| 2 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 25 | True | 벡터유사도:22 |
| 3 | 51751 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 22 | False | 벡터유사도:22 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 27749 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### male spring_warm 스트레이트 파티/모임 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.0
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 2 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 526164 | 상의/티셔츠 | 그린 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 22 | False | 벡터유사도:22 |
| 5 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### male spring_warm 웨이브 데일리 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 517744 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 2 | 1086194 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 3 | 88635 | 상의/니트웨어 | 베이지 | 노멀 | 31 | True | 벡터유사도:21 |
| 4 | 90639 | 상의/니트웨어 | 베이지 | 노멀 | 31 | True | 벡터유사도:21 |
| 5 | 34247 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 6 | 1085815 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |

### male spring_warm 웨이브 데일리 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 522243 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 3 | 27749 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 70375 | 상의/니트웨어 | 베이지 | 타이트 | 31 | True | 벡터유사도:21 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 31 | True | 벡터유사도:21 |
| 6 | 51751 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |

### male spring_warm 웨이브 데일리 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 522243 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 2 | 1086194 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 3 | 88635 | 상의/니트웨어 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 4 | 514904 | 상의/니트웨어 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 5 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male spring_warm 웨이브 데일리 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19327 | 하의/팬츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 32 | True | 벡터유사도:22 |
| 3 | 70375 | 상의/니트웨어 | 베이지 | 타이트 | 32 | True | 벡터유사도:22 |
| 4 | 514904 | 상의/니트웨어 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 522243 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |

### male spring_warm 웨이브 데일리 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 33 | True | 벡터유사도:21, 계절:셔츠 |
| 2 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 30 | True | 벡터유사도:22 |
| 3 | 1086194 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 4 | 514904 | 상의/니트웨어 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 5 | 22576 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 522106 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |

### male spring_warm 웨이브 데일리 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 521833 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 2 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 3 | 514904 | 상의/니트웨어 | 베이지 | 노멀 | 31 | True | 벡터유사도:21 |
| 4 | 88635 | 상의/니트웨어 | 베이지 | 노멀 | 31 | True | 벡터유사도:21 |
| 5 | 130431 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 6 | 1085815 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |

### male spring_warm 웨이브 여행 리조트

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 522243 | 하의/팬츠 | 베이지 | 와이드 | 31 | True | 벡터유사도:23 |
| 2 | 1084969 | 상의/티셔츠 | 베이지 | 노멀 | 31 | True | 벡터유사도:23 |
| 3 | 517899 | 상의/티셔츠 | 베이지 | 노멀 | 31 | True | 벡터유사도:23 |
| 4 | 522106 | 하의/팬츠 | 베이지 | 와이드 | 31 | True | 벡터유사도:23 |
| 5 | 14223 | 아우터/점퍼 | 베이지 | 노멀 | 31 | True | 벡터유사도:23 |
| 6 | 69475 | 하의/팬츠 | 베이지 | 와이드 | 31 | True | 벡터유사도:23 |

### male spring_warm 웨이브 여행 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 2 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 3 | 75776 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 503188 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 14223 | 아우터/점퍼 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 521833 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |

### male spring_warm 웨이브 여행 아웃도어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 2 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 14223 | 아우터/점퍼 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 75776 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 514904 | 상의/니트웨어 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 1082290 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |

### male spring_warm 웨이브 여행 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1085815 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 2 | 130431 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 3 | 508965 | 상의/블라우스 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 1086194 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |

### male spring_warm 웨이브 여행 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 75776 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 2 | 1084969 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 3 | 522243 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 4 | 522106 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 5 | 12373 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 503188 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |

### male spring_warm 웨이브 여행 시티보이

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 28 | True | 벡터유사도:23 |
| 2 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 28 | True | 벡터유사도:23 |
| 3 | 75776 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 1084973 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 69475 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 27749 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male spring_warm 웨이브 데이트 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 41 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 69475 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 3 | 522243 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 4 | 514904 | 상의/니트웨어 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21 |
| 6 | 517899 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |

### male spring_warm 웨이브 데이트 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 2 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 3 | 129718 | 상의/니트웨어 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 90639 | 상의/니트웨어 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 1082290 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 6 | 517744 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |

### male spring_warm 웨이브 데이트 남친룩

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 41 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 522106 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 3 | 69475 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 4 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21 |
| 5 | 85158 | 상의/니트웨어 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 6 | 90639 | 상의/니트웨어 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |

### male spring_warm 웨이브 데이트 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 2 | 521833 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 3 | 1086120 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 503188 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 1082290 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male spring_warm 웨이브 데이트 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 41 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 3 | 14795 | 하의/팬츠 | 브라운 | 와이드 | 32 | True | 벡터유사도:22 |
| 4 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 503188 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22 |

### male spring_warm 웨이브 데이트 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 41 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 70375 | 상의/니트웨어 | 베이지 | 타이트 | 27 | True | 벡터유사도:22 |
| 3 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 523327 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 5 | 514904 | 상의/니트웨어 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22 |

### male spring_warm 웨이브 출근/면접 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.5
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 2 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21 |
| 3 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 70375 | 상의/니트웨어 | 베이지 | 타이트 | 21 | False | 벡터유사도:21 |
| 6 | 88635 | 상의/니트웨어 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### male spring_warm 웨이브 출근/면접 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 30 | True | 벡터유사도:21, 계절:셔츠 |
| 2 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 70375 | 상의/니트웨어 | 베이지 | 타이트 | 26 | True | 벡터유사도:21 |
| 5 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male spring_warm 웨이브 출근/면접 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.8
- Precision@K: 0.17 (1 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 514904 | 상의/니트웨어 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 70375 | 상의/니트웨어 | 베이지 | 타이트 | 21 | False | 벡터유사도:21 |

### male spring_warm 웨이브 출근/면접 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.5
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 28 | True | 벡터유사도:21, 계절:셔츠 |
| 3 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 25 | True | 벡터유사도:22 |
| 4 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 88635 | 상의/니트웨어 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### male spring_warm 웨이브 출근/면접 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.7
- Precision@K: 0.17 (1 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 2 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 514904 | 상의/니트웨어 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### male spring_warm 웨이브 출근/면접 스마트 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.8
- Precision@K: 0.17 (1 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 22576 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### male spring_warm 웨이브 하객룩 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.3
- Precision@K: 0.17 (1 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 69475 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 3 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 5 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### male spring_warm 웨이브 하객룩 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 21.7
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 2 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 75776 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 4 | 514904 | 상의/니트웨어 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 22576 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |

### male spring_warm 웨이브 하객룩 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.0
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1086194 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 2 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 5 | 22576 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 522106 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |

### male spring_warm 웨이브 하객룩 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.5
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 28 | True | 벡터유사도:21, 계절:셔츠 |
| 3 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 25 | True | 벡터유사도:22 |
| 4 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### male spring_warm 웨이브 하객룩 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 51751 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 2 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 88649 | 상의/니트웨어 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 4 | 31201 | 상의/니트웨어 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 5 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male spring_warm 웨이브 하객룩 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.8
- Precision@K: 0.17 (1 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### male spring_warm 웨이브 운동/활동 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 517899 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 2 | 12373 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 517744 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 4 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 1084973 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 1086120 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male spring_warm 웨이브 운동/활동 애슬레저

- Source: `chroma_style_rag`
- Count: 6
- Average score: 21.7
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 2 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 75776 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 4 | 514904 | 상의/니트웨어 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### male spring_warm 웨이브 운동/활동 액티브

- Source: `chroma_style_rag`
- Count: 6
- Average score: 21.7
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 2 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 503188 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 4 | 75776 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |

### male spring_warm 웨이브 운동/활동 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 2 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 4 | 1084969 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 5 | 69475 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 1086194 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |

### male spring_warm 웨이브 운동/활동 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 2 | 522243 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 3 | 75776 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 503188 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male spring_warm 웨이브 운동/활동 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 21.2
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 2 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 3 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 4 | 517899 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 22576 | 하의/팬츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 51751 | 하의/팬츠 | 베이지 | 와이드 | 21 | False | 벡터유사도:21 |

### male spring_warm 웨이브 파티/모임 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.7
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 3 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 521833 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 5 | 514904 | 상의/니트웨어 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 75776 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### male spring_warm 웨이브 파티/모임 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.0
- Precision@K: 0.17 (1 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 22576 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 522106 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |

### male spring_warm 웨이브 파티/모임 트렌디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 21.7
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 2 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 509020 | 상의/블라우스 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 4 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 22576 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### male spring_warm 웨이브 파티/모임 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.2
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 514904 | 상의/니트웨어 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 2 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 3 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |

### male spring_warm 웨이브 파티/모임 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.7
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 28 | True | 벡터유사도:21, 계절:셔츠 |
| 3 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 25 | True | 벡터유사도:22 |
| 4 | 130431 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### male spring_warm 웨이브 파티/모임 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.0
- Precision@K: 0.17 (1 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### male spring_warm 내추럴 데일리 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 521588 | 상의/셔츠 | 베이지 | 루즈 | 35 | True | 벡터유사도:21, 계절:셔츠 |
| 2 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 35 | True | 벡터유사도:21, 계절:셔츠 |
| 3 | 1660 | 하의/팬츠 | 베이지 | 루즈 | 32 | True | 벡터유사도:22 |
| 4 | 1086194 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22 |
| 6 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22 |

### male spring_warm 내추럴 데일리 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 501923 | 하의/팬츠 | 화이트 | 루즈 | 32 | True | 벡터유사도:22 |
| 2 | 1082290 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 3 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 32 | True | 벡터유사도:22 |
| 4 | 1086194 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 5 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 32 | True | 벡터유사도:22 |
| 6 | 522243 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |

### male spring_warm 내추럴 데일리 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 501339 | 하의/청바지 | 네이비 | 와이드 | 36 | True | 벡터유사도:21, 골격:와이드 데님 |
| 2 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 26 | True | 벡터유사도:21 |
| 4 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 27 | True | 벡터유사도:22 |
| 5 | 522106 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 517744 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |

### male spring_warm 내추럴 데일리 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 501339 | 하의/청바지 | 네이비 | 와이드 | 42 | True | 벡터유사도:22, 골격:와이드 데님 |
| 2 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 3 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 74186 | 하의/팬츠 | 베이지 | 루즈 | 32 | True | 벡터유사도:22 |
| 5 | 19327 | 하의/팬츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 501923 | 하의/팬츠 | 화이트 | 루즈 | 32 | True | 벡터유사도:22 |

### male spring_warm 내추럴 데일리 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 34 | True | 벡터유사도:22, 계절:셔츠 |
| 2 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |
| 3 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 30 | True | 벡터유사도:22 |
| 4 | 1086194 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 5 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 27 | True | 벡터유사도:22 |
| 6 | 521588 | 상의/셔츠 | 베이지 | 루즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |

### male spring_warm 내추럴 데일리 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1085815 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 2 | 522106 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 3 | 105199 | 상의/티셔츠 | 베이지 | 루즈 | 31 | True | 벡터유사도:21 |
| 4 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 26 | True | 벡터유사도:21 |
| 5 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 32 | True | 벡터유사도:22 |
| 6 | 1086194 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |

### male spring_warm 내추럴 여행 리조트

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 31 | True | 벡터유사도:23 |
| 2 | 51751 | 하의/팬츠 | 베이지 | 와이드 | 31 | True | 벡터유사도:23 |
| 3 | 14375 | 상의/티셔츠 | 베이지 | 루즈 | 31 | True | 벡터유사도:23 |
| 4 | 1084973 | 상의/티셔츠 | 베이지 | 노멀 | 31 | True | 벡터유사도:23 |
| 5 | 14223 | 아우터/점퍼 | 베이지 | 노멀 | 31 | True | 벡터유사도:23 |
| 6 | 69475 | 하의/팬츠 | 베이지 | 와이드 | 31 | True | 벡터유사도:23 |

### male spring_warm 내추럴 여행 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 503188 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 2 | 517899 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 3 | 22576 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 14446 | 하의/팬츠 | 베이지 | 루즈 | 32 | True | 벡터유사도:22 |
| 5 | 1086120 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |

### male spring_warm 내추럴 여행 아웃도어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 31 | True | 벡터유사도:22, 계절:셔츠 |
| 2 | 130431 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 3 | 523327 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 4 | 75776 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 517744 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |

### male spring_warm 내추럴 여행 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 27 | True | 벡터유사도:22 |
| 2 | 522243 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 3 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 75776 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 130431 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 27749 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male spring_warm 내추럴 여행 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 503188 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 2 | 105199 | 상의/티셔츠 | 베이지 | 루즈 | 32 | True | 벡터유사도:22 |
| 3 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 28 | True | 벡터유사도:23 |
| 4 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 28 | True | 벡터유사도:23 |
| 5 | 1084969 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 75776 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |

### male spring_warm 내추럴 여행 시티보이

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 28 | True | 벡터유사도:23 |
| 2 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 28 | True | 벡터유사도:23 |
| 3 | 27707 | 상의/티셔츠 | 베이지 | 루즈 | 27 | True | 벡터유사도:22 |
| 4 | 517899 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 28 | True | 벡터유사도:23 |
| 6 | 130431 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |

### male spring_warm 내추럴 데이트 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 521588 | 상의/셔츠 | 베이지 | 루즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |
| 2 | 14795 | 하의/팬츠 | 브라운 | 와이드 | 27 | True | 벡터유사도:22 |
| 3 | 80485 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 105199 | 상의/티셔츠 | 베이지 | 루즈 | 27 | True | 벡터유사도:22 |
| 5 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 522106 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |

### male spring_warm 내추럴 데이트 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 521588 | 상의/셔츠 | 베이지 | 루즈 | 36 | True | 벡터유사도:22, 계절:셔츠 |
| 2 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 36 | True | 벡터유사도:22, 계절:셔츠 |
| 3 | 1660 | 하의/팬츠 | 베이지 | 루즈 | 32 | True | 벡터유사도:22 |
| 4 | 27749 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 1085815 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 6 | 74186 | 하의/팬츠 | 베이지 | 루즈 | 32 | True | 벡터유사도:22 |

### male spring_warm 내추럴 데이트 남친룩

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 521588 | 상의/셔츠 | 베이지 | 루즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |
| 2 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |
| 3 | 14446 | 하의/팬츠 | 베이지 | 루즈 | 27 | True | 벡터유사도:22 |
| 4 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 1660 | 하의/팬츠 | 베이지 | 루즈 | 27 | True | 벡터유사도:22 |
| 6 | 22576 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male spring_warm 내추럴 데이트 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 2 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 31 | True | 벡터유사도:22, 계절:셔츠 |
| 3 | 521588 | 상의/셔츠 | 베이지 | 루즈 | 31 | True | 벡터유사도:22, 계절:셔츠 |
| 4 | 1086194 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 5 | 517899 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 1084969 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male spring_warm 내추럴 데이트 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 80485 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 2 | 517744 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 3 | 105199 | 상의/티셔츠 | 베이지 | 루즈 | 32 | True | 벡터유사도:22 |
| 4 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 32 | True | 벡터유사도:22 |
| 6 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |

### male spring_warm 내추럴 데이트 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 521588 | 상의/셔츠 | 베이지 | 루즈 | 31 | True | 벡터유사도:22, 계절:셔츠 |
| 2 | 503188 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 1082290 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 4 | 27749 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 14375 | 상의/티셔츠 | 베이지 | 루즈 | 27 | True | 벡터유사도:22 |
| 6 | 105199 | 상의/티셔츠 | 베이지 | 루즈 | 27 | True | 벡터유사도:22 |

### male spring_warm 내추럴 출근/면접 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.0
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 501339 | 하의/청바지 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 골격:와이드 데님 |
| 2 | 22928 | 하의/청바지 | 블루 | 와이드 | 31 | True | 벡터유사도:21, 골격:와이드 데님 |
| 3 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 26 | True | 벡터유사도:21 |
| 4 | 615719 | 상의/셔츠 | 베이지 | 루즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 5 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### male spring_warm 내추럴 출근/면접 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.5
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 615719 | 상의/셔츠 | 베이지 | 루즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |
| 2 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |
| 3 | 27749 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 5 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 21 | False | 벡터유사도:21 |
| 6 | 521588 | 상의/셔츠 | 베이지 | 루즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |

### male spring_warm 내추럴 출근/면접 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.3
- Precision@K: 0.17 (1 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 30 | True | 벡터유사도:22 |
| 2 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 3 | 521588 | 상의/셔츠 | 베이지 | 루즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 4 | 69475 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 5 | 74186 | 하의/팬츠 | 베이지 | 루즈 | 22 | False | 벡터유사도:22 |
| 6 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |

### male spring_warm 내추럴 출근/면접 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.2
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 501339 | 하의/청바지 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 골격:와이드 데님 |
| 2 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 29 | True | 벡터유사도:22, 계절:셔츠 |
| 3 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 25 | True | 벡터유사도:22 |
| 4 | 521588 | 상의/셔츠 | 베이지 | 루즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 5 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 22 | False | 벡터유사도:22 |
| 6 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |

### male spring_warm 내추럴 출근/면접 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.8
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 2 | 521588 | 상의/셔츠 | 베이지 | 루즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 3 | 69475 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 4 | 517744 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 5 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 21 | False | 벡터유사도:21 |
| 6 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### male spring_warm 내추럴 출근/면접 스마트 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.2
- Precision@K: 0.17 (1 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 22928 | 하의/청바지 | 블루 | 와이드 | 31 | True | 벡터유사도:21, 골격:와이드 데님 |
| 2 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 21 | False | 벡터유사도:21 |
| 4 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 21 | False | 벡터유사도:21 |
| 5 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 22 | False | 벡터유사도:22 |

### male spring_warm 내추럴 하객룩 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.2
- Precision@K: 0.17 (1 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 30 | True | 벡터유사도:22 |
| 2 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 4 | 75776 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 74186 | 하의/팬츠 | 베이지 | 루즈 | 22 | False | 벡터유사도:22 |
| 6 | 517744 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |

### male spring_warm 내추럴 하객룩 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.5
- Precision@K: 0.17 (1 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 26 | True | 벡터유사도:21 |
| 2 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 22 | False | 벡터유사도:22 |
| 3 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 75776 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 69475 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 22576 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### male spring_warm 내추럴 하객룩 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.0
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 2 | 69475 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 3 | 22576 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 1086194 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 5 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |

### male spring_warm 내추럴 하객룩 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.7
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 29 | True | 벡터유사도:22, 계절:셔츠 |
| 2 | 521588 | 상의/셔츠 | 베이지 | 루즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 3 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 25 | True | 벡터유사도:22 |
| 4 | 80485 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 22 | False | 벡터유사도:22 |
| 6 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |

### male spring_warm 내추럴 하객룩 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 521588 | 상의/셔츠 | 베이지 | 루즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |
| 2 | 615719 | 상의/셔츠 | 베이지 | 루즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |
| 3 | 74186 | 하의/팬츠 | 베이지 | 루즈 | 27 | True | 벡터유사도:22 |
| 4 | 51751 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 5 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |
| 6 | 517744 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |

### male spring_warm 내추럴 하객룩 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 21.8
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 2 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 21 | False | 벡터유사도:21 |
| 4 | 22576 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 22 | False | 벡터유사도:22 |

### male spring_warm 내추럴 운동/활동 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 27707 | 상의/티셔츠 | 베이지 | 루즈 | 27 | True | 벡터유사도:22 |
| 2 | 44037 | 상의/티셔츠 | 베이지 | 루즈 | 27 | True | 벡터유사도:22 |
| 3 | 69475 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 4 | 22576 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 125213 | 상의/티셔츠 | 베이지 | 루즈 | 27 | True | 벡터유사도:22 |
| 6 | 95871 | 상의/티셔츠 | 베이지 |  | 27 | True | 벡터유사도:22 |

### male spring_warm 내추럴 운동/활동 애슬레저

- Source: `chroma_style_rag`
- Count: 6
- Average score: 21.7
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 2 | 22576 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 21 | False | 벡터유사도:21 |
| 4 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 22 | False | 벡터유사도:22 |
| 6 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### male spring_warm 내추럴 운동/활동 액티브

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.0
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 2 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 75776 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 517744 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### male spring_warm 내추럴 운동/활동 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 105199 | 상의/티셔츠 | 베이지 | 루즈 | 27 | True | 벡터유사도:22 |
| 2 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 12373 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 26 | True | 벡터유사도:21 |
| 6 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male spring_warm 내추럴 운동/활동 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.2
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 2 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 105199 | 상의/티셔츠 | 베이지 | 루즈 | 27 | True | 벡터유사도:22 |
| 4 | 14375 | 상의/티셔츠 | 베이지 | 루즈 | 22 | False | 벡터유사도:22 |
| 5 | 74186 | 하의/팬츠 | 베이지 | 루즈 | 27 | True | 벡터유사도:22 |
| 6 | 501923 | 하의/팬츠 | 화이트 | 루즈 | 27 | True | 벡터유사도:22 |

### male spring_warm 내추럴 운동/활동 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 21.5
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 2 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 22 | False | 벡터유사도:22 |
| 3 | 27707 | 상의/티셔츠 | 베이지 | 루즈 | 21 | False | 벡터유사도:21 |
| 4 | 1084969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 21 | False | 벡터유사도:21 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### male spring_warm 내추럴 파티/모임 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.5
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 2 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 26 | True | 벡터유사도:21 |
| 3 | 130431 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 4 | 105199 | 상의/티셔츠 | 베이지 | 루즈 | 22 | False | 벡터유사도:22 |
| 5 | 75776 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### male spring_warm 내추럴 파티/모임 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 21.7
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 130431 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 2 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 3 | 105199 | 상의/티셔츠 | 베이지 | 루즈 | 21 | False | 벡터유사도:21 |
| 4 | 75776 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 517744 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |

### male spring_warm 내추럴 파티/모임 트렌디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 21.5
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 74186 | 하의/팬츠 | 베이지 | 루즈 | 22 | False | 벡터유사도:22 |
| 2 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 22 | False | 벡터유사도:22 |
| 3 | 75776 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 4 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 21 | False | 벡터유사도:21 |
| 5 | 517899 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### male spring_warm 내추럴 파티/모임 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.2
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 105199 | 상의/티셔츠 | 베이지 | 루즈 | 27 | True | 벡터유사도:22 |
| 2 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 27 | True | 벡터유사도:22 |
| 5 | 75776 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male spring_warm 내추럴 파티/모임 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.7
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 29 | True | 벡터유사도:22, 계절:셔츠 |
| 2 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 25 | True | 벡터유사도:22 |
| 3 | 51751 | 하의/팬츠 | 베이지 | 와이드 | 22 | False | 벡터유사도:22 |
| 4 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 22 | False | 벡터유사도:22 |
| 5 | 22576 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 14089 | 하의/팬츠 | 베이지 | 루즈 | 22 | False | 벡터유사도:22 |

### male spring_warm 내추럴 파티/모임 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 21.5
- Precision@K: 0.0 (0 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 22576 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 2 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 22 | False | 벡터유사도:22 |
| 3 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 22 | False | 벡터유사도:22 |
| 4 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 75776 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 21 | False | 벡터유사도:21 |

### male summer_cool 스트레이트 데일리 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 478200 | 상의/셔츠 | 블루 | 노멀 | 36 | True | 벡터유사도:22, 계절:셔츠 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22 |

### male summer_cool 스트레이트 데일리 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 37.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 스트레이트 데일리 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 1084451 | 하의/팬츠 | 그레이 | 노멀 | 27 | True | 벡터유사도:22 |

### male summer_cool 스트레이트 데일리 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 619323 | 상의/니트웨어 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 1084451 | 하의/팬츠 | 그레이 | 노멀 | 32 | True | 벡터유사도:22 |

### male summer_cool 스트레이트 데일리 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 27 | True | 벡터유사도:22 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 30 | True | 벡터유사도:22 |

### male summer_cool 스트레이트 데일리 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 521648 | 상의/니트웨어 | 오렌지 | 타이트 | 32 | True | 벡터유사도:22 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |

### male summer_cool 스트레이트 여행 리조트

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 36 | True | 벡터유사도:23, 색상:스카이블루 |
| 2 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 36 | True | 벡터유사도:23, 색상:스카이블루 |
| 3 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 31 | True | 벡터유사도:23 |
| 4 | 120140 | 상의/티셔츠 | 그레이 | 노멀 | 31 | True | 벡터유사도:23 |
| 5 | 1083725 | 하의/팬츠 | 오렌지 | 노멀 | 31 | True | 벡터유사도:23 |
| 6 | 1083499 | 하의/팬츠 | 블루 | 노멀 | 31 | True | 벡터유사도:23 |

### male summer_cool 스트레이트 여행 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 120140 | 상의/티셔츠 | 그레이 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 1084451 | 하의/팬츠 | 그레이 | 노멀 | 32 | True | 벡터유사도:22 |

### male summer_cool 스트레이트 여행 아웃도어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 124638 | 상의/티셔츠 | 핑크 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male summer_cool 스트레이트 여행 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 509219 | 상의/블라우스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 1083499 | 하의/팬츠 | 블루 | 노멀 | 27 | True | 벡터유사도:22 |

### male summer_cool 스트레이트 여행 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083725 | 하의/팬츠 | 오렌지 | 노멀 | 36 | True | 벡터유사도:23 |
| 3 | 120140 | 상의/티셔츠 | 그레이 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 520010 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 36555 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22 |

### male summer_cool 스트레이트 여행 시티보이

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 12373 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 28 | True | 벡터유사도:23 |
| 6 | 1083725 | 하의/팬츠 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22 |

### male summer_cool 스트레이트 데이트 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 22576 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male summer_cool 스트레이트 데이트 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 510471 | 상의/셔츠 | 블루 | 노멀 | 36 | True | 벡터유사도:22, 계절:셔츠 |
| 4 | 619323 | 상의/니트웨어 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 1084451 | 하의/팬츠 | 그레이 | 노멀 | 32 | True | 벡터유사도:22 |

### male summer_cool 스트레이트 데이트 남친룩

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 1083725 | 하의/팬츠 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22 |

### male summer_cool 스트레이트 데이트 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male summer_cool 스트레이트 데이트 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 37.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 스트레이트 데이트 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 스트레이트 출근/면접 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.2
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 526164 | 상의/티셔츠 | 그린 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 9122 | 하의/팬츠 | 퍼플 | 와이드 | 22 | False | 벡터유사도:22 |

### male summer_cool 스트레이트 출근/면접 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 478200 | 상의/셔츠 | 블루 | 노멀 | 31 | True | 벡터유사도:22, 계절:셔츠 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male summer_cool 스트레이트 출근/면접 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 22 | False | 벡터유사도:22 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 22 | False | 벡터유사도:22 |

### male summer_cool 스트레이트 출근/면접 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.8
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 25 | True | 벡터유사도:22 |

### male summer_cool 스트레이트 출근/면접 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.0
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 1083499 | 하의/팬츠 | 블루 | 노멀 | 22 | False | 벡터유사도:22 |

### male summer_cool 스트레이트 출근/면접 스마트 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 1084451 | 하의/팬츠 | 그레이 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 526164 | 상의/티셔츠 | 그린 | 노멀 | 22 | False | 벡터유사도:22 |

### male summer_cool 스트레이트 하객룩 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.7
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 30 | True | 벡터유사도:22 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 스트레이트 하객룩 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21 |

### male summer_cool 스트레이트 하객룩 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.2
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 22576 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### male summer_cool 스트레이트 하객룩 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.8
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 22 | False | 벡터유사도:22 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 99215 | 하의/팬츠 | 화이트 | 와이드 | 25 | True | 벡터유사도:22 |

### male summer_cool 스트레이트 하객룩 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |

### male summer_cool 스트레이트 하객룩 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.2
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 22 | False | 벡터유사도:22 |
| 6 | 1083499 | 하의/팬츠 | 블루 | 노멀 | 22 | False | 벡터유사도:22 |

### male summer_cool 스트레이트 운동/활동 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083725 | 하의/팬츠 | 오렌지 | 노멀 | 30 | True | 벡터유사도:22 |
| 3 | 36555 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 503188 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male summer_cool 스트레이트 운동/활동 애슬레저

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.2
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 124638 | 상의/티셔츠 | 핑크 | 노멀 | 22 | False | 벡터유사도:22 |

### male summer_cool 스트레이트 운동/활동 액티브

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.2
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 125049 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 526164 | 상의/티셔츠 | 그린 | 노멀 | 22 | False | 벡터유사도:22 |

### male summer_cool 스트레이트 운동/활동 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 1046476 | 상의/티셔츠 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 1083725 | 하의/팬츠 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22 |

### male summer_cool 스트레이트 운동/활동 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 27 | True | 벡터유사도:22 |
| 5 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 19327 | 하의/팬츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22 |

### male summer_cool 스트레이트 운동/활동 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.2
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 1046476 | 상의/티셔츠 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 1083725 | 하의/팬츠 | 오렌지 | 노멀 | 22 | False | 벡터유사도:22 |

### male summer_cool 스트레이트 파티/모임 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.2
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### male summer_cool 스트레이트 파티/모임 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.2
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 521251 | 하의/팬츠 | 오렌지 | 와이드 | 22 | False | 벡터유사도:22 |

### male summer_cool 스트레이트 파티/모임 트렌디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 1083725 | 하의/팬츠 | 오렌지 | 노멀 | 22 | False | 벡터유사도:22 |

### male summer_cool 스트레이트 파티/모임 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 120140 | 상의/티셔츠 | 그레이 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 124638 | 상의/티셔츠 | 핑크 | 노멀 | 27 | True | 벡터유사도:22 |

### male summer_cool 스트레이트 파티/모임 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.8
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 25 | True | 벡터유사도:22 |

### male summer_cool 스트레이트 파티/모임 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.5
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 487521 | 상의/블라우스 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 86054 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### male summer_cool 웨이브 데일리 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 4 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |

### male summer_cool 웨이브 데일리 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 4 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 36 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |

### male summer_cool 웨이브 데일리 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 2 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |

### male summer_cool 웨이브 데일리 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 36 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 36 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 5 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 32 | True | 벡터유사도:22 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |

### male summer_cool 웨이브 데일리 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 1231659 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |

### male summer_cool 웨이브 데일리 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 36 | True | 벡터유사도:21, 색상:스카이블루 |
| 2 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 36 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 36 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 5 | 619323 | 상의/니트웨어 | 베이지 | 노멀 | 31 | True | 벡터유사도:21 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |

### male summer_cool 웨이브 여행 리조트

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 1

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 521251 | 하의/팬츠 | 오렌지 | 와이드 | 31 | True | 벡터유사도:23 |
| 2 | 1083725 | 하의/팬츠 | 오렌지 | 노멀 | 30 | True | 벡터유사도:22 |
| 3 | 509219 | 상의/블라우스 | 오렌지 | 노멀 | 30 | True | 벡터유사도:22 |
| 4 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |
| 5 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 30 | True | 벡터유사도:22 |
| 6 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 23 | True | 벡터유사도:22, 색상:스카이블루, 피하기골격:루즈 |

### male summer_cool 웨이브 여행 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 509219 | 상의/블라우스 | 오렌지 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |

### male summer_cool 웨이브 여행 아웃도어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 509219 | 상의/블라우스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 1083725 | 하의/팬츠 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22 |

### male summer_cool 웨이브 여행 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 509219 | 상의/블라우스 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 521251 | 하의/팬츠 | 오렌지 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male summer_cool 웨이브 여행 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083725 | 하의/팬츠 | 오렌지 | 노멀 | 35 | True | 벡터유사도:22 |
| 3 | 120140 | 상의/티셔츠 | 그레이 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 웨이브 여행 시티보이

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 522243 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 12373 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male summer_cool 웨이브 데이트 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 41 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male summer_cool 웨이브 데이트 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 41 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |

### male summer_cool 웨이브 데이트 남친룩

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 41 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |

### male summer_cool 웨이브 데이트 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 40 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 2 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 36 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male summer_cool 웨이브 데이트 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 37.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 41 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 웨이브 데이트 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 41 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |

### male summer_cool 웨이브 출근/면접 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.5
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 2 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 1231659 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### male summer_cool 웨이브 출근/면접 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.8
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 619323 | 상의/니트웨어 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 4 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male summer_cool 웨이브 출근/면접 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.2
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 2 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 29 | True | 벡터유사도:21 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 509219 | 상의/블라우스 | 오렌지 | 노멀 | 21 | False | 벡터유사도:21 |

### male summer_cool 웨이브 출근/면접 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.8
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 2 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### male summer_cool 웨이브 출근/면접 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.7
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 2 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 503188 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### male summer_cool 웨이브 출근/면접 스마트 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 2 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |

### male summer_cool 웨이브 하객룩 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.7
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 29 | True | 벡터유사도:21 |
| 2 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |

### male summer_cool 웨이브 하객룩 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.5
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 2 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 509219 | 상의/블라우스 | 오렌지 | 노멀 | 21 | False | 벡터유사도:21 |

### male summer_cool 웨이브 하객룩 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.5
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 2 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 1083725 | 하의/팬츠 | 오렌지 | 노멀 | 22 | False | 벡터유사도:22 |

### male summer_cool 웨이브 하객룩 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.2
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 4 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 25 | True | 벡터유사도:22 |

### male summer_cool 웨이브 하객룩 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.0
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 1083725 | 하의/팬츠 | 오렌지 | 노멀 | 27 | True | 벡터유사도:22 |

### male summer_cool 웨이브 하객룩 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.7
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 509219 | 상의/블라우스 | 오렌지 | 노멀 | 21 | False | 벡터유사도:21 |

### male summer_cool 웨이브 운동/활동 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083725 | 하의/팬츠 | 오렌지 | 노멀 | 30 | True | 벡터유사도:22 |
| 3 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 29 | True | 벡터유사도:21 |
| 4 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 27246 | 상의/티셔츠 | 그레이 | 노멀 | 26 | True | 벡터유사도:21 |

### male summer_cool 웨이브 운동/활동 애슬레저

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.5
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 1084973 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### male summer_cool 웨이브 운동/활동 액티브

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 2 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 1083725 | 하의/팬츠 | 오렌지 | 노멀 | 22 | False | 벡터유사도:22 |

### male summer_cool 웨이브 운동/활동 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 2 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male summer_cool 웨이브 운동/활동 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 522113 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21 |
| 5 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 1083499 | 하의/팬츠 | 블루 | 노멀 | 27 | True | 벡터유사도:22 |

### male summer_cool 웨이브 운동/활동 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.5
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 503188 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 1083725 | 하의/팬츠 | 오렌지 | 노멀 | 22 | False | 벡터유사도:22 |

### male summer_cool 웨이브 파티/모임 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.7
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 2 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### male summer_cool 웨이브 파티/모임 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.8
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 2 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### male summer_cool 웨이브 파티/모임 트렌디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.8
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 2 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### male summer_cool 웨이브 파티/모임 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 1083499 | 하의/팬츠 | 블루 | 노멀 | 27 | True | 벡터유사도:22 |

### male summer_cool 웨이브 파티/모임 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.2
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### male summer_cool 웨이브 파티/모임 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.7
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 2 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### male summer_cool 내추럴 데일리 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 35 | True | 벡터유사도:21, 계절:셔츠 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 내추럴 데일리 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 36.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 36 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 내추럴 데일리 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 6 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 32 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 내추럴 데일리 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 36 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 35 | True | 벡터유사도:21, 계절:셔츠 |
| 6 | 19327 | 하의/팬츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22 |

### male summer_cool 내추럴 데일리 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 86573 | 상의/티셔츠 | 화이트 | 오버사이즈 | 29 | True | 벡터유사도:21 |
| 6 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 내추럴 데일리 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 36 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 31 | True | 벡터유사도:21 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 내추럴 여행 리조트

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 36 | True | 벡터유사도:23, 색상:스카이블루 |
| 2 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 36 | True | 벡터유사도:23, 색상:스카이블루 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 36 | True | 벡터유사도:23, 색상:스카이블루 |
| 4 | 502955 | 상의/티셔츠 | 그레이 | 오버사이즈 | 31 | True | 벡터유사도:23 |
| 5 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 36 | True | 벡터유사도:23, 색상:스카이블루 |
| 6 | 1083725 | 하의/팬츠 | 오렌지 | 노멀 | 31 | True | 벡터유사도:23 |

### male summer_cool 내추럴 여행 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 36.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 502955 | 상의/티셔츠 | 그레이 | 오버사이즈 | 32 | True | 벡터유사도:22 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 내추럴 여행 아웃도어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 31 | True | 벡터유사도:22, 계절:셔츠 |
| 5 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 내추럴 여행 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 27 | True | 벡터유사도:22 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male summer_cool 내추럴 여행 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083725 | 하의/팬츠 | 오렌지 | 노멀 | 35 | True | 벡터유사도:22 |
| 3 | 120140 | 상의/티셔츠 | 그레이 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 32 | True | 벡터유사도:22 |
| 6 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 내추럴 여행 시티보이

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 105199 | 상의/티셔츠 | 베이지 | 루즈 | 27 | True | 벡터유사도:22 |
| 5 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 내추럴 데이트 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 38046 | 상의/티셔츠 | 스카이블루 | 루즈 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 32 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 내추럴 데이트 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 510471 | 상의/셔츠 | 블루 | 노멀 | 36 | True | 벡터유사도:22, 계절:셔츠 |
| 4 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 36 | True | 벡터유사도:22, 계절:셔츠 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 내추럴 데이트 남친룩

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 32 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 내추럴 데이트 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 내추럴 데이트 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 37.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 37 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 내추럴 데이트 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 35 | True | 벡터유사도:22 |
| 2 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 내추럴 출근/면접 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.2
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 6 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 내추럴 출근/면접 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 내추럴 출근/면접 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.2
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 29 | True | 벡터유사도:21 |
| 2 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 29 | True | 벡터유사도:21 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 412009 | 상의/셔츠 | 퍼플 | 오버사이즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 6 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 내추럴 출근/면접 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 86573 | 상의/티셔츠 | 화이트 | 오버사이즈 | 25 | True | 벡터유사도:22 |
| 6 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 내추럴 출근/면접 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.8
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |

### male summer_cool 내추럴 출근/면접 스마트 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 내추럴 하객룩 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.3
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 30 | True | 벡터유사도:22 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 509219 | 상의/블라우스 | 오렌지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 내추럴 하객룩 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.7
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 502955 | 상의/티셔츠 | 그레이 | 오버사이즈 | 21 | False | 벡터유사도:21 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21 |

### male summer_cool 내추럴 하객룩 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.7
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 509219 | 상의/블라우스 | 오렌지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |

### male summer_cool 내추럴 하객룩 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 내추럴 하객룩 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 내추럴 하객룩 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |

### male summer_cool 내추럴 운동/활동 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1085552 | 상의/티셔츠 | 스카이블루 | 루즈 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 1083725 | 하의/팬츠 | 오렌지 | 노멀 | 30 | True | 벡터유사도:22 |
| 4 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 38046 | 상의/티셔츠 | 스카이블루 | 루즈 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 518491 | 상의/티셔츠 | 스카이블루 | 루즈 | 31 | True | 벡터유사도:21, 색상:스카이블루 |

### male summer_cool 내추럴 운동/활동 애슬레저

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 38046 | 상의/티셔츠 | 스카이블루 | 루즈 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |

### male summer_cool 내추럴 운동/활동 액티브

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 93264 | 상의/티셔츠 | 스카이블루 | 루즈 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |

### male summer_cool 내추럴 운동/활동 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male summer_cool 내추럴 운동/활동 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 38046 | 상의/티셔츠 | 스카이블루 | 루즈 | 31 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 36555 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 502955 | 상의/티셔츠 | 그레이 | 오버사이즈 | 27 | True | 벡터유사도:22 |

### male summer_cool 내추럴 운동/활동 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.5
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 3 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 4 | 81941 | 상의/티셔츠 | 퍼플 | 오버사이즈 | 22 | False | 벡터유사도:22 |
| 5 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 26 | True | 벡터유사도:21, 색상:스카이블루 |

### male summer_cool 내추럴 파티/모임 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 내추럴 파티/모임 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.0
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 22 | False | 벡터유사도:22 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |

### male summer_cool 내추럴 파티/모임 트렌디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 6 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21, 색상:스카이블루 |

### male summer_cool 내추럴 파티/모임 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 5 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 38046 | 상의/티셔츠 | 스카이블루 | 루즈 | 31 | True | 벡터유사도:21, 색상:스카이블루 |

### male summer_cool 내추럴 파티/모임 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 86573 | 상의/티셔츠 | 화이트 | 오버사이즈 | 25 | True | 벡터유사도:22 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 6 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 27 | True | 벡터유사도:22, 색상:스카이블루 |

### male summer_cool 내추럴 파티/모임 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.7
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 2 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22, 색상:스카이블루 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:스카이블루 |
| 5 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 25 | False | 벡터유사도:21, 계절:가디건 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### male autumn_warm 스트레이트 데일리 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 37 | True | 벡터유사도:22, 색상:카키 |
| 3 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 73653 | 하의/팬츠 | 그린 | 와이드 | 32 | True | 벡터유사도:22 |
| 6 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22 |

### male autumn_warm 스트레이트 데일리 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 37 | True | 벡터유사도:22, 색상:카키 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 526164 | 상의/티셔츠 | 그린 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 521940 | 하의/팬츠 | 블랙 | 와이드 | 32 | True | 벡터유사도:22 |
| 6 | 1083499 | 하의/팬츠 | 블루 | 노멀 | 32 | True | 벡터유사도:22 |

### male autumn_warm 스트레이트 데일리 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19327 | 하의/팬츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 2 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male autumn_warm 스트레이트 데일리 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 37 | True | 벡터유사도:22, 색상:카키 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 32 | True | 벡터유사도:22 |
| 5 | 73653 | 하의/팬츠 | 그린 | 와이드 | 32 | True | 벡터유사도:22 |
| 6 | 87783 | 하의/팬츠 | 블랙 | 와이드 | 32 | True | 벡터유사도:22 |

### male autumn_warm 스트레이트 데일리 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 33 | True | 벡터유사도:21, 계절:셔츠 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 5 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 30 | True | 벡터유사도:22 |
| 6 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 30 | True | 벡터유사도:22 |

### male autumn_warm 스트레이트 데일리 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19327 | 하의/팬츠 | 카키 | 노멀 | 37 | True | 벡터유사도:22, 색상:카키 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 36 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21 |
| 5 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22 |
| 6 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |

### male autumn_warm 스트레이트 여행 리조트

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:23 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:23 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:23 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 31 | True | 벡터유사도:23 |
| 5 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 31 | True | 벡터유사도:23 |
| 6 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 31 | True | 벡터유사도:23 |

### male autumn_warm 스트레이트 여행 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19327 | 하의/팬츠 | 카키 | 노멀 | 37 | True | 벡터유사도:22, 색상:카키 |
| 2 | 27784 | 상의/티셔츠 | 카키 | 노멀 | 37 | True | 벡터유사도:22, 색상:카키 |
| 3 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22 |

### male autumn_warm 스트레이트 여행 아웃도어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19327 | 하의/팬츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 5 | 90054 | 하의/팬츠 | 블랙 | 벨보텀 | 27 | True | 벡터유사도:22 |
| 6 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |

### male autumn_warm 스트레이트 여행 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19327 | 하의/팬츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 2 | 27784 | 상의/티셔츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 3 | 90054 | 하의/팬츠 | 블랙 | 벨보텀 | 27 | True | 벡터유사도:22 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 27 | True | 벡터유사도:22 |

### male autumn_warm 스트레이트 여행 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 27784 | 상의/티셔츠 | 카키 | 노멀 | 37 | True | 벡터유사도:22, 색상:카키 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 90054 | 하의/팬츠 | 블랙 | 벨보텀 | 27 | True | 벡터유사도:22 |

### male autumn_warm 스트레이트 여행 시티보이

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19327 | 하의/팬츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 28 | True | 벡터유사도:23 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 28 | True | 벡터유사도:23 |

### male autumn_warm 스트레이트 데이트 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 27784 | 상의/티셔츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 19327 | 하의/팬츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 4 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 90054 | 하의/팬츠 | 블랙 | 벨보텀 | 27 | True | 벡터유사도:22 |

### male autumn_warm 스트레이트 데이트 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19327 | 하의/팬츠 | 카키 | 노멀 | 37 | True | 벡터유사도:22, 색상:카키 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 27784 | 상의/티셔츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 4 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22 |

### male autumn_warm 스트레이트 데이트 남친룩

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19327 | 하의/팬츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 2 | 27784 | 상의/티셔츠 | 카키 | 노멀 | 31 | True | 벡터유사도:21, 색상:카키 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 27 | True | 벡터유사도:22 |
| 5 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male autumn_warm 스트레이트 데이트 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 27784 | 상의/티셔츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 19327 | 하의/팬츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 27 | True | 벡터유사도:22 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |

### male autumn_warm 스트레이트 데이트 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 27784 | 상의/티셔츠 | 카키 | 노멀 | 37 | True | 벡터유사도:22, 색상:카키 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 37 | True | 벡터유사도:22, 색상:카키 |
| 3 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 32 | True | 벡터유사도:22 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 1084451 | 하의/팬츠 | 그레이 | 노멀 | 32 | True | 벡터유사도:22 |

### male autumn_warm 스트레이트 데이트 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 27784 | 상의/티셔츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 27 | True | 벡터유사도:22 |

### male autumn_warm 스트레이트 출근/면접 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.3
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19327 | 하의/팬츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22, 색상:카키 |
| 2 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 526164 | 상의/티셔츠 | 그린 | 노멀 | 22 | False | 벡터유사도:22 |

### male autumn_warm 스트레이트 출근/면접 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.7
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 60869 | 상의/셔츠 | 화이트 | 노멀 | 36 | True | 벡터유사도:22, 색상:브라운, 계절:셔츠 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 5 | 679195 | 아우터/가디건 | 그레이 | 노멀 | 25 | False | 벡터유사도:21, 계절:가디건 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male autumn_warm 스트레이트 출근/면접 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.8
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 29 | True | 벡터유사도:21 |
| 2 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 19327 | 하의/팬츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22, 색상:카키 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 22 | False | 벡터유사도:22 |
| 5 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 526164 | 상의/티셔츠 | 그린 | 노멀 | 22 | False | 벡터유사도:22 |

### male autumn_warm 스트레이트 출근/면접 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 28 | True | 벡터유사도:21, 계절:셔츠 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22, 색상:카키 |
| 3 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 25 | True | 벡터유사도:22 |
| 6 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 25 | True | 벡터유사도:22 |

### male autumn_warm 스트레이트 출근/면접 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.3
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22, 색상:카키 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 22 | False | 벡터유사도:22 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### male autumn_warm 스트레이트 출근/면접 스마트 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.7
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22, 색상:카키 |
| 3 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 526164 | 상의/티셔츠 | 그린 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 22 | False | 벡터유사도:22 |

### male autumn_warm 스트레이트 하객룩 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.7
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 30 | True | 벡터유사도:22 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22, 색상:카키 |
| 3 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### male autumn_warm 스트레이트 하객룩 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.3
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19327 | 하의/팬츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22, 색상:카키 |
| 2 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 22 | False | 벡터유사도:22 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 22 | False | 벡터유사도:22 |

### male autumn_warm 스트레이트 하객룩 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.2
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19327 | 하의/팬츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22, 색상:카키 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 22 | False | 벡터유사도:22 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### male autumn_warm 스트레이트 하객룩 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22, 색상:카키 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 22 | False | 벡터유사도:22 |
| 5 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 25 | True | 벡터유사도:22 |
| 6 | 120658 | 하의/팬츠 | 화이트 | 벨보텀 | 25 | True | 벡터유사도:22 |

### male autumn_warm 스트레이트 하객룩 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.8
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 3 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 27 | True | 벡터유사도:22 |

### male autumn_warm 스트레이트 하객룩 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.3
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19327 | 하의/팬츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22, 색상:카키 |
| 2 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 22 | False | 벡터유사도:22 |

### male autumn_warm 스트레이트 운동/활동 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 27784 | 상의/티셔츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 2 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 19327 | 하의/팬츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22, 색상:카키 |
| 5 | 36547 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22 |

### male autumn_warm 스트레이트 운동/활동 애슬레저

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.0
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 19327 | 하의/팬츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22, 색상:카키 |
| 4 | 27784 | 상의/티셔츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22, 색상:카키 |
| 5 | 118489 | 하의/팬츠 | 브라운 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 6 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 22 | False | 벡터유사도:22 |

### male autumn_warm 스트레이트 운동/활동 액티브

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.2
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19327 | 하의/팬츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22, 색상:카키 |
| 2 | 27784 | 상의/티셔츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22, 색상:카키 |
| 3 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 22 | False | 벡터유사도:22 |
| 6 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 22 | False | 벡터유사도:22 |

### male autumn_warm 스트레이트 운동/활동 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 19327 | 하의/팬츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 4 | 27784 | 상의/티셔츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 5 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 37991 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |

### male autumn_warm 스트레이트 운동/활동 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 3 | 27784 | 상의/티셔츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 4 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 5 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male autumn_warm 스트레이트 운동/활동 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.5
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19327 | 하의/팬츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22, 색상:카키 |
| 2 | 27784 | 상의/티셔츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22, 색상:카키 |
| 3 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 5 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 526164 | 상의/티셔츠 | 그린 | 노멀 | 22 | False | 벡터유사도:22 |

### male autumn_warm 스트레이트 파티/모임 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 27784 | 상의/티셔츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22, 색상:카키 |
| 4 | 19327 | 하의/팬츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22, 색상:카키 |
| 5 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |

### male autumn_warm 스트레이트 파티/모임 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.5
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 19327 | 하의/팬츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22, 색상:카키 |
| 4 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |

### male autumn_warm 스트레이트 파티/모임 트렌디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.7
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22, 색상:카키 |
| 3 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 136931 | 상의/티셔츠 | 핑크 | 노멀 | 22 | False | 벡터유사도:22 |

### male autumn_warm 스트레이트 파티/모임 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 27784 | 상의/티셔츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 3 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 9122 | 하의/팬츠 | 퍼플 | 와이드 | 27 | True | 벡터유사도:22 |

### male autumn_warm 스트레이트 파티/모임 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22, 색상:카키 |
| 3 | 99214 | 하의/팬츠 | 화이트 | 와이드 | 25 | True | 벡터유사도:22 |
| 4 | 70819 | 상의/티셔츠 | 블랙 | 노멀 | 25 | True | 벡터유사도:22 |
| 5 | 99215 | 하의/팬츠 | 화이트 | 와이드 | 25 | True | 벡터유사도:22 |
| 6 | 120658 | 하의/팬츠 | 화이트 | 벨보텀 | 25 | True | 벡터유사도:22 |

### male autumn_warm 스트레이트 파티/모임 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.7
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19327 | 하의/팬츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22, 색상:카키 |
| 2 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 27 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 22 | False | 벡터유사도:22 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 22 | False | 벡터유사도:22 |
| 5 | 526164 | 상의/티셔츠 | 그린 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 22 | False | 벡터유사도:22 |

### male autumn_warm 웨이브 데일리 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87522 | 하의/팬츠 | 카키 | 와이드 | 36 | True | 벡터유사도:21, 색상:카키 |
| 2 | 130386 | 하의/팬츠 | 카키 | 스키니 | 36 | True | 벡터유사도:21, 색상:카키 |
| 3 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 4 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 5 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21 |

### male autumn_warm 웨이브 데일리 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 36 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 36 | True | 벡터유사도:21, 색상:카키 |
| 3 | 87522 | 하의/팬츠 | 카키 | 와이드 | 36 | True | 벡터유사도:21, 색상:카키 |
| 4 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 5 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 32 | True | 벡터유사도:22 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 31 | True | 벡터유사도:21 |

### male autumn_warm 웨이브 데일리 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 2 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 87522 | 하의/팬츠 | 카키 | 와이드 | 31 | True | 벡터유사도:21, 색상:카키 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21 |

### male autumn_warm 웨이브 데일리 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19327 | 하의/팬츠 | 카키 | 노멀 | 37 | True | 벡터유사도:22, 색상:카키 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 36 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 5 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 32 | True | 벡터유사도:22 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 31 | True | 벡터유사도:21 |

### male autumn_warm 웨이브 데일리 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 31 | True | 벡터유사도:21, 색상:카키 |
| 3 | 87522 | 하의/팬츠 | 카키 | 와이드 | 31 | True | 벡터유사도:21, 색상:카키 |
| 4 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 5 | 14795 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 6 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |

### male autumn_warm 웨이브 데일리 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 14795 | 하의/팬츠 | 브라운 | 와이드 | 36 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 36 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 26 | True | 벡터유사도:21 |
| 5 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21 |

### male autumn_warm 웨이브 여행 리조트

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 0
- Avoid reasons: 3

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 30 | True | 벡터유사도:22 |
| 2 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |
| 3 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 30 | True | 벡터유사도:22 |
| 4 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 19 | True | 벡터유사도:23, 피하기골격:루즈 |
| 5 | 74186 | 하의/팬츠 | 베이지 | 루즈 | 18 | True | 벡터유사도:22, 피하기골격:루즈 |
| 6 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 18 | True | 벡터유사도:22, 피하기골격:루즈 |

### male autumn_warm 웨이브 여행 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22 |
| 5 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 32 | True | 벡터유사도:22 |

### male autumn_warm 웨이브 여행 아웃도어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 92156 | 아우터/가디건 | 네온 | 노멀 | 40 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 19327 | 하의/팬츠 | 카키 | 노멀 | 31 | True | 벡터유사도:21, 색상:카키 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21 |
| 5 | 538105 | 하의/팬츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 6 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 26 | True | 벡터유사도:21 |

### male autumn_warm 웨이브 여행 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19327 | 하의/팬츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 2 | 130386 | 하의/팬츠 | 카키 | 스키니 | 31 | True | 벡터유사도:21, 색상:카키 |
| 3 | 27246 | 상의/티셔츠 | 그레이 | 노멀 | 26 | True | 벡터유사도:21 |
| 4 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |

### male autumn_warm 웨이브 여행 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 32 | True | 벡터유사도:22 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 19327 | 하의/팬츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 5 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |

### male autumn_warm 웨이브 여행 시티보이

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 129080 | 아우터/가디건 | 베이지 | 노멀 | 41 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 14795 | 하의/팬츠 | 브라운 | 와이드 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 4 | 1084969 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 1084973 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male autumn_warm 웨이브 데이트 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 41 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 19327 | 하의/팬츠 | 카키 | 노멀 | 31 | True | 벡터유사도:21, 색상:카키 |
| 4 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21 |

### male autumn_warm 웨이브 데이트 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 40 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 36 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 87522 | 하의/팬츠 | 카키 | 와이드 | 36 | True | 벡터유사도:21, 색상:카키 |
| 4 | 41256 | 상의/니트웨어 | 화이트 | 타이트 | 31 | True | 벡터유사도:21 |
| 5 | 1080726 | 상의/니트웨어 | 퍼플 | 노멀 | 31 | True | 벡터유사도:21 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22 |

### male autumn_warm 웨이브 데이트 남친룩

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 40 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 2 | 87522 | 하의/팬츠 | 카키 | 와이드 | 31 | True | 벡터유사도:21, 색상:카키 |
| 3 | 1221158 | 아우터/베스트 | 카키 | 노멀 | 31 | True | 벡터유사도:21, 색상:카키 |
| 4 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |

### male autumn_warm 웨이브 데이트 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 40 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 2 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22 |
| 3 | 14795 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 31 | True | 벡터유사도:21 |
| 5 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21 |
| 6 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |

### male autumn_warm 웨이브 데이트 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 41 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 36 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 87522 | 하의/팬츠 | 카키 | 와이드 | 36 | True | 벡터유사도:21, 색상:카키 |
| 4 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 32 | True | 벡터유사도:22 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22 |

### male autumn_warm 웨이브 데이트 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 41 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 27 | True | 벡터유사도:22 |
| 5 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 26 | True | 벡터유사도:21 |
| 6 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |

### male autumn_warm 웨이브 출근/면접 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.5
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19327 | 하의/팬츠 | 카키 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 21 | False | 벡터유사도:21 |
| 5 | 1086214 | 하의/팬츠 | 스카이블루 | 와이드 | 21 | False | 벡터유사도:21 |
| 6 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 21 | False | 벡터유사도:21 |

### male autumn_warm 웨이브 출근/면접 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.7
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 31 | True | 벡터유사도:21, 색상:카키 |
| 3 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 21 | False | 벡터유사도:21 |
| 5 | 87522 | 하의/팬츠 | 카키 | 와이드 | 31 | True | 벡터유사도:21, 색상:카키 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |

### male autumn_warm 웨이브 출근/면접 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.8
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 29 | True | 벡터유사도:21 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 19327 | 하의/팬츠 | 카키 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |
| 6 | 22576 | 하의/팬츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### male autumn_warm 웨이브 출근/면접 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 28 | True | 벡터유사도:21, 계절:셔츠 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 19327 | 하의/팬츠 | 카키 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |
| 4 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 120658 | 하의/팬츠 | 화이트 | 벨보텀 | 24 | True | 벡터유사도:21 |
| 6 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 24 | True | 벡터유사도:21 |

### male autumn_warm 웨이브 출근/면접 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.5
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19327 | 하의/팬츠 | 카키 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 21 | False | 벡터유사도:21 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 21 | False | 벡터유사도:21 |
| 5 | 87522 | 하의/팬츠 | 카키 | 와이드 | 26 | True | 벡터유사도:21, 색상:카키 |
| 6 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 21 | False | 벡터유사도:21 |

### male autumn_warm 웨이브 출근/면접 스마트 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.2
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |
| 3 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 21 | False | 벡터유사도:21 |
| 4 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 79952 | 상의/티셔츠 | 스카이블루 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 21 | False | 벡터유사도:21 |

### male autumn_warm 웨이브 하객룩 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 523354 | 하의/팬츠 | 화이트 | 와이드 | 29 | True | 벡터유사도:21 |
| 2 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 29 | True | 벡터유사도:21 |
| 3 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 4 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 6 | 19327 | 하의/팬츠 | 카키 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |

### male autumn_warm 웨이브 하객룩 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.7
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |
| 3 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 21 | False | 벡터유사도:21 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 21 | False | 벡터유사도:21 |
| 5 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 21 | False | 벡터유사도:21 |
| 6 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 21 | False | 벡터유사도:21 |

### male autumn_warm 웨이브 하객룩 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.5
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87522 | 하의/팬츠 | 카키 | 와이드 | 26 | True | 벡터유사도:21, 색상:카키 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |
| 3 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 4 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 6 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 21 | False | 벡터유사도:21 |

### male autumn_warm 웨이브 하객룩 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.7
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19327 | 하의/팬츠 | 카키 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 21 | False | 벡터유사도:21 |
| 4 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 99214 | 하의/팬츠 | 화이트 | 와이드 | 24 | True | 벡터유사도:21 |
| 6 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 24 | True | 벡터유사도:21 |

### male autumn_warm 웨이브 하객룩 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.8
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87522 | 하의/팬츠 | 카키 | 와이드 | 31 | True | 벡터유사도:21, 색상:카키 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 4 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 19327 | 하의/팬츠 | 카키 | 노멀 | 31 | True | 벡터유사도:21, 색상:카키 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |

### male autumn_warm 웨이브 하객룩 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.0
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 19327 | 하의/팬츠 | 카키 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 21 | False | 벡터유사도:21 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 1231659 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### male autumn_warm 웨이브 운동/활동 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 27784 | 상의/티셔츠 | 카키 | 노멀 | 31 | True | 벡터유사도:21, 색상:카키 |
| 2 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 29 | True | 벡터유사도:21 |
| 3 | 1083725 | 하의/팬츠 | 오렌지 | 노멀 | 29 | True | 벡터유사도:21 |
| 4 | 1084969 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 5 | 130386 | 하의/팬츠 | 카키 | 스키니 | 26 | True | 벡터유사도:21, 색상:카키 |
| 6 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |

### male autumn_warm 웨이브 운동/활동 애슬레저

- Source: `chroma_style_rag`
- Count: 6
- Average score: 22.7
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |
| 3 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 21 | False | 벡터유사도:21 |
| 4 | 120140 | 상의/티셔츠 | 그레이 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 21 | False | 벡터유사도:21 |
| 6 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### male autumn_warm 웨이브 운동/활동 액티브

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 130386 | 하의/팬츠 | 카키 | 스키니 | 26 | True | 벡터유사도:21, 색상:카키 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |
| 3 | 27784 | 상의/티셔츠 | 카키 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |
| 4 | 1084969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 6 | 517744 | 하의/팬츠 | 베이지 | 와이드 | 21 | False | 벡터유사도:21 |

### male autumn_warm 웨이브 운동/활동 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19327 | 하의/팬츠 | 카키 | 노멀 | 31 | True | 벡터유사도:21, 색상:카키 |
| 2 | 130386 | 하의/팬츠 | 카키 | 스키니 | 31 | True | 벡터유사도:21, 색상:카키 |
| 3 | 1084969 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 4 | 122940 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21 |
| 5 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 6 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 26 | True | 벡터유사도:21 |

### male autumn_warm 웨이브 운동/활동 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19327 | 하의/팬츠 | 카키 | 노멀 | 31 | True | 벡터유사도:21, 색상:카키 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 27784 | 상의/티셔츠 | 카키 | 노멀 | 31 | True | 벡터유사도:21, 색상:카키 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 27 | True | 벡터유사도:22 |
| 6 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 27 | True | 벡터유사도:22 |

### male autumn_warm 웨이브 운동/활동 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.5
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 87522 | 하의/팬츠 | 카키 | 와이드 | 26 | True | 벡터유사도:21, 색상:카키 |
| 3 | 298 | 상의/티셔츠 | 브라운 | 타이트 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 1083755 | 하의/팬츠 | 스카이블루 | 와이드 | 21 | False | 벡터유사도:21 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### male autumn_warm 웨이브 파티/모임 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.0
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 2 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 102665 | 하의/팬츠 | 베이지 | 와이드 | 26 | True | 벡터유사도:21 |
| 5 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 21 | False | 벡터유사도:21 |

### male autumn_warm 웨이브 파티/모임 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.0
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 19327 | 하의/팬츠 | 카키 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |
| 4 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 21 | False | 벡터유사도:21 |

### male autumn_warm 웨이브 파티/모임 트렌디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 21.8
- Precision@K: 0.17 (1 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 3 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 21 | False | 벡터유사도:21 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 21 | False | 벡터유사도:21 |
| 6 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### male autumn_warm 웨이브 파티/모임 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 6 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21 |

### male autumn_warm 웨이브 파티/모임 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.2
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 19327 | 하의/팬츠 | 카키 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |
| 4 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### male autumn_warm 웨이브 파티/모임 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.2
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 19327 | 하의/팬츠 | 카키 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |
| 4 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 22 | False | 벡터유사도:22 |
| 5 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### male autumn_warm 내추럴 데일리 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 412009 | 상의/셔츠 | 퍼플 | 오버사이즈 | 40 | True | 벡터유사도:21, 색상:브라운, 계절:셔츠 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 37 | True | 벡터유사도:22, 색상:카키 |
| 3 | 87522 | 하의/팬츠 | 카키 | 와이드 | 36 | True | 벡터유사도:21, 색상:카키 |
| 4 | 411391 | 상의/셔츠 | 퍼플 | 루즈 | 35 | True | 벡터유사도:21, 계절:셔츠 |
| 5 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 26 | True | 벡터유사도:21 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21 |

### male autumn_warm 내추럴 데일리 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 36.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 412009 | 상의/셔츠 | 퍼플 | 오버사이즈 | 40 | True | 벡터유사도:21, 색상:브라운, 계절:셔츠 |
| 2 | 87522 | 하의/팬츠 | 카키 | 와이드 | 37 | True | 벡터유사도:22, 색상:카키 |
| 3 | 19327 | 하의/팬츠 | 카키 | 노멀 | 37 | True | 벡터유사도:22, 색상:카키 |
| 4 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 36 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 31 | True | 벡터유사도:21 |
| 6 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 36 | True | 벡터유사도:21, 색상:브라운 |

### male autumn_warm 내추럴 데일리 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 412009 | 상의/셔츠 | 퍼플 | 오버사이즈 | 35 | True | 벡터유사도:21, 색상:브라운, 계절:셔츠 |
| 2 | 87522 | 하의/팬츠 | 카키 | 와이드 | 31 | True | 벡터유사도:21, 색상:카키 |
| 3 | 113955 | 하의/팬츠 | 브라운 | 루즈 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 26 | True | 벡터유사도:21 |
| 6 | 87983 | 하의/팬츠 | 카키 | 루즈 | 31 | True | 벡터유사도:21, 색상:카키 |

### male autumn_warm 내추럴 데일리 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 36.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 412009 | 상의/셔츠 | 퍼플 | 오버사이즈 | 40 | True | 벡터유사도:21, 색상:브라운, 계절:셔츠 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 37 | True | 벡터유사도:22, 색상:카키 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 4 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 36 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 113955 | 하의/팬츠 | 브라운 | 루즈 | 36 | True | 벡터유사도:21, 색상:브라운 |
| 6 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 35 | True | 벡터유사도:21, 계절:셔츠 |

### male autumn_warm 내추럴 데일리 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 412009 | 상의/셔츠 | 퍼플 | 오버사이즈 | 35 | True | 벡터유사도:21, 색상:브라운, 계절:셔츠 |
| 2 | 113955 | 하의/팬츠 | 브라운 | 루즈 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 310836 | 상의/셔츠 | 화이트 | 루즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |
| 5 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 26 | True | 벡터유사도:21 |
| 6 | 19327 | 하의/팬츠 | 카키 | 노멀 | 31 | True | 벡터유사도:21, 색상:카키 |

### male autumn_warm 내추럴 데일리 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 36 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 113955 | 하의/팬츠 | 브라운 | 루즈 | 36 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 36 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 412009 | 상의/셔츠 | 퍼플 | 오버사이즈 | 35 | True | 벡터유사도:21, 색상:브라운, 계절:셔츠 |
| 5 | 87983 | 하의/팬츠 | 카키 | 루즈 | 36 | True | 벡터유사도:21, 색상:카키 |
| 6 | 87522 | 하의/팬츠 | 카키 | 와이드 | 36 | True | 벡터유사도:21, 색상:카키 |

### male autumn_warm 내추럴 여행 리조트

- Source: `chroma_style_rag`
- Count: 4
- Average score: 31.5
- Precision@K: 1.0 (4 / 4)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 35 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 31 | True | 벡터유사도:23 |
| 3 | 74186 | 하의/팬츠 | 베이지 | 루즈 | 30 | True | 벡터유사도:22 |
| 4 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |

### male autumn_warm 내추럴 여행 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87983 | 하의/팬츠 | 카키 | 루즈 | 37 | True | 벡터유사도:22, 색상:카키 |
| 2 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 501923 | 하의/팬츠 | 화이트 | 루즈 | 32 | True | 벡터유사도:22 |
| 6 | 74186 | 하의/팬츠 | 베이지 | 루즈 | 32 | True | 벡터유사도:22 |

### male autumn_warm 내추럴 여행 아웃도어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19327 | 하의/팬츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 2 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 31 | True | 벡터유사도:22, 계절:셔츠 |
| 5 | 87983 | 하의/팬츠 | 카키 | 루즈 | 31 | True | 벡터유사도:21, 색상:카키 |
| 6 | 115954 | 상의/셔츠 | 스카이블루 | 오버사이즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |

### male autumn_warm 내추럴 여행 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 27784 | 상의/티셔츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 2 | 87522 | 하의/팬츠 | 카키 | 와이드 | 32 | True | 벡터유사도:22, 색상:카키 |
| 3 | 19327 | 하의/팬츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 4 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 101963 | 아우터/재킷 | 카키 | 오버사이즈 | 31 | True | 벡터유사도:21, 색상:카키 |
| 6 | 87983 | 하의/팬츠 | 카키 | 루즈 | 31 | True | 벡터유사도:21, 색상:카키 |

### male autumn_warm 내추럴 여행 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 2
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 3 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 32 | True | 벡터유사도:22 |
| 4 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 27 | True | 벡터유사도:22 |
| 5 | 502955 | 상의/티셔츠 | 그레이 | 오버사이즈 | 32 | True | 벡터유사도:22 |
| 6 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22 |

### male autumn_warm 내추럴 여행 시티보이

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 1
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 501923 | 하의/팬츠 | 화이트 | 루즈 | 27 | True | 벡터유사도:22 |
| 3 | 14089 | 하의/팬츠 | 베이지 | 루즈 | 27 | True | 벡터유사도:22 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 1660 | 하의/팬츠 | 베이지 | 루즈 | 27 | True | 벡터유사도:22 |
| 6 | 1086194 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |

### male autumn_warm 내추럴 데이트 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19327 | 하의/팬츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 2 | 87983 | 하의/팬츠 | 카키 | 루즈 | 31 | True | 벡터유사도:21, 색상:카키 |
| 3 | 27784 | 상의/티셔츠 | 카키 | 노멀 | 31 | True | 벡터유사도:21, 색상:카키 |
| 4 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 30 | True | 벡터유사도:21, 계절:가디건 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22 |

### male autumn_warm 내추럴 데이트 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19327 | 하의/팬츠 | 카키 | 노멀 | 37 | True | 벡터유사도:22, 색상:카키 |
| 2 | 87522 | 하의/팬츠 | 카키 | 와이드 | 36 | True | 벡터유사도:21, 색상:카키 |
| 3 | 121513 | 상의/니트웨어 | 카키 | 루즈 | 36 | True | 벡터유사도:21, 색상:카키 |
| 4 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 35 | True | 벡터유사도:21, 계절:셔츠 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 105679 | 아우터/코트 | 핑크 | 루즈 | 26 | True | 벡터유사도:21 |

### male autumn_warm 내추럴 데이트 남친룩

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 87522 | 하의/팬츠 | 카키 | 와이드 | 31 | True | 벡터유사도:21, 색상:카키 |
| 3 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 30 | True | 벡터유사도:21, 계절:가디건 |
| 5 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |
| 6 | 105679 | 아우터/코트 | 핑크 | 루즈 | 26 | True | 벡터유사도:21 |

### male autumn_warm 내추럴 데이트 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 3 | 27784 | 상의/티셔츠 | 카키 | 노멀 | 31 | True | 벡터유사도:21, 색상:카키 |
| 4 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21 |
| 5 | 105679 | 아우터/코트 | 핑크 | 루즈 | 31 | True | 벡터유사도:21 |
| 6 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 31 | True | 벡터유사도:21, 색상:브라운 |

### male autumn_warm 내추럴 데이트 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 37 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 87983 | 하의/팬츠 | 카키 | 루즈 | 37 | True | 벡터유사도:22, 색상:카키 |
| 3 | 87522 | 하의/팬츠 | 카키 | 와이드 | 37 | True | 벡터유사도:22, 색상:카키 |
| 4 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 35 | True | 벡터유사도:21, 계절:셔츠 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22 |
| 6 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 32 | True | 벡터유사도:22 |

### male autumn_warm 내추럴 데이트 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 105679 | 아우터/코트 | 핑크 | 루즈 | 31 | True | 벡터유사도:21 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 87983 | 하의/팬츠 | 카키 | 루즈 | 31 | True | 벡터유사도:21, 색상:카키 |
| 5 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 30 | True | 벡터유사도:21, 계절:가디건 |
| 6 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |

### male autumn_warm 내추럴 출근/면접 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 412009 | 상의/셔츠 | 퍼플 | 오버사이즈 | 30 | True | 벡터유사도:21, 색상:브라운, 계절:셔츠 |
| 2 | 113955 | 하의/팬츠 | 브라운 | 루즈 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 26 | True | 벡터유사도:21 |
| 4 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 26 | True | 벡터유사도:21 |
| 5 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 6 | 87983 | 하의/팬츠 | 카키 | 루즈 | 26 | True | 벡터유사도:21, 색상:카키 |

### male autumn_warm 내추럴 출근/면접 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.2
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 412009 | 상의/셔츠 | 퍼플 | 오버사이즈 | 35 | True | 벡터유사도:21, 색상:브라운, 계절:셔츠 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 31 | True | 벡터유사도:21, 색상:카키 |
| 3 | 87522 | 하의/팬츠 | 카키 | 와이드 | 31 | True | 벡터유사도:21, 색상:카키 |
| 4 | 406434 | 상의/셔츠 | 레드 | 루즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |
| 5 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 21 | False | 벡터유사도:21 |
| 6 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 21 | False | 벡터유사도:21 |

### male autumn_warm 내추럴 출근/면접 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.0
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 412009 | 상의/셔츠 | 퍼플 | 오버사이즈 | 30 | True | 벡터유사도:21, 색상:브라운, 계절:셔츠 |
| 2 | 976976 | 아우터/재킷 | 스카이블루 | 루즈 | 29 | True | 벡터유사도:21 |
| 3 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 29 | True | 벡터유사도:21 |
| 4 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 29 | True | 벡터유사도:21 |
| 5 | 19327 | 하의/팬츠 | 카키 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |
| 6 | 411391 | 상의/셔츠 | 퍼플 | 루즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |

### male autumn_warm 내추럴 출근/면접 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 412009 | 상의/셔츠 | 퍼플 | 오버사이즈 | 30 | True | 벡터유사도:21, 색상:브라운, 계절:셔츠 |
| 2 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 28 | True | 벡터유사도:21, 계절:셔츠 |
| 3 | 87983 | 하의/팬츠 | 카키 | 루즈 | 26 | True | 벡터유사도:21, 색상:카키 |
| 4 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 21 | False | 벡터유사도:21 |
| 6 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 21 | False | 벡터유사도:21 |

### male autumn_warm 내추럴 출근/면접 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.8
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 412009 | 상의/셔츠 | 퍼플 | 오버사이즈 | 30 | True | 벡터유사도:21, 색상:브라운, 계절:셔츠 |
| 2 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 113955 | 하의/팬츠 | 브라운 | 루즈 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 19327 | 하의/팬츠 | 카키 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |
| 5 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 21 | False | 벡터유사도:21 |
| 6 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |

### male autumn_warm 내추럴 출근/면접 스마트 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.8
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 412009 | 상의/셔츠 | 퍼플 | 오버사이즈 | 30 | True | 벡터유사도:21, 색상:브라운, 계절:셔츠 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |
| 3 | 310836 | 상의/셔츠 | 화이트 | 루즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 4 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 22 | False | 벡터유사도:22 |
| 5 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 21 | False | 벡터유사도:21 |
| 6 | 411391 | 상의/셔츠 | 퍼플 | 루즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |

### male autumn_warm 내추럴 하객룩 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.0
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 29 | True | 벡터유사도:21 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |
| 3 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 87522 | 하의/팬츠 | 카키 | 와이드 | 26 | True | 벡터유사도:21, 색상:카키 |
| 6 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 22 | False | 벡터유사도:22 |

### male autumn_warm 내추럴 하객룩 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 412009 | 상의/셔츠 | 퍼플 | 오버사이즈 | 30 | True | 벡터유사도:21, 색상:브라운, 계절:셔츠 |
| 2 | 113955 | 하의/팬츠 | 브라운 | 루즈 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 19327 | 하의/팬츠 | 카키 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |
| 4 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 87983 | 하의/팬츠 | 카키 | 루즈 | 26 | True | 벡터유사도:21, 색상:카키 |
| 6 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |

### male autumn_warm 내추럴 하객룩 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.8
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |
| 3 | 113955 | 하의/팬츠 | 브라운 | 루즈 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 5 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 6 | 87522 | 하의/팬츠 | 카키 | 와이드 | 26 | True | 벡터유사도:21, 색상:카키 |

### male autumn_warm 내추럴 하객룩 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 412009 | 상의/셔츠 | 퍼플 | 오버사이즈 | 30 | True | 벡터유사도:21, 색상:브라운, 계절:셔츠 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |
| 3 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 87522 | 하의/팬츠 | 카키 | 와이드 | 26 | True | 벡터유사도:21, 색상:카키 |
| 6 | 87983 | 하의/팬츠 | 카키 | 루즈 | 26 | True | 벡터유사도:21, 색상:카키 |

### male autumn_warm 내추럴 하객룩 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.0
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 412009 | 상의/셔츠 | 퍼플 | 오버사이즈 | 35 | True | 벡터유사도:21, 색상:브라운, 계절:셔츠 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 3 | 113955 | 하의/팬츠 | 브라운 | 루즈 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 411391 | 상의/셔츠 | 퍼플 | 루즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |
| 5 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 21 | False | 벡터유사도:21 |
| 6 | 126059 | 하의/팬츠 | 카키 | 루즈 | 31 | True | 벡터유사도:21, 색상:카키 |

### male autumn_warm 내추럴 하객룩 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.0
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 412009 | 상의/셔츠 | 퍼플 | 오버사이즈 | 30 | True | 벡터유사도:21, 색상:브라운, 계절:셔츠 |
| 2 | 87522 | 하의/팬츠 | 카키 | 와이드 | 26 | True | 벡터유사도:21, 색상:카키 |
| 3 | 87983 | 하의/팬츠 | 카키 | 루즈 | 26 | True | 벡터유사도:21, 색상:카키 |
| 4 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 21 | False | 벡터유사도:21 |
| 6 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 21 | False | 벡터유사도:21 |

### male autumn_warm 내추럴 운동/활동 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 27784 | 상의/티셔츠 | 카키 | 노멀 | 31 | True | 벡터유사도:21, 색상:카키 |
| 3 | 1083725 | 하의/팬츠 | 오렌지 | 노멀 | 29 | True | 벡터유사도:21 |
| 4 | 19327 | 하의/팬츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22, 색상:카키 |
| 5 | 520214 | 상의/티셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:카키 |
| 6 | 27603 | 상의/티셔츠 | 화이트 | 루즈 | 31 | True | 벡터유사도:21, 색상:카키 |

### male autumn_warm 내추럴 운동/활동 애슬레저

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 118489 | 하의/팬츠 | 브라운 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 27784 | 상의/티셔츠 | 카키 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |
| 5 | 113955 | 하의/팬츠 | 브라운 | 루즈 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 6 | 19327 | 하의/팬츠 | 카키 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |

### male autumn_warm 내추럴 운동/활동 액티브

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.3
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 27603 | 상의/티셔츠 | 화이트 | 루즈 | 26 | True | 벡터유사도:21, 색상:카키 |
| 4 | 19327 | 하의/팬츠 | 카키 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |
| 5 | 27784 | 상의/티셔츠 | 카키 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |
| 6 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 22 | False | 벡터유사도:22 |

### male autumn_warm 내추럴 운동/활동 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87983 | 하의/팬츠 | 카키 | 루즈 | 31 | True | 벡터유사도:21, 색상:카키 |
| 2 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 3 | 27603 | 상의/티셔츠 | 화이트 | 루즈 | 31 | True | 벡터유사도:21, 색상:카키 |
| 4 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 19327 | 하의/팬츠 | 카키 | 노멀 | 31 | True | 벡터유사도:21, 색상:카키 |
| 6 | 520214 | 상의/티셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:카키 |

### male autumn_warm 내추럴 운동/활동 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 3 | 113955 | 하의/팬츠 | 브라운 | 루즈 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 27784 | 상의/티셔츠 | 카키 | 노멀 | 31 | True | 벡터유사도:21, 색상:카키 |
| 5 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 6 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |

### male autumn_warm 내추럴 운동/활동 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 27784 | 상의/티셔츠 | 카키 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |
| 2 | 87522 | 하의/팬츠 | 카키 | 와이드 | 26 | True | 벡터유사도:21, 색상:카키 |
| 3 | 27603 | 상의/티셔츠 | 화이트 | 루즈 | 26 | True | 벡터유사도:21, 색상:카키 |
| 4 | 118489 | 하의/팬츠 | 브라운 | 노멀 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 520214 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |
| 6 | 87983 | 하의/팬츠 | 카키 | 루즈 | 26 | True | 벡터유사도:21, 색상:카키 |

### male autumn_warm 내추럴 파티/모임 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.2
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19327 | 하의/팬츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22, 색상:카키 |
| 2 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22 |
| 3 | 105679 | 아우터/코트 | 핑크 | 루즈 | 26 | True | 벡터유사도:21 |
| 4 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 113955 | 하의/팬츠 | 브라운 | 루즈 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 6 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |

### male autumn_warm 내추럴 파티/모임 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 25.0
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 2 | 87522 | 하의/팬츠 | 카키 | 와이드 | 26 | True | 벡터유사도:21, 색상:카키 |
| 3 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:브라운 |
| 4 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 25 | False | 벡터유사도:21, 계절:가디건 |
| 5 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 25 | False | 벡터유사도:21, 계절:셔츠 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 22 | False | 벡터유사도:22 |

### male autumn_warm 내추럴 파티/모임 트렌디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 23.8
- Precision@K: 0.33 (2 / 6)
- Positive reasons: 3
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 412009 | 상의/셔츠 | 퍼플 | 오버사이즈 | 30 | True | 벡터유사도:21, 색상:브라운, 계절:셔츠 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22, 색상:카키 |
| 3 | 76065 | 하의/팬츠 | 스카이블루 | 와이드 | 22 | False | 벡터유사도:22 |
| 4 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 21 | False | 벡터유사도:21 |
| 6 | 538074 | 하의/팬츠 | 스카이블루 | 루즈 | 22 | False | 벡터유사도:22 |

### male autumn_warm 내추럴 파티/모임 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 412009 | 상의/셔츠 | 퍼플 | 오버사이즈 | 35 | True | 벡터유사도:21, 색상:브라운, 계절:셔츠 |
| 2 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 32 | True | 벡터유사도:22, 색상:브라운 |
| 3 | 19327 | 하의/팬츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:카키 |
| 4 | 21251 | 하의/팬츠 | 브라운 | 와이드 | 31 | True | 벡터유사도:21, 색상:브라운 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 26 | True | 벡터유사도:21 |

### male autumn_warm 내추럴 파티/모임 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.3
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 121307 | 아우터/가디건 | 카키 | 루즈 | 33 | True | 벡터유사도:21, 색상:카키, 계절:가디건 |
| 2 | 412009 | 상의/셔츠 | 퍼플 | 오버사이즈 | 30 | True | 벡터유사도:21, 색상:브라운, 계절:셔츠 |
| 3 | 46815 | 상의/티셔츠 | 카키 | 노멀 | 29 | True | 벡터유사도:21, 색상:카키 |
| 4 | 19327 | 하의/팬츠 | 카키 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |
| 5 | 99214 | 하의/팬츠 | 화이트 | 와이드 | 25 | True | 벡터유사도:22 |
| 6 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 21 | False | 벡터유사도:21 |

### male autumn_warm 내추럴 파티/모임 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 24.2
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 4
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 412009 | 상의/셔츠 | 퍼플 | 오버사이즈 | 30 | True | 벡터유사도:21, 색상:브라운, 계절:셔츠 |
| 2 | 19327 | 하의/팬츠 | 카키 | 노멀 | 26 | True | 벡터유사도:21, 색상:카키 |
| 3 | 87522 | 하의/팬츠 | 카키 | 와이드 | 26 | True | 벡터유사도:21, 색상:카키 |
| 4 | 1116 | 상의/티셔츠 |  | 루즈 | 21 | False | 벡터유사도:21 |
| 5 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 21 | False | 벡터유사도:21 |
| 6 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 21 | False | 벡터유사도:21 |

### male winter_cool 스트레이트 데일리 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 38.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 10
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 9130 | 하의/팬츠 | 블랙 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 526164 | 상의/티셔츠 | 그린 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 6 | 356978 | 하의/팬츠 | 네이비 | 노멀 | 42 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |

### male winter_cool 스트레이트 데일리 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 38.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 9130 | 하의/팬츠 | 블랙 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 501339 | 하의/청바지 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비 |
| 6 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:화이트 |

### male winter_cool 스트레이트 데일리 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 10
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 356978 | 하의/팬츠 | 네이비 | 노멀 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 526164 | 상의/티셔츠 | 그린 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 9130 | 하의/팬츠 | 블랙 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 6 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |

### male winter_cool 스트레이트 데일리 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 38.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 9130 | 하의/팬츠 | 블랙 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 37 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 1084451 | 하의/팬츠 | 그레이 | 노멀 | 37 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:화이트 |

### male winter_cool 스트레이트 데일리 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 40 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 9130 | 하의/팬츠 | 블랙 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 34 | True | 벡터유사도:22, 계절:셔츠 |
| 4 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 6 | 99214 | 하의/팬츠 | 화이트 | 와이드 | 35 | True | 벡터유사도:22, 색상:화이트 |

### male winter_cool 스트레이트 데일리 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 37.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 42 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 3 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 526164 | 상의/티셔츠 | 그린 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 9130 | 하의/팬츠 | 블랙 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 6 | 87783 | 하의/팬츠 | 블랙 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙 |

### male winter_cool 스트레이트 여행 리조트

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 41 | True | 벡터유사도:23, 색상:블랙, 색상:화이트 |
| 2 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 36 | True | 벡터유사도:23, 색상:화이트 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 36 | True | 벡터유사도:23, 색상:화이트 |
| 4 | 1084973 | 상의/티셔츠 | 베이지 | 노멀 | 31 | True | 벡터유사도:23 |
| 5 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 36 | True | 벡터유사도:23, 색상:화이트 |
| 6 | 1084969 | 상의/티셔츠 | 베이지 | 노멀 | 31 | True | 벡터유사도:23 |

### male winter_cool 스트레이트 여행 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 36.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 3 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 18244 | 하의/팬츠 | 베이지 | 노멀 | 32 | True | 벡터유사도:22 |

### male winter_cool 스트레이트 여행 아웃도어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 3 | 18207 | 하의/팬츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 69367 | 상의/티셔츠 | 네이비 | 노멀 | 32 | True | 벡터유사도:22, 색상:네이비 |
| 5 | 521940 | 하의/팬츠 | 블랙 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:화이트 |

### male winter_cool 스트레이트 여행 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 3 | 27784 | 상의/티셔츠 | 카키 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 90054 | 하의/팬츠 | 블랙 | 벨보텀 | 32 | True | 벡터유사도:22, 색상:블랙 |

### male winter_cool 스트레이트 여행 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 2 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 37 | True | 벡터유사도:22, 색상:블랙 |
| 3 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 4 | 90054 | 하의/팬츠 | 블랙 | 벨보텀 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 120140 | 상의/티셔츠 | 그레이 | 노멀 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:화이트 |

### male winter_cool 스트레이트 여행 시티보이

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 74369 | 하의/팬츠 | 베이지 | 노멀 | 28 | True | 벡터유사도:23 |

### male winter_cool 스트레이트 데이트 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 32 | True | 벡터유사도:22, 색상:블랙 |

### male winter_cool 스트레이트 데이트 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 37.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 506200 | 상의/니트웨어 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 70375 | 상의/니트웨어 | 베이지 | 타이트 | 32 | True | 벡터유사도:22 |
| 5 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 90054 | 하의/팬츠 | 블랙 | 벨보텀 | 37 | True | 벡터유사도:22, 색상:블랙 |

### male winter_cool 스트레이트 데이트 남친룩

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 3 | 90054 | 하의/팬츠 | 블랙 | 벨보텀 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |

### male winter_cool 스트레이트 데이트 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 90054 | 하의/팬츠 | 블랙 | 벨보텀 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 3 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 87783 | 하의/팬츠 | 블랙 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 521940 | 하의/팬츠 | 블랙 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙 |

### male winter_cool 스트레이트 데이트 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 37.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 37 | True | 벡터유사도:22, 색상:블랙 |
| 3 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 37 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 1084451 | 하의/팬츠 | 그레이 | 노멀 | 37 | True | 벡터유사도:22, 색상:블랙 |

### male winter_cool 스트레이트 데이트 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 40 | True | 벡터유사도:22, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |

### male winter_cool 스트레이트 출근/면접 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 356978 | 하의/팬츠 | 네이비 | 노멀 | 32 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 3 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 526164 | 상의/티셔츠 | 그린 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 9130 | 하의/팬츠 | 블랙 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 6 | 1163641 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |

### male winter_cool 스트레이트 출근/면접 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 9130 | 하의/팬츠 | 블랙 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 506200 | 상의/니트웨어 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 521648 | 상의/니트웨어 | 오렌지 | 타이트 | 27 | True | 벡터유사도:22 |
| 5 | 356978 | 하의/팬츠 | 네이비 | 노멀 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 6 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |

### male winter_cool 스트레이트 출근/면접 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 356978 | 하의/팬츠 | 네이비 | 노멀 | 32 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 3 | 1163641 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |

### male winter_cool 스트레이트 출근/면접 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 10
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 35 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 9130 | 하의/팬츠 | 블랙 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 29 | True | 벡터유사도:22, 계절:셔츠 |
| 4 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 356978 | 하의/팬츠 | 네이비 | 노멀 | 32 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 6 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |

### male winter_cool 스트레이트 출근/면접 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 3 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 90054 | 하의/팬츠 | 블랙 | 벨보텀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |

### male winter_cool 스트레이트 출근/면접 스마트 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 9130 | 하의/팬츠 | 블랙 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 526164 | 상의/티셔츠 | 그린 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 501339 | 하의/청바지 | 네이비 | 와이드 | 27 | True | 벡터유사도:22, 색상:네이비 |

### male winter_cool 스트레이트 하객룩 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 35 | True | 벡터유사도:22, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 526164 | 상의/티셔츠 | 그린 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 27 | True | 벡터유사도:22, 색상:화이트 |

### male winter_cool 스트레이트 하객룩 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 9130 | 하의/팬츠 | 블랙 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 501339 | 하의/청바지 | 네이비 | 와이드 | 27 | True | 벡터유사도:22, 색상:네이비 |
| 6 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 27 | True | 벡터유사도:22, 색상:화이트 |

### male winter_cool 스트레이트 하객룩 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 32 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 3 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 87783 | 하의/팬츠 | 블랙 | 와이드 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 521940 | 하의/팬츠 | 블랙 | 와이드 | 27 | True | 벡터유사도:22, 색상:블랙 |

### male winter_cool 스트레이트 하객룩 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 35 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 29 | True | 벡터유사도:22, 계절:셔츠 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 99215 | 하의/팬츠 | 화이트 | 와이드 | 30 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 120658 | 하의/팬츠 | 화이트 | 벨보텀 | 30 | True | 벡터유사도:22, 색상:화이트 |

### male winter_cool 스트레이트 하객룩 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 356978 | 하의/팬츠 | 네이비 | 노멀 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 6 | 90054 | 하의/팬츠 | 블랙 | 벨보텀 | 32 | True | 벡터유사도:22, 색상:블랙 |

### male winter_cool 스트레이트 하객룩 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 9130 | 하의/팬츠 | 블랙 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 356978 | 하의/팬츠 | 네이비 | 노멀 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 6 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |

### male winter_cool 스트레이트 운동/활동 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 36547 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 2 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 3 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 4 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 81956 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 6416 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |

### male winter_cool 스트레이트 운동/활동 애슬레저

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 120140 | 상의/티셔츠 | 그레이 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 69367 | 상의/티셔츠 | 네이비 | 노멀 | 27 | True | 벡터유사도:22, 색상:네이비 |
| 6 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |

### male winter_cool 스트레이트 운동/활동 액티브

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 27 | True | 벡터유사도:22, 색상:화이트 |

### male winter_cool 스트레이트 운동/활동 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 3 | 124638 | 상의/티셔츠 | 핑크 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 120140 | 상의/티셔츠 | 그레이 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 32 | True | 벡터유사도:22, 색상:블랙 |

### male winter_cool 스트레이트 운동/활동 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 6416 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 3 | 37991 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 1084451 | 하의/팬츠 | 그레이 | 노멀 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 112153 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |

### male winter_cool 스트레이트 운동/활동 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 3 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 526164 | 상의/티셔츠 | 그린 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |

### male winter_cool 스트레이트 파티/모임 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 3 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 526164 | 상의/티셔츠 | 그린 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |

### male winter_cool 스트레이트 파티/모임 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 90054 | 하의/팬츠 | 블랙 | 벨보텀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 3 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 27 | True | 벡터유사도:22, 색상:화이트 |

### male winter_cool 스트레이트 파티/모임 트렌디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 1084451 | 하의/팬츠 | 그레이 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 3 | 526164 | 상의/티셔츠 | 그린 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |

### male winter_cool 스트레이트 파티/모임 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 9130 | 하의/팬츠 | 블랙 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 526164 | 상의/티셔츠 | 그린 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 521940 | 하의/팬츠 | 블랙 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |

### male winter_cool 스트레이트 파티/모임 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 35 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 29 | True | 벡터유사도:22, 계절:셔츠 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 99214 | 하의/팬츠 | 화이트 | 와이드 | 30 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 120658 | 하의/팬츠 | 화이트 | 벨보텀 | 30 | True | 벡터유사도:22, 색상:화이트 |

### male winter_cool 스트레이트 파티/모임 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 27 | True | 벡터유사도:22, 색상:블랙 |

### male winter_cool 웨이브 데일리 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 38.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 10
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 42 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 31 | True | 벡터유사도:21, 색상:블랙 |
| 5 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 41 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 6 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 41 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |

### male winter_cool 웨이브 데일리 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 37.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 37 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 37 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22 |

### male winter_cool 웨이브 데일리 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 36 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 2 | 9130 | 하의/팬츠 | 블랙 | 와이드 | 36 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 31 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 31 | True | 벡터유사도:21, 색상:블랙 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21 |

### male winter_cool 웨이브 데일리 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 39.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 37 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 9130 | 하의/팬츠 | 블랙 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 6 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:화이트 |

### male winter_cool 웨이브 데일리 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 10
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 39 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 9130 | 하의/팬츠 | 블랙 | 와이드 | 36 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 31 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 36 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 6 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 36 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |

### male winter_cool 웨이브 데일리 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 37.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 42 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 41 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 31 | True | 벡터유사도:21, 색상:블랙 |
| 4 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 31 | True | 벡터유사도:21, 색상:블랙 |
| 5 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 41 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 6 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 36 | True | 벡터유사도:21, 색상:화이트 |

### male winter_cool 웨이브 여행 리조트

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 40 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 40 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 3 | 69367 | 상의/티셔츠 | 네이비 | 노멀 | 35 | True | 벡터유사도:22, 색상:네이비 |
| 4 | 503188 | 상의/티셔츠 | 베이지 | 노멀 | 30 | True | 벡터유사도:22 |
| 5 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 31 | True | 벡터유사도:23 |
| 6 | 27794 | 하의/팬츠 | 베이지 | 와이드 | 30 | True | 벡터유사도:22 |

### male winter_cool 웨이브 여행 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 38.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 42 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 69367 | 상의/티셔츠 | 네이비 | 노멀 | 37 | True | 벡터유사도:22, 색상:네이비 |
| 5 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 1085751 | 하의/팬츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:화이트 |

### male winter_cool 웨이브 여행 아웃도어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:화이트 |
| 4 | 69367 | 상의/티셔츠 | 네이비 | 노멀 | 31 | True | 벡터유사도:21, 색상:네이비 |
| 5 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 36 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 6 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:화이트 |

### male winter_cool 웨이브 여행 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 36 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:화이트 |
| 4 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 5 | 501973 | 하의/팬츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 19327 | 하의/팬츠 | 카키 | 노멀 | 27 | True | 벡터유사도:22 |

### male winter_cool 웨이브 여행 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 38.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 45 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 69367 | 상의/티셔츠 | 네이비 | 노멀 | 37 | True | 벡터유사도:22, 색상:네이비 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 6 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 37 | True | 벡터유사도:22, 색상:블랙 |

### male winter_cool 웨이브 여행 시티보이

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 3 | 69367 | 상의/티셔츠 | 네이비 | 노멀 | 32 | True | 벡터유사도:22, 색상:네이비 |
| 4 | 503188 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 6 | 522243 | 하의/팬츠 | 베이지 | 와이드 | 27 | True | 벡터유사도:22 |

### male winter_cool 웨이브 데이트 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 41 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 3 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 31 | True | 벡터유사도:21, 색상:블랙 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22 |

### male winter_cool 웨이브 데이트 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 38.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 42 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 42 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 3 | 129703 | 상의/니트웨어 | 베이지 | 노멀 | 31 | True | 벡터유사도:21 |
| 4 | 88649 | 상의/니트웨어 | 베이지 | 노멀 | 31 | True | 벡터유사도:21 |
| 5 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 6 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 41 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |

### male winter_cool 웨이브 데이트 남친룩

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 41 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 36 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 36 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 4 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 90639 | 상의/니트웨어 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 6 | 1231659 | 상의/티셔츠 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |

### male winter_cool 웨이브 데이트 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 41 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 3 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 4 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:화이트 |
| 6 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |

### male winter_cool 웨이브 데이트 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 38.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 42 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 3 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 41 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 37 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 37 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 32 | True | 벡터유사도:22 |

### male winter_cool 웨이브 데이트 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 41 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 3 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22 |

### male winter_cool 웨이브 출근/면접 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 35 | True | 벡터유사도:21, 골격:가디건, 계절:가디건 |
| 2 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 5 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21 |

### male winter_cool 웨이브 출근/면접 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 36 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 36 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 88635 | 상의/니트웨어 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 4 | 88649 | 상의/니트웨어 | 베이지 | 노멀 | 26 | True | 벡터유사도:21 |
| 5 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 36 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 6 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 36 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |

### male winter_cool 웨이브 출근/면접 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.5
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 4 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 6 | 57228 | 아우터/재킷 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### male winter_cool 웨이브 출근/면접 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.8
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 4 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 28 | True | 벡터유사도:21, 계절:셔츠 |
| 5 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 6 | 57228 | 아우터/재킷 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### male winter_cool 웨이브 출근/면접 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.5
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 5 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 6 | 57228 | 아우터/재킷 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### male winter_cool 웨이브 출근/면접 스마트 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.8
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 22 | False | 벡터유사도:22 |

### male winter_cool 웨이브 하객룩 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.3
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 34 | True | 벡터유사도:21, 색상:화이트 |
| 3 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 4 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 180453 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### male winter_cool 웨이브 하객룩 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 26 | True | 벡터유사도:21 |
| 6 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |

### male winter_cool 웨이브 하객룩 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 26.8
- Precision@K: 0.5 (3 / 6)
- Positive reasons: 6
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 4 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 6 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### male winter_cool 웨이브 하객룩 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.0
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 35 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 4 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 28 | True | 벡터유사도:21, 계절:셔츠 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 22 | False | 벡터유사도:22 |
| 6 | 1231659 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### male winter_cool 웨이브 하객룩 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.0
- Precision@K: 0.67 (4 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 36 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 36 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 1239969 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 4 | 1215720 | 상의/티셔츠 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |
| 5 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 36 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 6 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 36 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |

### male winter_cool 웨이브 하객룩 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.5
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 4 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 5 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 6 | 57228 | 아우터/재킷 | 베이지 | 노멀 | 21 | False | 벡터유사도:21 |

### male winter_cool 웨이브 운동/활동 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 10
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 40 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 69367 | 상의/티셔츠 | 네이비 | 노멀 | 32 | True | 벡터유사도:22, 색상:네이비 |
| 3 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 6 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |

### male winter_cool 웨이브 운동/활동 애슬레저

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 10
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 69367 | 상의/티셔츠 | 네이비 | 노멀 | 26 | True | 벡터유사도:21, 색상:네이비 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 6 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |

### male winter_cool 웨이브 운동/활동 액티브

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 10
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 4 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 5 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 6 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |

### male winter_cool 웨이브 운동/활동 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 10
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 36 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:화이트 |
| 4 | 69367 | 상의/티셔츠 | 네이비 | 노멀 | 31 | True | 벡터유사도:21, 색상:네이비 |
| 5 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 36 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 6 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 36 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |

### male winter_cool 웨이브 운동/활동 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 505652 | 상의/티셔츠 | 화이트 | 타이트 | 31 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 32 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 6 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:화이트 |

### male winter_cool 웨이브 운동/활동 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 10
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 4 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 5 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 6 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |

### male winter_cool 웨이브 파티/모임 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 4 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22 |
| 6 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |

### male winter_cool 웨이브 파티/모임 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 4 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 5 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 22 | False | 벡터유사도:22 |

### male winter_cool 웨이브 파티/모임 트렌디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 4 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 5 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 22 | False | 벡터유사도:22 |

### male winter_cool 웨이브 파티/모임 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 27 | True | 벡터유사도:22 |

### male winter_cool 웨이브 파티/모임 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 4 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 28 | True | 벡터유사도:21, 계절:셔츠 |
| 5 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 57303 | 아우터/점퍼 | 베이지 | 노멀 | 24 | True | 벡터유사도:21 |

### male winter_cool 웨이브 파티/모임 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.0
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 36 | True | 벡터유사도:22, 골격:가디건, 계절:가디건 |
| 2 | 282739 | 하의/팬츠 | 화이트 | 스키니 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 4 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 1163685 | 상의/티셔츠 | 블랙 | 타이트 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 1247433 | 아우터/재킷 | 스카이블루 | 노멀 | 22 | False | 벡터유사도:22 |

### male winter_cool 내추럴 데일리 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 42.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 13
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 310836 | 상의/셔츠 | 화이트 | 루즈 | 46 | True | 벡터유사도:22, 색상:블랙, 색상:화이트, 계절:셔츠 |
| 2 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 42 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 3 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 4 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 40 | True | 벡터유사도:21, 색상:화이트, 계절:셔츠 |
| 5 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 42 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 6 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |

### male winter_cool 내추럴 데일리 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 41.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 11
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 310836 | 상의/셔츠 | 화이트 | 루즈 | 46 | True | 벡터유사도:22, 색상:블랙, 색상:화이트, 계절:셔츠 |
| 2 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 42 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 4 | 527956 | 상의/티셔츠 | 화이트 | 루즈 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 9130 | 하의/팬츠 | 블랙 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |

### male winter_cool 내추럴 데일리 꾸안꾸

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 11
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 310836 | 상의/셔츠 | 화이트 | 루즈 | 40 | True | 벡터유사도:21, 색상:블랙, 색상:화이트, 계절:셔츠 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 3 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 36 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 4 | 1148 | 상의/티셔츠 | 화이트 | 루즈 | 31 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 31 | True | 벡터유사도:21, 색상:화이트 |
| 6 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 36 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |

### male winter_cool 내추럴 데일리 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 40.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 11
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 310836 | 상의/셔츠 | 화이트 | 루즈 | 46 | True | 벡터유사도:22, 색상:블랙, 색상:화이트, 계절:셔츠 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 9130 | 하의/팬츠 | 블랙 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 4 | 1148 | 상의/티셔츠 | 화이트 | 루즈 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 501923 | 하의/팬츠 | 화이트 | 루즈 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |

### male winter_cool 내추럴 데일리 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 36.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 11
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 310836 | 상의/셔츠 | 화이트 | 루즈 | 41 | True | 벡터유사도:22, 색상:블랙, 색상:화이트, 계절:셔츠 |
| 2 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 40 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 4 | 478404 | 상의/셔츠 | 베이지 | 노멀 | 33 | True | 벡터유사도:21, 계절:셔츠 |
| 5 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |

### male winter_cool 내추럴 데일리 내추럴

- Source: `chroma_style_rag`
- Count: 6
- Average score: 38.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 11
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 42 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 310836 | 상의/셔츠 | 화이트 | 루즈 | 40 | True | 벡터유사도:21, 색상:블랙, 색상:화이트, 계절:셔츠 |
| 4 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 31 | True | 벡터유사도:21, 색상:블랙 |
| 5 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 31 | True | 벡터유사도:21, 색상:화이트 |
| 6 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 42 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |

### male winter_cool 내추럴 여행 리조트

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 5
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 41 | True | 벡터유사도:23, 색상:블랙, 색상:화이트 |
| 2 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 36 | True | 벡터유사도:23, 색상:화이트 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 36 | True | 벡터유사도:23, 색상:화이트 |
| 4 | 75776 | 상의/티셔츠 | 베이지 | 노멀 | 31 | True | 벡터유사도:23 |
| 5 | 74368 | 아우터/재킷 | 베이지 | 노멀 | 31 | True | 벡터유사도:23 |
| 6 | 501923 | 하의/팬츠 | 화이트 | 루즈 | 36 | True | 벡터유사도:23, 색상:화이트 |

### male winter_cool 내추럴 여행 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 37.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 42 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 6171 | 상의/티셔츠 | 브라운 | 오버사이즈 | 32 | True | 벡터유사도:22 |
| 5 | 501923 | 하의/팬츠 | 화이트 | 루즈 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 12523 | 하의/팬츠 | 블랙 | 루즈 | 37 | True | 벡터유사도:22, 색상:블랙 |

### male winter_cool 내추럴 여행 아웃도어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 36.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 11
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 2 | 1083548 | 상의/티셔츠 | 화이트 | 루즈 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 3 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 4 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 36 | True | 벡터유사도:22, 색상:화이트, 계절:셔츠 |
| 5 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 6 | 69367 | 상의/티셔츠 | 네이비 | 노멀 | 32 | True | 벡터유사도:22, 색상:네이비 |

### male winter_cool 내추럴 여행 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 3 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 22291 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 517132 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 501923 | 하의/팬츠 | 화이트 | 루즈 | 32 | True | 벡터유사도:22, 색상:화이트 |

### male winter_cool 내추럴 여행 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 37.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 17194 | 상의/티셔츠 | 네이비 | 루즈 | 37 | True | 벡터유사도:22, 색상:네이비 |
| 2 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 3 | 81941 | 상의/티셔츠 | 퍼플 | 오버사이즈 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 5 | 69367 | 상의/티셔츠 | 네이비 | 노멀 | 37 | True | 벡터유사도:22, 색상:네이비 |
| 6 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |

### male winter_cool 내추럴 여행 시티보이

- Source: `chroma_style_rag`
- Count: 6
- Average score: 33.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 3 | 69367 | 상의/티셔츠 | 네이비 | 노멀 | 32 | True | 벡터유사도:22, 색상:네이비 |
| 4 | 1084973 | 상의/티셔츠 | 베이지 | 노멀 | 27 | True | 벡터유사도:22 |
| 5 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 6 | 1084461 | 하의/팬츠 | 베이지 | 루즈 | 28 | True | 벡터유사도:23 |

### male winter_cool 내추럴 데이트 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 11
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 36 | True | 벡터유사도:22, 색상:화이트, 계절:셔츠 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 31 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 6 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 36 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |

### male winter_cool 내추럴 데이트 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 40.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 11
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 42 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 2 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 42 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 3 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 41 | True | 벡터유사도:22, 색상:화이트, 계절:셔츠 |
| 4 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 36 | True | 벡터유사도:22, 계절:셔츠 |
| 5 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 6 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |

### male winter_cool 내추럴 데이트 남친룩

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 11
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 2 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 3 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 35 | True | 벡터유사도:21, 색상:화이트, 계절:셔츠 |
| 4 | 81941 | 상의/티셔츠 | 퍼플 | 오버사이즈 | 31 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 36 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 6 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 36 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |

### male winter_cool 내추럴 데이트 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 36.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 11
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 3 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 36 | True | 벡터유사도:22, 색상:화이트, 계절:셔츠 |
| 4 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 6 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |

### male winter_cool 내추럴 데이트 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 39.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 42 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 2 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 42 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 41 | True | 벡터유사도:22, 색상:화이트, 계절:셔츠 |
| 4 | 81941 | 상의/티셔츠 | 퍼플 | 오버사이즈 | 37 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 32 | True | 벡터유사도:22 |
| 6 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 42 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |

### male winter_cool 내추럴 데이트 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 3 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 36 | True | 벡터유사도:22, 색상:화이트, 계절:셔츠 |
| 4 | 81941 | 상의/티셔츠 | 퍼플 | 오버사이즈 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 27 | True | 벡터유사도:22 |
| 6 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |

### male winter_cool 내추럴 출근/면접 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 10
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 310836 | 상의/셔츠 | 화이트 | 루즈 | 35 | True | 벡터유사도:21, 색상:블랙, 색상:화이트, 계절:셔츠 |
| 2 | 356978 | 하의/팬츠 | 네이비 | 노멀 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 4 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 31 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 30 | True | 벡터유사도:21, 색상:화이트, 계절:셔츠 |
| 6 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 26 | True | 벡터유사도:21 |

### male winter_cool 내추럴 출근/면접 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.3
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 10
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 310836 | 상의/셔츠 | 화이트 | 루즈 | 40 | True | 벡터유사도:21, 색상:블랙, 색상:화이트, 계절:셔츠 |
| 2 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 36 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 36 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 4 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 35 | True | 벡터유사도:21, 색상:화이트, 계절:셔츠 |
| 5 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 6 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 21 | False | 벡터유사도:21 |

### male winter_cool 내추럴 출근/면접 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 10
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 310836 | 상의/셔츠 | 화이트 | 루즈 | 35 | True | 벡터유사도:21, 색상:블랙, 색상:화이트, 계절:셔츠 |
| 2 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 35 | True | 벡터유사도:22, 색상:화이트 |
| 3 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 4 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 5 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 30 | True | 벡터유사도:21, 색상:화이트, 계절:셔츠 |
| 6 | 976976 | 아우터/재킷 | 스카이블루 | 루즈 | 29 | True | 벡터유사도:21 |

### male winter_cool 내추럴 출근/면접 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.5
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 10
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 310836 | 상의/셔츠 | 화이트 | 루즈 | 35 | True | 벡터유사도:21, 색상:블랙, 색상:화이트, 계절:셔츠 |
| 2 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 35 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 86573 | 상의/티셔츠 | 화이트 | 오버사이즈 | 34 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 4 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 5 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 21 | False | 벡터유사도:21 |

### male winter_cool 내추럴 출근/면접 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.0
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 10
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 310836 | 상의/셔츠 | 화이트 | 루즈 | 35 | True | 벡터유사도:21, 색상:블랙, 색상:화이트, 계절:셔츠 |
| 2 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 4 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 30 | True | 벡터유사도:21, 색상:화이트, 계절:셔츠 |
| 5 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 6 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 21 | False | 벡터유사도:21 |

### male winter_cool 내추럴 출근/면접 스마트 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.5
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 310836 | 상의/셔츠 | 화이트 | 루즈 | 35 | True | 벡터유사도:21, 색상:블랙, 색상:화이트, 계절:셔츠 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 4 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 5 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 6 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 21 | False | 벡터유사도:21 |

### male winter_cool 내추럴 하객룩 클래식

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 35 | True | 벡터유사도:22, 색상:화이트 |
| 2 | 310836 | 상의/셔츠 | 화이트 | 루즈 | 35 | True | 벡터유사도:21, 색상:블랙, 색상:화이트, 계절:셔츠 |
| 3 | 19138 | 하의/팬츠 | 화이트 | 노멀 | 34 | True | 벡터유사도:21, 색상:화이트 |
| 4 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 5 | 976976 | 아우터/재킷 | 스카이블루 | 루즈 | 29 | True | 벡터유사도:21 |
| 6 | 1148 | 상의/티셔츠 | 화이트 | 루즈 | 26 | True | 벡터유사도:21, 색상:화이트 |

### male winter_cool 내추럴 하객룩 포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 12
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 310836 | 상의/셔츠 | 화이트 | 루즈 | 35 | True | 벡터유사도:21, 색상:블랙, 색상:화이트, 계절:셔츠 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 32 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 3 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 32 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 4 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 31 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 30 | True | 벡터유사도:21, 색상:화이트, 계절:셔츠 |
| 6 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |

### male winter_cool 내추럴 하객룩 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 10
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 32 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 30 | True | 벡터유사도:21, 색상:화이트, 계절:셔츠 |
| 4 | 81941 | 상의/티셔츠 | 퍼플 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 6 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 32 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |

### male winter_cool 내추럴 하객룩 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 31.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 11
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 35 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 86573 | 상의/티셔츠 | 화이트 | 오버사이즈 | 35 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 4 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 30 | True | 벡터유사도:21, 색상:화이트, 계절:셔츠 |
| 5 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 6 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 32 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |

### male winter_cool 내추럴 하객룩 미니멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 35.3
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 11
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 35 | True | 벡터유사도:21, 색상:화이트, 계절:셔츠 |
| 4 | 27299 | 상의/셔츠 | 그린 | 오버사이즈 | 30 | True | 벡터유사도:21, 계절:셔츠 |
| 5 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 6 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 36 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |

### male winter_cool 내추럴 하객룩 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 29.2
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 10
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 310836 | 상의/셔츠 | 화이트 | 루즈 | 35 | True | 벡터유사도:21, 색상:블랙, 색상:화이트, 계절:셔츠 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 32 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 3 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 4 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 30 | True | 벡터유사도:21, 색상:화이트, 계절:셔츠 |
| 5 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 6 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 21 | False | 벡터유사도:21 |

### male winter_cool 내추럴 운동/활동 스포티

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083548 | 상의/티셔츠 | 화이트 | 루즈 | 37 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 2 | 17194 | 상의/티셔츠 | 네이비 | 루즈 | 32 | True | 벡터유사도:22, 색상:네이비 |
| 3 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 4 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 32 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 5 | 69367 | 상의/티셔츠 | 네이비 | 노멀 | 32 | True | 벡터유사도:22, 색상:네이비 |
| 6 | 130745 | 상의/티셔츠 | 화이트 | 오버사이즈 | 32 | True | 벡터유사도:22, 색상:화이트 |

### male winter_cool 내추럴 운동/활동 애슬레저

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 69367 | 상의/티셔츠 | 네이비 | 노멀 | 26 | True | 벡터유사도:21, 색상:네이비 |
| 4 | 81941 | 상의/티셔츠 | 퍼플 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 6 | 501923 | 하의/팬츠 | 화이트 | 루즈 | 26 | True | 벡터유사도:21, 색상:화이트 |

### male winter_cool 내추럴 운동/활동 액티브

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.7
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 8
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 1148 | 상의/티셔츠 | 화이트 | 루즈 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 4 | 130745 | 상의/티셔츠 | 화이트 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 81941 | 상의/티셔츠 | 퍼플 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 6 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |

### male winter_cool 내추럴 운동/활동 캐주얼

- Source: `chroma_style_rag`
- Count: 6
- Average score: 34.2
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 36 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 17194 | 상의/티셔츠 | 네이비 | 루즈 | 32 | True | 벡터유사도:22, 색상:네이비 |
| 4 | 69367 | 상의/티셔츠 | 네이비 | 노멀 | 32 | True | 벡터유사도:22, 색상:네이비 |
| 5 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 36 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 6 | 81941 | 상의/티셔츠 | 퍼플 | 오버사이즈 | 32 | True | 벡터유사도:22, 색상:화이트 |

### male winter_cool 내추럴 운동/활동 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 130403 | 상의/티셔츠 | 화이트 | 루즈 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 3 | 1083548 | 상의/티셔츠 | 화이트 | 루즈 | 32 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 4 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 32 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 5 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 32 | True | 벡터유사도:22, 색상:블랙 |
| 6 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |

### male winter_cool 내추럴 운동/활동 고프코어

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 81941 | 상의/티셔츠 | 퍼플 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 4 | 130745 | 상의/티셔츠 | 화이트 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 6 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |

### male winter_cool 내추럴 파티/모임 시크

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.5
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 10
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 32 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 32 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 3 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 31 | True | 벡터유사도:21, 색상:화이트 |
| 4 | 14099 | 상의/셔츠 | 화이트 | 루즈 | 30 | True | 벡터유사도:21, 색상:화이트, 계절:셔츠 |
| 5 | 48762 | 상의/티셔츠 | 화이트 | 노멀 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 6 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |

### male winter_cool 내추럴 파티/모임 댄디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 28.8
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 32 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 32 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 3 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 4 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 81941 | 상의/티셔츠 | 퍼플 | 오버사이즈 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 6 | 516822 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |

### male winter_cool 내추럴 파티/모임 트렌디

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.0
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 2 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 3 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 5 | 88381 | 상의/티셔츠 | 블랙 | 노멀 | 26 | True | 벡터유사도:21, 색상:블랙 |
| 6 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 21 | False | 벡터유사도:21 |

### male winter_cool 내추럴 파티/모임 스트릿

- Source: `chroma_style_rag`
- Count: 6
- Average score: 32.0
- Precision@K: 1.0 (6 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 37 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 527956 | 상의/티셔츠 | 화이트 | 루즈 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 3 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 4 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 32 | True | 벡터유사도:22, 색상:네이비, 색상:화이트 |
| 5 | 901239 | 상의/티셔츠 | 화이트 | 노멀 | 32 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 27 | True | 벡터유사도:22 |

### male winter_cool 내추럴 파티/모임 모던

- Source: `chroma_style_rag`
- Count: 6
- Average score: 30.5
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 9
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 1083792 | 하의/팬츠 | 화이트 | 노멀 | 35 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 2 | 86573 | 상의/티셔츠 | 화이트 | 오버사이즈 | 35 | True | 벡터유사도:22, 색상:블랙, 색상:화이트 |
| 3 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 4 | 70819 | 상의/티셔츠 | 블랙 | 노멀 | 29 | True | 벡터유사도:21, 색상:블랙 |
| 5 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 6 | 97649 | 아우터/가디건 | 베이지 | 노멀 | 26 | False | 벡터유사도:22, 계절:가디건 |

### male winter_cool 내추럴 파티/모임 세미포멀

- Source: `chroma_style_rag`
- Count: 6
- Average score: 27.3
- Precision@K: 0.83 (5 / 6)
- Positive reasons: 7
- Avoid reasons: 0

| Rank | Image ID | Type | Color | Fit | Score | Relevant | Reasons |
|---:|---|---|---|---|---:|---|---|
| 1 | 87505 | 하의/팬츠 | 화이트 | 와이드 | 31 | True | 벡터유사도:21, 색상:블랙, 색상:화이트 |
| 2 | 87152 | 하의/팬츠 | 네이비 | 와이드 | 31 | True | 벡터유사도:21, 색상:네이비, 색상:화이트 |
| 3 | 1138936 | 상의/티셔츠 | 블랙 | 노멀 | 27 | True | 벡터유사도:22, 색상:블랙 |
| 4 | 976975 | 아우터/재킷 | 화이트 | 루즈 | 27 | True | 벡터유사도:22, 색상:화이트 |
| 5 | 1148 | 상의/티셔츠 | 화이트 | 루즈 | 26 | True | 벡터유사도:21, 색상:화이트 |
| 6 | 1032387 | 아우터/재킷 | 그레이 | 오버사이즈 | 22 | False | 벡터유사도:22 |
