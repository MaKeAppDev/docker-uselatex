#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
RESOURCES_DIR="${SCRIPT_DIR}/../resources"

IMAGE_TAG="${1:-uselatex:test}"

if [[ ! -f "${RESOURCES_DIR}/moderncv.tex" ]]; then
  echo "Missing ${RESOURCES_DIR}/moderncv.tex" >&2
  exit 1
fi
if [[ ! -f "${RESOURCES_DIR}/CMakeLists.txt" ]]; then
  echo "Missing ${RESOURCES_DIR}/CMakeLists.txt" >&2
  exit 1
fi

docker run --rm -i \
  -v "${RESOURCES_DIR}:/resources:ro" \
  "$IMAGE_TAG" bash -s <<'CONTAINER_SCRIPT'
set -euo pipefail

CHEATSHEET_DIR="/tmp/CheatsheetTemplate"
MODERNCV_DIR="/tmp/moderncv-test"

rm -rf "$CHEATSHEET_DIR" "$MODERNCV_DIR"

git clone --depth 1 https://github.com/latex4ei/CheatsheetTemplate "$CHEATSHEET_DIR"
cd "$CHEATSHEET_DIR"
mkdir build
cd build
cmake ..
make
find . -type f -name '*.pdf' | grep -q .

mkdir -p "$MODERNCV_DIR"
cd "$MODERNCV_DIR"
cp /resources/moderncv.tex .
cp /resources/CMakeLists.txt .

mkdir build
cd build
cmake ..
make

test -s moderncv.pdf
CONTAINER_SCRIPT
