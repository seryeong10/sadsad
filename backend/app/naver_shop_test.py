import os
import requests
import pandas as pd
from dotenv import load_dotenv

load_dotenv()

client_id = os.getenv("NAVER_CLIENT_ID")
client_secret = os.getenv("NAVER_CLIENT_SECRET")

queries = [
    "캠퍼스룩 후드티",
    "캠퍼스룩 청바지",
    "데이트룩 블라우스",
    "데이트룩 스커트",
    "면접룩 셔츠",
    "면접룩 슬랙스",
    "미니멀룩 니트",
    "미니멀룩 자켓",
    "하객룩 원피스",
    "데일리룩 가디건"
]

url = "https://openapi.naver.com/v1/search/shop.json"

headers = {
    "X-Naver-Client-Id": client_id,
    "X-Naver-Client-Secret": client_secret
}

items = []

for query in queries:
    params = {
        "query": query,
        "display": 20
    }

    response = requests.get(url, headers=headers, params=params)
    data = response.json()

    for item in data["items"]:
        items.append({
            "query": query,
            "title": item["title"].replace("<b>", "").replace("</b>", ""),
            "image": item["image"],
            "link": item["link"],
            "price": item["lprice"],
            "mallName": item["mallName"],
            "category1": item["category1"],
            "category2": item["category2"],
            "category3": item["category3"],
            "category4": item["category4"],
        })

df = pd.DataFrame(items)

df.to_csv("naver_clothes_data.csv", index=False, encoding="utf-8-sig")

print("저장 완료: naver_clothes_data.csv")
print(f"총 {len(df)}개 상품 저장됨")