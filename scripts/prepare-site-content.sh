#!/usr/bin/env bash

set -euo pipefail

content_dir="${1:?usage: prepare-site-content.sh OUTPUT_DIRECTORY}"

rm -rf -- "$content_dir"
mkdir -p "$content_dir"

# Start Here is the website homepage. Its Obsidian name remains an alias so
# existing [[Start Here]] links resolve without changing the vault source.
awk 'NR == 1 { print; print "title: The Arcane Aether"; print "aliases: [Start Here]"; next } { print }' \
  "Start Here.md" > "$content_dir/index.md"

# These notes are linked from the homepage and remain useful to readers.
cp "Open Questions.md" "$content_dir/Open Questions.md"
cp "AI Context.md" "$content_dir/AI Context.md"

# Only reader-facing sections enter the generated website.
for directory in lore rules tables; do
  cp -R "$directory" "$content_dir/$directory"
done

find "$content_dir" -name ".DS_Store" -delete
