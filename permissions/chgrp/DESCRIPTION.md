分享是一种美德，而这一理念也已内建于 Linux 的设计之中。
文件同时拥有一个所有者**用户**和**组**。一个组可以包含多个用户，一个用户也可以是多个组的成员。

你可以用 `id` 命令来查看你隶属于哪些组：

```console
hacker@dojo:~$ id
uid=1000(hacker) gid=1000(hacker) groups=1000(hacker)
hacker@dojo:~$
```

在这里，`hacker` 用户**只**属于 `hacker` 组。
组最常见的用途是控制对不同系统资源的访问。
例如，pwn.hust.college 的“练习模式”会授予你 root 权限以便更好地进行调试等操作。这是通过在练习模式中启动时给你一个额外的组来实现的：

```console
hacker@dojo:~$ id
uid=1000(hacker) gid=1000(hacker) groups=1000(hacker),27(sudo)
hacker@dojo:~$
```

一个典型的 Linux 桌面系统的主用户通常隶属于**很多**组。
例如，这是 Zardus 的桌面环境：

```console
zardus@yourcomputer:~$ id
uid=1000(zardus) gid=1000(zardus) groups=1000(zardus),24(cdrom),25(floppy),27(sudo),29(audio),30(dip),44(video),46(plugdev),100(users),106(netdev),114(bluetooth),117(lpadmin),120(scanner),995(docker)
zardus@yourcomputer:~$
```

所有这些组赋予了 Zardus 读取 CD 和软盘（现在谁还用这个？）、管理系统、播放音乐、在视频监视器上绘图、使用蓝牙等能力。
通常，这种访问控制是通过文件系统上的组所有权来实现的！
例如，图形输出可以通过特殊的 `/dev/fb0` 文件来完成：

```console
zardus@yourcomputer:~$ ls -l /dev/fb0
crw-rw---- 1 root video 29, 0 Jun 30 23:42 /dev/fb0
zardus@yourcomputer:~$
```

这个文件是一个特殊的**设备文件**（类型 `c` 意味着它是一个“字符设备”），与它交互会改变显示输出（而不是像普通文件那样改变磁盘存储！）。
Zardus 在他机器上的用户账户可以与它交互，因为该文件所属的组是 `video`，而 Zardus 正是 `video` 组的成员。

不过，在 dojo 环境里的 `/flag` 文件就没这么幸运了！
请看以下情况：

```console
hacker@dojo:~$ id
uid=1000(hacker) gid=1000(hacker) groups=1000(hacker)
hacker@dojo:~$ ls -l /flag
-r--r----- 1 root root 53 Jul  4 04:47 /flag
hacker@dojo:~$ cat /flag
cat: /flag: Permission denied
hacker@dojo:~$
```

在这里，flag 文件归 `root` 用户和 `root` 组所有，而 `hacker` 用户既不是 `root` 用户，也不是 `root` 组的成员，所以无法访问该文件。
幸运的是，文件的所属组可以用 `chgrp`（**ch**ange **gr**ou**p**，更改组）命令来更改！
除非你对该文件拥有写权限**并且**是新组的成员，否则这个操作通常需要 root 权限，所以让我们以 root 身份来试一下：

```console
root@dojo:~# mkdir pwn_directory
root@dojo:~# touch college_file
root@dojo:~# ls -l
total 4
-rw-r--r-- 1 root root    0 May 22 13:42 college_file
drwxr-xr-x 2 root root 4096 May 22 13:42 pwn_directory
root@dojo:~# chgrp hacker college_file
root@dojo:~# ls -l
total 4
-rw-r--r-- 1 root hacker    0 May 22 13:42 college_file
drwxr-xr-x 2 root root   4096 May 22 13:42 pwn_directory
root@dojo:~#
```

在本关卡中，我已经将 flag 文件设置为其所属组可读，但目前这个组是 `root`。
幸运的是，我也已经让你作为 `hacker` 用户也能够调用 `chgrp` 了！
更改 flag 文件的组所有权，然后读取 flag 吧！
