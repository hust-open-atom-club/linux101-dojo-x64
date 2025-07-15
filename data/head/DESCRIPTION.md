在你的 Linux 学习之旅中，你会遇到一些情况，需要从输出内容非常冗长的程序中，只抓取其开头的输出。
为此，你就会用到 `head`！
`head` 命令用于显示其输入的前几行：

```console
hacker@dojo:~$ cat /something/very/long | head
this
is
just
the
first
ten
lines
of
the
file
hacker@dojo:~$
```

默认情况下，它会显示前 10 行，但你可以使用 `-n` 选项来控制显示的行数：

```console
hacker@dojo:~$ cat /something/very/long | head -n 2
this
is
hacker@dojo:~$
```

本次挑战的 `/challenge/pwn` 会输出大量数据，你需要将其通过管道传给 `head` 来抓取前 7 行，接着再将结果通过管道传给 `/challenge/college`，如果操作正确，它就会给你 flag！
你的解决方案将会是一个复合命令，用*两个*管道连接起三个命令。
祝你好运！
