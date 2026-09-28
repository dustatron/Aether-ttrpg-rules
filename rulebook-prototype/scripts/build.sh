#!/bin/sh
set -eu

PROJECT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
LOCAL_QUARTO="$PROJECT_DIR/.tools/quarto/bin/quarto"

cd "$PROJECT_DIR"
node scripts/prepare.mjs
mkdir -p output

if command -v quarto >/dev/null 2>&1; then
  QUARTO=quarto
elif [ -x "$LOCAL_QUARTO" ]; then
  QUARTO="$LOCAL_QUARTO"
else
  echo "Quarto is missing. Run ./scripts/install-quarto.sh first." >&2
  exit 1
fi

"$QUARTO" render build/prototype.qmd --output arcane-aether-prototype.pdf
mv "$PROJECT_DIR/arcane-aether-prototype.pdf" "$PROJECT_DIR/output/arcane-aether-prototype.pdf"

echo "Created $PROJECT_DIR/output/arcane-aether-prototype.pdf"
