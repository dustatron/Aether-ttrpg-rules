#!/usr/bin/env bash

set -euo pipefail

temp_root="${RUNNER_TEMP:-${TMPDIR:-/tmp}}"
content_dir="$temp_root/aether-ttrpg-quartz-content"
site_dir="$(cd "$(dirname "$0")/.." && pwd)"

"$site_dir/scripts/prepare-site-content.sh" "$content_dir"
cd "$site_dir"
npm run quartz -- build -d "$content_dir" "$@"
