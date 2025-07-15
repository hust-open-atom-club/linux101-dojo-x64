输出重定向的一个常见用途，就是保存命令的执行结果，以供后续分析。通常，你会想要*汇总*处理：运行一系列命令，保存它们的输出，之后再用 `grep` 进行搜索。在这种情况下，你可能希望将所有输出都持续追加到同一个文件中。但 `>` 每次都会创建一个新的输出文件，并覆盖掉旧的内容。

你可以使用 `>>` 来代替 `>`，以*追加*模式重定向输出，如下所示：

```console
hacker@dojo:~$ echo pwn > outfile
hacker@dojo:~$ echo college >> outfile
hacker@dojo:~$ cat outfile
pwn
college
hacker@dojo:$
```

为了练习，请运行 `/challenge/solve`，并使用追加模式将它的输出重定向到 `/home/hacker/the-flag` 文件。该练习程序会先将flag的前半部分写入文件，随后，如果 `stdout` 被重定向，它会将后半部分也输出到 `stdout`。如果你正确地使用了追加模式重定向，那么后半部分就会被追加到前半部分的后面。但如果你使用了*截断*模式（`>`），后半部分就会*覆盖*掉前半部分，这样你就拿不到flag了！

现在开始吧！
