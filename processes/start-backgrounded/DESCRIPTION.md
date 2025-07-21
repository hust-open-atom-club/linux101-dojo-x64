当然，你不必非得先挂起进程再将其转入后台：你可以从一开始就直接在后台启动它们！
这很简单；你只需要在命令的末尾追加一个 `&` 符号，就像这样：

```console
hacker@dojo:~$ sleep 1337 &
[1] 1771
hacker@dojo:~$ ps -o user,pid,stat,cmd
USER         PID STAT CMD
hacker      1709 Ss   bash
hacker      1771 S    sleep 1337
hacker      1782 R+   ps -o user,pid,stat,cmd
hacker@dojo:~$ 
```

在这里，`sleep` 正在后台运行，**而不是**被挂起的状态。
现在轮到你来练习了！
在后台启动 `/challenge/solve` 来获取 flag！
