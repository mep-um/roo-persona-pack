#!/usr/bin/env bash
# update-personas.sh – Sync roo-persona-pack into the current repo.
#   • Upstream JSON wins
#   • Manifest is rebuilt on-the-fly (no manual edits)
#   • Removes only stale pack files
#   • Diff noise suppressed (.roo/rules-rpp-* + manifest)

set -euo pipefail

echo "Starting persona pack update..."
PACK_URL="https://github.com/mep-um/roo-persona-pack/archive/refs/heads/main.tar.gz"
TMP_DIR=$(mktemp -d ".tmp_roo_pack.XXXX")              # temp workspace
MANIFEST=".roo-persona-pack.manifest"
ATTR_RULES='/.roo/rules-rpp-* -diff'
ATTR_MANIFEST='/.roo-persona-pack.manifest -diff'


# Download + extract pack ➜ $TMP_DIR
echo "Downloading and extracting pack from $PACK_URL to $TMP_DIR..."
curl -Ls "$PACK_URL" |
  tar -xz --strip-components=1 \
          --exclude='*/LICENSE' --exclude='*/README*' \
          -C "$TMP_DIR"

# Build NEW manifest (all extracted paths)
echo "Building new manifest in $TMP_DIR/$MANIFEST..."
(
  cd "$TMP_DIR"
  find . -mindepth 1 -print | sed 's|^\./||'
) > "$TMP_DIR/$MANIFEST"            # every file/dir relative to repo root

# Merge .roomodes so UPSTREAM WINS
echo "Merging .roomodes..."
if [[ -f .roomodes ]]; then
  jq -s '.[1] + .[0] | unique_by(.slug)' \
     "$TMP_DIR/.roomodes" .roomodes > "$TMP_DIR/.merged"
  mv "$TMP_DIR/.merged" .roomodes
else
  mv "$TMP_DIR/.roomodes" .roomodes
fi

# Copy pack files into project root
echo "Copying pack files from $TMP_DIR to project root..."
rsync -a "$TMP_DIR"/ ./             # namespacing prevents collisions

# Remove stale pack files (old − new)
echo "Removing stale pack files..."
if [[ -f $MANIFEST ]]; then
  comm -23 <(sort "$MANIFEST") <(sort "$TMP_DIR/$MANIFEST") | xargs -r rm -rf
fi

# Save fresh manifest & update attrs
echo "Saving new manifest to $MANIFEST and updating .gitattributes..."
mv "$TMP_DIR/$MANIFEST" "$MANIFEST"

touch .gitattributes
grep -qxF "$ATTR_RULES"    .gitattributes || echo "$ATTR_RULES"    >> .gitattributes
grep -qxF "$ATTR_MANIFEST" .gitattributes || echo "$ATTR_MANIFEST" >> .gitattributes

echo "Saving new manifest to $MANIFEST and updating .gitattributes..."
rm -rf "$TMP_DIR"
echo "✅ roo-persona-pack synced (manifest rebuilt, upstream wins)."
