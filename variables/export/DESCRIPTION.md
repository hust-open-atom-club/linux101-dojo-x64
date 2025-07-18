默认情况下，你在一个 shell 会话中设置的变量是该 shell 进程的局部变量。
也就是说，你运行的其他命令不会继承它们。
你可以通过在自己的 shell 中启动另一个 shell 进程来亲自试验一下，如下所示：

```console
hacker@dojo:~$ VAR=1337
hacker@dojo:~$ echo "VAR is: $VAR"
VAR is: 1337
hacker@dojo:~$ sh
$ echo "VAR is: $VAR"
VAR is: 
```

在上面的输出中，`$` 提示符是 `sh` 的提示符，`sh` 是一个极简的 shell 实现，它作为主 shell 进程的一个*子*进程被启动。
而且它并没有接收到 `VAR` 这个变量！

当然，这完全合乎情理。
你的 shell 变量可能包含敏感或特殊的数据，你不会希望它们泄露给你运行的其他程序——除非你明确希望如此。
那该如何指定哪些变量应该被传递呢？
答案就是*导出*（export）你的变量。
当你导出变量时，它们就会被作为*环境变量*传递给子进程。
你会在其他挑战中遇到环境变量这个概念，但在这里你将能观察到它的效果。
下面是一个例子：

```console
hacker@dojo:~$ VAR=1337
hacker@dojo:~$ export VAR
hacker@dojo:~$ sh
$ echo "VAR is: $VAR"
VAR is: 1337
```

在这里，子 shell 接收到了 VAR 的值，并成功地把它输出了出来！
你也可以将前两行命令合并为一行。

```console
hacker@dojo:~$ export VAR=1337
hacker@dojo:~$ sh
$ echo "VAR is: $VAR"
VAR is: 1337
```

在本次挑战中，你必须在调用 `/challenge/solve` 时，将 `PWN` 变量导出并设置为 `COLLEGE`，同时将 `COLLEGE` 变量设置为 `PWN` 但*不*导出（也就是说，`/challenge/solve` 不会继承它）。
祝你好运！
