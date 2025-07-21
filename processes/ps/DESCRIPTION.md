首先，我们将学习如何使用 `ps` 命令列出正在运行的进程。
`ps` 的名字来源说法不一，有人说它代表“process snapshot”（进程快照），也有人说代表“process status”（进程状态），但它的功能就是列出进程。
默认情况下，`ps` 只列出在你的终端中运行的进程，老实说，这不太有用：

```console
hacker@dojo:~$ ps
    PID TTY          TIME CMD
    329 pts/0    00:00:00 bash
    349 pts/0    00:00:00 ps
hacker@dojo:~$
```

在上面的例子中，我们看到了 shell (`bash`) 和 `ps` 进程本身，这就是在这个特定终端上运行的全部内容。
我们还看到每个进程都有一个数字标识符（**进程ID**，即 PID），这个数字在 Linux 环境中唯一地标识了每一个正在运行的进程。
我们还能看到命令运行所在的终端（在本例中，是 `pts/0`），以及进程到目前为止所消耗的 **CPU 时间** 总量（由于这些进程对资源要求不高，它们甚至还没消耗满1秒钟！）。

在大多数情况下，使用默认的 `ps` 命令，你看到的也就只有这些了。
为了让它变得有用，我们需要传递一些参数。

`ps` 是一个非常古老的工具，所以它的用法有点混乱。
指定参数的方式有两种。

**“标准”语法：** 在这种语法中，你可以用 `-e` 来列出“每个”（every）进程，用 `-f` 来获得“完整格式”（full format）的输出，其中包含参数。
这些可以合并成一个参数 `-ef`。

**“BSD”语法：** 在这种语法中，你可以用 `a` 来列出所有用户的进程，用 `x` 来列出没有在终端中运行的进程，用 `u` 来获得“用户可读”（user-readable）的输出。
这些可以合并成一个参数 `aux`。

这两种方法，`ps -ef` 和 `ps aux`，产生的输出略有不同，但大体上是相通、可以相互参照的。

让我们在 dojo 环境中试试看：

```console
hacker@dojo:~$ ps -ef
UID          PID    PPID  C STIME TTY          TIME CMD
hacker         1       0  0 05:34 ?        00:00:00 /sbin/docker-init -- /bin/sleep 6h
hacker         7       1  0 05:34 ?        00:00:00 /bin/sleep 6h
hacker       102       1  1 05:34 ?        00:00:00 /usr/lib/code-server/lib/node /usr/lib/code-server --auth=none -
hacker       138     102 11 05:34 ?        00:00:07 /usr/lib/code-server/lib/node /usr/lib/code-server/out/node/entr
hacker       287     138  0 05:34 ?        00:00:00 /usr/lib/code-server/lib/node /usr/lib/code-server/lib/vscode/ou
hacker       318     138  6 05:34 ?        00:00:03 /usr/lib/code-server/lib/node --dns-result-order=ipv4first /usr/
hacker       554     138  3 05:35 ?        00:00:00 /usr/lib/code-server/lib/node /usr/lib/code-server/lib/vscode/ou
hacker       571     554  0 05:35 pts/0    00:00:00 /usr/bin/bash --init-file /usr/lib/code-server/lib/vscode/out/vs
hacker       695     571  0 05:35 pts/0    00:00:00 ps -ef
hacker@dojo:~$
```

在这里你可以看到，正在运行的进程有：用于初始化挑战环境的（`docker-init`），一个用于在6小时后超时并终止挑战以节省计算资源的（`sleep 6h`），VSCode 环境（几个 `code-server` 辅助进程），shell (`bash`)，以及我自己的 `ps -ef` 命令。
使用 `ps aux` 的情况也基本相同：

```
hacker@dojo:~$ ps aux
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
hacker         1  0.0  0.0   1128     4 ?        Ss   05:34   0:00 /sbin/docker-init -- /bin/sleep 6h
hacker         7  0.0  0.0   2736   580 ?        S    05:34   0:00 /bin/sleep 6h
hacker       102  0.4  0.0 723944 64660 ?        Sl   05:34   0:00 /usr/lib/code-server/lib/node /usr/lib/code-serve
hacker       138  3.3  0.0 968792 106272 ?       Sl   05:34   0:07 /usr/lib/code-server/lib/node /usr/lib/code-serve
hacker       287  0.0  0.0 717648 53136 ?        Sl   05:34   0:00 /usr/lib/code-server/lib/node /usr/lib/code-serve
hacker       318  3.3  0.0 977472 98256 ?        Sl   05:34   0:06 /usr/lib/code-server/lib/node --dns-result-order=
hacker       554  0.4  0.0 650560 55360 ?        Rl   05:35   0:00 /usr/lib/code-server/lib/node /usr/lib/code-serve
hacker       571  0.0  0.0   4600  4032 pts/0    Ss   05:35   0:00 /usr/bin/bash --init-file /usr/lib/code-server/li
hacker      1172  0.0  0.0   5892  2924 pts/0    R+   05:38   0:00 ps aux
hacker@dojo:~$
```

`ps -ef` 和 `ps aux` 之间有很多共同点：两者都显示了用户（`USER` 列）、PID、TTY、进程启动时间（`STIME`/`START`）、已占用的 CPU 总时间（`TIME`）以及命令（`CMD`/`COMMAND`）。
`ps -ef` 额外输出了**父进程ID**（`PPID`），它指的是启动当前进程的那个进程的 PID，而 `ps aux` 则输出进程正在使用的系统总 CPU 和内存的百分比。
此外，还有一堆其他信息，我们现在暂时不深入讨论。

好了！我们来练习一下。
在这一关，我再一次把 `/challenge/solve` 重命名成了一个随机文件名，并且这次我还设置了让你无法 `ls` `/challenge` 目录！
但我已经把它启动了，所以你可以在运行的进程列表中找到它，找出文件名，然后直接重新运行它来获得 flag！
祝你好运！

**注意：** `ps -ef` 和 `ps aux` 都会根据你终端的宽度截断命令列表的显示（这就是为什么上面的例子在屏幕右侧能排列得那么整齐）。
如果你无法读到进程的完整路径，你可能需要把终端窗口拉大一些（或者将输出重定向到某个地方来避免这种截断行为）！
另一种方法是，你可以传递 `w` 选项**两次**（例如 `ps -efww` 或 `ps auxww`）来禁用截断。
