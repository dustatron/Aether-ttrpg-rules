import { mkdir, readFile, writeFile } from "node:fs/promises"
import { dirname, join, resolve } from "node:path"
import { fileURLToPath } from "node:url"

const here = dirname(fileURLToPath(import.meta.url))
const projectDir = resolve(here, "..")
const vaultDir = resolve(projectDir, "..")
const buildDir = join(projectDir, "build")

function stripFrontmatter(markdown) {
  return markdown.replace(/^---\r?\n[\s\S]*?\r?\n---\r?\n/, "")
}

function translateObsidian(markdown) {
  return markdown
    .replace(/^!\[\[[^\]]+\]\]\s*$/gm, "")
    .replace(/\[\[([^\]|#]+)(?:#[^\]|]+)?\|([^\]]+)\]\]/g, "$2")
    .replace(/\[\[([^\]|#]+)(?:#[^\]]+)?\]\]/g, "$1")
}

function removeSection(markdown, heading) {
  const marker = `## ${heading}`
  const start = markdown.indexOf(marker)
  if (start === -1) return markdown

  const next = markdown.indexOf("\n## ", start + marker.length)
  return `${markdown.slice(0, start)}${next === -1 ? "" : markdown.slice(next + 1)}`
}

function demoteHeadings(markdown) {
  return markdown.replace(/^(#{1,5}) /gm, "$1# ")
}

function sectionRange(markdown, startHeading, endHeading) {
  const start = markdown.indexOf(`## ${startHeading}`)
  if (start === -1) return ""

  const end = markdown.indexOf(`## ${endHeading}`, start)
  return markdown.slice(start, end === -1 ? undefined : end).trim()
}

async function loadNote(name) {
  const source = await readFile(join(vaultDir, name), "utf8")
  return translateObsidian(stripFrontmatter(source)).trim()
}

let startHere = await loadNote("Start Here.md")
startHere = startHere
  .replace(/^\*\*Downloads:\*\*.*$/gm, "")
  .replace(/^\*\*Start here:\*\*.*$/gm, "")
startHere = removeSection(startHere, "Explore the game")
startHere = removeSection(startHere, "Current draft")
startHere = removeSection(startHere, "Character sheet")

let characterCreation = await loadNote("Rules/Character Creation.md")
characterCreation = removeSection(characterCreation, "Character sheet")

const coreRules = await loadNote("Rules/Core Rules.md")
const coreExcerpt = `# Core Rules\n\n${sectionRange(coreRules, "The dice", "Magical casting")}`

const source = `---
format:
  typst:
    papersize: us-letter
    margin:
      top: 0.68in
      bottom: 0.68in
      left: 0.65in
      right: 0.65in
    columns: 2
    column-gutter: 0.28in
    fontsize: 9.2pt
    mainfont: "Avenir Next"
    sansfont: "Avenir Next"
    toc: false
    filters:
      - ../filters/full-width-tables.lua
    include-in-header:
      - ../theme.typ
---

\`\`\`{=typst}
#set page(columns: 1, margin: 0.72in, fill: paper, header: none, footer: none)
#align(center + horizon)[
  #block(width: 100%, inset: 30pt, stroke: 1.2pt + arcane, radius: 4pt)[
    #align(center)[
      #text(font: "Avenir Next", size: 12pt, weight: "medium", tracking: 0.18em, fill: gold)[THE]
      #v(8pt)
      #text(font: "Avenir Next", size: 34pt, weight: "bold", fill: arcane)[ARCANE AETHER]
      #v(14pt)
      #line(length: 46%, stroke: 1pt + gold)
      #v(14pt)
      #text(size: 13pt, style: "italic", fill: ink)[A rules-light fantasy game about rewriting reality]
      #v(32pt)
      #box(fill: pale-blue, inset: (x: 18pt, y: 10pt), radius: 3pt)[
        #text(size: 10pt, weight: "medium", fill: arcane)[RULEBOOK LAYOUT PROTOTYPE · V4.5]
      ]
    ]
  ]
]
#pagebreak()
#counter(page).update(1)
#set page(
  columns: 2,
  margin: (top: 0.68in, bottom: 0.68in, left: 0.65in, right: 0.65in),
  fill: white,
  header: context align(right)[#text(size: 7.5pt, tracking: 0.08em, fill: muted)[THE ARCANE AETHER · PLAYTEST V4.5]],
  footer: context align(center)[#text(size: 8pt, fill: muted)[#counter(page).display("1")]],
)
#set text(hyphenate: false)
#set par(justify: false, leading: 0.56em, spacing: 0.7em)
\`\`\`

::: {.callout-note title="About this prototype"}
This sample tests two-column flow, tables, callouts, headings, page breaks, and content pulled from the Obsidian vault. The source rules have not been changed.
:::

${demoteHeadings(startHere)}

\`\`\`{=typst}
#pagebreak()
\`\`\`

${demoteHeadings(characterCreation)}

${demoteHeadings(coreExcerpt)}
`

await mkdir(buildDir, { recursive: true })
await writeFile(join(buildDir, "prototype.qmd"), source)
