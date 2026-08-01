# NPC Writer

Generate Obojima NPCs inspired by historical figures who died on today's date.

## Usage

`/npc-writer [count] [MM/DD]`

- `count` - Number of NPCs to generate (default: 1)
- `MM/DD` - Date to pull deaths from (default: today)

Examples:
- `/npc-writer 3` - 3 NPCs from today
- `/npc-writer 2 2/14` - 2 NPCs from February 14
- `/npc-writer 1 12/25` - 1 NPC from December 25

## Process

1. **Parse args** - Extract count and date. If no date, use today.

2. **Fetch deaths** - Call Wikipedia API:
   ```
   https://api.wikimedia.org/feed/v1/wikipedia/en/onthisday/deaths/{MM}/{DD}
   ```
   Use curl with User-Agent header (WebFetch gets 403).

3. **Extract data** - For each figure grab:
   - `text` (name/description)
   - `year`
   - `pages[0].extract` (bio summary)
   - `pages[0].thumbnail.source` (image URL, if exists)

4. **Filter out weak fits** - Remove figures that don't work for Obojima:
   - Modern celebrities (actors, musicians post-1900)
   - Athletes, sports figures
   - Politicians, businesspeople, executives
   - Industrial-era+ scientists (unless occult/weird)
   - Anyone whose identity is tied to modern technology

5. **Score remaining by Obojima fit** (highest = best):

   | Category | Score | Examples |
   |----------|-------|----------|
   | Japanese/East Asian origin | +3 | Samurai, monks, artisans |
   | Sailor, explorer, diver | +3 | Naval figures, cartographers |
   | Spiritual/mystical | +3 | Saints, monks, shamans, occultists |
   | Warrior (pre-gunpowder) | +2 | Knights, samurai, generals |
   | Artisan, craftsperson | +2 | Smiths, weavers, painters |
   | Nature-connected | +2 | Hermits, druids, rangers |
   | Scholar (pre-industrial) | +1 | Philosophers, alchemists |
   | Ancient/Medieval (pre-1500) | +1 | Bonus for older figures |
   | Interesting conflict/story | +1 | Assassins, exiles, cursed figures |

6. **Select figures** - Sort by score DESC, then year ASC (oldest as tiebreaker). Take top [count].

7. **For each figure**, generate NPC using rules below.

8. **Save** - Write all NPCs to `sandbox/npcs/{YYYY-MM-DD}-npcs.md`

## Ancestry Mapping

Map historical figure's origin → Obojima ancestry:

| Origin | Ancestry |
|--------|----------|
| Japanese, East Asian | Nakudama |
| European, Western | Human |
| Celtic, Nordic, nature-connected | Elf |
| African, Indigenous, tribal cultures | Dara |
| Unknown/Other | Roll d6 per [[npc-generator]] |

## Class/Occupation Mapping

Map historical profession → Obojima occupation (see [[npc-generator]] for ideas):

| Historical Role | Obojima Equivalent |
|-----------------|-------------------|
| Scientist, Scholar | AHA Researcher |
| Military, Warrior | Sword School Member |
| Sailor, Explorer | Deep Diver / Aeronaut |
| Artist, Writer | Artisan / Sand Sculptor |
| Religious, Spiritual | Spirit Medium / Witch |
| Politician, Noble | Warden / Faction Leader |
| Doctor, Healer | Midwife / Potion Merchant |
| Farmer, Laborer | Mushroom Farmer / Grove Keeper |
| Merchant, Trader | Potion Ingredient Merchant |
| Engineer, Inventor | Engineer / Tinkerer |

## Name Adaptation

Transform historical name → Obojima-style:

1. **Nakudama** - Keep Japanese names. Others: shorten, add Japanese syllables (ko, mi, ru, ta)
2. **Human** - Keep Western names or adapt spelling (Giovanni → Jovani)
3. **Elf** - Use nature words: tree names, plants, weather (see [[npc-generator]])
4. **Dara** - Short syllables, may add "Dara" suffix (see [[npc-generator]])

## Output Format

Use Obsidian callouts, color-coded by race:

| Race | Callout |
|------|---------|
| Human | `[!info]` |
| Nakudama | `[!success]` |
| Elf | `[!abstract]` |
| Dara | `[!example]` |

```markdown
> [!callout-type] NAME AGE
> ![name|200](thumbnail-url-if-available)
> *"Quote."*
> **Vibe:** `tag` `tag` `tag` | **Faction:** [[faction-link]]
> **Job:** [Obojima occupation, 1-5 words]
> **Look:** [One striking detail + one quirk/gesture]
> **Plays:** [One actable behavior cue]
> **Background:** [2 sentences max. What they're known for, with twist.]
>
> **Secret:** [One sentence. Gameable hidden truth.]
> **Want:** [What they need from PCs.]
> **Offer:** [What they can do for PCs - info/gear/access/muscle.]
> **Threat:** [Why crossing them costs.]
>
> `Lvl [1-4] | AC [10-16] | HP [4-20] | +[1-3] to [thing]`
>
> *Inspired by: [Historical Name] (died [year])* | [Wikipedia](wiki-url)
```

**Lvl Guide:**
- **Lvl 1:** Commoner, weak. AC 10-11, HP 4-8
- **Lvl 2:** Skilled, dangerous. AC 12-13, HP 9-14
- **Lvl 3:** Elite, deadly. AC 14-15, HP 15-20
- **Lvl 4:** Legendary, boss. AC 16+, HP 21+

Note: Only include image line if thumbnail exists. Skip for figures without images.

## Reference

Pull additional flavor from [[npc-generator]]:
- Quirks (d20)
- Wants (d20)
- Secrets (d12)

Tie to Obojima factions/locations when appropriate. See [[faction-matrix]].

## Example

Historical: Leonardo da Vinci (Italian polymath, died 1519, age 67)

> [!info] LEOVANI 63
> ![Leovani|200](https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Leonardo_self.jpg/220px-Leonardo_self.jpg)
> *"The eye sees what the mind knows. Look closer."*
> **Vibe:** `curious` `obsessive` `gentle` | **Faction:** [[AHA]]
> **Job:** AHA Researcher / Tinkerer
> **Look:** White beard stained with ink. Sketches constantly on any surface.
> **Plays:** Trails off mid-sentence chasing new thoughts.
> **Background:** Premier First Age scholar. Builds impossible machines that sometimes work. AHA both reveres and fears his discoveries.
>
> **Secret:** Found working First Age weapon. Dismantled it. Hid pieces across the island.
> **Want:** Recover his stolen notebook from Black Tide Syndicate.
> **Offer:** Can identify/repair any First Age tech. Knows AHA secrets.
> **Threat:** AHA will protect him violently. His inventions are unpredictable.
>
> `Lvl 2 | AC 10 | HP 8 | +3 to lore/tinker`
>
> *Inspired by: Leonardo da Vinci (died 1519)* | [Wikipedia](https://en.wikipedia.org/wiki/Leonardo_da_Vinci)
