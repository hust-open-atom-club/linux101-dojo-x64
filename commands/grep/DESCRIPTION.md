有时候，你可能需要 `cat` 的文件太大了。
幸运的是，我们有 `grep` 命令来搜索我们需要的内容！
在这个挑战中，我们将学习如何使用它。

有很多方法可以使用 `grep`，在这里我们将学习一种：

```console
hacker@dojo:~$ grep SEARCH_STRING /path/to/file
```

这样调用 `grep` 会在文件中搜索包含 `SEARCH_STRING` 的文本行，并将它们打印到控制台中。

在这个挑战中，我在 `/challenge/data.txt` 文件中放入了十万行的文本。
使用 `grep` 来查找flag吧！

提示：flag总是以 `pwn.hust.college` 开头。
