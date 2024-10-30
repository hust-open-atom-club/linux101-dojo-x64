Linux 中最关键的命令之一是 `cat`。
`cat` 最常用于读取文件，如下所示：

```console
hacker@dojo:~$ cat /challenge/DESCRIPTION.md
Linux 中最关键的命令之一是 `cat`。
`cat` 最常用于读取文件，如下所示：
...
```

`cat` 会连接多个文件（因此得名），如果提供多个参数。例如：

```console
hacker@dojo:~$ cat myfile
This is my file!
hacker@dojo:~$ cat yourfile
This is your file!
hacker@dojo:~$ cat myfile yourfile
This is my file!
This is your file!
hacker@dojo:~$ cat myfile yourfile myfile
This is my file!
This is your file!
This is my file!
```

如果不提供任何参数，cat 将从终端输入读取并输出内容。 我们将在后续的挑战中讨论这个...

在本挑战中，我将把 flag复制到你主目录中的 flag 文件里（即你的 shell 启动的位置）。 去用 cat 读取它吧！
