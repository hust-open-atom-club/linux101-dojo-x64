你已经学会了启动进程、查看进程，现在你将学习如何**终止**进程！

在 Linux 中，这是通过一个名字很有攻击性的 `kill` 命令来完成的。
使用默认选项时（这也是我们在本关卡中将要介绍的全部内容），`kill` 会终止一个进程，并给它一个机会在彻底消失前处理好自己的事务。

比方说，你在另一个终端启动了一个烦人的 `sleep` 进程（`sleep` 是一个程序，它只会等待命令行中指定的秒数，在本例中是 1337 秒），就像这样：

```console
hacker@dojo:~$ sleep 1337
```

我们要怎么干掉它呢？
你可以使用 `kill` 命令，并将进程标识符（即 `ps` 命令输出的 `PID`）作为参数传递给它来终止该进程，就像这样：

```console
hacker@dojo:~$ ps -e | grep sleep
 342 pts/0    00:00:00 sleep
hacker@dojo:~$ kill 342
hacker@dojo:~$ ps -e | grep sleep
hacker@dojo:~$
```

现在，是时候终止你的第一个进程了！
在这个挑战中，只要 `/challenge/dont_solve` 还在运行，`/challenge/solve` 就会拒绝执行！
你必须找到 `dont_run` 进程并 `kill` 掉它。
祝你好运。
