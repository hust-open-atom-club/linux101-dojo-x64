你已经接触过两个用户：`hacker` 和 `root`。
这仅仅是两个用户，在一个典型的 Linux 系统上，用户的数量要多得多！
Linux 系统上所有用户的完整列表都定义在 `/etc/passwd` 文件中（这个命名是出于历史原因——现在它实际上已经不存储密码了）。
下面是来自 dojo 容器的一个示例：

```console
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
_apt:x:100:65534::/nonexistent:/usr/sbin/nologin
systemd-timesync:x:101:101:systemd Time Synchronization,,,:/run/systemd:/usr/sbin/nologin
systemd-network:x:102:103:systemd Network Management,,,:/run/systemd:/usr/sbin/nologin
systemd-resolve:x:103:104:systemd Resolver,,,:/run/systemd:/usr/sbin/nologin
mysql:x:104:105:MySQL Server,,,:/nonexistent:/bin/false
messagebus:x:105:106::/nonexistent:/usr/sbin/nologin
sshd:x:106:65534::/run/sshd:/usr/sbin/nologin
hacker:x:1000:1000::/home/hacker:/bin/bash
```

这里有很多用户，还有很多信息！
每一行都包含由 `:` 分隔的多个字段，分别是：用户名、一个作为密码*曾*存放位置占位符的 `x`（我们稍后会介绍密码的实际存储位置）、数字用户 ID、数字默认组 ID、用户的详细信息、家目录，以及默认 shell。

我们可以看到 `hacker` 和 `root`，以及其他一大堆用户。
许多用户的存在是出于历史原因，一些是为支持各种已安装软件而设的服务账户，还有一些是“实用”账户（例如，`nobody` 用户就是用来确保某个程序在没有任何特殊权限的情况下运行的）。

在本模块中，我们将探索各种与用户相关的花样玩法，学习切换用户以管理系统的正确方法，并在此过程中享受乐趣！
