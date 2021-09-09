# linux-resource-command
 Convert the result of resource command (df , free) to hash [Studying Github and Ruby]
```
root@02c0bfcf7d4e:~/unixcmd-by-ruby# ruby main.rb 
-------------------------------------------
 free command hash (option null)
-------------------------------------------
{
  "total": {
    "Mem": 4029220,
    "Swap": 1048572
  },
  "used": {
    "Mem": 1267692,
    "Swap": 0
  },
  "free": {
    "Mem": 1229580,
    "Swap": 1048572
  },
  "shared": {
    "Mem": 409184
  },
  "buff/cache": {
    "Mem": 1531948
  },
  "available": {
    "Mem": 2077600
  }
}
-------------------------------------------
 free command hash (option lwmt)
-------------------------------------------
{
  "total": {
    "Mem": 3934,
    "Low": 3934,
    "High": 0,
    "Swap": 1023,
    "Total": 4958
  },
  "used": {
    "Mem": 1237,
    "Low": 2733,
    "High": 0,
    "Swap": 0,
    "Total": 1237
  },
  "free": {
    "Mem": 1201,
    "Low": 1201,
    "High": 0,
    "Swap": 1023,
    "Total": 2225
  },
  "shared": {
    "Mem": 399
  },
  "buffers": {
    "Mem": 323
  },
  "cache": {
    "Mem": 1172
  },
  "available": {
    "Mem": 2029
  }
}
-------------------------------------------
 free command hash (option h)
-------------------------------------------
{
  "total": {
    "Mem": "3.8Gi",
    "Swap": "1.0Gi"
  },
  "used": {
    "Mem": "1.2Gi",
    "Swap": "0B"
  },
  "free": {
    "Mem": "1.2Gi",
    "Swap": "1.0Gi"
  },
  "shared": {
    "Mem": "399Mi"
  },
  "buff/cache": {
    "Mem": "1.5Gi"
  },
  "available": {
    "Mem": "2.0Gi"
  }
}
-------------------------------------------
 free command hash (option m) free mem only
-------------------------------------------
1200
-------------------------------------------
 df command hash  (option null)
-------------------------------------------
{
  "/": {
    "Filesystem": "overlay",
    "1K-blocks": 61255492,
    "Used": 7027220,
    "Available": 51086948,
    "Use%": 13,
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
    "1K-blocks": 2014608,
    "Used": 0,
    "Available": 2014608,
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
    "Used": 7027220,
    "Available": 51086948,
    "Use%": 13,
    "Mounted on": "/etc/hosts"
  },
  "/proc/acpi": {
    "Filesystem": "tmpfs",
    "1K-blocks": 2014608,
    "Used": 0,
    "Available": 2014608,
    "Use%": 0,
    "Mounted on": "/proc/acpi"
  },
  "/sys/firmware": {
    "Filesystem": "tmpfs",
    "1K-blocks": 2014608,
    "Used": 0,
    "Available": 2014608,
    "Use%": 0,
    "Mounted on": "/sys/firmware"
  }
}
-------------------------------------------
 df command hash  (option ahT)
-------------------------------------------
{
  "/": {
    "Filesystem": "overlay",
    "Type": "overlay",
    "Size": "59G",
    "Used": "6.8G",
    "Avail": "49G",
    "Use%": 13,
    "Mounted on": "/"
  },
  "/proc": {
    "Filesystem": "proc",
    "Type": "proc",
    "Size": 0,
    "Used": 0,
    "Avail": 0,
    "Use%": "-",
    "Mounted on": "/proc"
  },
  "/dev": {
      (省略)
  },
  "/sys/firmware": {
    "Filesystem": "tmpfs",
    "Type": "tmpfs",
    "Size": "2.0G",
    "Used": 0,
    "Avail": "2.0G",
    "Use%": 0,
    "Mounted on": "/sys/firmware"
  }
}
-------------------------------------------
 df command hash  (option null) root only
-------------------------------------------
{
  "Filesystem": "overlay",
  "1K-blocks": 61255492,
  "Used": 7027220,
  "Available": 51086948,
  "Use%": 13,
  "Mounted on": "/"
}
-------------------------------------------
 df command hash  (option BM)
-------------------------------------------
{
  "/": {
    "Filesystem": "overlay",
    "1M-blocks": "59820M",
    "Used": "6863M",
    "Available": "49890M",
    "Use%": 13,
    "Mounted on": "/"
  },
  "/dev": {
    "Filesystem": "tmpfs",
    "1M-blocks": "64M",
    "Used": "0M",
    "Available": "64M",
    "Use%": 0,
    "Mounted on": "/dev"
  },
  "/sys/fs/cgroup": {
    "Filesystem": "tmpfs",
    "1M-blocks": "1968M",
    "Used": "0M",
    "Available": "1968M",
    "Use%": 0,
    "Mounted on": "/sys/fs/cgroup"
  },
  "/dev/shm": {
    "Filesystem": "shm",
    "1M-blocks": "64M",
    "Used": "0M",
    "Available": "64M",
    "Use%": 0,
    "Mounted on": "/dev/shm"
  },
  "/etc/hosts": {
    "Filesystem": "/dev/vda1",
    "1M-blocks": "59820M",
    "Used": "6863M",
    "Available": "49890M",
    "Use%": 13,
    "Mounted on": "/etc/hosts"
  },
  "/proc/acpi": {
    "Filesystem": "tmpfs",
    "1M-blocks": "1968M",
    "Used": "0M",
    "Available": "1968M",
    "Use%": 0,
    "Mounted on": "/proc/acpi"
  },
  "/sys/firmware": {
    "Filesystem": "tmpfs",
    "1M-blocks": "1968M",
    "Used": "0M",
    "Available": "1968M",
    "Use%": 0,
    "Mounted on": "/sys/firmware"
  }
}
-------------------------------------------
 df command hash  (option i)
-------------------------------------------
{
  "/": {
    "Filesystem": "overlay",
    "Inodes": 3907584,
    "IUsed": 258001,
    "IFree": 3649583,
    "IUse%": 7,
    "Mounted on": "/"
  },
  "/dev": {
    "Filesystem": "tmpfs",
    "Inodes": 503652,
    "IUsed": 17,
    "IFree": 503635,
    "IUse%": 1,
    "Mounted on": "/dev"
  },
  "/sys/fs/cgroup": {
    "Filesystem": "tmpfs",
    "Inodes": 503652,
    "IUsed": 15,
    "IFree": 503637,
    "IUse%": 1,
    "Mounted on": "/sys/fs/cgroup"
  },
  "/dev/shm": {
    "Filesystem": "shm",
    "Inodes": 503652,
    "IUsed": 1,
    "IFree": 503651,
    "IUse%": 1,
    "Mounted on": "/dev/shm"
  },
  "/etc/hosts": {
    "Filesystem": "/dev/vda1",
    "Inodes": 3907584,
    "IUsed": 258001,
    "IFree": 3649583,
    "IUse%": 7,
    "Mounted on": "/etc/hosts"
  },
  "/proc/acpi": {
    "Filesystem": "tmpfs",
    "Inodes": 503652,
    "IUsed": 1,
    "IFree": 503651,
    "IUse%": 1,
    "Mounted on": "/proc/acpi"
  },
  "/sys/firmware": {
    "Filesystem": "tmpfs",
    "Inodes": 503652,
    "IUsed": 1,
    "IFree": 503651,
    "IUse%": 1,
    "Mounted on": "/sys/firmware"
  }
}
```