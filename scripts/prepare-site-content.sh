#!/usr/bin/env bash

set -euo pipefail

content_dir="${1:?usage: prepare-site-content.sh OUTPUT_DIRECTORY}"

"$(dirname "$0")/check-content-format.sh"

rm -rf -- "$content_dir"
mkdir -p "$content_dir"

# Start Here is the website homepage. Its Obsidian name remains an alias so
# existing [[Start Here]] links resolve without changing the vault source.
awk '
  NR == 1 {
    print
    print "title: Start Here"
    print "aliases: [Start Here]"
    next
  }
  {
    sub(/The current design work is tracked in \[\[Open Questions\]\]\./, "")
    sub(/ Current design work is tracked in \[\[Open Questions\]\]\./, "")
    sub(/ For AI-assisted work on the vault, read \[\[AI Context\]\] first\./, "")
    print
  }
' \
  "Start Here.md" > "$content_dir/index.md"

cp "Core Rules.md" "Character Creation.md" "$content_dir/"

# Only reader-facing sections and their downloadable files enter the generated website.
for directory in files lore reference tables; do
  cp -R "$directory" "$content_dir/$directory"
done

find "$content_dir" -name ".DS_Store" -delete
