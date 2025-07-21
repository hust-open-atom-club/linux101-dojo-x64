原来，“Shell 是如何找到 `ls` 的？”这个问题的答案相当简单。
有一个名为 `PATH` 的特殊 shell 变量，它存储了一系列目录路径，shell 会在这些路径中搜索与命令相对应的程序。
如果你清空这个变量，情况就会变得很糟糕：

```console
hacker@dojo:~$ ls
Desktop    Downloads  Pictures  Templates
Documents  Music      Public    Videos
hacker@dojo:~$ PATH=""
hacker@dojo:~$ ls
bash: ls: No such file or directory
hacker@dojo:~$
```

如果没有 `PATH`，bash 就无法找到 `ls` 命令。

在这一关中，你需要干扰 `/challenge/solve` 程序的正常运行。
这个程序会使用 `rm` 命令来**删除** flag 文件。
然而，如果它找不到 `rm` 命令，flag 文件就不会被删除，而挑战就会把 flag 交给你！
因此，你必须让 `/challenge/solve` 也找不到 `rm` 命令！

请记住：`/challenge/solve` 将会是你的 shell 的一个*子进程*，所以你必须运用在[Shell 变量](./variables)模块中学到的概念来修改它的 `PATH` 变量！
如果你没有成功，导致 flag 被删除，你就需要重启挑战来重试！ 
