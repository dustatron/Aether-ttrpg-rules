#!/usr/bin/env bash

set -euo pipefail

bestiary="reference/Bestiary.md"

check_count() {
  local expected="$1"
  local pattern="$2"
  local label="$3"
  local actual

  actual="$(grep -Ec "$pattern" "$bestiary" || true)"
  if [[ "$actual" != "$expected" ]]; then
    echo "Bestiary format error: expected $expected $label lines, found $actual." >&2
    exit 1
  fi
}

check_count 6 '^## .+, Tier [1-6] .+$' 'monster heading'
check_count 6 '^\*\*Threat:\*\* [-+0-9]+ \*\*Damage:\*\* [0-9]+ \*\*Harm:\*\* [0-9]+ \*\*Armor:\*\* [0-9]+$' 'stat'
check_count 6 '^- \*\*Attacks:\*\* ' 'Attacks'
check_count 1 '^- \*\*Casts:\*\* ' 'Casts'
check_count 6 '^- \*\*Weakness:\*\* ' 'Weakness'
check_count 6 '^- \*\*Desire:\*\* ' 'Desire'

if grep -En '^.*\*\*Attacks:\*\*.*\*\*(Weakness|Desire):\*\*' "$bestiary"; then
  echo 'Bestiary format error: Attacks, Weakness, and Desire must be separate bullets.' >&2
  exit 1
fi

echo 'Bestiary format: ok'
