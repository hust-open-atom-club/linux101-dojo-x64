Linux 文件系统中有许多目录，每个目录中包含大量文件。你可以使用 `cd`（**c**hange **d**irectory）命令并传递路径作为参数来在目录间切换，如下所示：

```bash
hacker@dojo:~$ cd /some/new/directory
hacker@dojo:/some/new/directory$
```

这个命令会影响进程的“当前工作目录”。每个进程都有一个它当前所在的目录，稍后你会理解这一点。

顺便提一下，现在你可以理解提示符中的 `~` 是什么了！它显示的是你的 shell 当前所在的目录，也是当前用户的家目录。关于家目录，我们后续会专门解释。

这个挑战要求你从指定的路径执行 `/challenge/solve` 程序（系统会告诉你具体路径）。你需要先使用 `cd` 切换到那个目录，然后重新运行挑战程序。

祝你好运！