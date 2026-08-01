---
tags:
  - index
  - design
system: rules-lite
status: draft
version: 0.1
---

# Open Questions & TODO

> [!abstract] The designer's worklist
> Everything still to **decide, build, fix, or playtest** for *The Weave* (rules-lite). Roughly priority-ordered within each section. Check items off as they close; move the summary into [[#Resolved]] with a one-line note so the reasoning survives.

Conventions: 🔴 blocks play · 🟡 improves play · 🟢 polish / later. Each item links to where it lives.

---

## 1 · Decide — mechanical holes

*Rules that are currently undefined. These have a gap where a number or procedure should be.*

- [ ] 🔴 **[[Wild Magic]] severity hook.** The old Mana build scaled eruption severity by the caster's Mana pool; rules-lite has no pool. Pick a replacement lever:
  - current [[Casting & Corruption|Corruption]] (thematic: more doom banked = bigger blast)
  - number of [[Mutation|mutations]] (ties severity to how far gone you are)
  - GM [[Core Rules|Fear tokens]] spent (GM chooses the size)
  - *Decide this before [[#2 · Build — fill it out|the wild-magic table]] can be finished.*
- [ ] 🟡 **Initiation's mechanical price.** [[Becoming a Weaver]] — old build spent Injury slots. Rules-lite uses [[Death & Injury|Hearts + Wounds]]. What does making a weaver cost the initiate? Candidates: a permanent **Wound**, a lowered **Heart** cap, or purely **fictional debt**.

---

## 2 · Build — fill it out

*Content that exists as a stub or brainstorm and needs finishing.*

- [ ] 🔴 **[[wild-magic-table]] → rollable table.** Sort the [[wild-magic-table|brainstorm pile]] into an ordered table, mild → catastrophic. The scratchpad already suggests bands: **bodily · existential/mind · the dead · the watched · the scar** — pick one of each for variety. *(Depends on the severity hook above.)*
- [ ] 🟡 **Higher-level / deeper [[mutation-tables]].** Current tables cover levels 1–5 at d6 each. Consider more entries per level, or a d10/d12 depth. Leads saved in [[Resource|external references]].
- [ ] 🟢 **Enemy weaver stat-block / quick-build.** Fear-powered casting is defined ([[Running the Game#Spending Fear tokens]]) but there's no NPC weaver template yet.

---

## 3 · Fix / review — does this hold up?

*Existing rules that may need a second look.*

- [ ] 🟡 **Life Types balance.** [[Character Creation]] — Human / Elf / Goblin / Beastfolk each grant one trait. Are they roughly equal? Human's "+1 once/day anywhere" may outclass the narrower ones.
- [ ] 🟢 **Archetype perks parity.** Fighter / Thief / Scholar / Charmer once/day perks — check none is strictly better.
- [ ] 🟢 **"Grow: 5 Hope raises a stat."** [[Core Rules]] — confirm the growth curve (raising a mundane stat vs. the mutation-only casting track) feels right over a short arc.

---

## 4 · Playtest — feel it out at the table

*Not broken; needs real play to tune. Mirrors [[Running the Game#Playtest watch-list]].*

- [ ] 🔴 **The [[Casting & Corruption|Corruption]] furnace pace.** Does doom-in / items-out flow at the right speed? Target: ~3–4 mutations across a campaign.
- [ ] 🟡 **[[Core Rules|Difficulty targets]] (6/8/10/12/14).** Do they feel right against typical stat + tag bonuses, especially as casting bonus climbs with mutations?
- [ ] 🟡 **Fear spend costs.** The [[Running the Game#Spending Fear tokens|cost table]] is a draft dial — retune once you see how fast Fear banks with your player count.
- [ ] 🟢 **Legendary gate.** Does "needs ≥1 mutation to attempt" ([[Core Rules#Legendary actions target 14|Legendary]]) land as intended?

---

## Resolved

*Closed decisions, kept for the reasoning.*

- [x] **Fear token economy** *(v0.1)* — Hope cap **5** (per player), Fear cap **10** (shared GM pool, 2× Hope). Draft spend costs incl. powering enemy weavers. Keeps the five-motif. → [[Running the Game#Spending Fear tokens]]
- [x] **Canonical system** *(v0.1)* — rules-lite (Corruption + Hope/Fear) is canon; the Mana / Monster-of-the-Week build is archived. → [[CLAUDE]]
- [x] **Merged mechanics** *(v0.1)* — Casting + Corruption → [[Casting & Corruption]]; Hope & Fear folded into [[Core Rules]].
- [x] **Vault structure** *(v0.1)* — two slices (`rules/core`, `rules/magic`), lore, tables, archive. → [[Start Here]]

---

*Back to [[Start Here]] · working rules in [[CLAUDE]].*
