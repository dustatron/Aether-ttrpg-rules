#!/usr/bin/env bash

set -euo pipefail

bestiary="$(awk '/^## / { in_bestiary = ($0 == "## Bestiary Selection") } in_bestiary' Rules/Monsters.md)"

check_count() {
  local expected="$1"
  local pattern="$2"
  local label="$3"
  local actual

  actual="$(grep -Ec "$pattern" <<< "$bestiary" || true)"
  if [[ "$actual" != "$expected" ]]; then
    echo "Bestiary format error: expected $expected $label lines, found $actual." >&2
    exit 1
  fi
}

check_count 6 '^### (Tier [1-6], )?.+, .+$' 'monster heading'
check_count 6 '^#### Tier [1-6][[:space:]]*$' 'tier heading'
check_count 6 '^\*\*Threat:\*\* [-+0-9]+ \| \*\*Damage:\*\* [0-9]+ \| \*\*Health:\*\* [0-9]+ \| \*\*Armor:\*\* [0-9]+$' 'stat'
check_count 6 '^- \*\*Attacks:\*\* ' 'Attacks'
check_count 1 '^- \*\*Casts:\*\* ' 'Casts'
check_count 6 '^- \*\*Desire:\*\* ' 'Desire'

if ! awk '
  function missing_weakness() { return mythic && weaknesses != 1 }
  /^### / { if (missing_weakness()) failed = 1; mythic = weaknesses = 0 }
  /^#### Tier 6[[:space:]]*$/ { mythic = 1 }
  /^- \*\*Weakness:\*\* [^[:space:]]/ { weaknesses++ }
  END { exit (failed || missing_weakness()) }
' <<< "$bestiary"; then
  echo 'Bestiary format error: each Mythic needs one Weakness bullet.' >&2
  exit 1
fi

if grep -En '^.*\*\*Attacks:\*\*.*\*\*(Weakness|Desire):\*\*' <<< "$bestiary"; then
  echo 'Bestiary format error: Attacks, Weakness, and Desire must be separate bullets.' >&2
  exit 1
fi

echo 'Bestiary format: ok'
