接下来，我们来学习 `?`。
当 shell 在任何参数中遇到 `?` 字符时，它会将其视为一个**单字符**通配符。
它的作用和 `*` 类似，但只匹配*一个*字符。
例如：

```console
hacker@dojo:~$ touch file_a
hacker@dojo:~$ touch file_b
hacker@dojo:~$ touch file_cc
hacker@dojo:~$ ls
file_a	file_b	file_cc
hacker@dojo:~$ echo Look: file_?
Look: file_a file_b
hacker@dojo:~$ echo Look: file_??
Look: file_cc
```

现在，亲自动手练习一下吧！
从你的家目录开始，将当前目录切换到 `/challenge`，但在给 `cd` 命令的参数中，请用 `?` 字符来代替 `c` 和 `l`！
成功进入该目录后，运行 `/challenge/solve` 来获取 `flag` ！
