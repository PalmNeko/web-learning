
# 目的
時間がづれているのでその時間を修正する。

# 内容
参考URLに手順が書いてあるようなのでそれを参考に実行してみる。
1. 現在の設定の確認`timedatectl`
2. 色々記載があるものの飛ばして、タイムゾーンのリストを確認する`timedatectl list-timezones`
3. `Japan`もあるようだが、`Asia/Tokyo`をよく見るのでそちらを適用する`timedatectl set-timezone Asia/Tokyo`
4. `timedatectl`コマンドと`date`コマンドを実行したところあっているようである👍
5. 万が一ずれている場合は、リモートサーバーとの同期がとれていないようなので`timedatectl set-ntp yes`を実行する。

# 参考URL
 - https://docs.redhat.com/ja/documentation/red_hat_enterprise_linux/7/html/system_administrators_guide/chap-configuring_the_date_and_time
