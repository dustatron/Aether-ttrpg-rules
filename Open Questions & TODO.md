---
tags:
  - gm
system: rules-lite
status: draft
version: 0.1
---

# Open Questions & TODO

Master worklist. Everything to decide, build, fix, or playtest.

Opened by the six-lens review of [[Core Rules]], v0.1.

---

## Decide: blocks play

1. **Build the wild magic table.** Severity is decided (roll and add mutations + current Exposure), but [[wild-magic-table]] is an unsorted pile with no die size and no ordering. Real authoring job.

## Decide: economy

5. **Is 3 Luck the right crit-fail buydown?** It switches wild magic off for about 11% of a party's income.
6. **The goal award.** Player-written list, 2 Luck each, "own a horse" in the example.

## Decide: the doom engine

8. **"Advantage" has two meanings and no definition.** [[Charmer]] perk 2 and [[Witch]] perk 5 grant dice advantage; Otherfolk in [[Character Creation]] uses the same word for a flat **+1**. On 2d6, 3d6-keep-2 would also change the doubles odds.
9. **Difficulty and modifiers.** Nothing but a stat modifies a roll. No opposed rolls, no cover, no range penalty. Zones never touch resolution.
10. **What does a cast cost a Demon?** All twelve slots are gone, so nothing is left for a mutation to claim. Candidates: pay in Harm, pay in Scars, or casting is free.
11. **Playtest the mutation ladder thresholds.** 0/1–2/3–4/5–6/7+ gating 2/4/6/8/10 Exposure per cast. Shape settled, numbers are a first pass.

## Build

