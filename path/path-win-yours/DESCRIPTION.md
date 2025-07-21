回顾一下上一关的例子：

```console
hacker@dojo:~$ ls /home/hacker/scripts
goodscript	badscript	okayscript
hacker@dojo:~$ PATH=/home/hacker/scripts
hacker@dojo:~$ goodscript
YEAH! This is the best script!
hacker@dojo:~$
```

我们在这里看到的，当然是 `hacker` 用户通过引入自己的命令，让 shell 对自己更有用。
随着时间的推移，你可能会积累起自己的一套优雅的工具。就让我们从 `win` 开始吧！

之前，`/challenge/solve` 所执行的 `win` 命令存放在 `/challenge/more_commands` 目录下。
而这一次，`win` 命令不存在了！
回想一下 [链接命令](./chaining) 模块的最后一关，你需要创建一个名为 `win` 的 shell 脚本，将其所在位置添加到 `PATH` 中，从而让 `/challenge/solve` 能够找到它！

----
**提示：**
`/challenge/solve` 会以 root 身份运行，并且会调用 `win`。因此，`win` 只需要简单地 `cat` flag 文件即可。
同样，`win` 命令是 `/challenge/solve` 所需要的*唯一*东西，所以你可以只用那一个目录来覆盖 `PATH`。
但请记住，如果你这么做了，你的 `win` 命令将无法找到 `cat`。

你有三种方法可以避免这个问题：

1.  找出 `cat` 程序在文件系统中的位置。它*一定*在 `PATH` 变量所包含的某个目录中，所以你可以打印出这个变量（参考 [Shell 变量](./variables) 模块来回忆如何操作！），然后遍历其中的目录（回想一下，不同的条目是由 `:` 分隔的），找到哪个目录里有 `cat`，然后通过其绝对路径来调用 `cat`。
2.  设置一个 `PATH`，使其包含旧的目录，*再加上*你创建 `win` 的那个目录的新条目。
3.  使用 `read`（同样，参考 [Shell 变量](./variables) 模块）来读取 `/flag`。因为 `read` 是 `bash` 的一个内建功能，所以它不受 `PATH` 相关操作的影响。

现在，去 `win` 吧！
