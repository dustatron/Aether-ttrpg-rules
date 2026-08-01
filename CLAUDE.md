# CLAUDE.md — Working Contract for the *Weaver Magic* Vault

This is an **Obsidian vault** holding the rules and lore for **THE WEAVE**, a rules-light TTRPG in active design. Purpose: a **clean rules reference a GM can run from.**

Human entry point is [[Start Here]]. Read it before making changes.

---

## Canon — read this first

🚨 **The active game is the rules-light build: Corruption + Hope/Fear dice.** It lives in `rules/`.

- There was an earlier **heavy build** — a Monster-of-the-Week / **Mana** hack (2d6 + Mana modifier, Injury slots, overcasting). It is **archived, NOT CANON**, in `archive/`.
- **Never cite `archive/` as a current rule.** Never reintroduce Mana, Injury slots, or overcasting into `rules/`. If salvaging an idea from the archive, port it into the rules-lite frame (Corruption, Hearts/Wounds, casting bonus = mutations + tags).

If a request is ambiguous about which build, assume **rules-lite** and say so.

---

## The rules are in flux

This is a working draft (**v0.1**). Expect churn and unfinished pieces.

- **Mark status honestly.** Every rules/lore/table note carries `status:` in frontmatter: `draft` (default), `usable`, `brainstorm`, `stable`, or `shelved`. Don't upgrade a note to `stable` on your own — that's the designer's call.
- **Flag open questions with a callout,** not silent assumptions:
  ```markdown
  > [!question] Open design question
  > <what's unresolved, and the candidate options>
  ```
  Also log it in [[Open Questions & TODO]] — the master worklist of everything to decide, build, fix, or playtest. Keep that doc in sync: when a decision closes, move it to that doc's **Resolved** section with a one-line reason.
- **Don't invent rules to fill gaps.** If a mechanic is undefined (e.g. wild-magic severity, initiation's mechanical price), surface it as an open question — do not quietly pick a number and present it as canon.
- When you change a rule's substance, note it in [[Start Here#Changelog]] and update [[Open Questions & TODO]].

---

## Vault map

| Folder | Holds | Canon? |
|---|---|---|
| `rules/core/` | The system engine: [[Core Rules]] (incl. Hope & Fear), [[Character Creation]], [[Death & Injury]], [[Running the Game]] | ✅ canon |
| `rules/magic/` | The Weave engine: [[Casting & Corruption]], [[Mutation]], [[Spell Tags]], [[Magic Items]], [[Wild Magic]] | ✅ canon |
| `lore/` | Setting & story, system-neutral | ✅ canon |
| `tables/` | Spark/roll tables (mutation = usable; wild-magic = brainstorm) | mixed |
| `resources/` | Player-facing assets (character sheet) | ✅ |
| `archive/` | The old Mana / MotW build | ❌ NOT canon |
| `Start Here.md` | GM front door + index | — |

> [!note] Slices, not silos
> Rules are grouped into **slices** (`core`, `magic`). Wikilinks resolve by **note name, not path** — so a note can move between slices without breaking any `[[link]]`. Link across slices freely.
>
> Two notes are **merged mechanics** — don't re-split them: **[[Casting & Corruption]]** (casting *is* what generates Corruption) and **[[Core Rules]]** (Hope & Fear are read on every roll, so they live with the roll).

---

## Authoring conventions

**Obsidian Flavored Markdown.** (See the `obsidian-markdown` skill if unsure.)

- **Link liberally with wikilinks** — `[[Note Name]]`, `[[Note Name|display]]`. Cross-link every rule to the ones it touches. End rules notes with a `## See also` line.
- **Escape the pipe inside table cells:** `[[Core Rules\|difficulty]]`.
- **Use callouts** for emphasis, and use the type meaningfully:
  - `[!abstract]` = the one-line summary at the top of a note
  - `[!quote]` = the move/trigger text, verbatim
  - `[!warning]` / `[!danger]` = costs and doom
  - `[!tip]` = player-facing advice
  - `[!question]` = unresolved design
  - `[!failure]` = NOT-CANON banners
- **Frontmatter on every note:**
  ```yaml
  ---
  tags: [rules]        # rules | lore | table | gm | archive | brainstorm | villain
  system: rules-lite   # rules-lite | shared | (archive notes: omit / canon:false)
  status: draft        # draft | usable | brainstorm | stable | shelved
  version: 0.1
  ---
  ```
- **One topic per note.** If a note grows two distinct subjects, split it and link.
- **Titles are the wikilink targets** — renaming a note breaks inbound links. Prefer editing content over renaming; if you must rename, fix inbound links.

---

## Tone

The designer's house style (from global CLAUDE.md): **terse, facts first, no flattery.** Apply it to *chat with the designer* — not to the game text. **In-fiction rules and lore prose stay evocative** (that voice is the product). Keep mechanics crisp; keep flavor vivid.

---

## Don't

- Don't cite or resurrect the `archive/` Mana rules as canon.
- Don't mark unfinished mechanics as settled.
- Don't add crunch the rules-lite ethos rejects (it prizes *play to find out*; see [[Running the Game]]).
- Don't delete the archive or `initial-files` history without the designer's OK.
