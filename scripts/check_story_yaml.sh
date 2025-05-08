#!/usr/bin/env bash
fail=0
grep -R --include="*.md" -n "reviewChecklist:" stories | \
while read -r file; do
  pending=$(yq '.reviewChecklist | with_entries(select(.value == "pending")) | length' "$file")
  [ "$pending" -eq 0 ] || { echo "❌ pending reviews in $file"; fail=1; }
done
exit $fail
