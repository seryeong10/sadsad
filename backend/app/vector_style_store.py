from __future__ import annotations

import csv
import os
import shutil
from pathlib import Path
from typing import Iterable, Optional

from openai import OpenAI

from app.style_rag_documents import retrieve_style_context


ROOT_DIR = Path(__file__).resolve().parents[1]
DEFAULT_CHROMA_DIR = ROOT_DIR / "data" / "chroma"
DEFAULT_COLLECTION_NAME = "kfashion_style_items"
DEFAULT_EMBEDDING_MODEL = "text-embedding-3-small"


def build_chroma_store(
    csv_path: Path,
    persist_dir: Path = DEFAULT_CHROMA_DIR,
    collection_name: str = DEFAULT_COLLECTION_NAME,
    embedding_model: str = DEFAULT_EMBEDDING_MODEL,
    batch_size: int = 64,
    limit: Optional[int] = None,
    reset: bool = False,
) -> dict[str, object]:
    if reset and persist_dir.exists():
        shutil.rmtree(persist_dir)

    client = _openai_client()
    collection = _get_collection(persist_dir, collection_name, embedding_model)
    rows = _load_rows(csv_path)
    if limit is not None:
        rows = rows[:limit]

    added = 0
    for batch in _chunks(rows, batch_size):
        ids = [str(row.get("image_id", "")) for row in batch if row.get("image_id")]
        if not ids:
            continue

        documents = [build_item_document(row) for row in batch if row.get("image_id")]
        metadatas = [_row_metadata(row) for row in batch if row.get("image_id")]
        embeddings = _embed_texts(client, documents, embedding_model)

        collection.upsert(
            ids=ids,
            documents=documents,
            metadatas=metadatas,
            embeddings=embeddings,
        )
        added += len(ids)

    return {
        "persist_dir": str(persist_dir),
        "collection": collection_name,
        "embedding_model": embedding_model,
        "count": collection.count(),
        "added": added,
    }


def search_style_items(
    gender: str,
    personal_color: str,
    skeleton_type: str,
    situation: str,
    mood: str,
    season: str = "",
    limit: int = 8,
    persist_dir: Path = DEFAULT_CHROMA_DIR,
    collection_name: str = DEFAULT_COLLECTION_NAME,
    embedding_model: str = DEFAULT_EMBEDDING_MODEL,
) -> list[dict[str, object]]:
    if not persist_dir.exists():
        return []

    client = _openai_client()
    collection = _get_collection(persist_dir, collection_name, embedding_model)
    if collection.count() == 0:
        return []

    style_context = retrieve_style_context(
        gender=gender,
        personal_color=personal_color,
        skeleton_type=skeleton_type,
        situation=situation,
        mood=mood,
        season=season,
    )
    query_text = build_query_document(style_context)
    query_embedding = _embed_texts(client, [query_text], embedding_model)[0]
    result = collection.query(
        query_embeddings=[query_embedding],
        n_results=max(limit * 12, 60),
        include=["documents", "metadatas", "distances"],
    )

    matches = []
    ids = result.get("ids", [[]])[0]
    documents = result.get("documents", [[]])[0]
    metadatas = result.get("metadatas", [[]])[0]
    distances = result.get("distances", [[]])[0]
    for index, item_id in enumerate(ids):
        metadata = dict(metadatas[index] or {})
        metadata["image_id"] = str(metadata.get("image_id") or item_id)
        metadata["rag_document"] = documents[index] if index < len(documents) else ""
        metadata["vector_distance"] = float(distances[index]) if index < len(distances) else 0.0
        metadata["style_context"] = style_context
        matches.append(metadata)

    return matches


def build_item_document(row: dict[str, object]) -> str:
    parts = [
        _phrase("스타일", row.get("style", "")),
        _phrase("서브스타일", row.get("sub_style", "")),
        _phrase("아이템", row.get("item_type", ""), row.get("category", "")),
        _phrase("색상", row.get("color", ""), row.get("sub_color", "")),
        _phrase("핏", row.get("fit", "")),
        _phrase("소재", row.get("material", "")),
        _phrase("패턴", row.get("print", "")),
        _phrase("디테일", row.get("detail", "")),
        _phrase("상황", row.get("situation_tags", "")),
        _phrase("무드", row.get("mood_tags", "")),
    ]
    return ". ".join(part for part in parts if part)


def build_query_document(style_context: dict[str, object]) -> str:
    query = style_context.get("query", {})
    parts = [
        _phrase("", query.get("gender", ""), "사용자"),
        _phrase("상황", query.get("situation", "")),
        _phrase("무드", query.get("mood", "")),
        _phrase("계절", style_context.get("season_label") or style_context.get("season", "")),
        _phrase("퍼스널컬러", query.get("personal_color", "")),
        _phrase("골격", query.get("skeleton_type", "")),
        _phrase("추천 색상", ", ".join(style_context.get("recommended_colors", [])[:12])),
        _phrase("피해야 할 색상", ", ".join(style_context.get("avoid_colors", [])[:8])),
        _phrase("추천 핏", ", ".join(style_context.get("recommended_fit", [])[:8])),
        _phrase("추천 아이템", ", ".join(style_context.get("recommended_items", [])[:10])),
        _phrase("추천 소재", ", ".join(style_context.get("recommended_materials", [])[:8])),
        _phrase("피해야 할 골격 요소", ", ".join(style_context.get("avoid_skeleton_keywords", [])[:8])),
        _phrase("계절 추천", ", ".join(style_context.get("recommended_season_keywords", [])[:8])),
    ]
    return ". ".join(part for part in parts if part)


def _phrase(label: str, *values: object) -> str:
    text = " ".join(str(value).strip() for value in values if str(value).strip())
    if not text:
        return ""
    if not label:
        return text
    return f"{label} {text}"


def _get_collection(persist_dir: Path, collection_name: str, embedding_model: str):
    try:
        import chromadb
    except ImportError as exc:
        raise RuntimeError("chromadb가 설치되어 있지 않습니다. backend/requirements.txt를 설치하세요.") from exc

    persist_dir.mkdir(parents=True, exist_ok=True)
    client = chromadb.PersistentClient(
        path=str(persist_dir),
        settings=chromadb.Settings(anonymized_telemetry=False),
    )
    return client.get_or_create_collection(
        name=collection_name,
        metadata={
            "hnsw:space": "cosine",
            "embedding_model": embedding_model,
        },
    )


def _openai_client() -> OpenAI:
    api_key = os.getenv("OPENAI_API_KEY")
    if not api_key:
        raise RuntimeError("OPENAI_API_KEY가 설정되어 있지 않습니다.")
    return OpenAI(api_key=api_key)


def _embed_texts(client: OpenAI, texts: list[str], model: str) -> list[list[float]]:
    response = client.embeddings.create(model=model, input=texts)
    return [item.embedding for item in response.data]


def _load_rows(csv_path: Path) -> list[dict[str, str]]:
    with csv_path.open("r", encoding="utf-8-sig", newline="") as file:
        return list(csv.DictReader(file))


def _row_metadata(row: dict[str, object]) -> dict[str, str]:
    keys = [
        "image_id",
        "original_image_url",
        "image_url",
        "style",
        "sub_style",
        "item_type",
        "category",
        "color",
        "sub_color",
        "fit",
        "material",
        "print",
        "detail",
        "situation_tags",
        "mood_tags",
    ]
    return {key: str(row.get(key, "") or "") for key in keys}


def _chunks(values: list[dict[str, str]], size: int) -> Iterable[list[dict[str, str]]]:
    for index in range(0, len(values), size):
        yield values[index:index + size]
