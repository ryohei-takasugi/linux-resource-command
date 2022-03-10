# 概要
Linuxの一部のコマンド(df, free, ps, uptime)の結果を取得してハッシュ型にして返します。

# インストール
* Gemは必要ありません。
* Rubyは Version 2.7.1 で製作しましたが、多くのバージョンで動作するはずです。
* 必要なファイルは次のとおりです。
```
lib
 + common.rb
 + df.rb
 + free.rb
 + ps.rb
 + uptime.rb
```
# 実行
* dfコマンドを利用する場合は、次のようにしてすることで利用できるはずです。
```ruby
require_relative "lib/df"
include Df
puts JSON.pretty_generate(df)
```
* freeコマンドを利用する場合は、次のようにしてすることで利用できるはずです。
```ruby
require_relative "lib/free"
include Free
puts JSON.pretty_generate(free)
```
* psコマンドを利用する場合は、次のようにしてすることで利用できるはずです。
```ruby
require_relative "lib/ps"
include Ps
puts JSON.pretty_generate(ps.plane)
```
* uptimeコマンドを利用する場合は、次のようにしてすることで利用できるはずです。
```ruby
require_relative "lib/uptime"
include Uptime
puts JSON.pretty_generate(uptime)
```
# アンインストール
* ファイルを全て削除するだけです。
# 実行結果
```shell
root@ea99b2bc3338:~/origin/linuxcmd-by-ruby# ruby sample.rb 
-------------------------------------------
 free command hash (option null)
-------------------------------------------
{
  "total": {
    "Mem": 2036540,
    "Swap": 1048572
  },
  "used": {
    "Mem": 1259192,
    "Swap": 180584
  },
  "free": {
    "Mem": 74348,
    "Swap": 867988
  },
  "shared": {
    "Mem": 268440
  },
  "buff/cache": {
    "Mem": 703000
  },
  "available": {
    "Mem": 424164
  }
}
-------------------------------------------
 free command hash (option lwmt)
-------------------------------------------
{
  "total": {
    "Mem": 1988,
    "Low": 1988,
    "High": 0,
    "Swap": 1023,
    "Total": 3012
  },
  "used": {
    "Mem": 1229,
    "Low": 1916,
    "High": 0,
    "Swap": 176,
    "Total": 1406
  },
  "free": {
    "Mem": 72,
    "Low": 72,
    "High": 0,
    "Swap": 847,
    "Total": 920
  },
  "shared": {
    "Mem": 262
  },
  "buffers": {
    "Mem": 26
  },
  "cache": {
    "Mem": 659
  },
  "available": {
    "Mem": 414
  }
}
-------------------------------------------
 free command hash (option m) free memory megabyte
-------------------------------------------
72
-------------------------------------------
 df command hash  (option null)
-------------------------------------------
{
  "/": {
    "Filesystem": "overlay",
    "1K-blocks": 61255492,
    "Used": 4857332,
    "Available": 53256836,
    "Use%": 9,
    "Mounted on": "/"
  },
  "/dev": {
    "Filesystem": "tmpfs",
    "1K-blocks": 65536,
    "Used": 0,
    "Available": 65536,
    "Use%": 0,
    "Mounted on": "/dev"
  },
  "/sys/fs/cgroup": {
    "Filesystem": "tmpfs",
    "1K-blocks": 1018268,
    "Used": 0,
    "Available": 1018268,
    "Use%": 0,
    "Mounted on": "/sys/fs/cgroup"
  },
  "/dev/shm": {
    "Filesystem": "shm",
    "1K-blocks": 65536,
    "Used": 0,
    "Available": 65536,
    "Use%": 0,
    "Mounted on": "/dev/shm"
  },
  "/etc/hosts": {
    "Filesystem": "/dev/vda1",
    "1K-blocks": 61255492,
    "Used": 4857332,
    "Available": 53256836,
    "Use%": 9,
    "Mounted on": "/etc/hosts"
  },
  "/sys/firmware": {
    "Filesystem": "tmpfs",
    "1K-blocks": 1018268,
    "Used": 0,
    "Available": 1018268,
    "Use%": 0,
    "Mounted on": "/sys/firmware"
  }
}
-------------------------------------------
 df command hash  (option null) root only
-------------------------------------------
{
  "Filesystem": "overlay",
  "1M-blocks": "59820M",
  "Used": "4744M",
  "Available": "52009M",
  "Use%": 9,
  "Mounted on": "/"
}
-------------------------------------------
 df command hash  (option i)
-------------------------------------------
{
  "/": {
    "Filesystem": "overlay",
    "Inodes": 3907584,
    "IUsed": 222289,
    "IFree": 3685295,
    "IUse%": 6,
    "Mounted on": "/"
  },
  "/dev": {
    "Filesystem": "tmpfs",
    "Inodes": 254567,
    "IUsed": 17,
    "IFree": 254550,
    "IUse%": 1,
    "Mounted on": "/dev"
  },
  "/sys/fs/cgroup": {
    "Filesystem": "tmpfs",
    "Inodes": 254567,
    "IUsed": 15,
    "IFree": 254552,
    "IUse%": 1,
    "Mounted on": "/sys/fs/cgroup"
  },
  "/dev/shm": {
    "Filesystem": "shm",
    "Inodes": 254567,
    "IUsed": 1,
    "IFree": 254566,
    "IUse%": 1,
    "Mounted on": "/dev/shm"
  },
  "/etc/hosts": {
    "Filesystem": "/dev/vda1",
    "Inodes": 3907584,
    "IUsed": 222289,
    "IFree": 3685295,
    "IUse%": 6,
    "Mounted on": "/etc/hosts"
  },
  "/sys/firmware": {
    "Filesystem": "tmpfs",
    "Inodes": 254567,
    "IUsed": 1,
    "IFree": 254566,
    "IUse%": 1,
    "Mounted on": "/sys/firmware"
  }
}
-------------------------------------------
 ps command hash  (option nil)
-------------------------------------------
{
  "bash": {
    "PID": 355,
    "TTY": "pts/1",
    "TIME": "00:00:00",
    "CMD": "bash"
  },
  "ruby": {
    "PID": 51165,
    "TTY": "pts/1",
    "TIME": "00:00:00",
    "CMD": "ruby"
  },
  "ps": {
    "PID": 51184,
    "TTY": "pts/1",
    "TIME": "00:00:00",
    "CMD": "ps"
  }
}
-------------------------------------------
 ps command hash  (option aux, head -n 2)
-------------------------------------------
{
  "bash": {
    "USER": "root",
    "PID": 1,
    "%CPU": 0.0,
    "%MEM": 0.1,
    "VSZ": 4132,
    "RSS": 2616,
    "TTY": "pts/0",
    "STAT": "Ss+",
    "START": "10:58",
    "TIME": "0:00",
    "COMMAND": "bash"
  }
}
-------------------------------------------
 ps command hash  (option a, head -n 2)
-------------------------------------------
{
  "bash": {
    "PID": 1,
    "TTY": "pts/0",
    "STAT": "Ss+",
    "TIME": "0:00",
    "COMMAND": "bash"
  }
}
-------------------------------------------
 ps command hash  (option u, head -n 2)
-------------------------------------------
{
  "bash": {
    "USER": "root",
    "PID": 1,
    "%CPU": 0.0,
    "%MEM": 0.1,
    "VSZ": 4132,
    "RSS": 2616,
    "TTY": "pts/0",
    "STAT": "Ss+",
    "START": "10:58",
    "TIME": "0:00",
    "COMMAND": "bash"
  }
}
-------------------------------------------
 ps command hash  (option x, head -n 2)
-------------------------------------------
{
  "bash": {
    "PID": 1,
    "TTY": "pts/0",
    "STAT": "Ss+",
    "TIME": "0:00",
    "COMMAND": "bash"
  }
}
-------------------------------------------
 ps command hash  (option e, head -n 2)
-------------------------------------------
{
  "bash PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin HOSTNAME=ea99b2bc3338 TERM=xterm HOME=/root": {
    "PID": 1,
    "TTY": "pts/0",
    "STAT": "Ss+",
    "TIME": "0:00",
    "COMMAND": "bash PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin HOSTNAME=ea99b2bc3338 TERM=xterm HOME=/root"
  }
}
-------------------------------------------
 ps command hash  (option l, head -n 2)
-------------------------------------------
{
  "bash": {
    "F": 4,
    "UID": 0,
    "PID": 1,
    "PPID": 0,
    "PRI": 20,
    "NI": 0,
    "VSZ": 4132,
    "RSS": 2616,
    "WCHAN": "do_sel",
    "STAT": "Ss+",
    "TTY": "pts/0",
    "TIME": "0:00",
    "COMMAND": "bash"
  }
}
-------------------------------------------
 ps command hash  (option o pid,uid,tty, head -n 2)
-------------------------------------------
{
  "pts/0": {
    "PID": 1,
    "UID": 0,
    "TT": "pts/0"
  }
}
-------------------------------------------
 ps command hash  (option -C ruby, head -n 2)
-------------------------------------------
{
  "ruby": {
    "PID": 51165,
    "TTY": "pts/1",
    "TIME": "00:00:00",
    "CMD": "ruby"
  }
}
-------------------------------------------
 ps command hash  (option -u root, head -n 2)
-------------------------------------------
{
  "bash": {
    "PID": 1,
    "TTY": "pts/0",
    "TIME": "00:00:00",
    "CMD": "bash"
  }
}
-------------------------------------------
 ps command hash  (option nil, grep ruby)
-------------------------------------------
{
  "/root/.vscode-server/bin/7f6ab5485bbc008386c4386d08766667e155244e/node /root/.vscode-server/extensions/rebornix.ruby-0.28.1/dist/server/index.js --node-ipc --clientProcessId=321": {
    "USER": "root",
    "PID": 4169,
    "%CPU": 0.1,
    "%MEM": 11.0,
    "VSZ": 11073492,
    "RSS": 224328,
    "TTY": "?",
    "STAT": "Sl",
    "START": "11:04",
    "TIME": "0:19",
    "COMMAND": "/root/.vscode-server/bin/7f6ab5485bbc008386c4386d08766667e155244e/node /root/.vscode-server/extensions/rebornix.ruby-0.28.1/dist/server/index.js --node-ipc --clientProcessId=321"
  },
  "ruby sample.rb": {
    "USER": "root",
    "PID": 51165,
    "%CPU": 0.0,
    "%MEM": 0.6,
    "VSZ": 77296,
    "RSS": 13880,
    "TTY": "pts/1",
    "STAT": "S+",
    "START": "15:32",
    "TIME": "0:00",
    "COMMAND": "ruby sample.rb"
  }
}
-------------------------------------------
 uptime command hash
-------------------------------------------
{
  "now": "15:32:30",
  "up": "4:34",
  "users": 0,
  "load average": {
    "1min": 0.2,
    "5min": 0.14,
    "15min": 0.1
  }
}
```