首先，我们来看看如何将 stdout（标准输出）重定向到文件。
你可以通过 `>` 字符来实现这一点，如下所示：

```console
hacker@dojo:~$ echo hi > asdf
```

这会将 `echo hi` 的输出（也就是 `hi`）重定向到 `asdf` 文件。
然后，你可以使用像 `cat` 这样的程序来输出这个文件的内容：

```console
hacker@dojo:~$ cat asdf
hi
```

在这个挑战中，你必须使用这种输出重定向，将单词 `PWN`（全大写）写入到名为 `COLLEGE`（全大写）的文件中。
