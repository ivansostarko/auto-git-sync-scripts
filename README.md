# Auto Git Sync Scripts

This repository contains two automated scripts designed to simplify daily 
repository maintenance by automatically **pulling remote changes** and 
**committing & pushing local changes** on a fixed schedule using `cron`.

---

## 📌 Overview

| Script | Purpose | Execution Time | Location |
|--------|----------|----------------|-----------|
| `update_repo.sh` | Pulls the latest code from the remote repository | Every day at **23:00 (11 PM)** | `/home/tester/update_repo.sh` |
| `commit_repo.sh` | Stages, commits, and pushes **local changes** to the remote repository | Every day at **12:00 (noon)** | `/home/tester/commit_repo.sh` |


---

## 🔧 Script Details

### `update_repo.sh` (Remote → Local)

This script:
1. Goes to the repo directory
2. Fetches latest changes from origin
3. Resets local branch to remote `main`
4. Pulls latest version
5. Logs timestamp of update

Short code snippet:
```bash
cd /www/docker/confi/docker-test
git fetch --all
git reset --hard origin/main
git pull
```

---

### `commit_repo.sh` (Local → Remote)

This script:
1. Checks for uncommitted changes
2. If changes exist → commits them automatically with timestamp
3. Pushes to the `main` branch
4. Logs the action

Short code snippet:
```bash
git add --all
git commit -m "Automated backup"
git push origin main
```

---

## ⏲ Cron Scheduling

| Script | Cron Entry | Schedule |
|-------|-------------|----------|
| `update_repo.sh` | `0 23 * * * /home/tester/update_repo.sh >/dev/null 2>&1` | 23:00 daily |
| `commit_repo.sh` | `0 12 * * * /home/tester/commit_repo.sh >/dev/null 2>&1` | 12:00 daily |

To edit your cron table:
```bash
crontab -e
```

---

## 📁 Repository Structure Example

```
auto-git-sync-scripts/
│
├── update_repo.sh
├── commit_repo.sh
└── README.md
```

---

## 🔒 Requirements

- Git installed
- SSH key configured for GitHub/Git remote
- Proper file permissions (`chmod +755`)
- Correct repo path in both scripts
- `main` branch exists on origin

---


## License

Free to use and modify. No attribution required.
