本模块将带你了解 Linux 权限，这是你接下来学习之旅中最重要的内容之一。

在 Linux 中，文件拥有不同的权限或文件模式。你可以使用 `ls -l` 命令来查看文件或目录的权限。
让我们创建一些文件，并查看它们的权限：

```console
hacker@dojo:~$ mkdir pwn_directory
hacker@dojo:~$ touch college_file
hacker@dojo:~$ ls -l
total 4
-rw-r--r-- 1 hacker hacker    0 May 22 13:42 college_file
drwxr-xr-x 2 hacker hacker 4096 May 22 13:42 pwn_directory
hacker@dojo:~$
```

这里包含了很多信息，我们将在本模块中学习其中的大部分内容！
现在，让我们从宏观层面看一下上面的输出：

#### 文件类型

每一行的第一个字符代表文件类型。
以 `pwn_directory` 为例，`d` 表示它是一个目录；以 `college_file` 为例，`-` 代表它是一个普通文件。
此外还有其他类型，你会在后续学习中遇到其中一些。

#### 权限

接下来的九个字符是实际的文件或目录访问权限。它们被分为三组：前3个字符表示文件所有者（termed the "owner"）的权限，中间3个字符表示文件所属组（termed the "group"）的权限，最后3个字符表示所有其他访问（例如，其他用户和其他组）的权限。
我们将在本模块的后续部分详细学习所有这些内容。

#### 所有权信息

有两列显示了文件的所有者（本例中是用户 `hacker`）以及文件所属的组（本例中也是 `hacker` - 组）。
你将在这里实际操作一下！

----

在本模块中，你将练习如何识别权限。
让我们开始吧！
