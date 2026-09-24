#!/usr/bin/env bash
# Usage: ./build.sh companies/<name>.json [--en]   cover letter
#        ./build.sh cv [--en]                       CV
#        ./build.sh abilities [--en]                skills profile
set -euo pipefail
cd "$(dirname "$0")"

target="${1:?Usage: $0 companies/<name>.json|cv|abilities [--en]}"

lang="de"
suffix=""
if [[ "${2:-}" == "--en" ]]; then
  lang="en"
  suffix="-en"
fi

if [[ "$target" == "cv" ]]; then
  source="cv.typ"
  data=(--input cv="/cv$suffix.json")
  out="gen/cv/cv$suffix.pdf"
elif [[ "$target" == "abilities" ]]; then
  source="ability-sheet.typ"
  data=(--input abilities="/abilities$suffix.json")
  out="gen/ability-sheet/ability-sheet$suffix.pdf"
else
  source="cover-letter.typ"
  data=(--input job="/$target")
  out="gen/cover-letter/cover-letter$suffix-$(basename "$target" .json).pdf"
fi

mkdir -p "$(dirname "$out")"
typst compile --root . \
  "${data[@]}" \
  --input personal="/personal-data$suffix.json" \
  --input lang="$lang" \
  "$source" "$out"
echo "OK  $out"
