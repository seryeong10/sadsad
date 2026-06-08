from __future__ import annotations

from copy import deepcopy
from datetime import datetime
from zoneinfo import ZoneInfo


SEASON_STYLE_RULES = {
    "female": {
        "spring": {
            "label": "봄",
            "recommended": ["가디건", "트렌치코트", "얇은 니트", "셔츠", "플라워 원피스", "코튼 자켓"],
            "avoid": ["패딩", "기모", "두꺼운 울", "롱패딩", "퍼자켓", "목폴라"],
        },
        "summer": {
            "label": "여름",
            "recommended": ["반팔", "민소매", "린넨", "시어서커", "냉감", "샌들"],
            "avoid": ["패딩", "코트", "울", "기모", "목폴라", "두꺼운 니트"],
        },
        "autumn": {
            "label": "가을",
            "recommended": ["자켓", "트렌치코트", "니트", "가디건", "코듀로이", "앵클부츠"],
            "avoid": ["민소매", "냉감", "시어서커", "비치 원피스", "두꺼운 패딩", "퍼자켓"],
        },
        "winter": {
            "label": "겨울",
            "recommended": ["코트", "패딩", "울", "기모", "니트", "목폴라"],
            "avoid": ["반팔", "민소매", "린넨", "시어서커", "냉감", "샌들"],
        },
    },
    "male": {
        "spring": {
            "label": "봄",
            "recommended": ["가디건", "트렌치코트", "셔츠", "맨투맨", "코튼 자켓", "얇은 니트"],
            "avoid": ["패딩", "기모", "두꺼운 니트", "롱패딩", "퍼자켓", "방한화"],
        },
        "summer": {
            "label": "여름",
            "recommended": ["반팔티", "반팔 셔츠", "린넨 셔츠", "시어서커 셔츠", "냉감 티셔츠", "샌들"],
            "avoid": ["패딩", "코트", "울 니트", "기모 맨투맨", "목폴라", "방한 부츠"],
        },
        "autumn": {
            "label": "가을",
            "recommended": ["자켓", "트렌치코트", "니트", "가디건", "코듀로이 팬츠", "첼시부츠"],
            "avoid": ["민소매", "냉감 티셔츠", "시어서커 셔츠", "반바지", "롱패딩", "방한화"],
        },
        "winter": {
            "label": "겨울",
            "recommended": ["코트", "패딩", "울 니트", "기모 맨투맨", "목폴라", "방한화"],
            "avoid": ["반팔티", "민소매", "린넨 셔츠", "시어서커 셔츠", "냉감 티셔츠", "샌들"],
        },
    },
}


SEASON_SEARCH_OVERRIDES = {
    ("female", "spring", "데이트", "러블리"): ["플라워 원피스", "리본 가디건", "셔링 블라우스", "얇은 니트", "트렌치코트"],
    ("female", "summer", "여행", "리조트"): ["린넨 원피스", "민소매 원피스", "반팔 셔츠", "샌들", "라탄백"],
    ("female", "autumn", "출근/면접", "클래식"): ["트렌치코트", "니트 가디건", "자켓", "코듀로이 스커트", "앵클부츠"],
    ("female", "winter", "하객룩", "우아한"): ["울 코트", "니트 원피스", "목폴라 니트", "롱부츠", "울 스커트"],
    ("male", "spring", "데일리", "미니멀"): ["셔츠", "가디건", "코튼 자켓", "얇은 니트", "슬랙스"],
    ("male", "summer", "여행", "시티보이"): ["반팔 셔츠", "린넨 셔츠", "반바지", "샌들", "냉감 티셔츠"],
    ("male", "autumn", "데이트", "댄디"): ["트렌치코트", "니트 셔츠", "가디건", "첼시부츠", "코듀로이 팬츠"],
    ("male", "winter", "출근/면접", "포멀"): ["울 코트", "목폴라", "울 니트", "정장 자켓", "기모 슬랙스"],
}


SEASON_ALIASES = {
    "봄": "spring",
    "spring": "spring",
    "여름": "summer",
    "summer": "summer",
    "가을": "autumn",
    "autumn": "autumn",
    "fall": "autumn",
    "겨울": "winter",
    "winter": "winter",
}


def resolve_season(season: str = "") -> str:
    normalized = season.strip().lower()
    if normalized in SEASON_ALIASES:
        return SEASON_ALIASES[normalized]

    month = datetime.now(ZoneInfo("Asia/Seoul")).month
    if 3 <= month <= 5:
        return "spring"
    if 6 <= month <= 8:
        return "summer"
    if 9 <= month <= 11:
        return "autumn"
    return "winter"


def get_season_style_rules(gender: str, season: str) -> dict:
    gender_key = "male" if gender == "male" else "female"
    season_key = resolve_season(season)
    return deepcopy(SEASON_STYLE_RULES[gender_key][season_key])


def get_season_search_keywords(
    gender: str,
    season: str,
    situation: str,
    mood: str,
) -> list[str]:
    gender_key = "male" if gender == "male" else "female"
    season_key = resolve_season(season)
    return deepcopy(SEASON_SEARCH_OVERRIDES.get((gender_key, season_key, situation, mood), []))
