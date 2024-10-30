到目前为止，我们已经告诉你要与哪些文件互动。
但是目录中可能有很多文件（和其他目录），我们不可能一直告诉你它们的名字。
你需要学习使用 `ls` 命令来**list**出它们的内容！

`ls` 将列出所有提供给它作为参数的目录中的文件，如果没有提供参数，则列出当前目录中的文件。
观察：

```console
hacker@dojo:~$ ls /challenge
run
hacker@dojo:~$ ls
Desktop    Downloads  Pictures  Templates
Documents  Music      Public    Videos
hacker@dojo:~$ ls /home/hacker
Desktop    Downloads  Pictures  Templates
Documents  Music      Public    Videos
hacker@dojo:~$
```

在这个挑战中，我们将 `/challenge/solve` 命名为一个随机名称！
列出 `/challenge` 中的文件以找到它。

