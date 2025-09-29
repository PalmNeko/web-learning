# web-learning
WEBアプリケーションを学ぶリポジトリ。DB、バックグラウンドの構築を行う。

# 開発
1. .env.exampleを`.env`で保存し、内容を修正してください。

- 以下を実行することで特別な環境のシェルを提供します。
```
bash shell.sh
```
以下のコマンドで詳細を確認できます。
```
usage
```
- .bashrcファイルを作成することで、shell.sh実行時に自動で読み込みます。
- etcに設定ファイルや隠しファイルを置いています。

# 環境変数 .env
| 変数名 | 内容 |
| --- | --- |
| IP_ADDRESS_PLACEHOLDER | connect.sh経由でSSH接続時のIPアドレス探索用 |
| SSH_USER | connect.sh経由で接続時のSSHのユーザー名 |