- ✅ [[Monsters]] rewritten against the live engine, then cut to 399 words.
- ✅ [[Bestiary]] split out of [[Monsters]]. Seven entries.
- ✅ [[Core Rules v2]] deduped. [[Core Rules v2#Scars|Scars]] and [[Core Rules v2#Frayed|Frayed]] written.
- ✅ Archetypes split into `rules/archetypes/`, one note each, indexed from [[Character Creation]].

12. **`Running the Game`.** No GM-facing procedure exists anywhere.
13. **A navigation spine.** [[Start Here]] has zero outbound links and needs an index.
14. **Do not create `Wild Magic`.** Decided. Its only ruling belongs in the casting rules; the link retargets to [[wild-magic-table]].

## Fix

15. **Retire [[Core Rules]] (v1).** It is linked from nowhere and kept only for diffing. Retiring it closes four stale items at once: emoji headings that break anchors, truncated sentences and typos, stat glosses that have drifted from [[Character Creation]], and the proposal to split it.
16. **`resources/Resource.md` frontmatter.** Missing `system:` and `version:`. It is also designer-facing material in a player-facing folder.
17. **Duplicate Key Terms.** Byte-identical in [[Start Here]] and [[World Lore]].

## Playtest

18. Whether the **−3 to +3 range** works at its ends. At −3, full success is impossible; at +4, every failure is a double 1.
19. Whether the **low-stat Luck advantage** reads as a rubber band or a death spiral. Worth protecting: raising a stat cuts its own Luck income, the one sound feedback loop in the economy.
20. Whether **dial-back** haggling slows casting to four exchanges per spell.

---

## Resolved

- **Luck earned from a failure cannot change that roll.** The player must accept and resolve the failure before gaining the Luck. Luck can change any result only once. *(Designer, v4 GM review.)*

- **Any number of players may assist.** Each commits before the roll, spends 1 Luck, and adds 1d6. Every involved character shares the consequences of a failure or partial success. *(Designer, v4 GM review.)*

- **Critical results replace normal results.** A double 6 on an enemy attack deals triple damage without also adding the 10+ complication. *(Designer, v4 GM review.)*

- **Armor does not reduce spell damage.** Against a physical hit, stacked armor breaks shield first, then worn armor. *(Designer, v4 GM review.)*

- **Morale checks happen at or below half Harm.** No rounding rule is needed. The GM may call for another check after the creature takes more damage. *(Designer, v4 GM review.)*

- **A full night's rest removes one fatigue, then restores all Harm if none remains.** Removing the final fatigue and restoring Harm can happen during the same rest. *(Designer, v4 GM review.)*

- **Spell tags only add to casting rolls.** Choose one relevant tag and add its rating, to a maximum of +3. Tags do not stack, do not run out, and never reduce Exposure. *(Designer, v4 concision pass.)*

- **Reach / Size combines distance and size into one casting dial.** Use the highest applicable cost, not their sum. Exposure is 1 + Reach / Size + Force and Effect + Duration. Transformations use the larger form. This supersedes the separate Distance and Size dials. *(Designer, v4 concision pass.)*

- **Track relic charges, not remaining Exposure.** Each use spends one charge. At filling, transfer the effect’s Exposure cost for each whole charge, up to 6 Exposure worth of charges held. Exposure that cannot fund a whole charge stays with the character; this replaces tracking leftovers in the item. Example: a 2-Exposure fireball takes 6 Exposure for three charges. *(Designer requested charge-only tracking, v4 simplification.)*

- **Relics store up to 6 Exposure; one charge means one use.** Each use spends the fixed effect’s full Exposure cost. Available charges are the whole uses the stored Exposure can pay for, and any remainder stays for refilling. This replaces the earlier use of “charge” to mean one stored Exposure point. *(Designer, v4 magic items pass.)*

- **Force and Effect share one casting dial.** Restore the earlier healing prices: +1, +2, or +3 for 1, 2, or 3 Harm, or +3 to heal one scar. Healing is instant and stays healed; transformation still has no separate surcharge and lasts for its paid Duration. This resolves the healing pricing question raised in the previous casting pass. *(Designer, v4 healing pass.)*

- **Spell pricing uses Distance, Size, Force, and Duration.** Add each to a base 1 Exposure, paid on success. The base covers simple transformation; transformation lasts only for its paid Duration. This replaces the earlier Effect categories. Size and Force numbers remain draft benchmarks, and healing needs a new pricing pass. *(Designer, v4 casting pass.)*

- **Magic Items restored below Magical casting in v4.** Carries forward the existing relic rules: one slot, five charges, an hour to fill, a fixed effect, and activation paid in charges without a casting roll or Exposure. The companion note now links to v4. *(Designer requested restoration, v4 pass.)*

- **Character Creation v2 drafted against Core Rules v4.** Preserves the earlier creation document. Uses key goals, recoverable scars, one starting mutation and the proposed +1 spell tag; mutations set the safe Exposure limit, not the casting bonus. Core Rules v4 links to the new draft. *(V4 creation pass.)*

- **Flashbacks cost 2 Luck.** Play a short scene in the past in which the character attempts something relevant to the present. Roll using the normal action rules, then return to the main story with the outcome. The spend buys the scene rather than automatic success. *(Designer, v4 Luck pass.)*

- **Assistance is committed before the roll.** Declare the help and spend 1 Luck before rolling; roll the assist d6 alongside the acting player’s 2d6. The assist die counts toward double 1s and double 6s. Assistance cannot be added after the action has been rolled. This supersedes earlier post-roll assistance timing and exclusions from doubles; direct Luck result upgrades retain their existing timing. *(Designer, v4 assistance pass.)*

- **Assistance shares the risk.** On an assisted failure, only the player making the original roll earns 1 Luck. On a failure or partial success, both characters share consequences; the GM describes how each is affected. Spend Luck after seeing the dice and before resolving consequences. *(Designer, v4 Luck pass.)*

- **Character goals are key goals.** During character creation, write up to four key goals, serious or petty. Earn 2 Luck when the character achieves one and the player crosses it off. Character Creation now links to v4 for this award. *(Designer, v4 pass.)*

- **Attuner, not Weaver.** "Weaver" and "Corruption" are dead terms. *(Designer, this review.)*
- **Maximum Exposure for a single cast is 10.** Replaces the stale 5. One maximum cast equals exactly one mutation, pending question 31, since the dials cannot yet reach 10. *(Designer, this review.)*
- **Monsters deleted** rather than repaired; it was written against the dead engine. Rewrite when ready. *(Designer, this review.)*
- **A 5-damage cast costs 6 Exposure, not 9.** [[Monsters]] claimed a legendary cast needed nine Exposure and five mutations. The dials price 5 damage at base 1 + force 5, which three mutations already reach. Corrected in the note. *(Claude, from [[Core Rules v2#Casting Exposure Cost]].)*
- **Monster attack ladder lives only in [[Core Rules v2]].** [[Monsters]] carried a second copy that had drifted: it read 7-9 as half damage and omitted the Luck award on a miss. Deleted, replaced with a link. *(Claude, this pass.)*
- **No em dashes in vault copy.** *(Designer.)*
- **Never hand the GM a dead end.** New voice rule 9 in `osr-rules-writing`: a field that answers "nothing" or "you cannot" has spent a line taking an option away. Prompted by a Demon whose Desire read "nothing you can offer", which closed the one scene the field exists to open. *(Designer.)*
- **[[mutation-tables]] row 26 is Chitin plates.** 21 to 26 is a coverings block (scale, fur, feather, bark, metal), so the blank wanted another covering. Chitin also foreshadows 66. *(Claude, this pass.)*
- **Basics are two slots, not one.** **Firelight** (torch, flint and steel) and **Rations** (3). Welding food to the fire kit hid a real decision: rations bundle 3 to a slot, so carrying more is now a choice you spend slots on, and catching your breath spends one. Free slots drop by 1 across all six archetypes. *(Designer.)*
- **A full success deals double damage.** 7 to 9 and 10+ previously dealt the same, so rolling well bought nothing in a fight. Double the weapon first, then subtract armor. Taken over +1 deliberately, for flow and feel, and flagged for playtest: doubling also lets a party reach a Legendary's morale mark, which activates the existing "it withdraws or it changes" rule. *(Designer.)*
- **Superseded critical rule:** a crit once found a weak spot and destroyed armor. V4 now gives each critical its own replacement result. *(Designer.)*
- **Armor is destroyed, not degraded.** Match it and you are stopped cold with the armor intact. Exceed it and it gives nothing until repaired. Replaces "wears it down by 1", which needed tracking across a fight. *(Designer.)*
- **Monsters check morale at or below half Harm.** Roll 2d6 + Threat: 6- it breaks, 7 to 9 it changes what it is doing, 10+ it holds. The GM may call for another check after more damage. Players never check, and mindless or driven things never check. Harm is a morale clock rather than a health pool. *(Designer.)*
- **Threat is the morale bonus.** A Mook at −1 breaks 58% of the time, a Legendary at +3 breaks 8%. No new number: the stat that says how dangerous it is also says how committed it is. *(Designer.)*
- **The game is THE RESONANCE.** "The Weave" joins Weaver and Corruption as a dead term, for the energy and the title alike. The setting energy and the game now share one name. *(Designer.)*
- **The stat is Dexterity, spelled out.** The archetype stat lines now spell all four out rather than mixing `Strength` with `Dex`. *(Designer.)*
- **Inventory is twelve slots, with no cap on mutations and Scars.** "When the last slot goes, you are finished" stays one number with no exceptions. A cap at 6 was considered and dropped: it would have made the `7+` row of the mutation ladder unreachable, so no character could ever spend 10 Exposure on a cast. *(Designer.)*
- **The relic rules have one home each.** [[Core Rules v2#Magic Items]] owns the slot cost, the 5-charge cap and the hour. [[Magic Items]] owns using, shaping and selling. Neither restates the other, so they cannot drift. *(Designer.)*
- **Second concision pass on [[Core Rules v2]].** 1,610 to 1,511 words. Dropped the `[!abstract]` block, which `### The dice` already said in full, and seven justification clauses hanging off rulings. *(Designer.)*
- **The Force dial ends at +4, and 3 damage is the most a cast can do.** The 4 and 5 damage rows are gone, so the dials now reach exactly 10 with no cap patch. Legendary casts buy scope, not a bigger number. *(Designer.)*
- **A critical cast still costs nothing.** Kept as written: 1 in 36, any size. The one moment the Resonance gives something back. *(Designer.)*
- **Legendary is the one exception to the armor cap, at 5.** Everything else caps at 3. *(Designer.)*
- **Superseded Legendary armor rule:** armor once prevented every spell from hurting a Legendary. V4 spell damage ignores armor, but only the Legendary's weakness can end it. *(Designer.)*
- **The in-play Luck spends are priced 1 / 2 / 1.** Push a failure for 1, push a partial for 2, assist for 1, buy down a crit fail for 3. Three of the four had no cost written at all. *(Designer.)*
- **A partial success deals full damage.** Same as monsters on 7 to 9. The complication is the cost, not a smaller number, and fights stay short. *(Designer.)*
- **A failed cast costs no Exposure.** You pay only when the working lands. This also steepens the doom curve: a green Attuner fails 42% of casts and pays for none of them, while a seven-mutation Attuner fails 17% and pays for nearly everything. *(Designer.)*
- **Catching your breath costs your action.** It works mid-fight, at 1 ration for 1d6 Harm. The turn is the price, and 3 rations caps the whole mid-fight budget: one breath roughly matches one 2-damage attacker, so it stabilises against one enemy and loses against two. *(Designer.)*
- **Harm does not empty when you Scar.** It stays full, and every further hit takes another slot. Only rest clears it. An emptying track let a Witch absorb 50 damage in one fight and made grinding optimal; now the answer to a losing fight is to leave it. *(Designer.)*
- **No escape or disengage procedure.** Fleeing is fiction, and a contested exit is an ordinary roll. *(Designer.)*
- **Notes are split on subject, not on word count.** The 400-word ceiling in `osr-rules-writing` was arbitrary and drove bad advice; Cairn's whole ruleset is ~4,000 words. Replaced with a subject test. *(Designer.)*
- **Scars have a creation rule.** Filling your Harm takes a Scar, which claims your last slot. The note used Scars in four places and never said where they came from. *(Claude, from the Resolved log.)*
- **Frayed is defined in the rules.** New section in [[Core Rules v2]], absorbing the old "Mutated Attuners cannot go shopping". Frayed changes the world, not the dice. *(Claude, from the Resolved log.)*
- **Luck has three sources, not two.** Failing, being missed, and crossing off a goal. [[Core Rules v2#Luck Points]] listed only two. *(Claude, this pass.)*
- **Five broken heading anchors repaired.** `#Doubles`, `#Zones`, `#Frayed`, `#What it costs`, and `[[Core Rules#Luck]]` pointing at the superseded v1. *(Claude, this pass.)*
- **Worked monster entries live in [[Bestiary]], rulings in [[Monsters]].** The combined note was 743 words against a 400 budget. *(Designer.)*
- **The Legendary is the Prophet, not "the Dragon."** One villain, one name. The entry already carried the Prophet's identity from [[The Church & The Prophet]]. *(Designer.)*
- **A bear is a Baddy.** The tier table and the entry disagreed; 15 Harm and armor 2 read wrong for a bear. *(Designer.)*
- **Mutation is a cost, not a reward. Every mutation claims one slot, permanently.** This was the root question of the review: mutation previously paid out three times and took nothing, so maximising Exposure was optimal play. The body now has a fixed amount of room and the Resonance takes it. *(Designer.)*
- **Scars fill a slot too.** Filling your Harm track marks you permanently, on the same track as mutation. *(Designer.)*
- **No running Exposure total.** Exposure stays a 0–10 meter and resets. The permanent record lives in the slots, which is what makes the accumulation visible without arithmetic. Resolves the review's "nothing accumulates" blocker. *(Designer.)*
- **Gear slots re-costed** so the doom clock has room: small things of a kind bundle, worn armor is free, and the basics are one slot. Every archetype now sits at 4–6 free slots; three of four were illegal as built. *(Designer.)*
- **A mutation takes your last slot and destroys what is in it.** Mutations fill from the bottom up, so packing order is a choice made before you know when it lands. An empty last slot costs nothing, which rewards travelling light. *(Designer.)*
- **Frayed and Demon thresholds: 1–2 hideable · 3–4 visibly wrong · 5+ Frayed, hunted on sight · 10 Demon, the character retires.** One number measures both how much of you is gone and how much strangers can see. *(Designer.)*
- **Exposure empties on mutation, and the overflow carries.** Take 6 on 8 and you mutate, then restart at 4. Closes the overshoot exploit, where crossing the line by as much as possible wasted the excess for free. *(Designer.)*
- **The relic valve is easy to reach and expensive to hold.** A relic **takes a slot**, so shedding converts a permanent slot into a temporary one; it holds at most **5 charges**; and forging takes **an hour undisturbed**, so the valve is never open in the moment that matters. This answers the vault's founding question: the world is littered with relics because Attuners cannot carry all their own poison, and it is what the Church actually sells: somewhere to put it. *(Designer.)*
- **Monsters run on six tiers:** Mook −1 · Baddy +0 · Glass cannon +1 · Monster +1 · **Horror +2** · Legendary +3. Each carries Threat, damage, Harm and armor. Port from any system by ignoring its numbers and asking three questions. **Harm alone never kills a Legendary; only its weakness does.** *(Designer.)*
- **Armor is mended in the fiction, never by a roll.** Find a town, find someone who works that style of armor, pay in coin or a favour. Broken armor is a reason to go somewhere. *(Designer.)*
- **Doubles no longer pay Luck.** They keep their real job (double 6 is a crit, double 1 is a disaster), and the contradictory, self-stacking award is gone. Luck now comes only from failing, from being missed, and from crossing off a goal: every point of it from the world going badly for you. *(Designer.)*
- **Double 1s always fail,** settled by arithmetic rather than ruling: nothing adds more than +3, so a double 1 can never exceed 5. *(Designer.)*
- **The GM rolls for the opposition:** 2d6 + Threat, same ladder. **A miss earns the target 1 Luck**, so every swing that comes at you and fails is luck to spend. Enemies never earn Luck themselves. Doubles work the same both ways. **A crowd attacks on one roll** at the best single weapon among them. *(Designer.)*
- **Harm is set by archetype:** Fighter 8 · Hunter 7 · Monk 7 · Thief 6 · Charmer 6 · Witch 5. The 1d6 ration rest sets a floor: below 6 a single ration overheals and the supply economy stops meaning anything. The Witch being frailest is right; they are spending slots on mutations too. *(Designer.)*
- **Filling a relic is one action, always an hour.** Forging and recharging are the same act, and the first time you also shape the effect. A minutes-long recharge would have reopened the laundromat: forge one rock early, then shed at will forever. *(Designer.)*
- **[[Magic Items]] rewritten** as the single home, resolving the six disagreements with the old Core Rules copy and its own internal contradiction on activation cost. *(Designer.)*
- **Luck caps at 10 and moves freely between players.** No limit, no narration required. *(Designer.)*
- **Advancement costs 5, 10, 15, then 20.** Transfers are what make the ladder possible: nobody can hold 15, so a third upgrade must be funded by the table. It turns advancement from a drip into a party decision, and the character they fund is usually the Attuner spending their body on everyone's behalf. *(Designer.)*
- **Luck never buys a mutation.** Mutations are earned by casting and paid for with the body. Currency must not reach the doom clock. *(Designer.)*
- **Every archetype has six perks,** rollable on a d6 or picked, each split into its own note under `rules/archetypes/`. *(Designer.)*
- **The stat perk is repriced to +1, capped at +3.** It was `+2 to distribute` on every table, strictly the best pick in the field (roughly 25 percentage points of failure reduction, permanent) and the thing that pushed a starting stat to +4, past the stated range. *(Designer.)*
- **Six archetypes.** Fighter added: the one who can take a hit meant for someone else, which matters because Scars are permanent. Witch added: a former order magician carrying a relic they did not make, whose first perk *costs* a slot for a second mutation. *(Designer.)*
- **Armor subtracts, and also breaks.** It stacks to 3. Subtract it from every hit, and a hit that meets or beats it wears it down by 1. Supersedes the earlier "stops the blow entirely" reading, which contradicted two other lines in [[Core Rules v2]]. *(Designer, this pass.)*
- **Damage can exceed 3, by perk.** Add-your-stat is a perk an archetype offers, not a trait every archetype has. The Hunter's ranged perk and the Monk's unarmed perk now carry it. Universal stat-to-damage would only renumber the scale and make +2 mandatory. *(Designer.)*
- **The Force dial extends to 4 and 5 damage** at +6 and +8. A 5-damage cast is 9 Exposure before reach or duration, so only an Attuner deep in it can hold one, and it nearly finishes them where they stand. *(Designer.)*
- **Catching your breath costs 1 ration.** Three rations in the basics slot means three breaths between resupplies. *(Designer.)*
- **One track, two endings.** Mutations and Scars both permanently fill the same slots. When the last one goes the character is finished. **Demon** if mutations took them, **dead** if Scars did. Your body holds a fixed number of units of you, and both magic and violence spend them. *(Designer.)*
- **Scars can be taken back; mutations cannot.** A healer or a `Heal` cast clears a Scar and returns the slot. Healing is casting, so mending your humanity can cost you a mutation. *(Designer.)*
- **Initiative: the table goes first.** Players act, then everything else, unless they were surprised. *(Designer.)*
- **Recovery:** catch your breath for **1d6 Harm**; a safe night's sleep with food returns **all** Harm. Rest never touches Scars. *(Designer.)*
- **Wild magic severity scales with how far gone you are.** Roll and add mutations + current Exposure. A green Attuner makes something strange happen; someone deep in it tears a hole in the world. *(Designer.)*
- **Armor stacks, capped at 3.** *(Designer.)*
- **Spell tags are retired as a rule.** An Attuner has no spell list. The fiction says so, since the wizards with the narrow rules are the *scavengers*. [[Spell Tags]] survives in `tables/` as a prompt sheet for a blank player. *(Designer.)*
- **Casting bonus = your mutations, capped at +3.** Same scale as every stat. Kills the runaway that made casting auto-succeed by session four. *(Designer.)*
- **Mutations gate how much Exposure one cast may carry:** 0→2, 1–2→4, 3–4→6, 5–6→8, 7+→10. Past the third mutation you stop getting better and start getting bigger. This makes "you cannot do that yet" a fact about the character's body rather than a GM veto. *(Designer.)*
- **A Force dial prices damage:** +0 none, +1 for 1, +2 for 2, +4 for 3. With reach and duration the dials now reach exactly 10, and the 5-damage row is gone: legendary casts buy scope, not a bigger number. *(Designer.)*
- **A critical success on a cast costs no Exposure.** Replaces the retired "take a new spell tag" prize, and pays in the currency that matters. *(Designer.)*
- **Everyone starts with one mutation**, rolled. Casting bonus +1, 4 Exposure per cast, 9 slots. Closes the chargen hole that let a player start at +6. *(Designer.)*
- **Frayed changes the world, not the dice.** Doors close, prices climb, the Church is told. No modifier. The game has no situational modifier layer, and a shut gate cannot be bought off with a Luck Point. *(Designer.)*

## Character Creation v2: open draft questions

- Set starting Luck and current Exposure. The new draft proposes 0 for each, with no starting scars or fatigue.
- Replace Beastfolk's obsolete Grace/Wit bonus; clarify life-trait stacking, total bonus limits, casting applicability, and Otherfolk body advantages.
- Finish archetype perk tables, define advantage, and replace the Monk's obsolete ration-free recovery perk. Choose a usable written perk until the tables are complete.
- Review gear: ammunition, shield slot treatment, Hunter doses, Witch staff and powder, and other undefined item effects.
- Confirm whether the proposed first +1 spell tag can come from the character's first magic as well as their mutation.
