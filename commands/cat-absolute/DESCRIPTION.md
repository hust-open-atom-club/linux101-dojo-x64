在上一关，你使用了 `cat flag` 从你的主目录中读取旗标！
当然，你也可以将 `cat` 的参数指定为绝对路径：

```console
hacker@dojo:~$ cat /challenge/DESCRIPTION.md
在上一关，你使用了 `cat flag` 从你的主目录中读取flag！
当然，你也可以将 `cat` 的参数指定为绝对路径：
...
```

在这个目录中，我不会将它复制到你的主目录，但我会让它可读。 
你可以通过绝对路径 '/flag' 使用 'cat' 来读取它。

----
*有趣的事实：* 
'/flag' 是 pwn.hust.college 中 flag _总是_存在的地方，但与本次挑战不同，你通常无法直接访问该文件。
