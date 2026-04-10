# my-first-project

このリポジトリは、3台のパソコンで同じ作業を共有するためのサンプルプロジェクトです。

## 使い方
1. VS Code でこのフォルダを開く
2. ファイルを編集する
3. `git add .`
4. `git commit -m "変更内容"`
5. `git push`

## 3台の PC で共有する手順
- PC A: 作業して `git push`
- PC B/C: `git pull` で最新を取得

## 例ファイル
- `hello.txt` を作りました。これを各 PC で確認してください。

## 会話履歴の共有
- Copilot のチャット履歴は自動では同期されません。
- 重要な決定は `CHAT_HISTORY.md` に記録し、`git push` で共有してください。
- 追記するには、`./scripts/update_chat_history.sh "summary"` を使います。
