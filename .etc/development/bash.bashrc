#!/bin/bash

# - Makefile から呼び出されることを想定しています

# 環境変数の設定
if [ -f .etc/development/.env ]; then
	set -a
	. .etc/development/.env
	set +a
else
	echo "Error: .etc/development/.env ファイルが存在していません"
fi

# PATHとプロンプトの設定
PATH="$(pwd)/scripts:$PATH"
PS1='〇'"$PS1"

# 追加の環境変数
export PROJECTDIR="$(pwd)"

# bashrcの読み込み
test -f .bashrc && . .bashrc

# ようこそメッセージ
if [ -f .etc/development/.welcome_message ]; then
	cat .etc/development/.welcome_message
	echo
fi


#
# 関数定義
#


# ヘルプ関数
usage() {
	echo
	echo "スクリプトやコマンドへの素早い接続を提供します。"
	echo
	echo "[スクリプト一覧]"
	echo "connect.sh IP_ADDRESS_PLACEHOLDER の形式に沿って、SSH_USERでSSH接続します"
	echo
}
