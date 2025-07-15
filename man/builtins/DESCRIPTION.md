有些命令并非是带有手册页（man page）和帮助选项的程序，而是被直接内建在 shell 之中。
它们被称为内建命令 *builtins*。
内建命令的调用方式和普通命令一样，但 shell 会在内部处理它们，而不会去启动一个新程序。
你可以通过运行内建命令 `help` 来获取一个 shell 内建命令的列表，像这样：

``` console
hacker@dojo:~$ help
```

如果你想获取某个特定内建命令的帮助，只需将它的名字作为参数传递给 `help` 即可。
让我们来看一个我们之前已经用过的内建命令 `cd` 吧！

``` console
hacker@dojo:~$ help cd
cd: cd [-L|[-P [-e]] [-@]] [dir]
    Change the shell working directory.
    
    Change the current directory to DIR.  The default DIR is the value of the
    HOME shell variable.
...
```

这些信息很有用！
在本挑战中，我们将练习使用 `help` 来查找内建命令的帮助信息。
本次挑战的 `challenge` 命令就是一个 `shell` 内建命令，而不是一个程序。
和之前一样，你需要查询它的帮助信息，来找出需要传递给它的秘密数值！
