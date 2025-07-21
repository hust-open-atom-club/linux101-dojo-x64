可怜的 Zardus，你已经把他黑得够惨的了。
但他学乖了，把自己的家目录保护了起来！
游戏结束了吗？

还没完呢！
当一台电脑上有多个账户时，人们常常忽略一件事：他们的*命令调用*会泄露什么样的信息。
记住，当你执行 `ps aux` 时，你会得到：

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

但是，如果这些命令中某个命令的参数是敏感信息，比如 flag 或密码，会发生什么呢？
这种情况确实会发生，而共享同一台机器的恶意用户（或者能以其他方式列出机器上进程的用户）就能窃取这些信息并加以利用！

这正是本挑战所要探讨的内容。
Zardus 正在使用一个自动化脚本，并将他的账户密码作为参数传递给该脚本。
Zardus 也被允许使用 `sudo`（因此，他可以执行 `sudo cat /flag`！）。
窃取他的密码，登录 Zardus 的账户（回想一下[解析用户](../users)模块中的 `su` 命令），然后拿到那个 flag！
