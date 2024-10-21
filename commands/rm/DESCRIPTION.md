文件随处可见。
就像熵增定律那样，最终会有太多杂乱文件。
在这一关，我们将学习如何清理！

在 Linux 中，你可以使用 `rm` 命令来**r**e**m**ove**文件，如下所示：


```console
hacker@dojo:~$ touch PWN
hacker@dojo:~$ touch COLLEGE
hacker@dojo:~$ ls
COLLEGE     PWN
hacker@dojo:~$ rm PWN
hacker@dojo:~$ ls
COLLEGE
hacker@dojo:~$
```

让我们来练习。
这一关将会在你的家目录中创建一个 `delete_me` 文件！
删除它，然后运行 `/challenge/solve`，这将确保你已删除该文件，并给你提供标志！
