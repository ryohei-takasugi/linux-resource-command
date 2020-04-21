# =====================
# 
# @os: CentOS Linux release 7.7.1908 (Core) 
# @ruby-version: ruby-2.7.1
# @version: 0.1
# 
# =====================

require "json"
require "./core/lc"

# freeコマンドの結果をHash型で取得する
free = LinuxCommand::Free.new
opt = "-lwmt"
puts "\nfree %s" % opt
puts JSON.pretty_generate(free.get(opt))

# dfコマンドの結果をHash型で取得する
df = LinuxCommand::Df.new
opt = "-aT"
puts "\ndf %s" % opt
puts JSON.pretty_generate(df.get(opt))