# =====================
# 
# @os:Ubuntu 21.04
# @ruby-version: ruby 2.7.4p191 (2021-07-07 revision a21a3b7d23) [aarch64-linux]
# 
# =====================

require "json"
require "./core/lcmd"

# freeコマンドの結果をHash型で取得する
free = Free.new

puts "-------------------------------------------"
puts " free command hash (option null)"
puts "-------------------------------------------"
puts JSON.pretty_generate(free.get)

puts "-------------------------------------------"
puts " free command hash (option lwmt)"
puts "-------------------------------------------"
puts JSON.pretty_generate(free.get("-lwmt"))

puts "-------------------------------------------"
puts " free command hash (option m) free memory megabyte"
puts "-------------------------------------------"
puts JSON.pretty_generate(free.get("-m")["free"]["Mem"])


# dfコマンドの結果をHash型で取得する
df = Df.new

puts "-------------------------------------------"
puts " df command hash  (option null)"
puts "-------------------------------------------"
puts JSON.pretty_generate(df.get)

puts "-------------------------------------------"
puts " df command hash  (option null) root only"
puts "-------------------------------------------"
puts JSON.pretty_generate(df.get("-BM")["/"])

puts "-------------------------------------------"
puts " df command hash  (option i)"
puts "-------------------------------------------"
puts JSON.pretty_generate(df.get("-i"))