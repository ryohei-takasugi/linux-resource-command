# =====================
# 
# @os:Ubuntu 18.04.4 LTS
# @ruby-version: ruby-2.7.1
# 
# =====================

require "json"
require "./core/unixcmd"

# freeコマンドの結果をHash型で取得する
puts JSON.pretty_generate(free("-lwmt"))
# dfコマンドの結果をHash型で取得する
puts JSON.pretty_generate(df("-aT"))