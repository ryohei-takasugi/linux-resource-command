# =====================
# 
# @os:Ubuntu 21.04
# @ruby-version: ruby 2.7.4p191 (2021-07-07 revision a21a3b7d23) [aarch64-linux]
# 
# =====================

require "json"
require_relative "lib/df"
require_relative "lib/free"
require_relative "lib/ps"
require_relative "lib/uptime"

# freeコマンドの結果をHash型で取得する
include Free

puts "-------------------------------------------"
puts " free command hash (option null)"
puts "-------------------------------------------"
puts JSON.pretty_generate(free)

puts "-------------------------------------------"
puts " free command hash (option lwmt)"
puts "-------------------------------------------"
puts JSON.pretty_generate(free("-lwmt"))

puts "-------------------------------------------"
puts " free command hash (option m) free memory megabyte"
puts "-------------------------------------------"
puts JSON.pretty_generate(free("-m")["free"]["Mem"])


# dfコマンドの結果をHash型で取得する
include Df

puts "-------------------------------------------"
puts " df command hash  (option null)"
puts "-------------------------------------------"
puts JSON.pretty_generate(df)

puts "-------------------------------------------"
puts " df command hash  (option null) root only"
puts "-------------------------------------------"
puts JSON.pretty_generate(df("-BM")["/"])

puts "-------------------------------------------"
puts " df command hash  (option i)"
puts "-------------------------------------------"
puts JSON.pretty_generate(df("-i"))

# psコマンドの結果をHash型で取得する
include Ps
puts "-------------------------------------------"
puts " ps command hash  (option nil)"
puts "-------------------------------------------"
puts JSON.pretty_generate(ps.plane)

puts "-------------------------------------------"
puts " ps command hash  (option aux, head -n 2)"
puts "-------------------------------------------"
puts JSON.pretty_generate(ps.head("aux", 2))

puts "-------------------------------------------"
puts " ps command hash  (option a, head -n 2)"
puts "-------------------------------------------"
puts JSON.pretty_generate(ps.head("a", 2))

puts "-------------------------------------------"
puts " ps command hash  (option u, head -n 2)"
puts "-------------------------------------------"
puts JSON.pretty_generate(ps.head("u", 2))

puts "-------------------------------------------"
puts " ps command hash  (option x, head -n 2)"
puts "-------------------------------------------"
puts JSON.pretty_generate(ps.head("x", 2))

puts "-------------------------------------------"
puts " ps command hash  (option e, head -n 2)"
puts "-------------------------------------------"
puts JSON.pretty_generate(ps.head("e", 2))

puts "-------------------------------------------"
puts " ps command hash  (option l, head -n 2)"
puts "-------------------------------------------"
puts JSON.pretty_generate(ps.head("l", 2))

puts "-------------------------------------------"
puts " ps command hash  (option o pid,uid,tty, head -n 2)"
puts "-------------------------------------------"
puts JSON.pretty_generate(ps.head("o pid,uid,tty", 2))

puts "-------------------------------------------"
puts " ps command hash  (option -C ruby, head -n 2)"
puts "-------------------------------------------"
puts JSON.pretty_generate(ps.head(" -C ruby", 2))

puts "-------------------------------------------"
puts " ps command hash  (option -u root, head -n 2)"
puts "-------------------------------------------"
puts JSON.pretty_generate(ps.head("-u root", 2))

puts "-------------------------------------------"
puts " ps command hash  (option nil, grep ruby)"
puts "-------------------------------------------"
puts JSON.pretty_generate(ps.grep("aux", "ruby"))

# uptimeコマンドの結果をHash型で取得する
include Uptime
puts "-------------------------------------------"
puts " uptime command hash"
puts "-------------------------------------------"
puts JSON.pretty_generate(uptime)
