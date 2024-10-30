现在我们知道如何列出、读取和创建文件。
但是，我们该如何找到它们呢？
我们使用 `find` 命令！

`find` 命令可以接受可选参数来描述搜索条件和搜索位置。
如果不指定搜索条件，`find` 将匹配所有文件。
如果不指定搜索位置，`find` 默认使用当前工作目录（`.`）。
例如：


```console
hacker@dojo:~$ mkdir my_directory
hacker@dojo:~$ mkdir my_directory/my_subdirectory
hacker@dojo:~$ touch my_directory/my_file
hacker@dojo:~$ touch my_directory/my_subdirectory/my_subfile
hacker@dojo:~$ find
.
./my_directory
./my_directory/my_subdirectory
./my_directory/my_subdirectory/my_subfile
./my_directory/my_file
hacker@dojo:~$
```

当指定搜索位置时，你可以使用绝对路径或相对路径。例如：

```console
hacker@dojo:~$ find my_directory/my_subdirectory
my_directory/my_subdirectory
my_directory/my_subdirectory/my_subfile
hacker@dojo:~$
```

当然，我们可以指定搜索条件！例如，这里我们按名称进行过滤：

```console
hacker@dojo:~$ find -name my_subfile
./my_directory/my_subdirectory/my_subfile
hacker@dojo:~$ find -name my_subdirectory
./my_directory/my_subdirectory
hacker@dojo:~$
```

如果你想的话，可以搜索整个文件系统！

```console
hacker@dojo:~$ find / -name hacker
/home/hacker
hacker@dojo:~$
```

现在轮到你了。
我已经把flag隐藏在文件系统的一个随机目录中。
它仍然叫做 `flag`。
去找找看吧！

几点说明。首先，文件系统中还有其他名为 `flag` 的文件。
如果你第一次尝试的文件没有实际的flag，不要惊慌。
其次，文件系统中有很多地方对普通用户不可访问。
这些地方会导致 `find` 生成错误，但你可以忽略这些；我们不会把flag藏在那里！
最后，`find` 可能需要一些时间；请耐心等待！

