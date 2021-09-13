# linux-resource-command
 Convert the result of resource command (df , free) to hash [Studying Github and Ruby]
```
-------------------------------------------
 free command hash (option null)
-------------------------------------------
{
  "total": {
    "Mem": 2036540,
    "Swap": 1048572
  },
  "used": {
    "Mem": 868496,
    "Swap": 334096
  },
  "free": {
    "Mem": 405708,
    "Swap": 714476
  },
  "shared": {
    "Mem": 146932
  },
  "buff/cache": {
    "Mem": 762336
  },
  "available": {
    "Mem": 932772
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
    "Mem": 848,
    "Low": 1592,
    "High": 0,
    "Swap": 326,
    "Total": 1174
  },
  "free": {
    "Mem": 396,
    "Low": 396,
    "High": 0,
    "Swap": 697,
    "Total": 1093
  },
  "shared": {
    "Mem": 143
  },
  "buffers": {
    "Mem": 82
  },
  "cache": {
    "Mem": 661
  },
  "available": {
    "Mem": 910
  }
}
-------------------------------------------
 free command hash (option m) free memory megabyte
-------------------------------------------
395
-------------------------------------------
 df command hash  (option null)
-------------------------------------------
{
  "/": {
    "Filesystem": "overlay",
    "1K-blocks": 61255492,
    "Used": 3106012,
    "Available": 55008156,
    "Use%": 6,
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
    "Used": 3106012,
    "Available": 55008156,
    "Use%": 6,
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
  "Used": "3034M",
  "Available": "53719M",
  "Use%": 6,
  "Mounted on": "/"
}
-------------------------------------------
 df command hash  (option i)
-------------------------------------------
{
  "/": {
    "Filesystem": "overlay",
    "Inodes": 3907584,
    "IUsed": 114626,
    "IFree": 3792958,
    "IUse%": 3,
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
    "IUsed": 114626,
    "IFree": 3792958,
    "IUse%": 3,
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
```