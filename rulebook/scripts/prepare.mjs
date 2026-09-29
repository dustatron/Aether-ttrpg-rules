import { copyFile, mkdir, readFile, writeFile } from "node:fs/promises"
import { dirname, join, resolve } from "node:path"
import { fileURLToPath } from "node:url"

const here = dirname(fileURLToPath(import.meta.url))
const projectDir = resolve(here, "..")
const vaultDir = resolve(projectDir, "..")
const buildDir = join(projectDir, "build")
const book = JSON.parse(await readFile(join(projectDir, "book.json"), "utf8"))

function stripFrontmatter(markdown) {
  return markdown.replace(/^---\r?\n[\s\S]*?\r?\n---\r?\n/, "")
}

function translateObsidian(markdown) {
  return markdown
    .replace(/^!\[\[[^\]]+\]\]\s*$/gm, "")
    .replace(/\[\[#[^|\]]+\|([^\]]+)\]\]/g, "$1")
    .replace(/\[\[#([^\]]+)\]\]/g, "$1")
    .replace(/\[\[([^\]|#]+)(?:#[^\]|]+)?\|([^\]]+)\]\]/g, "$2")
    .replace(/\[\[([^\]|#]+)(?:#[^\]]+)?\]\]/g, "$1")
}

function translateCallouts(markdown) {
  return markdown.replace(
    /^> \[!note\] ([^\n]+)\n((?:^>.*(?:\n|$))+)/gm,
    (_, title, body) => {
      const content = body.replace(/^> ?/gm, "").trim()
      return `::: {.prompt-card title="${title.replaceAll('"', "&quot;")}"}\n${content}\n:::\n`
    },
  )
}

function compactMonsterTierTable(markdown) {
  const lines = markdown.split(/\r?\n/)
  const headerIndex = lines.findIndex((line) =>
    /^\|\s*Tier level\s*\|\s*Tier label/.test(line),
  )

  if (headerIndex === -1) return markdown

  let endIndex = headerIndex + 2
  while (endIndex < lines.length && /^\|/.test(lines[endIndex])) {
    endIndex += 1
  }

  const rows = lines.slice(headerIndex + 2, endIndex).map((line) =>
    line
      .split("|")
      .slice(1, -1)
      .map((cell) => cell.trim()),
  )

  const compact = [
    "| d6 | Tier | Stats and example |",
    "| --- | --- | --- |",
    ...rows.map(
      ([level, label, threat, damage, health, armor, example]) =>
        `| ${level} | **${label}** | **Threat:** ${threat}; **Damage:** ${damage}; **Health:** ${health}; **Armor:** ${armor}; ${example}. |`,
    ),
  ]

  lines.splice(headerIndex, endIndex - headerIndex, ...compact)
  return lines.join("\n")
}

function boxBestiaryEntries(markdown) {
  const firstEntry = markdown.search(/^##\s+/m)
  if (firstEntry === -1) return markdown

  const introduction = markdown.slice(0, firstEntry).trimEnd()
  const entries = markdown
    .slice(firstEntry)
    .split(/(?=^##\s+)/m)
    .filter(Boolean)
    .map((entry, index) => {
      const lines = entry.trim().split(/\r?\n/)
      const title = lines.shift().replace(/^##\s+/, "").trim()
      const bodyLines = []

      for (const line of lines) {
        const stats = line.match(
          /^\*\*Threat:\*\*\s*(.*?)\s*\|\s*\*\*Damage:\*\*\s*(.*?)\s*\|\s*\*\*Health:\*\*\s*(.*?)\s*\|\s*\*\*Armor:\*\*\s*(.*?)\s*$/,
        )
        const isDetail = /^- \*\*(Attacks|Casts|Weakness|Desire):\*\*/.test(line)
        const previous = bodyLines.at(-1) ?? ""

        if (stats) {
          if (previous.trim()) bodyLines.push("")
          bodyLines.push(
            "```{=typst}",
            `#monster-stats([${stats[1]}], [${stats[2]}], [${stats[3]}], [${stats[4]}])`,
            "```",
          )
          continue
        }

        if (isDetail && !previous.startsWith("- ") && previous.trim()) {
          bodyLines.push("")
        }

        bodyLines.push(line)
      }

      const body = bodyLines.join("\n").trim()
      const columnBreak = index === 3
        ? "```{=typst}\n#colbreak()\n```\n\n"
        : ""
      return `${columnBreak}::: {.monster-card title="${title.replaceAll('"', "&quot;")}"}\n${body}\n:::`
    })

  return `${introduction}\n\n${entries.join("\n\n")}`
}

function removeSection(markdown, heading) {
  const marker = `## ${heading}`
  const start = markdown.indexOf(marker)
  if (start === -1) return markdown

  const next = markdown.indexOf("\n## ", start + marker.length)
  return `${markdown.slice(0, start)}${next === -1 ? "" : markdown.slice(next + 1)}`
}

function removeFirstHeading(markdown) {
  return markdown.replace(/^\s*# .+\r?\n+/, "")
}

function removeGoblinPitchExample(markdown) {
  return markdown.replace(
    /^\*\*Example: Tier 1, Goblin, Pest\*\*[\s\S]*?^- \*\*Desire:\*\*.*(?:\r?\n|$)/m,
    "",
  )
}

function keepParagraphTogether(markdown, paragraphStart) {
  const escaped = paragraphStart.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")
  const pattern = new RegExp(`(^${escaped}[^\\n]*(?:\\n(?!\\n)[^\\n]+)*)`, "m")
  return markdown.replace(pattern, "::: {.keep-together}\n$1\n:::")
}

function splitD66Table(markdown) {
  const lines = markdown.split(/\r?\n/)
  const headerIndex = lines.findIndex((line) => /^\|\s*d66\s*\|/i.test(line))
  if (headerIndex === -1) return markdown

  let endIndex = headerIndex + 2
  while (endIndex < lines.length && /^\|/.test(lines[endIndex])) {
    endIndex += 1
  }

  const rows = lines.slice(headerIndex + 2, endIndex)
  const midpoint = Math.ceil(rows.length / 2)
  const header = lines.slice(headerIndex, headerIndex + 2)
  const split = [
    ...header,
    ...rows.slice(0, midpoint),
    "",
    "```{=typst}",
    "#colbreak()",
    "```",
    "",
    ...header,
    ...rows.slice(midpoint),
  ]

  lines.splice(headerIndex, endIndex - headerIndex, ...split)
  return lines.join("\n")
}

function formatArchetypeGear(markdown) {
  const lines = markdown.split(/\r?\n/)
  const headerIndex = lines.findIndex((line) => line === "## Gear")
  if (headerIndex === -1) return markdown

  let startIndex = headerIndex + 1
  while (startIndex < lines.length && lines[startIndex].trim() === "") startIndex += 1
  let endIndex = startIndex
  while (endIndex < lines.length && /^- /.test(lines[endIndex])) endIndex += 1

  const gear = lines.slice(startIndex, endIndex).map((line) =>
    line
      .replace(/^- /, "")
      .replaceAll("\\", "\\\\")
      .replaceAll("[", "\\[")
      .replaceAll("]", "\\]")
      .replaceAll("#", "\\#"),
  )
  const items = gear.map((item) => `[${item}]`).join(", ")
  lines.splice(
    headerIndex,
    endIndex - headerIndex,
    "```{=typst}",
    `#gear-label(${items})`,
    "```",
  )
  return lines.join("\n")
}

function formatArchetypeStats(markdown) {
  const lines = markdown.split(/\r?\n/)
  const headerIndex = lines.findIndex((line) => /^\|\s*Strength\s*\|/.test(line))
  if (headerIndex === -1) return markdown

  let endIndex = headerIndex + 2
  while (endIndex < lines.length && /^\|/.test(lines[endIndex])) endIndex += 1

  const values = lines[headerIndex + 2]
    .split("|")
    .slice(1, -1)
    .map((value) => value.trim())

  if (values.length !== 5) return markdown

  const typstValues = values.map((value) => `[${value}]`).join(", ")
  lines.splice(
    headerIndex,
    endIndex - headerIndex,
    "```{=typst}",
    `#archetype-stats(${typstValues})`,
    "```",
  )
  return lines.join("\n")
}

function demoteHeadings(markdown, levels) {
  return markdown.replace(
    /^(#{1,5}) /gm,
    (_, hashes) => `${hashes}${"#".repeat(levels)} `,
  )
}

async function loadNote(entry) {
  let markdown = stripFrontmatter(
    await readFile(join(vaultDir, entry.path), "utf8"),
  )

  markdown = translateObsidian(markdown)
  markdown = translateCallouts(markdown)

  if (entry.path === "reference/Monsters.md") {
    markdown = compactMonsterTierTable(markdown)
  }

  if (entry.path === "reference/Bestiary.md") {
    markdown = boxBestiaryEntries(markdown)
  }

  if (entry.path === "Start Here.md") {
    markdown = markdown
      .replace(/^\*\*Downloads:\*\*.*$/gm, "")
      .replace(/^\*\*Start here:\*\*.*$/gm, "")
    markdown = removeGoblinPitchExample(markdown)
    markdown = removeSection(markdown, "Explore the game")
    markdown = removeSection(markdown, "Current draft")
    markdown = removeSection(markdown, "Character sheet")
  }

  if (entry.path === "reference/Key Ideas.md") {
    markdown = markdown.replace(
      /^These ideas shape the game even when the rules do not say them outright\.\s*$/m,
      "",
    )
  }

  if (entry.path === "Character Creation.md") {
    markdown = removeSection(markdown, "Character sheet")
    markdown = markdown.replace(
      /^## Step 4: Choose how changed they are$/m,
      "```{=typst}\n#colbreak()\n```\n\n## Step 4: Choose how changed they are",
    )
  }

  if (entry.path === "lore/World Lore.md") {
    markdown = markdown.replace(
      /^## The magical orders$/m,
      "```{=typst}\n#colbreak()\n```\n\n## The magical orders",
    )
  }

  if (entry.path === "Core Rules.md") {
    markdown = markdown.replace(
      /^For the premise and reading order, start with Start Here\. To make a character, use Character Creation\.\s*$/m,
      "",
    )
    markdown = keepParagraphTogether(
      markdown,
      "Damage and healing normally happen instantly and remain afterward",
    )
    markdown = keepParagraphTogether(
      markdown,
      "On a failure or partial success, an enemy may hurt your character",
    )
  }

  if (entry.splitTable) {
    markdown = splitD66Table(markdown)
  }

  if (entry.hideTitle) {
    markdown = removeFirstHeading(markdown)
  }

  if (entry.path.startsWith("reference/archetypes/")) {
    markdown = formatArchetypeGear(markdown)
    markdown = formatArchetypeStats(markdown)
  }

  const demotion = entry.hideTitle ? 1 : 2
  const output = demoteHeadings(markdown.trim(), demotion)

  if (entry.path.startsWith("reference/archetypes/")) {
    return `::: {.archetype-block}\n${output}\n:::`
  }

  if (entry.compactTable) {
    const tableClass = `${entry.compactTable}-table-block`
    return `::: {.${tableClass}}\n${output}\n:::`
  }

  return output
}

const parts = []

for (const [sectionIndex, section] of book.sections.entries()) {
  if (sectionIndex > 0 && section.pageBreakBefore !== false) {
    parts.push("```{=typst}\n#pagebreak()\n```")
  }

  parts.push(`## ${section.title}`)

  for (const entry of section.files) {
    if (entry.pageBreakBefore) {
      parts.push("```{=typst}\n#pagebreak()\n```")
    }
    if (entry.columnBreakBefore) {
      parts.push("```{=typst}\n#colbreak()\n```")
    }
    parts.push(await loadNote(entry))
  }
}

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
    fontsize: 9.8pt
    mainfont: "Barlow"
    sansfont: "Barlow"
    toc: false
    filters:
      - ../filters/custom-blocks.lua
      - ../filters/full-width-tables.lua
    include-in-header:
      - ../theme.typ
---

\`\`\`{=typst}
#set page(columns: 1, margin: 0.72in, fill: paper, header: none, footer: none)
#align(center + horizon)[
  #block(width: 100%, inset: 30pt, stroke: 1.2pt + arcane, radius: 4pt)[
    #align(center)[
      #text(font: "Barlow", size: 12pt, weight: "medium", tracking: 0.18em, fill: gold)[THE]
      #v(8pt)
      #text(font: "Barlow", size: 34pt, weight: "bold", fill: arcane)[ARCANE AETHER]
      #v(14pt)
      #line(length: 46%, stroke: 1pt + gold)
      #v(14pt)
      #text(size: 13pt, style: "italic", fill: ink)[${book.subtitle}]
      #v(32pt)
      #box(fill: pale-blue, inset: (x: 18pt, y: 10pt), radius: 3pt)[
        #text(size: 10pt, weight: "medium", fill: arcane)[VERSION ${book.version} · INITIAL FULL-BOOK DRAFT]
      ]
    ]
  ]
]
#pagebreak()
#set page(columns: 1, margin: 0.8in, fill: white, header: none, footer: none)
#outline(title: [Contents], depth: 2, indent: auto)
#pagebreak()
#counter(page).update(1)
#set page(
  columns: 2,
  margin: (top: 0.68in, bottom: 0.68in, left: 0.65in, right: 0.65in),
  fill: white,
  header: context align(right)[#text(size: 7.5pt, tracking: 0.08em, fill: muted)[THE ARCANE AETHER · VERSION ${book.version}]],
  footer: context align(center)[#text(size: 8pt, fill: muted)[#counter(page).display("1")]],
)
#set text(hyphenate: false)
#set par(justify: false, leading: 0.62em, spacing: 0.66em)
#show regex("[A-Za-z]+-[A-Za-z]+"): it => box(it)
\`\`\`

${parts.join("\n\n")}

\`\`\`{=typst}
#pagebreak()
#set page(
  columns: 1,
  width: 11in,
  height: 8.5in,
  margin: 0.4in,
  header: none,
  footer: context align(center)[#text(size: 8pt, fill: muted)[#counter(page).display("1")]],
)
\`\`\`

\`\`\`{=typst}
#align(center + horizon)[#image("assets/character-sheet.png", width: 100%)]
\`\`\`
`

await mkdir(buildDir, { recursive: true })
await mkdir(join(buildDir, "assets"), { recursive: true })
await copyFile(
  join(vaultDir, "files", "Character sheet v4.6.png"),
  join(buildDir, "assets", "character-sheet.png"),
)
await writeFile(join(buildDir, "book.qmd"), source)
