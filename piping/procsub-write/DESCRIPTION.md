好的，所以你可以用 `tee` 把数据复制到两个文件：

```console
hacker@dojo:~$ echo HACK | tee THE > PLANET
hacker@dojo:~$ cat THE
HACK
hacker@dojo:~$ cat PLANET
HACK
hacker@dojo:~$
```

而且你已经用过 `tee` 把数据同时复制到一个文件和一个命令：

```console
hacker@dojo:~$ echo HACK | tee THE | cat
HACK
hacker@dojo:~$ cat THE
HACK
hacker@dojo:~$
```

但是，如何把数据复制到两个命令呢？
`tee` 的手册页（manpage）上说，它被设计用来写入文件和标准输出：

```text
TEE(1)                           用户命令                          TEE(1)

名称
       tee - 从标准输入读取，并写入到标准输出和文件
```

幸运的是，Linux 遵循着“["万物皆文件"](https://en.wikipedia.org/wiki/Everything_is_a_file)”的哲学。
也就是说，系统致力于为大多数资源提供类似文件的访问方式，这其中就包括了正在运行的程序的输入和输出！
Shell 也遵循这一哲学，它允许你（举个例子）使用任何接受文件作为命令行参数的工具（比如 `tee`），并将其与某个程序的输入或输出端连接起来！

这可以通过一种叫做[“进程替换”](https://www.gnu.org/software/bash/manual/html_node/Process-Substitution.html)（Process Substitution）的技术来实现。
如果你写下 `>(rev)` 这样的参数，bash 会运行 `rev` 命令（这个命令从标准输入读取数据，将其反转，然后写到标准输出！），并将其输入端连接到一个它创建的临时文件上。
当然，这并不是一个*真正*的文件，它被称为*命名管道*（named pipe），因为它确实有一个文件名：

```console
hacker@dojo:~$ echo >(rev)
/dev/fd/63
hacker@dojo:~$
```

这个 `/dev/fd/63` 是从哪来的？
是 `bash` 用连接到 `rev` 输入端的命名管道文件的路径，替换了 `>(rev)`！
当命令运行时，向这个文件写入数据，就等于将数据通过管道传给了该命令的标准输入。
通常，这是通过那些接受输出文件作为参数的命令（比如 `tee`）来完成的：

```console
hacker@dojo:~$ echo HACK | rev
KCAH
hacker@dojo:~$ echo HACK | tee >(rev)
HACK
KCAH
```

在上面这个例子中，事件的发生顺序如下：

1.  `bash` 启动 `rev` 命令，并把一个命名管道（比如 `/dev/fd/63`）连接到 `rev` 的标准输入。
2.  `bash` 启动 `tee` 命令，将其标准输入连接到一个管道，并将 `tee` 的第一个参数替换为 `/dev/fd/63`。`tee` 甚至从未见过 `>(rev)` 这个参数；shell 在启动 `tee` *之前*就把它*替换*掉了。
3.  `bash` 使用 `echo` 内建命令将 `HACK` 打印到 `tee` 的标准输入。
4.  `tee` 读取 `HACK`，将其写入标准输出，然后再将其写入 `/dev/fd/63`（它连接着 `rev` 的标准输入）。
5.  `rev` 从其标准输入读取 `HACK`，将其反转，然后将 `KCAH` 写入标准输出。

现在轮到你了！
在这个挑战中，我们有 `/challenge/hack`、`/challenge/the` 和 `/challenge/planet` 这几个程序。
请运行 `/challenge/hack` 命令，并将其输出复制后，同时作为输入传递给 `/challenge/the` 和 `/challenge/planet` 命令！

----
**小知识！**

细心的学生会发现，下面这两种写法是等效的：

```console
hacker@dojo:~$ echo hi | rev
ih
hacker@dojo:~$ echo hi > >(rev)
ih
hacker@dojo:~$
```

不止一种方法可以传递管道数据！
当然，第二种方式可读性差得多，也更难扩展。
例如：

```console
hacker@dojo:~$ echo hi | rev | rev
hi
hacker@dojo:~$ echo hi > >(rev | rev)
hi
hacker@dojo:~$
```

这简直太蠢了！
这里的教训是，尽管进程替换是你工具箱里的一个强大工具，但它也是一个非常*专用*的工具；不要什么都用它！
