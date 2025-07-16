我们首先要学习的通配符是 `*`。
当 shell 在任何参数中遇到 `*` 字符时，它会将其视为一个“通配符”，并尝试用所有匹配该模式的文件名来替换这个参数。
用实例演示比口头解释要容易得多：

```console
hacker@dojo:~$ touch file_a
hacker@dojo:~$ touch file_b
hacker@dojo:~$ touch file_c
hacker@dojo:~$ ls
file_a	file_b	file_c
hacker@dojo:~$ echo Look: file_*
Look: file_a file_b file_c
```

当然，虽然在上面的例子中，通配符匹配并扩展成了多个参数，但它同样也可以只匹配一个文件。
例如：

```console
hacker@dojo:~$ touch file_a
hacker@dojo:~$ ls
file_a
hacker@dojo:~$ echo Look: file_*
Look: file_a
```

当没有文件匹配时，在默认情况下，shell 会保留通配符本身，不做任何改变：

```console
hacker@dojo:~$ touch file_a
hacker@dojo:~$ ls
file_a
hacker@dojo:~$ echo Look: nope_*
Look: nope_*
```

`*` 可以匹配文件名中的任意部分，但有两个例外：它不会匹配路径分隔符 `/`，也不会匹配文件名开头的小数点 `.`。
例如：

```console
hacker@dojo:~$ echo ONE: /ho*/*ck*
ONE: /home/hacker
hacker@dojo:~$ echo TWO: /*/hacker
TWO: /home/hacker
hacker@dojo:~$ echo THREE: ../*
THREE: ../hacker
```

现在，亲自动手练习一下吧！
请从你的家目录开始，将当前目录切换到 `/challenge`。在操作时，请使用通配符，以确保你传递给 `cd` 命令的参数最多不超过四个字符！
成功进入该目录后，运行 `/challenge/solve` 来获取 `flag` ！
