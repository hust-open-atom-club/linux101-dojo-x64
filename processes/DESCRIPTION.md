计算机通过执行软件来完成各种任务。

在现代计算中，这些软件被分为两大类：一类是**操作系统内核**，另一类是**进程**，也就是我们这里要讨论的内容。

当 Linux 启动时，它会启动一个 **init**（initializer 的缩写，意为“初始化程序”）进程，该进程继而启动一系列其他进程，这些进程又会启动更多的进程，直到最终，你看到了你的命令行 shell——它本身也是一个进程！

当然，shell 会根据你输入的命令来启动相应的进程。

在本模块中，我们将学习如何以多种激动人心的方式来查看进程并与之交互！
