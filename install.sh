#!/bin/bash
set -euo pipefail

# Master Skill Installer for Claude Code
# Installs all skills to ~/.claude/skills/ for global availability

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="$HOME/.claude/skills"

SKILLS=(
  "code-review"
  "debug"
  "doc-gen"
  "explain"
  "explore-project"
  "git-workflow"
  "perf-check"
  "refactor"
  "security-review"
  "session-start-hook"
  "test-gen"
)

echo "=== Master Skill Installer ==="
echo "Source: $SCRIPT_DIR"
echo "Target: $TARGET_DIR"
echo ""

mkdir -p "$TARGET_DIR"

installed=0
updated=0
skipped=0

for skill in "${SKILLS[@]}"; do
  src="$SCRIPT_DIR/$skill/SKILL.md"
  dest_dir="$TARGET_DIR/$skill"
  dest="$dest_dir/SKILL.md"

  if [ ! -f "$src" ]; then
    echo "  [SKIP] $skill - source not found"
    ((skipped++))
    continue
  fi

  mkdir -p "$dest_dir"

  if [ -f "$dest" ]; then
    if diff -q "$src" "$dest" > /dev/null 2>&1; then
      echo "  [OK]   $skill - already up to date"
      ((skipped++))
    else
      cp "$src" "$dest"
      echo "  [UPD]  $skill - updated"
      ((updated++))
    fi
  else
    cp "$src" "$dest"
    echo "  [NEW]  $skill - installed"
    ((installed++))
  fi
done

echo ""
echo "=== Done ==="
echo "  New: $installed | Updated: $updated | Unchanged: $skipped"
echo ""
echo "Skills are now available in all Claude Code sessions."
echo "Use /skill-name to invoke (e.g., /code-review, /debug, /explain)"
