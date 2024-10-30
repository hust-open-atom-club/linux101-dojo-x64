“Shell 是如何知道 `ls` 的？”这个问题的答案相当简单。存在一个特殊的 Shell 变量，叫做 `PATH`，它存储了一系列目录路径，Shell 会在这些路径中搜索与命令对应的程序。

如果你清空了这个变量，情况就会变得糟糕：

```console
hacker@dojo:~$ ls
Desktop    Downloads  Pictures  Templates
Documents  Music      Public    Videos
hacker@dojo:~$ PATH=""
hacker@dojo:~$ ls
bash: ls: No such file or directory
hacker@dojo:~$
```

没有 `PATH`，bash 就无法找到 `ls` 命令。

在这一关，你将干扰 `/challenge/solve` 程序的操作。这个程序会使用 `rm` 命令**删除**标志文件。但是，如果它找不到 `rm` 命令，标志将不会被删除，挑战会将其交给你！

因此，你必须确保 `/challenge/solve` 也无法找到 `rm` 命令！

请记住：`/challenge/solve` 将是你的 Shell 的一个**子进程**，所以你需要运用在 [Shell Variables](../variables) 中学到的概念来干扰它的 `PATH` 变量！如果你没有成功，标志被删除，你将需要重启挑战重新尝试！
