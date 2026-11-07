---
tags:
  - rules
system: arcane-aether
status: current
version: 4.5
canonical: true
source: The Arcane Aether Rules v4.5.rtf
---

# Core Mechanics

## The dice

Say what your character intends to do. **Roll two six-sided dice (2d6)** and add the relevant stat. For casting, use one relevant Spell Tag in place of the stat.

The GM calls for a roll when the outcome is uncertain and failure would change the situation. Otherwise, the GM lets it happen or tells you what it costs in time or resources.

| Total         | Result                                                                    |
| ------------- | ------------------------------------------------------------------------- |
| 6 or less     | **Failure.** It goes wrong. Resolve the failure, then gain 1 Luck.        |
| 7 to 9        | **Partial success.** Your character does it, but there is a complication. |
| 10 or greater | **Full success.** Your character achieves what they intended.             |
| Double 1s     | **Tragic failure.**                                                       |
| Double 6s     | **Critical success.**                                                     |

Check doubles on the two dice that determine the result. Double 1s or double 6s replace the normal result.

When no more specific doubles rule applies, the GM adds a severe or lasting consequence to a Tragic failure. On a Critical success, your character achieves what they intended and gains an extra benefit chosen by the GM.

A complication should move events forward. Your character might lose something, end up in danger, attract attention, or get hurt. A partial success still accomplishes what you rolled for.

## Luck

Each character can hold up to **10 Luck**.

### Gaining Luck

- Gain **1 Luck** after you accept and resolve a failed roll.
- Gain **2 Luck** when your character achieves a Key Goal and you cross it off their list.
- Gain **2 Luck** when you roll double 1s.

You may give your Luck to another player whenever you like.

### Tracking Luck

Use spare six-sided dice or tokens at the table. Each die or token represents 1 Luck. The number showing on a die doesn’t matter. Collect them as you gain Luck and return them as you spend it.

At the end of the session, record what’s left in the Luck box on your character sheet. Set out that many dice or tokens at the start of the next session.

### Spending Luck

| Cost | Spend it on                                                                               |
| ---- | ----------------------------------------------------------------------------------------- |
| 1    | [[#Add a die]] and keep the highest two.                                                  |
| 1    | [[#Assist another character]] by adding a die to their player’s roll.                     |
| 2    | Play a scene from your character’s past that can affect the present. See [[#Flashbacks]]. |
| 5    | Improve your character. See [[#Advancement]].                                             |

### Add a die

Spend 1 Luck before resolving a roll. Roll **3d6 and keep the highest two**. Only the kept dice count for double 1s or double 6s.

### Assist another character

Spend 1 Luck and explain how your character helps. The active player adds 1d6 to their roll and keeps the highest two dice.

If the roll fails, only the active player gains 1 Luck. Everyone who assisted shares the consequences of a failure or partial success.

You can spend 1 Luck to assist while the active player spends 1 Luck to add a die to the same roll.

### Flashbacks

Spend 2 Luck to play a short scene from your character's past that affects the present. Maybe they bribed the kitchen servant to leave the back door unlocked.

Play the scene and roll if its outcome is uncertain. Then return to the present with the result. Costs and consequences apply normally. In a turn, the flashback counts as your character's action.

### Advancement

Spend 5 Luck and choose one.

- Increase a stat by 1, to a maximum of +3.
- Increase a Spell Tag by 1, to a maximum of +3.
- Increase maximum Health by 1.
- Gain an Archetype Perk.

## Inventory and conditions

Your character’s inventory tracks what they carry and how they’re holding up.

Your character has **12 inventory slots**. Gear fills from the top down. Conditions fill from the bottom up, taking the lowest available slot.

An item usually takes one slot. Small things of the same kind bundle together, such as a handful of arrows, spikes, or three rations. Worn armor does not take a slot.

Mutations, Scars, and Fatigue are conditions. If one takes a slot holding an item, that item is dropped.

When conditions claim all twelve slots, the character is lost. The final condition determines what happens in [[Dying and Recovery#Death and dying|Death and dying]].

## Movement

A move shifts your character one zone toward or away from something. Skip their action to take a second move.

| Zone  | Meaning                             |
| ----- | ----------------------------------- |
| Close | Melee. Close enough to touch.       |
| Near  | Across the room. One move to Close. |
| Far   | Two moves from Close. Bowshot.      |

Walls, locked doors, crowds, and deep holes still matter.

## Combat

Player characters act first, then enemies. Each player rolls 1d6. The character of the player who rolled highest acts first, then play moves clockwise around the table. If the characters are surprised, the attackers act first.

### Your character's turn

Your character can take **one move and one action** in either order. They can attack, [[Magic System|cast]], [[Dying and Recovery#Healing|catch their breath]], use something, assist someone, or try something else.

### Attacking

Roll **2d6 plus Strength** for hand-to-hand combat or **2d6 plus Dexterity** for a ranged attack. Your character must be able to reach the target with what they are using.

| Result          | Effect                                                                                                    |
| --------------- | --------------------------------------------------------------------------------------------------------- |
| Failure         | The attack fails and the situation gets worse.                                                            |
| Partial success | The attack deals the weapon’s damage and your character faces a complication.                             |
| Full success    | The attack deals double the weapon’s damage.                                                              |
| Double 6s       | Deal triple damage and ignore Armor.                                                                      |
| Double 1s       | The attack fails. Your character takes 1 damage or their weapon breaks, whichever fits.                   |
| Triple 6s       | Your character kills the target outright.                                                                 |
| Triple 1s       | Your character takes a scare and drops their weapon. They blunder so badly they fall and hurt themselves. |

On a failure or partial success, an enemy may hurt your character, push them back, damage their gear, or create another fitting complication. The enemy still takes its regular turn.

### Damage and Armor

| Damage magnitude | Damage |
| ---------------- | ------ |
| Tiny             | 0      |
| Small            | 1      |
| Medium           | 2      |
| Large            | 3      |
| Huge             | 4      |
| Mythic           | 8      |

Damage uses the same magnitude names as magic. Apply damage modifiers, doubling, tripling, and Armor as usual. [[Monsters#Mythic monsters|Mythic monsters]] also follow their own Weakness rules.

Weapon damage depends on the weapon’s size and weight.

- Small or concealable: **Small damage (1)**.
- Normal: **Medium damage (2)**.
- Heavy or two-handed: **Large damage (3)**.

Apply damage added by a Perk before doubling or tripling the attack.

Armor reduces incoming damage. Worn armor and shields stack to a maximum of **3 Armor**, although Mythic creatures may have more.

If incoming damage exceeds your character’s Armor, subtract their Armor and apply the remaining damage. Their Armor breaks. If the damage is equal to or below their Armor, your character takes no damage and their Armor stays intact.

A critical success ignores Armor without breaking it. Broken Armor must be repaired by someone with the necessary skills. Pay them or owe them a favor.

### When enemies attack

Use the enemy's Threat from [[Monsters]]. The GM rolls **2d6 plus Threat**.

| Total         | Result                                                   |
| ------------- | -------------------------------------------------------- |
| 6 or less     | The attack misses.                                       |
| 7 to 9        | Deal the enemy's listed damage.                          |
| 10 or greater | Deal the enemy's listed damage and cause a complication. |
| Double 6s     | Deal triple damage and ignore Armor.                     |
| Double 1s     | The attack fails and the enemy suffers a mishap.         |

When a crowd attacks one target, the GM rolls once, using the group’s highest Threat and best single Damage. The crowd can still block exits, surround a character, or create other complications.
