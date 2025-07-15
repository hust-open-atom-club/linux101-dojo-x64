在很多情况下，非 root 用户需要提升权限来执行某些系统任务。
每当用户想要执行一项只有 root 或 sudoers 才能完成的任务时，系统管理员不可能每次都在场提供密码。
“设置用户ID”（Set User ID，简称 SUID）这个权限位，允许用户以**该程序文件的所有者**身份来运行程序。

实际上，这**正是**用来让你们运行的挑战程序能够读取 flag 的机制，在 pwn.college 之外，它也被用来实现像 `su`、`sudo` 等系统管理工具的功能。
一个设置了 SUID 的文件的权限看起来是这样的：

```console
hacker@dojo:~$ ls -l /usr/bin/sudo
-rwsr-xr-x 1 root root 232416 Dec 1 11:45 /usr/bin/sudo
hacker@dojo:~$
```

那个取代了可执行权限位的 `s` 标志意味着该程序是**可执行且带有 SUID 权限**的。
这意味着，无论哪个用户运行该程序（只要他们有执行权限），该程序都将以文件所有者（在本例中是 `root` 用户）的身份来执行。

作为文件的所有者，你可以使用 `chmod` 来设置文件的 SUID 位：

```
chmod u+s [program]
```

但要小心！为一个归 `root` 所有的可执行文件设置 SUID 位，可能会给攻击者提供一条获取 root 权限的潜在攻击途径。

现在，我们将让你为 `/challenge/getroot` 程序添加 SUID 位，以便它能为你启动一个 root shell，然后你就可以亲自用 `cat` 来读取 flag 了！
