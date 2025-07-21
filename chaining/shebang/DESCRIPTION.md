你已经踏上了成为 shell 脚本编写者的道路！
然而，到目前为止，你的 shell 脚本*只能从 shell 中启动*。
在上一关中，一切都很顺利（因为你是在 `bash` shell 中调用你的脚本），但如果你的脚本是由一个（比如说）用 Python（或任何其他语言）编写的程序调用的，那就不行了。

在 Linux 中调用一个程序时，Linux 内核会首先检查该文件，以确定它应该如何运行。
这个过程并**不**使用文件扩展名（这就是为什么你的 shell 脚本并*不一定*要以 `.sh` 结尾，Python 脚本也并*不一定*要以 `.py` 结尾，等等）。
相反，Linux 会查看文件开头的几个字节来获取这些信息。

程序有很多不同的类型，但如果程序文件以 `#!` 这两个字符开头（通常被称为“[shebang](https://en.wikipedia.org/wiki/Shebang_(Unix))”），Linux 就会将该文件视为一个*解释型程序*，并将其余部分的内容视为*解释器*的路径。
然后，它会调用该解释器，并将程序文件的路径作为其唯一的参数传递给它。

我们来看下面这个 shell 脚本：

```bash
#!/bin/bash

echo "Hello Hackers!"
```

它可以这样执行：

```console
hacker@dojo:~$ chmod a+x script.sh
hacker@dojo:~$ ./script.sh
Hello Hackers!
hacker@dojo:~$
```
