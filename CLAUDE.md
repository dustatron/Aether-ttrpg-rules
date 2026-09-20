# CLAUDE.md: Working Contract for the *Resonance* Vault

This is an **Obsidian vault** holding the rules and lore for **THE RESONANCE**, a rules-light TTRPG in active design. Purpose: a **clean rules reference a GM can run from.**

Human entry point is [[Start Here]]. Read it before making changes.

---

## Current rules and writing reference

Read [AGENTS.md](AGENTS.md) before editing. It is the shared reference for player/character terminology and preserving the designer’s voice.

[[Core Rules v4]] is the current working rules draft. Its draft notes contain proposals, not automatically settled decisions. [[World Lore]] remains the lore reference. The user’s latest decisions take precedence.

Earlier versions and historical TODO entries are background. Character Creation and companion notes still need synchronization with v4. Do not reintroduce mutation-based casting bonuses or other older mechanics from those documents.

The older inventory of files and gaps below is historical and may be stale. Check the actual vault before relying on it. In particular, `archive/`, [[Monsters]], and [[Open Questions & TODO]] exist.

---

## Terminology

**Canon:** a person who alters the Resonance is an **Attuner**.

> [!failure] Deprecated vocabulary: do not use
> **Weaver** is the old term for Attuner. **Corruption** is the old term for Exposure. **The Weave** is the old name for both the Resonance and the game. None are canon. If you find them in a note, they are leftovers to fix, not usage to copy.

Still unsettled:

| Concept | Status |
|---|---|
| **Exposure** vs **Resonance Exposure** | Both in use. Same thing. Pick one. |
| The GM's action currency | **Fear tokens** appeared in the deleted Monsters note and are **defined nowhere**. Unclear if the idea survives. |

---

## The rules are in flux

The current core rules are a working draft (**v0.4**). Expect churn and unfinished pieces.

- **Mark status honestly.** Every rules/lore/table note carries `status:` in frontmatter: `draft` (default), `usable`, `brainstorm`, `stable`, or `shelved`. Don't upgrade a note to `stable` on your own. That's the designer's call.
- **Flag open questions with a callout,** not silent assumptions:
  ```markdown
  > [!question] Open design question
  > <what's unresolved, and the candidate options>
  ```
  Also log it in [[Open Questions & TODO]], the master worklist of everything to decide, build, fix, or playtest. Read its existing entries as history and check them against the current draft. When a decision closes, move it to that note's **Resolved** section with a one-line reason.
- **Don't invent rules to fill gaps.** If a mechanic is undefined (wild-magic severity, initiation's mechanical price, what an enemy Attuner's mutation count does), surface it as an open question. Do not quietly pick a number and present it as canon.
- When you change a rule's substance, update [[Open Questions & TODO]].

---

## Vault map

| Folder | Holds | Canon? |
|---|---|---|
| `rules/` | [[Core Rules v2]] (the live engine), [[Core Rules]] (v1, superseded, kept for diffing), [[Character Creation]], [[Monsters]] (tiers and rulings), [[Bestiary]] (worked entries) | ✅ canon |
| `rules/archetypes/` | [[Hunter]] · [[Thief]] · [[Charmer]] · [[Monk]] · [[Fighter]] · [[Witch]]. One note each, indexed from [[Character Creation]] | ✅ canon |
| `rules/magic/` | [[Magic Items]] | ✅ canon |
| `lore/` | [[World Lore]] (the Resonance), [[Becoming an Attuner]], [[The Church & The Prophet]] | ✅ canon |
| `tables/` | [[mutation-tables]] (`usable`) · [[Spell Tags]] (`usable`, a prompt sheet, **not a rule**) · [[wild-magic-table]] (`brainstorm`) | mixed |
| `resources/` | [[Resource]]. External links to mine, not player-facing | ✅ |
| `Start Here.md` | Designer's premise + key terms | n/a |

`rules/` is flat apart from `rules/magic/` and `rules/archetypes/`. There is no `rules/core/`.

> [!warning] Archetype note names are generic
> [[Hunter]], [[Fighter]] and [[Witch]] are plain nouns, and wikilinks resolve by name. If a monster or NPC ever wants one of those names, one of the two has to be renamed. Check before creating.

