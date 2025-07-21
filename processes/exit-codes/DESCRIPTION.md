每个 shell 命令，包括每个程序和每个内建命令，在运行结束并终止时，都会返回一个**退出码**。
shell 或 shell 的用户（也就是你！）可以利用这个退出码来检查进程是否成功完成了其功能（当然，这个判断取决于该进程本身的任务是什么）。

你可以通过特殊的 `?` 变量来获取上一个终止命令的退出码（别忘了在它前面加上 `$` 来读取它的值！）：

```console
hacker@dojo:~$ touch test-file
hacker@dojo:~$ echo $?
0
hacker@dojo:~$ touch /test-file
touch: cannot touch '/test-file': Permission denied
hacker@dojo:~$ echo $?
1
hacker@dojo:~$
```

如你所见，成功执行的命令通常返回 `0`，而执行失败的命令通常返回一个非零值，最常见的是 `1`，但有时也会是其他能标识特定失败模式的错误码。

在这个挑战中，你必须获取 `/challenge/get-code` 返回的退出码，然后运行 `/challenge/submit-code`，并将该退出码作为参数传递给它。
祝你好运！
