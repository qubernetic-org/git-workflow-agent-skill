#!/usr/bin/env bash
#
# Lint SKILL.md for structural consistency.
# Usage: ./scripts/lint.sh [path/to/SKILL.md]
#
# Exit codes: 0 = all checks pass, 1 = one or more checks failed

set -euo pipefail

SKILL="${1:-SKILL.md}"
errors=0

pass() { printf "  \033[32m✓\033[0m %s\n" "$1"; }
fail() { printf "  \033[31m✗\033[0m %s\n" "$1"; errors=$((errors + 1)); }

echo "Linting $SKILL"
echo

# --- 1. File exists ---
if [[ ! -f "$SKILL" ]]; then
  fail "File not found: $SKILL"
  exit 1
fi

# --- 2. YAML frontmatter presence ---
if head -1 "$SKILL" | grep -q '^---$'; then
  pass "YAML frontmatter opening delimiter"
else
  fail "Missing YAML frontmatter opening '---'"
fi

frontmatter_end=$(awk 'NR>1 && /^---$/ { print NR; exit }' "$SKILL")
if [[ -n "$frontmatter_end" ]]; then
  pass "YAML frontmatter closing delimiter (line $frontmatter_end)"
else
  fail "Missing YAML frontmatter closing '---'"
fi

# --- 3. Required frontmatter fields ---
frontmatter=$(sed -n "2,$((frontmatter_end - 1))p" "$SKILL")

for field in name description version license; do
  if echo "$frontmatter" | grep -qE "^${field}:"; then
    pass "Frontmatter field: $field"
  else
    fail "Missing frontmatter field: $field"
  fi
done

if echo "$frontmatter" | grep -qE "^  version:"; then
  pass "Frontmatter field: metadata.version"
else
  fail "Missing frontmatter field: metadata.version"
fi

# --- 4. Version consistency ---
top_version=$(echo "$frontmatter" | grep -E '^version:' | head -1 | awk '{print $2}')
meta_version=$(echo "$frontmatter" | grep -E '^  version:' | head -1 | awk '{print $2}')

if [[ "$top_version" == "$meta_version" ]]; then
  pass "Version consistency: frontmatter ($top_version) = metadata ($meta_version)"
else
  fail "Version mismatch: frontmatter ($top_version) != metadata ($meta_version)"
fi

# --- 5. README badge version (if README exists) ---
if [[ -f "README.md" ]]; then
  badge_version=$(grep -oP 'version-\K[0-9]+\.[0-9]+\.[0-9]+' README.md | head -1)
  if [[ "$badge_version" == "$top_version" ]]; then
    pass "README badge version ($badge_version) matches SKILL.md ($top_version)"
  else
    fail "README badge version ($badge_version) != SKILL.md ($top_version)"
  fi
fi

# --- 6. CHANGELOG version (if CHANGELOG exists) ---
if [[ -f "CHANGELOG.md" ]]; then
  changelog_version=$(grep -oP '## \[\K[0-9]+\.[0-9]+\.[0-9]+' CHANGELOG.md | head -1)
  if [[ "$changelog_version" == "$top_version" ]]; then
    pass "CHANGELOG latest version ($changelog_version) matches SKILL.md ($top_version)"
  else
    fail "CHANGELOG latest version ($changelog_version) != SKILL.md ($top_version)"
  fi
fi

# --- 7. Trailing whitespace ---
trailing=$(grep -nE ' +$' "$SKILL" | head -5 || true)
if [[ -z "$trailing" ]]; then
  pass "No trailing whitespace"
else
  fail "Trailing whitespace found:"
  echo "$trailing" | sed 's/^/        /'
fi

# --- 8. Section heading hierarchy (no skipped levels) ---
prev_level=0
heading_ok=true
while IFS= read -r line; do
  level=$(echo "$line" | grep -oE '^#{1,6}' | wc -c)
  level=$((level - 1))
  if [[ $prev_level -gt 0 && $level -gt $((prev_level + 1)) ]]; then
    fail "Heading level skipped: '$line' (h$level after h$prev_level)"
    heading_ok=false
  fi
  prev_level=$level
done < <(grep -E '^#{1,6} ' "$SKILL")

if $heading_ok; then
  pass "Heading hierarchy is consistent (no skipped levels)"
fi

# --- Summary ---
echo
if [[ $errors -eq 0 ]]; then
  printf "\033[32mAll checks passed.\033[0m\n"
else
  printf "\033[31m%d check(s) failed.\033[0m\n" "$errors"
fi

exit $((errors > 0 ? 1 : 0))
