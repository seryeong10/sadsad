#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
flutter_revision="d3b14c876900e553bc736ca19295fc09e3853e8e"
flutter_sdk="$repo_root/.vercel/cache/flutter-sdk-d3b14c8769"
if [[ ! -x "$flutter_sdk/bin/flutter" ]]; then
  mkdir -p "$(dirname "$flutter_sdk")"
  git clone --depth 1 --branch 3.47.2 https://github.com/flutter/flutter.git "$flutter_sdk"
fi
if [[ "$(git -C "$flutter_sdk" rev-parse HEAD)" != "$flutter_revision" ]]; then
  echo "Flutter SDK revision does not match the verified release." >&2
  exit 1
fi
export PATH="$flutter_sdk/bin:$PATH"
export CI=true
export PUB_CACHE="$repo_root/.vercel/cache/pub"

# This is Firebase's public client key, already present in the Android config.
# Never read OpenAI/FAL keys into this frontend build.
firebase_key="${FIREBASE_API_KEY:-}"
if [[ -z "$firebase_key" ]]; then
  firebase_key="$(node -e 'const fs=require("node:fs");const c=JSON.parse(fs.readFileSync(process.argv[1],"utf8"));process.stdout.write(c.client[0].api_key[0].current_key)' "$repo_root/frontend/android/app/google-services.json")"
fi
api_url="${API_BASE_URL:-https://a-vata-api.vercel.app}"
if [[ "$api_url" != https://* ]]; then
  echo "API_BASE_URL must be an HTTPS backend origin." >&2
  exit 1
fi

cd "$repo_root/frontend"
flutter pub get
flutter build web --release \
  --dart-define=MOCK_DEMO_MODE=false \
  --dart-define=FIREBASE_REST_AUTH=true \
  "--dart-define=FIREBASE_API_KEY=$firebase_key" \
  "--dart-define=API_BASE_URL=$api_url"
