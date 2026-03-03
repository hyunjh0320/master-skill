#!/bin/bash
set -euo pipefail

# Master Skill Auto-Sync Script
# Called by Claude Code SessionStart hook
# Automatically syncs skills from GitHub to ~/.claude/skills/

REPO_URL="${MASTER_SKILL_REPO:-https://github.com/${GITHUB_USER:-}/master-skill.git}"
CACHE_DIR="$HOME/.claude/.master-skill-cache"
TARGET_DIR="$HOME/.claude/skills"

# Skip if no repo URL configured
if [ -z "${GITHUB_USER:-}" ] && [ -z "${MASTER_SKILL_REPO:-}" ]; then
  echo "MASTER_SKILL_REPO or GITHUB_USER not set. Skipping skill sync."
  exit 0
fi

mkdir -p "$TARGET_DIR"

# Clone or pull the repo
if [ -d "$CACHE_DIR/.git" ]; then
  cd "$CACHE_DIR"
  git pull --quiet origin main 2>/dev/null || true
else
  git clone --quiet "$REPO_URL" "$CACHE_DIR" 2>/dev/null || {
    echo "Failed to clone master-skill repo. Skipping sync."
    exit 0
  }
fi

# Run install
if [ -f "$CACHE_DIR/install.sh" ]; then
  bash "$CACHE_DIR/install.sh"
fi
