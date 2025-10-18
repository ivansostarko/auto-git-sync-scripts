#!/bin/bash
set -euo pipefail

# --- Settings ---
REPO_DIR="/mnt/github-ivan/auto-git-sync-scripts"
BRANCH="main"
LOG_FILE="/home/auto-git-sync-scripts/update_repo.log"

# Optional: ensure Git identity is set (uncomment & edit if needed)
# git -C "$REPO_DIR" config user.name  "Your Name"
# git -C "$REPO_DIR" config user.email "you@example.com"

cd "$REPO_DIR" || exit 1

# Exit early if nothing changed
if [ -z "$(git status --porcelain)" ]; then
  echo "$(date '+%Y-%m-%d %H:%M:%S') - No changes to commit." >> "$LOG_FILE"
  exit 0
fi

# Stage all changes
git add --all

# Commit with timestamp message
COMMIT_MSG="Automated backup: $(date '+%Y-%m-%d %H:%M:%S')"
git commit -m "$COMMIT_MSG"

# Push to origin
git push origin "${BRANCH}"

# Log success
echo "$(date '+%Y-%m-%d %H:%M:%S') - Changes committed & pushed to ${BRANCH}." >> "$LOG_FILE"
