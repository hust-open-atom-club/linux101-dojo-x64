链接命令最简单的方法是使用 `;`。
在大多数情况下，`;` 分隔命令的方式与按“回车键”分隔多行的方式类似。
所以，下面这样：

```console
hacker@dojo:~$ echo COLLEGE > pwn
hacker@dojo:~$ cat pwn
COLLEGE
hacker@dojo:~$
```

和下面这样大致相同：

```console
hacker@dojo:~$ echo COLLEGE > pwn; cat pwn
COLLEGE
hacker@dojo:~$
```

基本上，当你按下回车键时，你的 shell 会执行你输入的命令，并在该命令结束后，显示提示符让你输入另一条命令。
分号的作用与此类似，只是它不会显示提示符，而且你是在任何命令被执行之前就输入了所有命令。

现在就来试试吧！在这一关中，你必须先运行 `/challenge/pwn`，然后运行 `/challenge/college`，并用分号将它们链接起来。
