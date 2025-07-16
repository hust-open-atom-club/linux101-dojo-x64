通配是基于*路径*的，所以你可以用你的通配参数来扩展整个路径。
例如：

```console
hacker@dojo:~$ touch file_a
hacker@dojo:~$ touch file_b
hacker@dojo:~$ touch file_c
hacker@dojo:~$ ls
file_a	file_b	file_c
hacker@dojo:~$ echo Look: /home/hacker/file_[ab]
Look: /home/hacker/file_a /home/hacker/file_b
```

现在轮到你了。
我们又一次在 `/challenge/files` 目录下放置了一些文件。
请从你的家目录开始，运行 `/challenge/solve`，并提供一个单一参数，该参数需要通过方括号通配，最终扩展为 `file_b`、`file_a`、`file_s` 和 `file_h` 这几个文件的绝对路径！
