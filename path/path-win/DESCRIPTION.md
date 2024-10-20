当你清空 `PATH` 时事情会变得糟糕。但使用 `PATH` 做一些 _有用_ 的事情呢？

让我们探索一下，如何将一个新的程序目录添加到我们的命令库中。回忆一下，`PATH` 存储了查找命令的目录列表，对于不在标准位置的命令，我们通常需要通过它们的路径来执行它们：

```console
hacker@dojo:~$ ls /home/hacker/scripts
goodscript	badscript	okayscript
hacker@dojo:~$ goodscript
bash: goodscript: command not found
hacker@dojo:~$ /home/hacker/scripts/goodscript
YEAH! This is the best script!
hacker@dojo:~$
```

如果你维护一些常用的的脚本，并希望通过更简单的命令名来启动它们，而不是输入一大串长长的路径。那么，通过添加目录到PATH 列表中，或替换列表中的目录，你可以使这些程序能够通过它们的名称直接启动！例如：

```console
hacker@dojo:~$ PATH=/home/hacker/scripts
hacker@dojo:~$ goodscript
YEAH! This is the best script!
hacker@dojo:~$
```

让我们来练习一下。在这一关的 `/challenge/solve` 将通过`win`命令的名称运行 `win`命令，但这个命令存在于`/challenge/more_commands/` 目录中，而该目录最初不在 PATH 中。`win`命令是`/challenge/solve`唯一需要环境变量目录的，因此你可以直接用那个目录替换`PATH`。祝你好运！
