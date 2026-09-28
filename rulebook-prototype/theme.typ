#let ink = rgb("#211e1b")
#let arcane = rgb("#315b72")
#let gold = rgb("#9b6d2f")
#let muted = rgb("#6d6963")
#let paper = rgb("#f3ecdc")
#let pale-blue = rgb("#dce7ea")
#let rule = rgb("#b8b0a1")

#set text(fill: ink, hyphenate: false)
#set par(justify: false, leading: 0.56em, spacing: 0.7em)
#set list(indent: 1.05em, body-indent: 0.48em, spacing: 0.3em)
#set enum(indent: 1.05em, body-indent: 0.48em, spacing: 0.3em)
#set table(
  inset: (x: 4.5pt, y: 3.5pt),
  stroke: 0.45pt + rule,
  fill: (_, y) => if y == 0 { pale-blue } else { none },
)

#show table: it => block(breakable: false)[#it]

#show strong: set text(fill: arcane, weight: "bold")
#show link: set text(fill: arcane)

#show heading.where(level: 1): it => block(
  above: 0.4em,
  below: 0.65em,
  breakable: false,
)[
  #text(size: 20pt, weight: "bold", fill: arcane)[#it.body]
  #v(3pt)
  #line(length: 100%, stroke: 1pt + gold)
]

#show heading.where(level: 2): it => block(
  above: 1.1em,
  below: 0.55em,
  breakable: false,
)[
  #text(size: 17pt, weight: "bold", fill: arcane)[#it.body]
  #v(2pt)
  #line(length: 100%, stroke: 0.8pt + gold)
]

#show heading.where(level: 3): it => block(
  above: 0.9em,
  below: 0.35em,
  breakable: false,
)[#text(size: 12.5pt, weight: "bold", fill: arcane)[#it.body]]

#show heading.where(level: 4): it => block(
  above: 0.75em,
  below: 0.25em,
  breakable: false,
)[#text(size: 10.2pt, weight: "bold", fill: gold)[#it.body]]
