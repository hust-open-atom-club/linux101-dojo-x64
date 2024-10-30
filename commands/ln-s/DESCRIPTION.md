如果你在 Linux上工作了一段时间，你最终会遇到以下情况：你想让两个程序访问相同的数据，但这两个程序期望数据位于不同的位置。
幸运的是，Linux 提供了解决这个问题的方法：_链接_。

链接有两种类型：_硬链接_和_软链接_（也称为_符号链接_）。
我们可以用一个比喻来区分这两者：

- **硬链接** 就像你用多个地址来描述你的公寓，这些地址都指向同一个地方（例如，`501` 和 `五楼第一个房间`）。
- **软链接** 就像你搬家后，邮局会自动将寄往旧地址的邮件从旧地址转发到新地址（前提是你有通知他们）。

在文件系统中，文件从概念上讲是一个存储内容的地址。
硬链接是一个替代地址，它索引那些数据——访问硬链接和访问原始文件是完全相同的，因为它们都是立即返回必要的数据。
而软链接/符号链接则包含原始文件的名称。
当你访问符号链接时，Linux 会意识到这是一个符号链接，读取原始文件名，然后（通常）自动访问该文件。
在大多数情况下，这两种情况都会访问原始数据，但机制不同。

硬链接对大多数人来说听起来更简单，但它们有各种缺点和实现问题，这使得软链接/符号链接成为更受欢迎的选择。

在这个挑战中，我们将学习符号链接（_symlinks_）。
符号链接使用 `ln` 命令与 `-s` 参数创建，如下所示：

```console
hacker@dojo:~$ cat /tmp/myfile
This is my file!
hacker@dojo:~$ ln -s /tmp/myfile /home/hacker/ourfile
hacker@dojo:~$ cat ~/ourfile
This is my file!
hacker@dojo:~$
```

你可以看到，访问符号链接会返回原始文件的内容！
此外，你还可以看到 `ln -s` 的用法。
请注意，在命令中，原始文件路径在链接路径之前！

符号链接可以通过几种方法识别。例如，`file` 命令可以告诉你文件的类型，它会识别符号链接：

```console
hacker@dojo:~$ file /tmp/myfile
/tmp/myfile: ASCII text
hacker@dojo:~$ file ~/ourfile
/home/hacker/ourfile: symbolic link to /tmp/myfile
hacker@dojo:~$
```

现在轮到你了！
在这一关，flag依然在 `/flag`，但是 `/challenge/catflag` 会读取 `/home/hacker/not-the-flag`。
使用符号链接，让它给你带来 flag！

