接下来，我们来学习 `[]`。
方括号本质上是 `?` 的一种受限形式。`?` 匹配任意单个字符，而 `[]` 则是一个通配符，用于匹配在括号内指定的一组字符中的任意一个。
例如，`[pwn]` 将会匹配字符 `p`、`w` 或 `n`。
举个例子：

```console
hacker@dojo:~$ touch file_a
hacker@dojo:~$ touch file_b
hacker@dojo:~$ touch file_c
hacker@dojo:~$ ls
file_a	file_b	file_c
hacker@dojo:~$ echo Look: file_[ab]
Look: file_a file_b
```

来亲自试试吧！
我们在 `/challenge/files` 目录下放置了一些文件。
请将你的工作目录切换到 `/challenge/files`，然后运行 `/challenge/solve`，并为其提供一个单一参数，该参数需要使用方括号通配来匹配到 `file_b`、`file_a`、`file_s` 和 `file_h`！
