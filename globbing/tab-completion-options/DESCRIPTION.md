请思考以下情况：

```console
hacker@dojo:~$ ls
flag  flamingo  flowers
hacker@dojo:~$ cat f<TAB>
```

这里有多个选项！
会发生什么呢？

具体会发生什么，取决于所使用的 shell 及其选项。
默认情况下，`bash` 会自动补全到出现多个选项的分歧点为止（在上面这个例子里，就是补全到 `fl`）。
当你*第二次*按 Tab 键时，它就会列出所有这些选项。
而其他的 shell 或配置，则可能会在这些选项之间循环切换。

本挑战在 `/challenge/files` 目录中放置了一些以 `pwncollege` 开头的文件。
请从输入 `/challenge/files/p` 之类的路径开始，使用 Tab 键补全，一路找到flag！

