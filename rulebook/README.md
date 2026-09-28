# The Arcane Aether rulebook

This folder builds the complete PDF rulebook from the Obsidian vault. It is
separate from the Quartz website and does not change the source notes.

## Build

```sh
./scripts/install-quarto.sh
npm run build
```

Output:

```text
output/pdf/the-arcane-aether-v4.6-draft.pdf
```

## Important files

- `book.json`: version, chapter order, and included notes
- `theme.typ`: fonts, colors, headings, tables, and page design
- `scripts/prepare.mjs`: Obsidian-to-Quarto conversion
- `filters/full-width-tables.lua`: full-column table sizing

The generated `build/` directory and local `.tools/` directory are ignored by
Git. The final PDF is kept under `output/pdf/`.

