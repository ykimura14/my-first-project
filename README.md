# my-first-project

This repository is a sample project shared across 3 computers.

## Usage
1. Open this folder in VS Code.
2. Edit files locally.
3. `git add .`
4. `git commit -m "your message"`
5. `git push`

## Share workflow
- PC A: make changes and `git push`
- PC B/C: run `git pull` to get the latest updates.

## Example file
- `hello.txt` is included as a sample file to verify the shared workflow.

## Chat history sharing
- Copilot chat history does not sync automatically across PCs.
- Use `CHAT_HISTORY.md` to record important decisions and share them via Git.
- Use the helper script to update and push in one command:

```bash
./scripts/update_chat_history.sh "Summary of the conversation"
```

- Optionally add details with a second argument:

```bash
./scripts/update_chat_history.sh "Decision summary" "Details for the team"
```
