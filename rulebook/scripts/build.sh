#!/bin/sh
set -eu

PROJECT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
LOCAL_QUARTO="$PROJECT_DIR/.tools/quarto/bin/quarto"
PROTOTYPE_QUARTO="$PROJECT_DIR/../rulebook-prototype/.tools/quarto/bin/quarto"

cd "$PROJECT_DIR"
node scripts/prepare.mjs
mkdir -p output/pdf

if command -v quarto >/dev/null 2>&1; then
  QUARTO=quarto
elif [ -x "$LOCAL_QUARTO" ]; then
  QUARTO="$LOCAL_QUARTO"
elif [ -x "$PROTOTYPE_QUARTO" ]; then
  QUARTO="$PROTOTYPE_QUARTO"
else
  echo "Quarto is missing. Run ./scripts/install-quarto.sh first." >&2
  exit 1
fi

OUTPUT_NAME=$(node -e 'const b=require("./book.json"); process.stdout.write(b.output)')
"$QUARTO" render build/book.qmd --output "$OUTPUT_NAME"
mv "$PROJECT_DIR/$OUTPUT_NAME" "$PROJECT_DIR/output/pdf/$OUTPUT_NAME"

echo "Created $PROJECT_DIR/output/pdf/$OUTPUT_NAME"

