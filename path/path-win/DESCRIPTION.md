好的，所以当你清空 `PATH` 时，事情就会出问题。
但是，怎么用 `PATH` 做一些*有用*的事情呢？

我们来探索一下，例如，如何将一个新的程序目录添加到我们的命令库中。
回想一下，`PATH` 存储了一个用于查找命令的目录列表，而对于那些不在标准位置的命令，我们通常必须通过它们的路径来执行它们：

```console
hacker@dojo:~$ ls /home/hacker/scripts
goodscript	badscript	okayscript
hacker@dojo:~$ goodscript
bash: goodscript: command not found
hacker@dojo:~$ /home/hacker/scripts/goodscript
YEAH! This is the best script!
hacker@dojo:~$
```

如果你维护了一些有用的脚本，并希望能够仅通过名称来启动它们，每次都要输入完整路径会很烦人。
然而，通过在这个列表中添加或替换目录，你就可以让这些程序也能仅通过名称来启动！
例如：

```console
hacker@dojo:~$ PATH=/home/hacker/scripts
hacker@dojo:~$ goodscript
YEAH! This is the best script!
hacker@dojo:~$
```

我们来练习一下。
这一关的 `/challenge/solve` 将通过其裸名来运行 `win` 命令，但这个命令位于 `/challenge/more_commands/` 目录中，该目录初始时并不在 PATH 里。
`win` 命令是 `/challenge/solve` 所需要的*唯一*东西，所以你只需要用那一个目录来覆盖 `PATH` 即可。
祝你好运！
