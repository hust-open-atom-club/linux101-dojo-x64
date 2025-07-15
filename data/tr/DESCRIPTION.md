管道传输数据的目的之一就是为了_修改_它。
许多 Linux 命令都可以帮助你以非常酷的方式修改数据。
其中一个就是 `tr`，它的作用是`tr`anslate（转换）从标准输入接收的字符，并将其打印到标准输出。

在其最基本的用法中，`tr` 会将第一个参数中提供的字符转换为第二个参数中提供的字符：

```console
hacker@dojo:~$ echo OWN | tr O P
PWN
hacker@dojo:~$
```

它也能处理多个字符，第一个参数中不同位置的字符，会被替换为第二个参数中相应位置的字符。

```console
hacker@dojo:~$ echo PWM.COLLAGE | tr MA NE
PWN.COLLEGE
hacker@dojo:~$
```

现在，你来试试吧！
在这一关中，`/challenge/solve` 会打印出 flag，但它会调换所有字符的大小写（例如，`A` 会变成 `a`，反之亦然）。
你能用 `tr` 把它复原并获取 flag 吗？
