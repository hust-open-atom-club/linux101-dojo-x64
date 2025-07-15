和标准输出一样，你也可以重定向命令的错误通道。
在这里，我们将学习*文件描述符编号*。
文件描述符（File Descriptor，简称 FD）是一个数字，它*描述*了 Linux 中的一个通信通道。
尽管你可能没有意识到，但其实你已经在使用它们了。
我们已经熟悉其中三个：

-   FD 0: 标准输入 (Standard Input)
-   FD 1: 标准输出 (Standard Output)
-   FD 2: 标准错误 (Standard Error)

当你重定向进程通信时，你实际上是根据 FD 编号来进行操作的，尽管有些 FD 编号是隐式指定的。
例如，不带数字的 `>` 符号，实际上就等同于 `1>`，它会重定向 FD 1（标准输出）。
因此，下面这两个命令是等效的：

```console
hacker@dojo:~$ echo hi > asdf
hacker@dojo:~$ echo hi 1> asdf
```

知道了这一点后，重定向错误就变得非常简单了。
如果你有一个命令可能会通过标准错误输出数据（比如 `/challenge/solve`），你可以这样做：

```console
hacker@dojo:~$ /challenge/run 2> errors.log
```

这样就会把标准错误（FD 2）重定向到 `errors.log` 文件。
此外，你还可以同时重定向多个文件描述符！
例如：

```console
hacker@dojo:~$ some_command > output.log 2> errors.log
```

该命令会将标准输出重定向到 `output.log`，并将标准错误重定向到 `errors.log`。

让我们来实践一下吧！
在这个挑战中，你需要像之前一样，将 `/challenge/solve` 的输出重定向到 `myflag`，同时将其“错误信息”（在我们的例子中，其实是操作指令）重定向到 `instructions` 文件。
你会发现，终端上什么都不会打印出来，因为你已经把所有输出都重定向了！
当你成功完成这个操作后，你就可以在 `instructions` 文件中找到指令/反馈，在 `myflag` 文件中找到旗标！
