我们可以创建文件。
那么，目录呢？
你可以使用 `mkdir` 命令来**创**建**目**录。
然后你可以把文件放进去！

以下为示例：


```console
hacker@dojo:~$ cd /tmp
hacker@dojo:/tmp$ ls
hacker@dojo:/tmp$ ls
hacker@dojo:/tmp$ mkdir my_directory
hacker@dojo:/tmp$ ls
my_directory
hacker@dojo:/tmp$ cd my_directory
hacker@dojo:/tmp/my_directory$ touch my_file
hacker@dojo:/tmp/my_directory$ ls
my_file
hacker@dojo:/tmp/my_directory$ ls /tmp/my_directory/my_file
/tmp/my_directory/my_file
hacker@dojo:/tmp/my_directory$
```

现在，去创建一个 `/tmp/pwn` 目录，并在其中创建一个 `college` 文件！
然后运行 `/challenge/solve`，它会检查你的解决方案并给你flag！
