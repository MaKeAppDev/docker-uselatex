#!/usr/bin/env bash
set -euo pipefail

IMAGE_TAG="${1:-uselatex:test}"
WORKDIR="/tmp/CheatsheetTemplate"

docker run --rm "$IMAGE_TAG" bash -lc "
  set -euo pipefail
  rm -rf '$WORKDIR'
  git clone --depth 1 https://github.com/latex4ei/CheatsheetTemplate '$WORKDIR'
  cd '$WORKDIR'
  mkdir build
  cd build
  cmake ..
  make
"
