import pandas as pd

# 1. 네이버 API로 수집한 CSV 읽기
df = pd.read_csv("naver_clothes_data.csv")

# 2. 중복 상품 제거
df = df.drop_duplicates(subset=["title", "link"])

# 3. 추천용 컬럼 추가
df["category_simple"] = ""
df["situation_tags"] = ""
df["mood_tags"] = ""
df["style_tags"] = ""
df["season_tags"] = ""

# 4. 카테고리 단순화 함수
def simplify_category(row):
    text = f"{row.get('title', '')} {row.get('category3', '')} {row.get('category4', '')}"

    if any(word in text for word in ["후드", "티셔츠", "셔츠", "블라우스", "니트", "가디건"]):
        return "상의"
    if any(word in text for word in ["청바지", "슬랙스", "팬츠", "바지", "스커트"]):
        return "하의"
    if any(word in text for word in ["자켓", "재킷", "코트", "점퍼", "패딩"]):
        return "아우터"
    if any(word in text for word in ["원피스", "드레스"]):
        return "원피스"

    return "기타"

# 5. query 기준으로 상황/무드/스타일 태그 생성
def make_tags(query):
    situation = []
    mood = []
    style = []
    season = ["봄", "가을"]

    if "캠퍼스" in query:
        situation += ["캠퍼스", "데일리"]
        mood += ["캐주얼", "편안한"]
        style += ["캠퍼스룩", "데일리룩"]

    if "데이트" in query:
        situation += ["데이트"]
        mood += ["러블리", "부드러운"]
        style += ["데이트룩", "페미닌"]

    if "면접" in query:
        situation += ["면접", "발표"]
        mood += ["단정", "깔끔"]
        style += ["오피스룩", "미니멀룩"]

    if "미니멀" in query:
        situation += ["데일리", "출근"]
        mood += ["깔끔", "차분한"]
        style += ["미니멀룩", "베이직"]

    if "하객" in query:
        situation += ["하객", "격식"]
        mood += ["우아한", "단정"]
        style += ["하객룩", "포멀"]

    if "데일리" in query:
        situation += ["데일리", "캠퍼스"]
        mood += ["편안한", "캐주얼"]
        style += ["데일리룩", "베이직"]

    return (
        ",".join(sorted(set(situation))),
        ",".join(sorted(set(mood))),
        ",".join(sorted(set(style))),
        ",".join(sorted(set(season))),
    )

# 6. 카테고리 적용
df["category_simple"] = df.apply(simplify_category, axis=1)

# 7. 태그 적용
for idx, row in df.iterrows():
    situation, mood, style, season = make_tags(row["query"])
    df.at[idx, "situation_tags"] = situation
    df.at[idx, "mood_tags"] = mood
    df.at[idx, "style_tags"] = style
    df.at[idx, "season_tags"] = season

# 8. 기타 카테고리 제거
df = df[df["category_simple"] != "기타"]

# 9. 저장
df.to_csv("structured_clothes_data.csv", index=False, encoding="utf-8-sig")

print("완료: structured_clothes_data.csv 생성")
print(f"총 {len(df)}개 상품 정리됨")