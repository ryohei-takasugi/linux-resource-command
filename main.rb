# =====================
# 
# @os:Ubuntu 18.04.4 LTS
# @ruby-version: ruby-2.7.1
# 
# =====================

require "json"
require "./core/unixcmd"

# freeコマンドの結果をHash型で取得する
puts "-------------------------------------------"
puts " free command hash (option null)"
puts "-------------------------------------------"
puts JSON.pretty_generate(free)

puts "-------------------------------------------"
puts " free command hash (option lwmt)"
puts "-------------------------------------------"
puts JSON.pretty_generate(free("-lwmt"))

puts "-------------------------------------------"
puts " free command hash (option h)"
puts "-------------------------------------------"
puts JSON.pretty_generate(free("-h"))

puts "-------------------------------------------"
puts " free command hash (option m) free mem only"
puts "-------------------------------------------"
puts JSON.pretty_generate(free("-m")["free"]["Mem"])


# dfコマンドの結果をHash型で取得する
puts "-------------------------------------------"
puts " df command hash  (option null)"
puts "-------------------------------------------"
puts JSON.pretty_generate(df)

puts "-------------------------------------------"
puts " df command hash  (option ahT)"
puts "-------------------------------------------"
puts JSON.pretty_generate(df("-ahT"))

puts "-------------------------------------------"
puts " df command hash  (option null) root only"
puts "-------------------------------------------"
puts JSON.pretty_generate(df["/"])

puts "-------------------------------------------"
puts " df command hash  (option BM)"
puts "-------------------------------------------"
puts JSON.pretty_generate(df("-BM"))

puts "-------------------------------------------"
puts " df command hash  (option i)"
puts "-------------------------------------------"
puts JSON.pretty_generate(df("-i"))