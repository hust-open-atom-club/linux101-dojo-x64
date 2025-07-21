你已经学会了用 `fg` 命令在**前台**恢复进程。
你也可以用 `bg` 命令在**后台**恢复进程！
这能让进程在后台继续运行，同时你又能拿回 shell 的控制权来执行其他命令。

本关卡的 `solve` 程序要求检测到它自己的另一个正在运行（**而不是被挂起的**）的副本，并且该副本使用的是同一个终端。
要怎么做呢？
用终端启动它，然后挂起它，接着用 `bg` 命令将其转入**后台**，在第一个进程于后台运行的同时，再启动另一个副本！

---

**奥秘:**
如果你对更深层的细节感兴趣，可以看看如何查看被挂起和在后台运行的进程属性之间的区别！
让我来演示一下。
首先，我们来挂起一个 `sleep` 进程：

```console
hacker@dojo:~$ sleep 1337
^Z
[1]+  Stopped                 sleep 1337
hacker@dojo:~$
```

`sleep` 进程现在在后台被**挂起**了。
我们可以通过 `ps` 命令的 `-o` 选项来启用 `stat` 列的输出来看到这一点：

```console
hacker@dojo:~$ ps -o user,pid,stat,cmd
USER         PID STAT CMD
hacker       702 Ss   bash
hacker       762 T    sleep 1337
hacker       782 R+   ps -o user,pid,stat,cmd
hacker@dojo:~$ 
```

看到那个 `T` 了吗？
它表示该进程因为我们按下了 `Ctrl-Z` 而被挂起了。
`bash` 的 `STAT` 列中的 `S` 表示 `bash` 正在休眠以等待输入。
`ps` 所在行的 `R` 表示它正在活动中（running），而 `+` 号表示它处于前台！

注意看，当我们在后台恢复 `sleep` 进程时会发生什么：

```console
hacker@dojo:~$ bg
[1]+ sleep 1337 &
hacker@dojo:~$ ps -o user,pid,stat,cmd
USER         PID STAT CMD
hacker       702 Ss   bash
hacker       762 S    sleep 1337
hacker      1224 R+   ps -o user,pid,stat,cmd
hacker@dojo:~$
```

看！
`sleep` 进程的状态现在变成了 `S`。
它正在休眠（S 状态），嗯，因为它本身就在休眠（`sleep` 命令的功能），但它并没有被挂起！
它也处于**后台**，因此没有 `+` 号。
