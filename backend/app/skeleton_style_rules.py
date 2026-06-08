from __future__ import annotations

from copy import deepcopy


SKELETON_STYLE_RULES = {
    "female": {
        "스트레이트": {
            "recommended_fit": ["정핏", "기본핏", "일자핏", "세미슬림핏", "테일러드핏", "슬림스트레이트핏"],
            "recommended_tops": ["브이넥 니트", "스퀘어넥 티셔츠", "오픈카라 셔츠", "기본 셔츠", "싱글 자켓", "카라 니트"],
            "recommended_bottoms": ["일자 슬랙스", "스트레이트 데님", "세미부츠컷 팬츠", "H라인 스커트", "테이퍼드 팬츠", "기본핏 면바지"],
            "recommended_materials": ["코튼 셔츠", "탄탄한 니트", "울 블렌드", "트윌 코튼", "데님 원단", "수트 원단"],
            "avoid": ["프릴 블라우스", "러플 원피스", "벌룬소매", "두꺼운 꽈배기 니트", "박시핏 셔츠", "오버핏 맨투맨"],
        },
        "웨이브": {
            "recommended_fit": ["슬림핏", "크롭핏", "하이웨스트핏", "허리강조핏", "세미타이트핏", "플레어핏"],
            "recommended_tops": ["크롭 니트", "크롭 가디건", "라운드넥 니트", "리본 블라우스", "퍼프소매 블라우스", "슬림핏 티셔츠"],
            "recommended_bottoms": ["하이웨스트 팬츠", "하이웨스트 데님", "플레어 스커트", "A라인 스커트", "부츠컷 데님", "하이웨스트 와이드팬츠"],
            "recommended_materials": ["부드러운 니트", "골지 니트", "쉬폰 소재", "레이온 블라우스", "실키 블라우스", "얇은 코튼"],
            "avoid": ["롱 박스티", "로우라이즈 팬츠", "오버핏 셔츠", "긴 기장 맨투맨", "두꺼운 데님", "무거운 울코트"],
        },
        "내추럴": {
            "recommended_fit": ["오버핏", "루즈핏", "와이드핏", "세미와이드핏", "박시핏", "릴렉스핏"],
            "recommended_tops": ["오버핏 셔츠", "루즈핏 니트", "박시핏 티셔츠", "오버핏 맨투맨", "린넨 셔츠", "롱 가디건"],
            "recommended_bottoms": ["와이드 팬츠", "세미와이드 슬랙스", "카고 팬츠", "와이드 데님", "린넨 팬츠", "롱 스커트"],
            "recommended_materials": ["린넨 소재", "데님 원단", "코튼 캔버스", "트위드 소재", "코듀로이", "워싱 코튼"],
            "avoid": ["초슬림핏 티셔츠", "스키니진", "짧은 크롭 자켓", "얇은 실키 블라우스", "딱 붙는 골지 니트", "미니스커트"],
        },
    },
    "male": {
        "스트레이트": {
            "recommended_fit": ["기본핏", "정핏", "레귤러핏", "슬림스트레이트핏", "테이퍼드핏", "테일러드핏"],
            "recommended_tops": ["브이넥 니트", "오픈카라 셔츠", "기본 반팔티", "카라 티셔츠", "싱글 자켓", "테일러드 자켓"],
            "recommended_bottoms": ["일자 슬랙스", "스트레이트 데님", "테이퍼드 슬랙스", "치노팬츠", "세미와이드 슬랙스", "기본핏 면바지"],
            "recommended_materials": ["코튼 티셔츠", "피케 면", "옥스포드 셔츠", "울 블렌드", "치노 원단", "수트 원단"],
            "avoid": ["박시핏 맨투맨", "오버핏 후드", "두꺼운 터틀넥", "루즈핏 니트", "드롭숄더 티셔츠", "과한 와이드 팬츠"],
        },
        "웨이브": {
            "recommended_fit": ["슬림핏", "세미슬림핏", "숏기장핏", "레이어드핏", "테이퍼드핏", "깔끔한 기본핏"],
            "recommended_tops": ["슬림핏 니트", "라운드넥 니트", "숏기장 자켓", "레이어드 티셔츠", "가디건", "세미슬림 셔츠"],
            "recommended_bottoms": ["테이퍼드 슬랙스", "슬림 스트레이트 데님", "크롭 슬랙스", "세미와이드 팬츠", "밴딩 슬랙스", "발목기장 팬츠"],
            "recommended_materials": ["부드러운 니트", "코튼 니트", "얇은 가디건", "레이온 셔츠", "소프트 코튼", "라이트 울"],
            "avoid": ["롱기장 티셔츠", "오버핏 셔츠", "박시핏 자켓", "과한 와이드 팬츠", "두꺼운 니트", "롱 코트"],
        },
        "내추럴": {
            "recommended_fit": ["오버핏", "루즈핏", "와이드핏", "릴렉스핏", "박시핏", "레귤러와이드핏"],
            "recommended_tops": ["오버핏 셔츠", "루즈핏 니트", "박시핏 반팔티", "오버핏 맨투맨", "워크자켓", "린넨 셔츠"],
            "recommended_bottoms": ["와이드 데님", "카고 팬츠", "세미와이드 슬랙스", "벌룬 팬츠", "린넨 팬츠", "와이드 치노팬츠"],
            "recommended_materials": ["린넨 셔츠", "데님 원단", "코튼 캔버스", "코듀로이 팬츠", "워싱 코튼", "나일론 자켓"],
            "avoid": ["초슬림 티셔츠", "스키니진", "타이트 셔츠", "짧은 슬림 자켓", "얇은 찰랑 셔츠", "너무 작은 니트"],
        },
    },
}


SECTION_WEIGHTS = {
    "recommended_fit": 4,
    "recommended_tops": 5,
    "recommended_bottoms": 5,
    "recommended_materials": 3,
    "avoid": -10,
}


def get_skeleton_style_rules(skeleton_type: str, gender: str = "") -> dict:
    gender_key = "male" if gender == "male" else "female"
    return deepcopy(SKELETON_STYLE_RULES[gender_key][skeleton_type])


def score_skeleton_text(text: str, skeleton_type: str, gender: str = "") -> dict:
    normalized_text = _normalize_search_text(text)
    rules = get_skeleton_style_rules(skeleton_type, gender=gender)
    score = 0
    reasons = []
    avoid_reasons = []

    for section, keywords in rules.items():
        weight = SECTION_WEIGHTS[section]
        for keyword in keywords:
            if _normalize_search_text(keyword) in normalized_text:
                score += weight
                if weight > 0:
                    reasons.append(keyword)
                else:
                    avoid_reasons.append(keyword)

    return {
        "score": score,
        "matched_keywords": reasons,
        "avoid_keywords": avoid_reasons,
    }


def _normalize_search_text(value: str) -> str:
    return value.replace(" ", "").lower()
