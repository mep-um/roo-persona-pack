#!/usr/bin/env bash
# update-personas.sh  –  Sync roo-persona-pack into the current project.
#  Features
#   • Downloads the latest tarball (branch main)   • Skips LICENSE and README*
#   • Merges .roomodes so that UPSTREAM WINS       • Removes stale pack files only
#   • Tracks its own footprint in .roo-persona-pack.manifest
#   • Adds diff-ignore lines to .gitattributes once:
#    /.roo/rules-rpp-*            -diff
#    /.roo-persona-pack.manifest  -diff


set -euo pipefail

echo "Starting persona pack update..."
PACK_URL=${PACK_URL:-"https://github.com/mep-um/roo-persona-pack/archive/refs/heads/main.tar.gz"}
TMP_DIR=$(mktemp -d ".tmp_roo_pack.XXXX")   # unique temp dir  (mktemp -d)
MANIFEST=".roo-persona-pack.manifest"
ATTR_RULES='/.roo/rules-rpp-* -diff'
ATTR_MANIFEST='/.roo-persona-pack.manifest -diff'

# Download & untar into $TMP_DIR
echo "Downloading and extracting persona pack from $PACK_URL..."
curl -Ls "$PACK_URL" | tar -xz --strip-components=1 \
                               --exclude='*/LICENSE' \
                               --exclude='*/README*' \
                               -C "$TMP_DIR"      # strip top dir (tar)

echo "Merging .roomodes..."
# Merge .roomodes (upstream wins)
if [[ -f .roomodes ]]; then                     # test for file
  jq -s '.[1] + .[0] | unique_by(.slug)' \
        "$TMP_DIR/.roomodes" .roomodes \
      > "$TMP_DIR/.roomodes.merged"            # unique_by keeps first dup (docs)
  mv "$TMP_DIR/.roomodes.merged" .roomodes     # same-FS mv is atomic
else
  mv "$TMP_DIR/.roomodes" .roomodes
fi

echo "Pruning stale pack files..."
# Prune pack files that vanished upstream
NEW_MANIFEST="$TMP_DIR/$MANIFEST"
if [[ -f $MANIFEST ]]; then
  # delete paths present in OLD manifest but absent in NEW
  grep -Fxvf "$NEW_MANIFEST" "$MANIFEST" | xargs -r rm -rf   # grep diff trick
fi

echo "Syncing files with rsync..."
# rsync : copy + delete only pack files
rsync -a --delete \
      --include-from="$NEW_MANIFEST" \
      --exclude='*' \
      "$TMP_DIR"/ ./                                 # include/exclude pattern

echo "Saving new manifest and updating .gitattributes..."
# Save fresh manifest & add diff rule
mv "$NEW_MANIFEST" "$MANIFEST"
touch .gitattributes
grep -qxF "$ATTR_RULES"    .gitattributes || echo "$ATTR_RULES"    >> .gitattributes
grep -qxF "$ATTR_MANIFEST" .gitattributes || echo "$ATTR_MANIFEST" >> .gitattributes
echo "Cleaning up temporary directory..."

rm -rf "$TMP_DIR"
echo "roo-persona-pack synced (upstream wins, custom files preserved)."
