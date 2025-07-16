有时候，你想在通配符匹配中过滤掉某些文件！
幸运的是，`[]` 正好可以帮你做到这一点。
如果方括号内的第一个字符是 `!` 或者（在较新版本的 bash 中是）`^`，那么通配符的匹配逻辑就会反转，此时方括号会匹配所有*未被*列出的字符。
例如：

```console
hacker@dojo:~$ touch file_a
hacker@dojo:~$ touch file_b
hacker@dojo:~$ touch file_c
hacker@dojo:~$ ls
file_a	file_b	file_c
hacker@dojo:~$ echo Look: file_[!ab]
Look: file_c
hacker@dojo:~$ echo Look: file_[^ab]
Look: file_c
hacker@dojo:~$ echo Look: file_[ab]
Look: file_a file_b
```

掌握了这些知识后，请前往 `/challenge/files` 目录，然后用所有不以 `p`、`w` 或 `n` 开头的文件为目标来运行 `/challenge/solve`！

**注意：** 当 `!` 字符不位于 `[]` 通配符的开头时，它在 bash 中有其他的特殊含义，所以如果遇到不符合预期的情况，请记住这一点！`^` 则没有这个问题，但它也与旧版本的 shell 不兼容。
