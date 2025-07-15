首先要说的是：文件所有权。
在 Linux 中，每个文件都归属于系统上的一个用户。
在你的日常使用中，这个用户通常就是你每天登录时所用的那个用户。

在共享系统上（例如计算机实验室），可能会有许多人使用不同的用户账户，每个人都在各自的家目录中存放着自己的文件。
但即使在非共享系统上（比如你的个人电脑），Linux 仍然为不同的任务设置了许多“服务”用户账户。

最重要的两个用户账户是：

1.  你的用户账户！在 pwn.hust.college 上，不管你的用户名是什么，这个账户都是 `hacker` 用户。
2.  `root`。这是管理员账户，在大多数安全场景中，它都是终极目标。如果你控制了 `root` 用户，那几乎可以肯定你已经达成了你的黑客目标！

这有什么用呢？
嗯，事实证明，我们阻止你直接使用 `cat /flag` 的方法，就是让 `/flag` 文件归 `root` 用户所有，配置其权限以使其他用户无法读取它（你稍后会学到如何做到这一点），并将实际的挑战程序配置为以 `root` 用户身份运行（你稍后也会学到如何做到这一点）。
结果就是，当你执行 `cat /flag` 时，你会得到：

```console
hacker@dojo:~$ ls -l /flag
-r-------- 1 root root 53 Jul  4 04:47 /flag
hacker@dojo:~$ cat /flag
cat: /flag: Permission denied
hacker@dojo:~$
```

在这里，你可以看到 flag 文件归 `root` 用户（那一行中的第一个 `root`）和 `root` 组（那一行中的第二个 `root`）所有。
当我们以 `hacker` 用户身份尝试读取它时，我们被拒绝了。
然而，如果我们是 `root`（黑客的梦想！），我们读取这个文件就毫无问题：

```console
root@dojo:~# cat /flag
pwn.college{demo_flag}
root@dojo:~#
```

有趣的是，我们可以更改文件的所有权！
这可以通过 `chown`（**ch**ange **own**er，更改所有者）命令来完成：

```
chown [username] [file]
```

通常情况下，`chown` 只能由 `root` 用户调用。
让我们再次假装我们是 root（这招百玩不厌！），来看看 `chown` 的一个典型用法：

```console
root@dojo:~# mkdir pwn_directory
root@dojo:~# touch college_file
root@dojo:~# ls -l
total 4
-rw-r--r-- 1 root root    0 May 22 13:42 college_file
drwxr-xr-x 2 root root 4096 May 22 13:42 pwn_directory
root@dojo:~# chown hacker college_file
root@dojo:~# ls -l
total 4
-rw-r--r-- 1 hacker root    0 May 22 13:42 college_file
drwxr-xr-x 2 root   root 4096 May 22 13:42 pwn_directory
root@dojo:~#
```

`college_file` 的所有者已经被更改为 `hacker` 用户，现在 `hacker` 就能对它做任何之前 `root` 能做的事情了！
如果这是 `/flag` 文件，那就意味着 `hacker` 用户将能够读取它！

在本关卡中，我们将练习把 `/flag` 文件的所有者更改为 `hacker` 用户，然后读取 flag。
仅在本挑战中，我做了特殊设置，让你作为 `hacker` 用户可以尽情使用 `chown`（再次强调，这通常需要你是 `root`）。
请明智地使用这份权力，开始 `chown` 吧！
