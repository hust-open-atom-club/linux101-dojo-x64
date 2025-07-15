尽管使用 `*` 来缩短命令行输入可能很诱人，但这很容易导致错误。
你的通配符可能会扩展到意料之外的文件，而你可能直到 `rm` 命令已经开始运行时才发现！
谁都可能犯这种错误。

一个更安全的替代方案是*Tab 键补全*。
如果你在 shell 中按下 Tab 键，它会尝试推断你想要输入的内容并自动补全。
自动补全功能非常有用，本挑战将探索它在指定文件时的用法。

本挑战已将旗标（flag）复制到了 `/challenge/pwncollege`，你可以随意 `cat` 该文件。
但是你不能手动输入文件名：我们使用了一些非常巧妙的技巧，来确保你*必须*通过 Tab 键补全来指定它。
试试看！

```console
hacker@dojo:~$ ls /challenge
DESCRIPTION.md  pwncollege
hacker@dojo:~$ cat /challenge/pwncollege
cat: /challenge/pwncollege: No such file or directory
hacker@dojo:~$ cat /challenge/pwn<TAB>
pwn.college{HECK YEAH}
hacker@dojo:~$
```

当你按下那个 Tab 键时，文件名就会被扩展，然后你就能读取该文件了。
祝你好运！
