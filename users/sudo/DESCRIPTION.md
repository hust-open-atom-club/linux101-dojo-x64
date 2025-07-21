在以前，典型的 Linux 系统会设置一个 root 密码，管理员在用自己的普通账户密码登录后，会使用这个 root 密码通过 `su` 命令切换到 root 用户。
但是 root 密码维护起来很麻烦，它们（或它们的哈希值！）可能会泄露，而且它们不适用于大型环境（例如，服务器集群）。
为了解决这个问题，近几十年来，世界已经从通过 `su` 进行管理转向了通过 `sudo` (**su**peruser **do**) 进行管理。

与 `su` 不同，`su` 默认是为指定用户启动一个 shell，而 `sudo` 默认是以 root 身份运行一条命令：

```console
hacker@dojo:~$ whoami
hacker
hacker@dojo:~$ sudo whoami
root
hacker@dojo:~$
```

或者，一个与获取 flag 更相关的例子：

```console
hacker@dojo:~$ grep hacker /etc/shadow
grep: /etc/shadow: Permission denied
hacker@dojo:~$ sudo grep hacker /etc/shadow
hacker:$6$Xro.e7qB3Q2Jl2sA$j6xffIgWn9xIxWUeFzvwPf.nOH2NTWNJCU5XVkPuONjIC7jL467SR4bXjpVJx4b/bkbl7kyhNquWtkNlulFoy.:19921:0:99999:7:::
hacker@dojo:~$
```

与依赖密码认证的 `su` 不同，`sudo` 通过检查策略来确定用户是否有权限以 root 身份运行命令。
这些策略定义在 `/etc/sudoers` 文件中，尽管详细介绍它超出了我们这里的范围，但有很多[资源](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file)可以学习相关内容！

所以，世界已经转向使用 `sudo`，并且（在系统管理方面）抛弃了 `su`。
实际上，就连 pwn.hust.college 的练习模式也是通过赋予你 `sudo` 权限来让你提升权限的！

在这一关中，我们将给予你 `sudo` 权限，你需要用它来读取 flag。
轻松愉快！
