#!/usr/bin/env bash
set -euo pipefail

# Move to project root
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${script_dir%/scripts}"

if [ $# -gt 0 ]; then
  summary="$1"
else
  read -rp 'Enter a short summary for this chat update: ' summary
fi

if [ -z "$summary" ]; then
  echo 'Error: summary is required.'
  exit 1
fi

auto_details=""
if [ $# -gt 1 ]; then
  auto_details="$2"
fi

branch="$(git rev-parse --abbrev-ref HEAD)"
remote="origin"

if git rev-parse --verify --quiet "$remote/$branch" >/dev/null; then
  echo "Fetching latest changes from $remote/$branch..."
  git fetch "$remote" "$branch" >/dev/null 2>&1 || true
  echo "Rebasing local branch onto remote..."
  git pull --rebase --autostash "$remote" "$branch" || true
fi

timestamp="$(date '+%Y-%m-%d %H:%M:%S')"
printf '\n## Chat history update\n- Summary: %s\n- Date: %s\n- Branch: %s\n' "$summary" "$timestamp" "$branch" >> CHAT_HISTORY.md
if [ -n "$auto_detailsif [ -n "$auto_detailsif [ -n "$auto_detailsif [ -n "$auto_detailsif [ -n "
###################ep################cha################add CHA###################ep################cha###############"
ifififififififififififififit; tififi echo 'No changesififcommit.'
else
  git commit -m "$commit_msg"
fi

if git rev-parse --abbrev-ref --symbolic-full-name @{u} >/dev/null 2>&1; then
  git push
else
  git push --set-upstream "$remote" "$branch"
fi

echo 'Chat history updated and pushed.'
