#!/bin/bash

main () {
	if [[ "$1" == "-h" || "$1" == "--help" ]]; then
		usage
		exit 0
	fi
	if ! validate; then
		exit 1
	fi
	echo "ip_searchを行います。"
	if ! ip="$(ip_search)"; then
		echo "Error: 接続先IPアドレスが見つかりませんでした"
		exit 1
	fi
	echo "接続先IPアドレス: $ip"
	ssh -l "$SSH_USER" "$ip"
}

usage() {
	echo "Usage: $0"
	echo "  SSHでローカルのリモートサーバーに接続します。"
}

validate() {
	if [[ -z "$SSH_USER" ]]; then
		echo "環境変数SSH_USER が設定されていません"
		return 1
	fi
	if [[ -z "$IP_ADDRESS_PLACEHOLDER" ]]; then
		echo "環境変数IP_ADDRESS_PLACEHOLDER が設定されていません"
		return 1
	fi
}

ip_search() {
	local verbose="$1"
	local logfile="/dev/null"
	if [[ "$verbose" == "-v" ]]; then
		set -x
		logfile="/dev/stderr"
	fi
	for i in {2..10}; do
		printf '\r%s\n' $i > "$logfile"
		if nc -w 1 "${IP_ADDRESS_PLACEHOLDER/X/$i}" 22 > "$logfile"; then
			echo "${IP_ADDRESS_PLACEHOLDER/X/$i}"
			return
		fi
	done
	return 1
}

main "$@"
