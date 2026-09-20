---
tags:
  - rules
system: rules-lite
status: draft
version: 0.2
---

# Core Rules v2

### The dice
- **Common action:** 2d6 + stat.
- **Casting:** 2d6 + casting bonus.
- **Fail and you gain a Luck Point.** Spend Luck to push the story.
- **Cast and you gain Exposure.** At 10 you mutate, and the mutation takes an inventory slot.

The rest is roleplay and imagination.

## At a glance

1. [[#Stats|Stats]]. What you are good at
2. [[#Inventory Slots|Slots]]. What is left of you
3. [[#The roll|The roll]]. 2d6 + stat, three outcomes
4. [[#Critical Rolls|Doubles]]. Crits and wild magic
5. [[#Luck Points|Luck Points]]. Earn and spend
6. [[#Zones for distance|Zones]]
7. [[#Damage and armor|Damage and armor]] · [[#Combat|Combat]] · [[#Recovery|Recovery]]
8. [[#Casting|Casting]] · [[#Exposure and mutation|Exposure and mutation]]

---

## Stats

Four stats cover everything mundane, each ranging **−3 to +3**.

- **Strength**
- **Dexterity**
- **Willpower**
- **Charm**

[[Character Creation]] has specific details on how to quickly assign these stats.

**Your character carries 4 more numbers:**

- **Armor.** Subtracts from damage you take.
- **Harm.** How much you can take before it marks you. Your archetype sets it: 5 to 8.
- **Exposure.** How much Resonance you are carrying, 0 to 10.
- **Inventory.** 12 slots. Gear, mutations and Scars all share them.

## Inventory Slots

**This game has a slot based inventory.** 
total slots 12. 
These slots hold your:
- common Items like rations and tools
- weapons like swords and crossbows
- your scars, when you take damage after you run out of harm
- mutations, when you take more than 10 exposure points. 
Gear fills them. So do **mutations** and **Scars**, and those fill from your **last slot upward**, destroying whatever was in it.

**When the last slot goes, you are finished.** What filled you decides how:

- **Mostly mutations: you are a Demon.** The Resonance finished the job.
- **Mostly Scars: you are dead.** You stayed human the whole way down.

**Scars can be taken back. Mutations cannot.** A healer or a `Heal` cast clears a Scar and returns the slot.

## The roll

State what your character wants. Roll **2d6 + the fitting stat**.

| Total         | Result                                               |
| ------------- | ---------------------------------------------------- |
| **6 or less** | **Failure.** It goes wrong. Gain 1 Luck.             |
| **7 to 9**    | **Partial success.** You do it, with a complication. |
| **10+**       | **Full success.** Clean.                             |

**A partial deals full damage. A full success doubles it.** Double the weapon first, then subtract armor.

## Critical Rolls

**Double 6s = you find the weak spot.** Through the eye, under the arm, where the plates meet.

- **Combat:** deal its **full Harm, minus its armor**, and **the armor is destroyed**. Anything unarmored simply dies.
- **Casting:** the spell works **and costs you nothing.** No Exposure.

> [!danger] A Legendary has no weak spot
> It is not really a body. Crits do nothing to it. Only its named weakness ends it. See [[Monsters]].

**Double 1s = critical failure.**

- **Combat:** a total failure. Take 1 Harm, or your weapon is damaged.
- **Casting:** **roll on the [[wild-magic-table|wild magic table]], and add your mutations and your current Exposure.** The further gone you are, the worse the thing you let through.

## Luck Points

**Earn 1 Luck** when you fail a roll.
**Earn 1 Luck** when an attack on you misses.
**Earn 2 Luck** when your character crosses a goal off their list.

### Luck caps at 10

Anything over is lost.

**Give Luck to anyone at the table, whenever you like.**

### Spend it in play

| Cost | Buy |
|---|---|
| **1** | Push a **failure** up to a **partial success**. |
| **2** | Push a **partial** up to a **full success**. |
| **1** | **Assist a teammate.** Roll a d6 and add it to their total. |
| **3** | Downgrade a **critical fail** to a normal failure. |

Say what you do when you assist. The assist die only adds; it cannot make doubles.

### Spend on upgrades

| Upgrade         | Cost   |
| --------------- | ------ |
| Your first      | **5**  |
| Your second     | **10** |
| Your third      | **15** |
| Every one after | **20** |

- **+1 to a stat,** to a maximum of **+3**.
- **Another perk from your archetype.**

**Past your second upgrade, somebody else has to want it too.** No one can hold 15, so a third upgrade is a decision the table makes.

> [!danger] Luck never buys a mutation
> Mutations are earned by casting and paid for with your body.

## Zones

| Zone | What it means |
|---|---|
| **Close** | Melee. You can touch it. |
| **Near** | Across the room. One move to close. |
| **Far** | Two moves. Bowshot. |
| **Long** | Somewhere else. Getting there takes travel time. |

**One move shifts you one zone.**

## Damage and armor

**Weapons deal 1, 2, or 3.** Some characters add a stat on top: see [[Character Creation]].

**Armor subtracts, to a maximum of 3.** A **Legendary** is the only exception, at 5. See [[Monsters]].

### Armor breaks

**Match it and you are stopped cold.** Damage equal to your armor does nothing, and the armor is fine.

**Exceed it and the armor is destroyed.** It gives you nothing until it is repaired.

**Mending needs a smith who knows that style.** Pay in coin, or owe them a favour.

### Scars

**Fill your Harm and you take a Scar.** It claims your last slot, permanently, and whatever was in that slot is gone.

**Your Harm stays full.** You are still on your feet, but every hit that lands from here takes another slot.

**Only rest clears Harm.** Get out, or spend a ration.

## Combat

**The table goes first.** Players act, then everything else does, unless they walked into it, and then the other side moves first.

**Declare an action, then roll.**

### When monsters attack

The GM rolls for it: **2d6 + its Threat**, on the same ladder as everything else.

| Total | Result |
|---|---|
| **6 or less** | **It misses. You earn 1 Luck.** |
| **7 to 9** | It hits for its damage. |
| **10+** | It hits, and it costs you something more. |

**Doubles work the same for the other side.** Double 6s find your weak spot. Double 1s are its disaster, not yours.

**Enemies never earn Luck.**

Tiers, weaknesses and worked entries: [[Monsters]].

### A crowd rolls once

**Everything attacking the same target attacks together, on one roll.** Their damage is **the best single weapon among them**. Twenty goblins are still goblins.

### Morale

> [!quote] Very few things fight to the death when losing looks certain.

**Mark half its Harm, rounded up. When it drops past the mark, the GM rolls 2d6 + its Threat.**

| Total | Result |
|---|---|
| **6 or less** | **It breaks.** It flees, surrenders, or takes the bargain. |
| **7 to 9** | **It holds, but not like this.** It gives ground, calls for help, or goes for what it wants instead of you. |
| **10+** | **It holds.** |

**Roll once per fight.**

**Players never check.** Whether you run is always your decision.

**Mindless, driven or bound things never check.** See [[Monsters#Morale]].

## Recovery

- **Catch your breath.** Give up your action and spend 1 ration. Recover **1d6 Harm**, in a fight or out of one.
- **A night's sleep,** somewhere safe, with food. **All Harm back.**
- **Scars need a healer, or a `Heal` cast.** Rest never touches them.

**Rations bundle: 3 to a slot.** Carry more by spending more slots.

## Casting

> There is no spell list. Say what you want the Resonance to do, and pay for it.

**Casting bonus = your mutations, capped at +3.**

**Three steps, every time:**

1. **The caster says what they want:** how big, how far, how long, how hard.
2. **The GM prices it in Exposure** from the dials below.
3. **The caster rolls 2d6 + casting bonus, or dials it back.**

The price is always known before the dice.

**A failed cast costs nothing.** Exposure is paid only when the working lands.

### What your mutations buy

| Mutations | Casting bonus         | Most you may spend on one cast |     |
| --------- | --------------------- | ------------------------------ | --- |
| **0**     | +0                    | 1-3                            |     |
| **1**     | 1                     | 4                              |     |
| 2         | 2                     | 5                              |     |
| **3**     | **+3, and no higher** | 6                              |     |
| **4**     | +3                    | 7                              |     |
| 5         |                       | 8                              |     |
| 6         |                       | 9                              |     |
| **7+**    | +3                    | **10**                         |     |

**Past the third mutation you stop getting better and start getting bigger.**

> [!danger] The biggest magic eats you where you stand
> A 10-Exposure cast **is** 10 Exposure. You mutate the moment it lands. 
### Casting Exposure Cost

**Start at 1. Add for reach, duration, and force.**

The three Ds of casting
Distance, durations, and damage


| Distance: how much of the world it touch   |        |
| ------------------------------------------ | ------ |
| One person or thing, **Close** or **Near** | **+0** |
| A room, a handful of people, or **Far**    | **+1** |
| A building, a street, or **Long**          | **+2** |

| Duration: how long it stays        |        |
| ---------------------------------- | ------ |
| Instant, or it ends with the scene | **+0** |
| A few hours                        | **+1** |
| A day or more                      | **+2** |
| A year or more, or forever         | **+3** |

| Damage: how hard it lands                      |        |
| ---------------------------------------------- | ------ |
| It does no damage                              | **+0** |
| **1 damage.** A lash, a shove, a grasping hand | **+1** |
| **2 damage.** A wall of fire, a spear of ice   | **+2** |
| **3 damage.** The building comes down on them  | **+4** |

**The dials top out at exactly 10, which is exactly one mutation.** Three damage is the most a cast can do.

## Exposure and mutation

> [!danger] At 10 Exposure, you mutate
> - Roll on the [[mutation-tables|d66 mutation table]] and take what comes.
> - **A mutation claims your last slot, permanently,** and whatever was in it is gone.
> - **Your Exposure empties, and anything past 10 carries over.** Take 6 while sitting on 8 and you mutate, then start again at 4.

**You choose what sits in your last slot. You do not choose when it goes.**

**You never mutate twice at once.**

### Frayed

**Past three mutations you are visibly wrong. Past five you are hunted on sight.**

**Frayed changes the world, not the dice.** Doors close, prices climb, the Church is told. Nothing modifies a roll.

**Somebody in the party has to still be able to walk into a town.**

## Magic Items

Relics are the release valve: **an Attuner can move Exposure out of their body and into an object.** Other than a mutation, it is the only way Exposure comes down.

- **A relic takes a slot.**
- **A relic holds at most 5 charges.** Half a mutation.
- **Filling one takes an hour, undisturbed.** Forging and topping up alike.

Using, shaping and selling one: [[Magic Items]].
