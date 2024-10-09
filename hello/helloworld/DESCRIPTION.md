让我们尝试一些更复杂的内容：带有 _参数_ 的命令，也就是传递给命令的附加数据。

当你输入一行文本并按下回车键时，shell 实际上会将你的输入解析为一个命令及其 _参数_ 。
第一个单词是命令，后续的单词是参数。
观察以下示例：

```console
hacker@dojo:~$ echo Hello
Hello
hacker@dojo:~$
```

在这个例子中，命令是 `echo`，参数是 `Hello`。
`echo` 是一个简单的命令，它会将所有参数“回显”到终端，如上面的会话所示。

让我们再看看带有多个参数的 `echo`：

```console
hacker@dojo:~$ echo Hello Hackers!
Hello Hackers!
hacker@dojo:~$
```

在这个例子中，命令是 `echo`，`Hello` 和 `Hackers!` 是传递给 `echo` 的两个参数。
很简单！

在本挑战中，要获得 flag，你必须运行 `hello` 命令（而不是 `echo` 命令），并传递一个参数 `hackers`。
现在试试看吧！