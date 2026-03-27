#!/usr/bin/env bash
#
# Install or uninstall the git-workflow skill for Claude Code (macOS).
# Creates a symlink so the skill stays in sync with the repo.
#
# Usage:
#   ./scripts/install_macos.sh              # Install
#   ./scripts/install_macos.sh --uninstall  # Uninstall

set -euo pipefail

SKILL_DIR="$HOME/.claude/skills/git-workflow"
SKILL_FILE="$SKILL_DIR/SKILL.md"
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SOURCE="$REPO_ROOT/SKILL.md"

info()  { printf "  \033[34mℹ\033[0m %s\n" "$1"; }
pass()  { printf "  \033[32m✓\033[0m %s\n" "$1"; }
fail()  { printf "  \033[31m✗\033[0m %s\n" "$1"; }

# macOS readlink does not support -f; resolve symlink manually
resolve_link() {
  local target="$1"
  while [[ -L "$target" ]]; do
    local dir="$(cd "$(dirname "$target")" && pwd)"
    target="$(readlink "$target")"
    [[ "$target" != /* ]] && target="$dir/$target"
  done
  echo "$(cd "$(dirname "$target")" && pwd)/$(basename "$target")"
}

uninstall() {
  if [[ -L "$SKILL_FILE" ]]; then
    rm "$SKILL_FILE"
    pass "Removed symlink: $SKILL_FILE"
    # Remove directory if empty
    rmdir "$SKILL_DIR" 2>/dev/null && info "Removed empty directory: $SKILL_DIR" || true
  elif [[ -f "$SKILL_FILE" ]]; then
    fail "$SKILL_FILE exists but is not a symlink — remove it manually to avoid data loss"
    exit 1
  else
    info "Nothing to uninstall — $SKILL_FILE does not exist"
  fi
  exit 0
}

install() {
  # Verify source exists
  if [[ ! -f "$SOURCE" ]]; then
    fail "SKILL.md not found at $SOURCE"
    exit 1
  fi

  # Check if already installed
  if [[ -L "$SKILL_FILE" ]]; then
    current_target="$(resolve_link "$SKILL_FILE")"
    if [[ "$current_target" == "$SOURCE" ]]; then
      pass "Already installed (symlink points to $SOURCE)"
      exit 0
    else
      info "Existing symlink points to $current_target — replacing"
      rm "$SKILL_FILE"
    fi
  elif [[ -f "$SKILL_FILE" ]]; then
    fail "$SKILL_FILE exists but is not a symlink — remove it manually before installing"
    exit 1
  fi

  # Create directory and symlink
  mkdir -p "$SKILL_DIR"
  ln -s "$SOURCE" "$SKILL_FILE"
  pass "Installed: $SKILL_FILE → $SOURCE"
  info "The skill will stay in sync with this repo. Restart Claude Code to activate."
}

# --- Main ---
case "${1:-}" in
  --uninstall) uninstall ;;
  "")          install ;;
  *)
    echo "Usage: $0 [--uninstall]"
    exit 1
    ;;
esac
