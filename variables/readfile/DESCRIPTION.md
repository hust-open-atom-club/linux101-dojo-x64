通常，当 shell 用户想把一个文件的内容读取到环境变量中时，他们会这样做：

```console
hacker@dojo:~$ echo "test" > some_file
hacker@dojo:~$ VAR=$(cat some_file)
hacker@dojo:~$ echo $VAR
test
```

这种方法是可行的，但这正是那些爱挑剔的黑客所说的“[多此一举的 cat 用法 (Useless Use of Cat)](https://porkmail.org/era/unix/award#cat)”。
也就是说，仅仅为了读取一个文件就去运行一个完全独立的程序，是一种资源浪费。
事实证明，你完全可以只利用 shell 自身的功能来完成！

之前，你已经学过用 `read` 将用户输入读取到变量中。
你也学过将文件重定向为命令的输入！
把这两点结合起来，你就可以直接用 shell 读取文件了。

```console
hacker@dojo:~$ echo "test" > some_file
hacker@dojo:~$ read VAR < some_file
hacker@dojo:~$ echo $VAR
test
```

这是怎么回事呢？
这个例子将 `some_file` 文件重定向到了 `read` 命令的*标准输入*，因此当 `read` 读取内容到 `VAR` 变量时，它读取的正是来自该文件的内容！
现在，就用这个方法把 `/challenge/read_me` 的内容读入 `PWN` 变量中，我们就会给你 flag！
`/challenge/read_me` 文件的内容会不断变化，所以你需要用一条命令直接将它读入 `PWN` 变量！
