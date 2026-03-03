#!/bin/bash
set -euo pipefail

# Master Skill Uninstaller for Claude Code
# Removes all Master Skills from ~/.claude/skills/

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

echo "=== Master Skill Uninstaller ==="
echo ""

read -p "Remove all Master Skills from $TARGET_DIR? (y/N): " confirm
if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
  echo "Cancelled."
  exit 0
fi

removed=0
for skill in "${SKILLS[@]}"; do
  dest="$TARGET_DIR/$skill"
  if [ -d "$dest" ]; then
    rm -rf "$dest"
    echo "  [DEL] $skill"
    ((removed++))
  fi
done

echo ""
echo "Removed $removed skills."
