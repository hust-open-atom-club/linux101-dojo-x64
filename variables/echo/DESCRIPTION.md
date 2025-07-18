我们先从输出变量开始吧。
`/challenge/solve` 这个程序不会，也不能，给你 flag，但这没关系，因为 flag 已经被放进了一个名为 “FLAG” 的变量里！
你只要让 shell 把它输出就行了！

你可以用很多种方法来完成这个任务，但我们先从 `echo` 命令开始。
这个命令的作用就是输出内容。
例如：

```console
hacker@dojo:~$ echo Hello Hackers!
Hello Hackers!
```

你也可以用 `echo` 来输出变量，方法是在变量名前加上一个 `$` 符号。
例如，有一个名为 `PWD` 的变量，它始终保存着当前 shell 所在的工作目录。
你可以像这样把它输出：

```console
hacker@dojo:~$ echo $PWD
/home/hacker
```

现在轮到你了。
让你的 shell 输出 `FLAG` 变量，完成本次挑战吧！
