在使用 shell 的过程中，你经常会想要把某个命令的输出存储到一个变量里。
幸运的是，shell 使用一种叫做[命令替换 (Command Substitution)](https://www.gnu.org/software/bash/manual/html_node/Command-Substitution.html) 的功能，让这件事变得相当简单！
请看：

```console
hacker@dojo:~$ FLAG=$(cat /flag)
hacker@dojo:~$ echo "$FLAG"
pwn.college{blahblahblah}
hacker@dojo:~$
```

很酷吧！
现在，你来练习一下。
将 `/challenge/solve` 命令的输出直接读取到一个名为 `PWN` 的变量中，这个变量就会包含 flag！

----
**小知识：**
你也可以使用反引号 (`` ` ``) 来代替 `$()`：在上面的例子中，你可以写成 `` FLAG=`cat /flag` ``，而不是 `FLAG=$(cat /flag)`。
这是一种比较旧的格式，并且有一些缺点（例如，想象一下，如果你想*嵌套*使用命令替换。你要怎么用反引号来实现 `$(cat $(find / -name flag))` 这样的操作呢？）。
pwn.college 的官方立场是，你应该使用 `$(blah)` 的形式，而不是 `` `blah` ``。
