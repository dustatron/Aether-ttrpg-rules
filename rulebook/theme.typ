#let ink = rgb("#211e1b")
#let arcane = rgb("#315b72")
#let gold = rgb("#1f3b4a")
#let muted = rgb("#6d6963")
#let paper = rgb("#e5eef2")
#let paper-soft = rgb("#f2f7f9")
#let table-head = arcane
#let row-blue = rgb("#e4eef2")
#let row-blue-alt = rgb("#f1f6f8")
#let pale-blue = rgb("#dce7ea")
#let rule = rgb("#9fadb4")

#set text(fill: ink, hyphenate: false)
#set par(justify: false, leading: 0.62em, spacing: 0.66em)
#set list(indent: 1.05em, body-indent: 0.48em, spacing: 0.34em)
#set enum(indent: 1.05em, body-indent: 0.48em, spacing: 0.34em)
#set table(
  inset: (x: 5pt, y: 4pt),
  stroke: 0.5pt + rule,
  fill: (_, y) => if y == 0 {
    table-head
  } else if calc.rem(y, 2) == 0 {
    row-blue
  } else {
    row-blue-alt
  },
)

#show table.cell.where(y: 0): set text(
  fill: white,
  weight: "bold",
  size: 8.8pt,
)

#show strong: set text(fill: ink, weight: "bold")
#show link: set text(fill: arcane)

#show heading.where(level: 1): it => place(
  top,
  scope: "parent",
  float: true,
  clearance: 16pt,
)[
  #block(width: 100%, breakable: false)[
    #grid(
      columns: (1fr,),
      row-gutter: 6pt,
      text(size: 22pt, weight: "bold", fill: arcane)[#it.body],
      line(length: 100%, stroke: 1.2pt + gold),
    )
  ]
]

#show heading.where(level: 2): it => block(
  width: 100%,
  above: 1.15em,
  below: 0.6em,
  breakable: false,
  fill: arcane,
  inset: (x: 8pt, y: 5pt),
  radius: 2pt,
)[
  #text(size: 14pt, weight: "bold", fill: white)[#it.body]
]

#show heading.where(level: 3): it => block(
  above: 0.95em,
  below: 0.4em,
  breakable: false,
)[
  #grid(
    columns: (3pt, 1fr),
    column-gutter: 7pt,
    rect(width: 3pt, height: 1.05em, fill: gold, radius: 1.5pt),
    text(size: 12.8pt, weight: "bold", fill: arcane)[#it.body],
  )
]

#show heading.where(level: 4): it => block(
  above: 0.78em,
  below: 0.28em,
  breakable: false,
)[#text(size: 10.8pt, weight: "bold", fill: gold)[#it.body]]

#let monster-stats(threat, damage, health, armor) = block(
  width: 100%,
  breakable: false,
  below: 0.45em,
)[
  #set text(size: 8pt)
  #set table(inset: (x: 2pt, y: 2pt), stroke: 0.45pt + rule)
  #table(
    columns: (1fr, 1fr, 1fr, 1fr),
    align: center,
    [Threat], [Damage], [Health], [Armor],
    [#strong[#threat]],
    [#strong[#damage]],
    [#strong[#health]],
    [#strong[#armor]],
  )
]

#let monster-card(title, body) = block(
  width: 100%,
  breakable: false,
  fill: paper-soft,
  stroke: 0.8pt + gold,
  radius: 4pt,
  inset: 0pt,
  below: 10pt,
)[
  #block(width: 100%, fill: paper, inset: (x: 9pt, y: 6pt))[
    #text(size: 10.4pt, weight: "bold", fill: arcane)[#title]
  ]
  #block(inset: (x: 9pt, y: 8pt))[
    #set par(leading: 0.58em, spacing: 0.45em)
    #body
  ]
]

#let prompt-card(title, body) = block(
  width: 100%,
  breakable: false,
  fill: paper-soft,
  stroke: (left: 2.2pt + gold, rest: 0.55pt + rule),
  radius: 3pt,
  inset: 10pt,
  above: 4pt,
  below: 9pt,
)[
  #text(size: 10.4pt, weight: "bold", fill: gold)[#title]
  #v(5pt)
  #body
]

#let archetype-block(body) = block(
  width: 100%,
  breakable: false,
  stroke: 1.5pt + gold,
  radius: 0pt,
  inset: 4pt,
  above: 12pt,
  below: 7pt,
)[
  #set text(size: 9.1pt)
  #set par(leading: 0.56em, spacing: 0.5em)
  #set table(
    inset: (x: 3pt, y: 2.5pt),
    stroke: 0.65pt + gold,
    fill: (_, y) => if y == 0 {
      table-head
    } else if calc.rem(y, 2) == 0 {
      row-blue
    } else {
      white
    },
  )
  #show heading.where(level: 2): it => block(
    width: 100%,
    above: 0pt,
    below: 0.45em,
    breakable: false,
    inset: (x: 0pt, y: 0pt),
  )[
    #align(center)[#text(size: 19pt, weight: "bold", fill: gold)[#it.body]]
    #v(-8pt)
    #line(length: 100%, stroke: 3.5pt + gold)
  ]
  #body
]

#let gear-label(..items) = block(width: 100%, breakable: false)[
  #block(width: 100%, fill: arcane, inset: (x: 3pt, y: 2.15pt))[
    #text(size: 8.8pt, weight: "bold", fill: white)[Gear]
  ]
  #for item in items.pos() {
    block(
      width: 100%,
      inset: (x: 6pt, y: 2.15pt),
      stroke: (bottom: 0.65pt + gold),
    )[#item]
  }
]

#let stats-table-block(body) = {
  set table(
    inset: (x: 3pt, y: 2.15pt),
    fill: (_, y) => if y == 0 { table-head } else { white },
  )
  body
}

#let keep-together(body) = block(
  width: 100%,
  breakable: false,
)[#body]

#let wild-table-block(body) = {
  set text(size: 8.2pt)
  set table(inset: (x: 3pt, y: 1.55pt))
  body
}

#let mutation-table-block(body) = {
  set text(size: 8.5pt)
  set table(inset: (x: 3pt, y: 2.9pt))
  body
}

#let spell-table-block(body) = {
  set text(size: 8.5pt)
  set table(inset: (x: 3pt, y: 4.9pt))
  body
}
