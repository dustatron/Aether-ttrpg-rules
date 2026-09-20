# The Arcane Aether

This repository contains the Obsidian vault and public rules website for **The Arcane Aether**, a rules-light fantasy tabletop role-playing game.

## Website

GitHub Actions builds the reader-facing notes with [Quartz](https://quartz.jzhao.xyz/) and deploys them to GitHub Pages:

<https://dustatron.github.io/Aether-ttrpg-rules/>

The published site contains `Start Here.md`, `Core Rules.md`, `Character Creation.md`, and the notes under `files/`, `lore/`, `reference/`, and `tables/`. AI context, open questions, project instructions, archives, resources, Obsidian settings, and trash are not copied into the website build.

## Local preview

Quartz requires Node.js 22 or later.

```sh
npm ci
npm run site:preview
```

Open <http://localhost:8080/>. Pushes to `main` automatically rebuild and deploy the public website.
