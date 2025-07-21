到目前为止，你主要接触的都是**读取**权限。
这很合理，因为你一直都在想办法让 `/flag` 文件变得可读，以便读取它。
在本关卡中，我们将探讨**执行**权限。

当你调用一个程序时，比如 `/challenge/solve`，只有当你对该程序文件拥有执行权限，Linux 才会真正地执行它。
请看：

```console
hacker@dojo:~$ ls -l /challenge/solve
-rwxr-xr-x 1 root root    0 May 22 13:42 /challenge/solve
hacker@dojo:~$ /challenge/solve
Successfully ran the challenge!
hacker@dojo:~$
```

在这种情况下，`/challenge/solve` 能够运行，是因为 `hacker` 用户对它有执行权限。
由于该文件归 `root` 用户和 `root` 组所有，这就要求在**其他（other）**用户的权限上设置了执行位。
如果我们移除了这些权限，执行就会失败！

```console
hacker@dojo:~$ chmod o-x /challenge/solve
hacker@dojo:~$ ls -l /challenge/solve
-rwxr-xr-- 1 root root    0 May 22 13:42 /challenge/solve
hacker@dojo:~$ /challenge/solve
bash: /challenge/solve: Permission denied
hacker@dojo:~$
```

在这个挑战中，`/challenge/solve` 程序会给你 flag，但你必须先让它变得可执行！
记住你的 `chmod` 命令，让 `/challenge/solve` 告诉你 flag 吧！
