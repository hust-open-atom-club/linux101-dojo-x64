好吧，Zardus 学乖了！
他不再共享家目录了：尽管便利性降低了，Zardus 已经改用共享 `/tmp/collab` 目录。他把那个目录设置成了对所有人可写，并开始创建了一个要记住的邪恶命令列表！

```console
zardus@dojo:~$ mkdir /tmp/collab
zardus@dojo:~$ chmod a+w /tmp/collab
zardus@dojo:~$ echo "rm -rf /" > /tmp/collab/evil-commands.txt
```

在这个挑战中，当你运行 `/challenge/victim` 时，Zardus 会将 `cat /flag` 添加到那个命令列表中：

```console
hacker@dojo:~$ /challenge/victim

Username: zardus
Password: **********
zardus@dojo:~$ echo "cat /flag" >> /tmp/collab/evil-commands.txt
zardus@dojo:~$ exit
logout

hacker@dojo:~$
```

回顾一下上一关，由于 `hacker` 用户对 `/tmp/collab` 拥有写权限，他可以替换掉那个 `evil-commands.txt` 文件。同时，也回想一下[深入理解命令](./commands)模块的内容，文件可以*链接*到其他文件。如果 `hacker` 将 `evil-commands.txt` 替换为一个指向某个 Zardus 可以写入的敏感文件的符号链接，会发生什么呢？混乱和花样玩法！

你*知道*要链接到哪个文件。实施这次攻击，并获取 `/flag` 吧（在这一关里，Zardus 又可以读取这个文件了！）。

----
**提示：**
你需要运行 `/challenge/victim` 两次：一次是为了让 `cat /flag` 被写入你想要的地方，另一次是为了触发它！

**`/tmp` 目录使用起来危险吗？？？**
尽管这里展示了这种攻击，`/tmp` 目录是可以安全使用的。这个目录*确实是对所有人可写的*，但它设置了一个特殊的权限位：

```console
hacker@dojo:~$ ls -ld /tmp
drwxrwxrwt 29 root root 1056768 Jun  6 14:06 /tmp
hacker@dojo:~$
```

末尾的那个 `t` 位就是*粘滞位*（sticky bit）。粘滞位意味着该目录只允许文件的所有者重命名或删除目录中的文件。它就是为了防止这种攻击而设计的！当然，本挑战中的问题在于，Zardus 没有在 `/tmp/collab` 上启用粘滞位。在目前这个特定情况下，这样做本可以堵上这个漏洞：

```console
zardus@dojo:~$ chmod +t /tmp/collab
```

当然，像对所有人可写的目录这样的共享资源仍然是危险的。
