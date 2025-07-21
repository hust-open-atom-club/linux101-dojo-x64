有时候，你会想要提取数据的特定列，比如第一列、第三列，或者第 42 列。
为此，我们有 `cut` 命令。

例如，假设你有如下的数据文件：

```console
hacker@dojo:~$ cat scores.txt
hacker 78 99 67
root 92 43 89
hacker@dojo:~$
```

你可以使用 `cut` 来提取特定的列：

```console
hacker@dojo:~$ cut -d " " -f 1 scores.txt
hacker
root
hacker@dojo:~$ cut -d " " -f 2 scores.txt
78
92
hacker@dojo:~$ cut -d " " -f 3 scores.txt
99
43
hacker@dojo:~$
```

`-d` 参数用于指定列的*分隔符*（delimiter），即列与列之间是如何分隔的。
在本例中，它是一个空格字符。
当然，在这里它必须用引号括起来，这样 shell 才能知道这个空格本身是一个参数，而不是一个用来分隔其他参数的空格！
`-f` 参数用于指定*字段*（field）编号，即要提取哪一列。

在本次挑战中，`/challenge/solve` 程序会输出许多行，每行都由随机数和单个字符（即 flag 的字符）作为列组成。
请使用 `cut` 提取出 flag 字符，然后（就像上一关那样！）通过管道将它们传递给 `tr -d "\n"`，从而将它们拼接成单一行。
你的解决方案看起来会像这样：`/challenge/solve | cut ??? | tr ???`，你需要将 `???` 的部分补充完整。
