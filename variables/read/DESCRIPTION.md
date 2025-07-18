我们先从读取用户（也就是你）的输入开始。
这个操作是通过一个名副其实的内置命令 `read` 来完成的，它的作用就是*读取*输入！

下面是一个使用 `-p` 参数的例子，它能让你指定一个提示符（否则，正在阅读的你可能很难在下面的例子中区分输入和输出）：

```console
hacker@dojo:~$ read -p "INPUT: " MY_VARIABLE
INPUT: Hello!
hacker@dojo:~$ echo "You entered: $MY_VARIABLE"
You entered: Hello!
```

请记住，`read` 是从你的标准输入读取数据的！
在上面，第一个 `Hello!` 是被*输入*的，而不是被*输出*的。
让我们更明确地展示这一点。
在这里，我们在每一行的开头都做了标注，用来说明该行是用户的 `INPUT`（输入）还是给用户的 `OUTPUT`（输出）：

```console
 输入: hacker@dojo:~$ echo $MY_VARIABLE
输出:
 输入: hacker@dojo:~$ read MY_VARIABLE
 输入: Hello!
 输入: hacker@dojo:~$ echo "You entered: $MY_VARIABLE"
输出: You entered: Hello!
```

在本次挑战中，你的任务是使用 `read` 命令，将 `PWN` 变量的值设置为 `COLLEGE`。
祝你好运！
