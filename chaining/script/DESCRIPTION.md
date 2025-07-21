随着你组合越来越多的命令以实现复杂的效果，这串合并后的命令很快就会变得非常冗长，处理起来也很麻烦。
当这种情况发生时，你可以将这些命令放入一个文件，这个文件被称为*shell脚本*，然后通过执行该文件来运行这些命令！
例如，我们来看看之前用分号的方法：

```console
hacker@dojo:~$ echo COLLEGE > pwn; cat pwn
COLLEGE
hacker@dojo:~$
```

我们可以创建一个名为 `pwn.sh` 的 shell 脚本（按照惯例，shell 脚本文件通常以 `sh` 为后缀命名）：

```sh
echo COLLEGE > pwn
cat pwn
```

然后我们就可以通过把它作为一个参数传递给 shell（`bash`）的一个新实例来执行它！
当 shell 以这种方式被调用时，它不会从用户那里接收命令，而是从文件中读取命令。

```console
hacker@dojo:~$ ls
hacker@dojo:~$ bash pwn.sh
COLLEGE
hacker@dojo:~$ ls
pwn
hacker@dojo:~$
```

你可以看到，这个 shell 脚本执行了两条命令，创建并打印了 `pwn` 文件。

现在，轮到你了！
和上一关一样，你需要先运行 `/challenge/pwn`，然后运行 `/challenge/college`，但这一次要在一个名为 `x.sh` 的 shell 脚本中完成，然后用 `bash` 来运行它！

---
**注意：** 我们还没有讨论过 Linux 提供的那些功能强大的命令行文件编辑器。
目前，你可以随意使用桌面模式下的 `Text Editor` 应用程序（`Applications->Accessories->Text Editor`）或 VSCode 工作区中的默认编辑器！
