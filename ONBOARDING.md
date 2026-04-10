# 🚀 my-first-project セットアップガイド

このガイドは、新しいPCで `my-first-project` を共有・同期するためのオンボーディング手順です。

---

## 📋 事前要件（最初に1回だけ）

新しいPCで以下をインストール（未インストールの場合）：

### 1. Git のインストール
```bash
# macOS
brew install git

# Windows
# https://git-scm.com/download/win からダウンロード

# Linux (Ubuntu/Debian)
sudo apt install git
```

### 2. GitHub CLI のインストール（推奨）
```bash
# macOS
brew install gh

# Windows
# https://github.com/cli/cli/releases からダウンロード

# Linux (Ubuntu/Debian)
sudo apt install gh
```

### 3. VS Code のインストール
https://code.visualstudio.com/

インストール後、Copilot 拡張機能をインストール：
- VS Code を開く
- サイドバーの拡張機能アイコンをクリック
- "GitHub Copilot" を検索してインストール
- GitHub アカウントで認証

---

## 🔧 セットアップ手順

### ステップ 1. リポジトリをクローン

ターミナルを開いて：

```bash
cd ~
git clone https://github.com/ykimura14/my-first-project.git
cd my-first-project
```

### ステップ 2. GitHub 認証（初回のみ）

```bash
gh auth login
# プロンプトに従い、GitHub にサインイン
```

### ステップ 3. プロジェクトをVS Codeで開く

```bash
code .
```

---

## 📚 プロジェクトの構成

```
my-first-project/
├── README.md                    # プロジェクト概要
├── CHAT_HISTORY.md              # 全員の質問・依頼・説明の時系列ログ
├── SETUP.md                     # 共有ワークフロー説明
├── hello.txt                    # サンプルファイル
├── ONBOARDING.md               # このファイル
├── scripts/
│   ├── update_chat_history.sh   # 会話サマリー記録スクリプト
│   └── log_user_query.sh        # 質問・依頼・説明をログするスクリプト
└── .git/                        # Git 管理ファイル（自動）
```

---

## 💬 使い方

### A. これまでの質問・依頼・説明を確認

```bash
cat CHAT_HISTORY.md
```

または VS Code で開いて確認。タイムスタンプ付きで全員のやり取りが記録されています。

### B. あなたの質問・依頼・説明を記録

当プロジェクトでは、ユーザーからの投げかけをすべて記録して、他のPCと共有する仕組みがあります。

**スクリプトで記録：**

```bash
./scripts/log_user_query.sh
```

このコマンドで：
1. 質問 / 依頼 / 説明 / 議論 のいずれかを選択
2. あなたのテキストを入力（複数行OK）
3. 任意でコンテキストを追記
4. 自動で `CHAT_HISTORY.md` に追記、GitHub にプッシュ

他のPCの人も `git pull` したら即座に共有されます。

### C. 会話サマリーを記録

特定の会話をまとめて記録したい場合：

```bash
./scripts/update_chat_history.sh "今日は環境セットアップを完了した"
```

詳細付き：

```bash
./scripts/update_chat_history.sh "環境セットアップ完了" "Node.jsとnpmのバージョン確認済み"
```

### D. 他のPCの変更を同期

```bash
git pull
cat CHAT_HISTORY.md
```

---

## 🔄 複数PC間の同期ワークフロー

1. **他のPCで質問・変更があった**
   ```bash
   git pull
   cat CHAT_HISTORY.md  # 最新のログを確認
   ```

2. **あなたが何か記録したい**
   ```bash
   ./scripts/log_user_query.sh
   # または
   ./scripts/update_chat_history.sh "サマリー"
   ```

3. **全員で自動同期**
   - スクリプトが自動で commit & push
   - 他のPC は `git pull` で最新状態に

---

## ❓ よくある質問

**Q. VS Code を立ち上げたら何をしたらいい？**

A. フォルダを開いて、Copilot Chat を立ち上げ（左サイドバーのCopilotアイコン）、このガイドの内容を Copilot に伝えれば、あとは指示に従うだけです。

**Q. スクリプトが動かない**

A. 以下を実行：
```bash
chmod +x scripts/*.sh
```

**Q. Git push/pull がうまくいかない**

A. GitHub 認証を確認：
```bash
gh auth status
```

認証が無い場合：
```bash
gh auth login
```

**Q. CHAT_HISTORY.md が更新されていない**

A. 他のPCで記録した場合、このPC でその情報を見るには：
```bash
git pull
```

**Q. 古い会話を見たい**

A. `CHAT_HISTORY.md` の全文を確認：
```bash
cat CHAT_HISTORY.md
```

VS Code で grep や Ctrl+F で検索することもできます。

---

## 🎯 次のステップ

1. ✅ このガイドを読む
2. ✅ `git clone` してセットアップ
3. ✅ `cat CHAT_HISTORY.md` で共有履歴を確認
4. ✅ `./scripts/log_user_query.sh` で質問を記録
5. ✅ `git pull` で他のPC の最新情報を受け取る

---

## 📞 サポート

このガイドがわからない部分があれば、VS Code の Copilot Chat に直接聞いてください。Copilot はこのプロジェクトの全情報を持っているので、詳しくサポートできます。

**Happy collaborating! 🚀**