> [!note] Slices, not silos
> Wikilinks resolve by **note name, not path**. A note can move between folders without breaking any `[[link]]`. Link across folders freely.

### Known gaps in the map

Notes that are referenced but do not exist. Creating one is a real authoring job, not a stub. Ask first.

| Note | Linked from |
|---|---|
| `[[Mutation]]` | [[Resource]]. A canon note wants it |
| `[[Wild Magic]]` | [[wild-magic-table]]. Retarget the link to the table instead; the only ruling it would hold ("on double 1s, roll on the table") belongs in the casting rules |
| `[[Combat]]` · `[[Running the Game]]` · `[[Monsters]]` | **nothing**. No canon note links them. Create them on merit, not to satisfy a dangling link |
| `[[Open Questions & TODO]]` | this file |

**Monsters was deleted deliberately.** It was written against the deprecated engine. It gets rewritten when the designer is ready. [[Core Rules]] currently carries combat and casting inline.

### Known duplications

- **Magic item rules live in two places:** [[Core Rules]] `## 🧙‍♂️ Magic Items` and [[Magic Items]]. They don't match. [[Magic Items]] is the fuller treatment.
- **Key Terms is duplicated** verbatim in [[Start Here]] and [[World Lore]].

Don't "fix" either by deleting one. Flag it.

---

## Authoring conventions

**Obsidian Flavored Markdown.** (See the `obsidian-markdown` skill if unsure.)

**Follow the voice and terminology guidance in [AGENTS.md](AGENTS.md).** Preserve the designer’s conversational phrasing and strange examples while making mechanics precise. Do not impose a terse OSR rewrite, hard word budgets, or a mandatory writing skill.

- **Link liberally with wikilinks:** `[[Note Name]]`, `[[Note Name|display]]`. Cross-link every rule to the ones it touches, **inline, at the point the reader needs it**.
- **No `## See also` sections.** Obsidian's backlinks pane already does that job, and a trailing link list is a lookup hop that earns nothing.
- **No em dashes.** Anywhere in the vault. Use a period, a colon, or a comma.
- **Escape the pipe inside table cells:** `[[Core Rules\|difficulty]]`.
- **Check heading anchors.** `[[Note#Heading]]` must match the heading exactly, emoji included. Emoji in headings are the usual cause of a dead anchor.
- **Use callouts** for emphasis, and use the type meaningfully:
  - `[!abstract]` = the one-line summary at the top of a note
  - `[!quote]` = the move/trigger text, verbatim
  - `[!warning]` / `[!danger]` = costs and doom
  - `[!tip]` = player-facing advice
  - `[!example]` = a stat block, an archetype, a sample list
  - `[!question]` = unresolved design
- **Frontmatter on every note:**
  ```yaml
  ---
  tags: [rules]        # rules | lore | table | gm | index | reference | brainstorm | villain
  system: rules-lite   # rules-lite | shared
  status: draft        # draft | usable | brainstorm | stable | shelved
  version: 0.1
  ---
  ```
  `lore/` notes currently omit `system:`. That's fine; lore is system-neutral.
- **One topic per note.** If a note grows two distinct subjects, split it and link.
- **Titles are the wikilink targets.** Renaming a note breaks inbound links. Prefer editing content over renaming; if you must rename, fix inbound links.

---

## Tone

Keep conversation with the designer direct and candid. Game text follows the designer’s own conversational voice, as described in [AGENTS.md](AGENTS.md). Player means the person at the table and is addressed as “you.” Character means the person in the story. Preserve that distinction everywhere.

---

## Don't

- Don't treat this file as canon over the user’s instructions, [[Core Rules v4]], and [[World Lore]].
- Don't write **Weaver**, **Corruption** or **the Weave**. They are dead terms: use **Attuner**, **Exposure** and **the Resonance**.
- Don't mark unfinished mechanics as settled.
- Don't add crunch the rules-lite ethos rejects. [[Start Here]] prizes *play to find out*, and "the answer to your problems is in your imagination, not your character sheet."
- Don't create the missing notes ([[Combat]], [[Running the Game]], [[Mutation]], [[Wild Magic]], [[Monsters]]) without asking.
- Don't delete either half of a known duplication to resolve it.
