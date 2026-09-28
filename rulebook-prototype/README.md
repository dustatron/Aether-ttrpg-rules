# Rulebook PDF prototype

This folder is an isolated Quarto + Typst experiment. It does not modify the
vault notes or participate in the Quartz website build.

## What it uses

- `../Start Here.md`
- `../Character Creation.md`
- `theme.typ` for the print design
- `scripts/prepare.mjs` to translate Obsidian links for Quarto

## Build

```sh
./scripts/install-quarto.sh
./scripts/build.sh
```

The finished file is written to:

```text
output/arcane-aether-prototype.pdf
```

The Quarto download is pinned and stored under `.tools/`, which is ignored by
Git. If Quarto is already installed, the build uses that instead.

