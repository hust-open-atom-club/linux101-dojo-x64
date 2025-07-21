在上一关中，你使用了 `/challenge/getroot` 程序来成为 `root` 用户。
成为 root 是 Linux 用户一个相当常见的操作，而典型的 Linux 系统显然不会有 `/challenge/getroot` 这个程序。
取而代之的是，有两个用于此目的的工具：`su` 和 `sudo`。

在这个挑战中，我们将介绍其中较老的一个，`su`（即 **s**witch **u**ser，切换用户命令）。
现在，它通常已不再用于提升至 root 权限，但它是一个来自更文明时代的优雅工具，因此我们将首先介绍它。

`su` 是一个 setuid 可执行文件：

```console
hacker@dojo:~$ ls -l /usr/bin/su
-rwsr-xr-x 1 root root 232416 Dec 1 11:45 /usr/bin/su
hacker@dojo:~$
```

因为它设置了 SUID 位，所以 `su` 会以 root 身份运行。
以 root 身份运行时，它可以启动一个 root shell！
当然，`su` 是有辨别能力的：在允许用户将权限提升到 root 之前，它会检查以确保用户知道 root 的密码：

```console
hacker@dojo:~$ su
Password: 
su: Authentication failure
hacker@dojo:~$
```

这种需要验证 root 密码的机制，正是导致 `su` 被淘汰的原因。
现代系统极少设置 root 密码，而是使用不同的机制（我们稍后会学到）来授予管理权限。

但是，**这个**挑战（且仅有这个挑战）*确实*设置了 root 密码。
那个密码是 `hack-the-planet`，你必须将它提供给 `su` 以成为 root！
去完成操作，然后读取 flag 吧！
