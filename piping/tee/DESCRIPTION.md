当你用管道将数据从一个命令传递给另一个时，这些数据自然就不会再显示在你的屏幕上了。
但这并不总是我们想要的结果：例如，你可能想在调试意外状况（比如，“为什么第二个命令没成功？？？”）时，能看到数据在命令之间流动的情况。

幸运的是，我们有一个解决方案！它就是 `tee` 命令。它的名字来源于*水管工程*中的“T 型三通管”（T-splitter），它能将流经管道的数据复制到命令行上指定的任意多个文件中。
例如：

```console
hacker@dojo:~$ echo hi | tee pwn college
hi
hacker@dojo:~$ cat pwn
hi
hacker@dojo:~$ cat college
hi
hacker@dojo:~$
```

如你所见，通过给 `tee` 提供两个文件名，我们最终得到了三份管道中的数据：一份输出到了 stdout（标准输出），一份存入了 `pwn` 文件，还有一份存入了 `college` 文件。
你可以想象一下，当事情出乱子时，要如何利用它来进行调试：

```console
hacker@dojo:~$ command_1 | command_2
Command 2 failed!
hacker@dojo:~$ command_1 | tee cmd1_output | command_2
Command 2 failed!
hacker@dojo:~$ cat cmd1_output
Command 1 failed: must pass --succeed!
hacker@dojo:~$ command_1 --succeed | command_2
Commands succeeded!
```

现在，你来试试！
本关要求必须将 `/challenge/pwn` 的输出通过管道传递给 `/challenge/college`，但你需要中途截获数据，才能看到 `pwn` 程序需要你提供什么信息！
