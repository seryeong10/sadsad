from __future__ import annotations

import argparse
import os
from pathlib import Path

from dotenv import load_dotenv

try:
    from app.vector_style_store import (
        DEFAULT_CHROMA_DIR,
        DEFAULT_COLLECTION_NAME,
        DEFAULT_EMBEDDING_MODEL,
        ROOT_DIR,
        build_chroma_store,
    )
except ModuleNotFoundError:
    import sys

    sys.path.append(str(Path(__file__).resolve().parents[1]))
    from app.vector_style_store import (
        DEFAULT_CHROMA_DIR,
        DEFAULT_COLLECTION_NAME,
        DEFAULT_EMBEDDING_MODEL,
        ROOT_DIR,
        build_chroma_store,
    )


def main() -> None:
    load_dotenv()
    parser = argparse.ArgumentParser(description="Build ChromaDB index for K-Fashion style RAG.")
    parser.add_argument(
        "--csv",
        default=str(ROOT_DIR / "data" / "kfashion" / "kfashion_recommendation_data.csv"),
        help="K-Fashion recommendation CSV path.",
    )
    parser.add_argument(
        "--persist-dir",
        default=os.getenv("CHROMA_PERSIST_DIR", str(DEFAULT_CHROMA_DIR)),
        help="ChromaDB persistent directory.",
    )
    parser.add_argument(
        "--collection",
        default=os.getenv("CHROMA_COLLECTION", DEFAULT_COLLECTION_NAME),
        help="ChromaDB collection name.",
    )
    parser.add_argument(
        "--embedding-model",
        default=os.getenv("OPENAI_EMBEDDING_MODEL", DEFAULT_EMBEDDING_MODEL),
        help="OpenAI embedding model.",
    )
    parser.add_argument("--batch-size", type=int, default=64)
    parser.add_argument("--limit", type=int, default=None, help="Optional row limit for a quick demo index.")
    parser.add_argument("--reset", action="store_true", help="Delete the existing ChromaDB directory first.")
    args = parser.parse_args()

    result = build_chroma_store(
        csv_path=Path(args.csv),
        persist_dir=Path(args.persist_dir),
        collection_name=args.collection,
        embedding_model=args.embedding_model,
        batch_size=args.batch_size,
        limit=args.limit,
        reset=args.reset,
    )
    print(result)


if __name__ == "__main__":
    main()
