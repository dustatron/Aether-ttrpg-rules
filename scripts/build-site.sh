#!/usr/bin/env bash

set -euo pipefail

temp_root="${RUNNER_TEMP:-${TMPDIR:-/tmp}}"
content_dir="$temp_root/aether-ttrpg-quartz-content"

"$(dirname "$0")/prepare-site-content.sh" "$content_dir"
npm run quartz -- build -d "$content_dir" "$@"
