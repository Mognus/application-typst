#!/usr/bin/env bash
# Usage: ./build.sh companies/<name>.json [--en]
set -euo pipefail
cd "$(dirname "$0")"

job="${1:?Usage: $0 companies/<name>.json [--en]}"
slug="$(basename "$job" .json)"

lang="de"
personal="personal-data.json"
prefix="cover-letter"
if [[ "${2:-}" == "--en" ]]; then
  lang="en"
  personal="personal-data-en.json"
  prefix="cover-letter-en"
fi

out="gen/cover-letter/$prefix-$slug.pdf"
mkdir -p gen/cover-letter
typst compile --root . \
  --input job="/$job" \
  --input personal="/$personal" \
  --input lang="$lang" \
  cover-letter.typ "$out"
echo "OK  $out"
