#!/usr/bin/env bash
set -euo pipefail

# Move to project root
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${script_dir%/scripts}"

# Colors for terminal output
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== User Query Logger ===${NC}\n"

# Ask for query type
echo "Query type:"
echo "  1) question  (質問)"
echo "  2) request   (依頼)"
echo "  3) explanation (説明)"
echo "  4) discussion (議論)"
read -rp "Choose (1-4): " query_type_choice

case "$query_type_choice" in
  1) query_type="Question" ;;
  2) query_type="Request" ;;
  3) query_type="Explanation" ;;
  4) query_type="Discussion" ;;
  *) echo "Invalid choice. Exiting."; exit 1 ;;
esac

# Get the query content
echo -e "\n${YELLOW}Enter your query/question/request (end with Ctrl+D):${NC}"
query_content=""
while IFS= read -r line; do
  query_content="${query_content}${line}"$'\n'
done

# Remove trailing newline
query_content="${query_content%$'\n'}"

if [ -z "$query_content" ]; then
  echo "Query is empty. Exiting."
  exit 1
fi

# Optional context
echo -e "\n${YELLOW}Additional context? (optional, press Enter to skip):${NC}"
read -rp "> " context

# Get timestamp and branch
timestamp="$(date '+%Y-%m-%d %H:%M:%S')"
branch="$(git rev-parse --abbrev-ref HEAD)"

# Prepare the log entry
cat >> CHAT_HISTORY.md << EOF

---
## User Query Log
**Type:** $query_type  
**Date:** $timestamp  
**Branch:** $branch  

### Query:
$query_content

EOF

if [ -n "$context" ]; then
  cat >> CHAT_HISTORY.md << EOF
### Context:
$context

EOF
fi

# Try to fetch and pull before committing
if git rev-parse --verify --quiet "origin/$branch" >/dev/null 2>&1; then
  echo -e "${BLUE}Fetching latest changes...${NC}"
  git fetch origin "$branch" >/dev/null 2>&1 || true
  git pull --rebase --autostash origin "$branch" || true
fi

# Commit and push
git add CHAT_HISTORY.md
git commit -m "Log user query: $query_type at $timestamp"

if git rev-parse --abbrev-ref --symbolic-full-name @{u} >/dev/null 2>&1; then
  git push
else
  git push --set-upstream origin "$branch"
fi

echo -e "\n${GREEN}✓ Query logged and pushed to GitHub${NC}"
