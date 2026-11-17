# The Arcane Aether

This repository contains the Obsidian vault and public rules website for **The Arcane Aether**, a rules-light fantasy tabletop role-playing game.

## Website

GitHub Actions builds the reader-facing notes with [Quartz](https://quartz.jzhao.xyz/) and deploys them to GitHub Pages:

<https://dustatron.github.io/Aether-ttrpg-rules/>

The published site contains `Start Here.md` and the reader-facing notes under `Rules/`, `files/`, `lore/`, and `tables/`. AI context, open questions, project instructions, archives, research resources, Obsidian settings, and trash are not copied into the website build.

## Local preview

Quartz requires Node.js 22 or later.

```sh
cd tooling/site
npm ci
npm run site:preview
```

Open <http://localhost:8080/>. Pushes to `main` automatically rebuild and deploy the public website.

## PDF rulebook

The Version 4.6 full-book draft lives in `tooling/rulebook/`. It is built from the vault's Markdown with Quarto and Typst. The generated book is separate from the Quartz website.

```sh
cd tooling/rulebook
./scripts/install-quarto.sh
npm run build
```

The finished PDF is written to:

```text
tooling/rulebook/output/pdf/the-arcane-aether-v4.6-draft.pdf
```

Edit `tooling/rulebook/book.json` to change chapter order or included notes. Edit `tooling/rulebook/theme.typ` to change print styling. Do not edit files under `tooling/rulebook/build/`; they are regenerated from the vault.

## Project layout

- `Rules/`, `lore/`, `tables/`, and `files/` contain the Obsidian vault's game content.
- `tooling/site/` contains Quartz and its website configuration.
- `tooling/rulebook/` contains the current PDF book build.
- `tooling/rulebook-prototype/` contains an older print layout experiment.
- `.github/` contains the GitHub Pages deployment workflow.
