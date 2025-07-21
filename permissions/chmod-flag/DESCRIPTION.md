好了，我们现在已经精通了所有权。让我们来谈谈另一方面：文件权限。
回顾一下我们的例子：

```console
hacker@dojo:~$ mkdir pwn_directory
hacker@dojo:~$ touch college_file
hacker@dojo:~$ ls -l
total 4
-rw-r--r-- 1 hacker hacker    0 May 22 13:42 college_file
drwxr-xr-x 2 hacker hacker 4096 May 22 13:42 pwn_directory
hacker@dojo:~$
```

提醒一下，那里的第一个字符是文件类型。
接下来的九个字符是文件或目录的实际访问权限，它们被分为三组：3个字符表示所有者用户的权限（现在你懂这个了！），3个字符表示所属组的权限（现在你也懂这个了！），还有3个字符表示所有其他访问（例如，其他用户和其他组）对文件的权限。

这三个字符中的每一个都代表一种不同类型的权限：

```
r - 用户/组/其他可以读取文件（或列出目录内容）
w - 用户/组/其他可以修改文件（或在目录中创建/删除文件）
x - 用户/组/其他可以作为程序执行文件（或可以进入目录，例如使用 `cd`）
- - 无权限
```

对于上面的 `college_file`，其权限条目 `rw-r--r--` 解码如下：

-   `r`: 文件的所有者用户（`hacker` 用户）可以读取它
-   `w`: 文件的所有者用户（`hacker` 用户）可以写入它
-   `-`: 文件的所有者用户（`hacker` 用户）*不能*执行它
-   `r`: 文件所属组（`hacker` 组）的成员可以读取它
-   `-`: 文件所属组（`hacker` 组）的成员*不能*写入它
-   `-`: 文件所属组（`hacker` 组）的成员*不能*执行它
-   `r`: 所有其他用户可以读取它
-   `-`: 所有其他用户*不能*写入它
-   `-`: 所有其他用户*不能*执行它

现在，我们来看看 `/flag` 的默认权限：

```console
hacker@dojo:~$ ls -l /flag
-r-------- 1 root root 53 Jul  4 04:47 /flag
hacker@dojo:~$
```

在这里，只设置了一个权限位：所有者用户（本例中是 `root`）的 `r`ead（读取）权限。
所属组（`root` 组）的成员以及所有其他用户都无权访问此文件。

你可能想知道，如果文件没有组访问权限，那之前的 `chgrp` 关卡是怎么通过的。
嗯，在那些关卡中，我设置了不同的权限：

```console
hacker@dojo:~$ ls -l /flag
-r--r----- 1 root root 53 Jul  4 04:47 /flag
hacker@dojo:~$
```

组有访问权限！这就是为什么通过 `chgrp` 更改文件所属组后你就能读取文件的原因。

总之！和所有权一样，文件权限也是可以更改的。
这通过 `chmod` (**ch**ange **mod**e，更改模式）命令来完成。
`chmod` 的基本用法是：

```
chmod [选项] 模式 文件
```

你可以用两种方式指定`模式`（MODE）：一种是修改现有权限模式，另一种是使用一个全新的模式覆盖旧的。

在本关卡中，我们将介绍前一种：修改现有模式。
`chmod` 允许你使用 `WHO`+/-`WHAT` 的模式格式来调整权限，其中 `WHO` 指的是用户（user）/组（group）/其他（other），而 `WHAT` 指的是读（read）/写（write）/执行（execute）。
例如，要为所有者*用户*添加*读取*权限，你可以指定模式为 `u+r`。
为`g`roup（组）和`o`ther（其他）（或`a`ll，所有模式）指定`w`rite（写）和e`x`ecute（执行）权限的方式也是一样的。
更多例子：

-   `u+r`，如上所述，为用户权限添加读取权限
-   `g+wx` 为组权限添加写入和执行权限
-   `o-w` *移除*其他用户的写入权限
-   `a-rwx` 移除用户、组和所有其他人的所有权限

所以：

```console
root@dojo:~# mkdir pwn_directory
root@dojo:~# touch college_file
root@dojo:~# ls -l
total 4
-rw-r--r-- 1 root root    0 May 22 13:42 college_file
drwxr-xr-x 2 root root 4096 May 22 13:42 pwn_directory
root@dojo:~# chmod go-rwx *
root@dojo:~# ls -l
total 4
-rw------- 1 hacker root    0 May 22 13:42 college_file
drwx------ 2 root   root 4096 May 22 13:42 pwn_directory
root@dojo:~#
```

在这个挑战中，你必须更改 `/flag` 文件的权限才能读取它！
通常，你需要对文件有写入权限才能更改其权限，但在本关卡中，我已经让 `chmod` 命令变得无所不能，即使你是 `hacker` 用户，你也可以对任何你想要的东西使用 `chmod`。这是一种终极力量。
`/flag` 文件归 root 所有，这一点你无法改变，但你可以让它变得可读。
去解决它吧！
