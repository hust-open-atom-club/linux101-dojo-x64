有趣的是，`ls` 默认并不会列出 _所有_ 文件。
Linux 有一个约定，以 `.` 开头的文件在默认情况下不会在 `ls` 和其他一些上下文中显示。
要查看这些文件，你需要使用 `-a` 选项来调用 `ls`，如下所示：


```console
hacker@dojo:~$ touch pwn
hacker@dojo:~$ touch .college
hacker@dojo:~$ ls
pwn
hacker@dojo:~$ ls -a
.college	pwn
hacker@dojo:~$
```

现在轮到你了！
去寻找被隐藏为以点开头的文件的标志，位置在 `/` 目录下。
