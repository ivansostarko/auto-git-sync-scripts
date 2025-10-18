#!/bin/bash
set -euo pipefail

# --- Settings ---
REPO_DIR="/www/docker/confi/docker-test"
BRANCH="main"
LOG_FILE="/home/tester/update_repo.log"

# Go to repo
cd "$REPO_DIR" || exit 1

# Fetch latest, hard reset to remote branch, then pull
git fetch --all
git reset --hard "origin/${BRANCH}"
git pull origin "${BRANCH}"

# Log success
echo "$(date '+%Y-%m-%d %H:%M:%S') - Repository fast-synced to origin/${BRANCH}." >> "$LOG_FILE"
