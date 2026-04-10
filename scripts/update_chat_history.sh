#!/usr/bin/env bash
set -e
if [ $# -eq 0 ]; then
  echo "Usage: $0 'Summary of the conversation or decision'"
  exit 1
fi
summary="$1"
cat >> CHAT_HISTORY.md <<MSG

## Manual chat update
- Summary: $summary
- Date: $(date '+%Y-%m-%d %H:%M:%S')
MSG
git add CHAT_HISTORY.md
git commit -m "Update chat history: $summary"
git push
