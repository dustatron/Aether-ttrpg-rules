# The Arcane Aether

This repository contains the Obsidian vault and public rules website for **The Arcane Aether**, a rules-light fantasy tabletop role-playing game.

## Website

GitHub Actions builds the reader-facing notes with [Quartz](https://quartz.jzhao.xyz/) and deploys them to GitHub Pages:

<https://dustatron.github.io/Aether-ttrpg-rules/>

The published site contains `Start Here.md` and the reader-facing notes under `Rules/`, `files/`, `lore/`, and `tables/`. AI context, open questions, project instructions, archives, research resources, Obsidian settings, and trash are not copied into the website build.

## Local preview

Quartz requires Node.js 22 or later.

```sh
npm ci
npm run site:preview
```

Open <http://localhost:8080/>. Pushes to `main` automatically rebuild and deploy the public website.

## PDF rulebook

The Version 4.6 full-book draft lives in `rulebook/`. It is built from the vault's Markdown with Quarto and Typst. The generated book is separate from the Quartz website.

```sh
cd rulebook
./scripts/install-quarto.sh
npm run build
```

The finished PDF is written to:

```text
rulebook/output/pdf/the-arcane-aether-v4.6-draft.pdf
```

Edit `rulebook/book.json` to change chapter order or included notes. Edit `rulebook/theme.typ` to change print styling. Do not edit files under `rulebook/build/`; they are regenerated from the vault.
