好吧，Zardus 学乖了——他干嘛会把 `.bashrc` 设置成可写的呢？
但一个更常见的情景是，同一个系统上的用户为了方便协作，会把他们的家目录设置成*对所有人可写*。这有什么问题呢？

问题在于 Linux 文件/目录权限的一个微妙之处：任何对目录拥有写权限的人，都可以*移动*和*删除*其中的文件。
例如，假设 Zardus 有一个用于协作的、对所有人可写的目录：

```console
zardus@dojo:~$ mkdir /tmp/collab
zardus@dojo:~$ chmod a+w /tmp/collab
zardus@dojo:~$ echo "do pwn.college" > /tmp/collab/todo-list
```

然后一个黑客来了，做了以下操作，*尽管他并不拥有 `todo-list` 文件*！

```console
hacker@dojo:~$ ls -l /tmp/collab/todo-list
-rw-r--r-- 1 zardus zardus 15 Jun  6 13:12 /tmp/collab/todo-list
hacker@dojo:~$ rm /tmp/collab/todo-list
rm: remove write-protected regular file '/tmp/collab/todo-list'? y
hacker@dojo:~$ echo "send hacker money" > /tmp/collab/todo-list
hacker@dojo:~$ ls -l /tmp/collab/todo-list
-rw-r--r-- 1 hacker hacker 18 Jun  6 13:12 /tmp/collab/todo-list
hacker@dojo:~$
```

这可能看起来有些反直觉：`hacker` 对 `todo-list` 文件没有写权限，但最终结果是他们可以更改其内容。
但你可以这样理解：文件与目录的关联信息（比如文件名）最终是存储在目录本身里的，而对该目录拥有写权限的用户就可以操作这些关联信息。
当然，当重要的目录对所有人可写时，这自然会带来安全隐患。

在这个挑战中，为了方便，Zardus 开放了他家目录的权限：

```console
zardus@dojo:~$ chmod a+w /home/zardus
```

如你所知，那个目录里有很多敏感文件，*_比如 `.bashrc`_*！
你能通过对 `/home/zardus` 的写权限（而不是直接对 `/home/zardus/.bashrc` 的写权限）来复现之前的攻击吗？
