你也可以使用 `mv` 命令来移动文件。
用法很简单：

```console
hacker@dojo:~$ ls
my-file
hacker@dojo:~$ cat my-file
PWN!
hacker@dojo:~$ mv my-file your-file
hacker@dojo:~$ ls
your-file
hacker@dojo:~$ cat your-file
PWN!
hacker@dojo:~$
```

本次挑战要求你将 `/flag` 文件移动到 `/tmp/hack-the-planet` 目录中（动手吧）！
完成后，请运行 `/challenge/solve`，该程序会检查你的操作，然后把 `flag` 交给你。
