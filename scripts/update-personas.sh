#!/usr/bin/env bash
# update-personas.sh – post-install/update hook for roo-persona-pack
# Usage: bash ./scripts/update-personas.sh [--add-diff-attr]

set -euo pipefail   # fail fast, catch undefined vars :contentReference[oaicite:3]{index=3}

ADD_DIFF=0
for arg in "$@"; do
  case "$arg" in
    --add-diff-attr) ADD_DIFF=1 ;;
    *) echo "Unknown option: $arg" >&2; exit 1 ;;
  esac
done

if (( ADD_DIFF )); then
  ATTR='/.roo-personas/* -diff'               # ignore diffs for persona files
  touch .gitattributes                        # create if missing
  # add the rule only once (idempotent) :contentReference[oaicite:4]{index=4}
  grep -qxF "$ATTR" .gitattributes || echo "$ATTR" >> .gitattributes
fi

echo "✅ roo-persona-pack synced successfully."