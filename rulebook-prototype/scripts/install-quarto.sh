#!/bin/sh
set -eu

QUARTO_VERSION="1.10.18"
PROJECT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
TOOLS_DIR="$PROJECT_DIR/.tools"
QUARTO_DIR="$TOOLS_DIR/quarto"
ARCHIVE="$TOOLS_DIR/quarto-macos.tar.gz"

if command -v quarto >/dev/null 2>&1; then
  echo "Using installed Quarto: $(command -v quarto)"
  exit 0
fi

if [ -x "$QUARTO_DIR/bin/quarto" ]; then
  echo "Quarto $QUARTO_VERSION is already available locally."
  exit 0
fi

mkdir -p "$TOOLS_DIR"
curl -fL "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-macos.tar.gz" -o "$ARCHIVE"
mkdir -p "$QUARTO_DIR"
tar -xzf "$ARCHIVE" -C "$QUARTO_DIR" --strip-components=1
rm "$ARCHIVE"

"$QUARTO_DIR/bin/quarto" --version

