本关卡将介绍 `man` 命令。
`man` 是 `manual`（手册）的缩写，它会显示（如果可用）你作为参数传递的命令的手册。
例如，假设我们想要了解 `yes` 命令（*是的*，这真的是一个命令）：

```console
hacker@dojo:~$ man yes
```

这将会显示 yes 的手册页，看起来会像这样：

```text
YES(1)                           User Commands                          YES(1)

NAME
       yes - output a string repeatedly until killed

SYNOPSIS
       yes [STRING]...
       yes OPTION

DESCRIPTION
       Repeatedly output a line with all specified STRING(s), or 'y'.

       --help display this help and exit

       --version
              output version information and exit

AUTHOR
       Written by David MacKenzie.

REPORTING BUGS
       GNU coreutils online help: <https://www.gnu.org/software/coreutils/>
       Report any translation bugs to <https://translationproject.org/team/>

COPYRIGHT
       Copyright  ©  2020  Free Software Foundation, Inc.  License GPLv3+: GNU
       GPL version 3 or later <https://gnu.org/licenses/gpl.html>.
       This is free software: you are free  to  change  and  redistribute  it.
       There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       Full documentation <https://www.gnu.org/software/coreutils/yes>
       or available locally via: info '(coreutils) yes invocation'

GNU coreutils 8.32               February 2022                          YES(1)
```

其中重要的部分有：

``` text
名称(1)                            类别                                     名称(1)

NAME
	这里给出该手册页所讨论的命令或概念的名称（以及简短描述）。

SYNOPSIS
	这里给出了一个简短的用法摘要。这些摘要有标准的格式。
	通常，每一行都是一种不同的有效命令调用方式，这些行可以这样解读：

	命令 [可选参数] 单个强制参数
	命令 [可选参数] 多个参数...

DESCRIPTION
	关于命令或概念的详情，以及对各种选项的详细描述。

SEE ALSO
	其他可能有用的手册页或在线资源。

集合                               日期                                     名称(1)
```

你可以使用方向键和 `PgUp/PgDn` 键来滚动手册页。
当你读完手册页后，可以按 `q` 键退出。

手册页存储在一个集中的数据库中。
如果你好奇，这个数据库位于 `/usr/share/man` 目录，但你永远不需要直接与它交互：你只需要使用 `man` 命令来查询它。
`man` 命令的参数不是文件路径，而是条目本身的名称（例如，你运行 `man yes` 来查找 `yes` 的手册页，而不是 `man /usr/bin/yes`，后者是 `yes` 程序的实际路径，但会导致 `man` 显示垃圾信息）。

本关卡的挑战程序有一个秘密选项，当你使用它时，将使该程序打印出 `flag`。
你必须通过 `challenge` 的手册页来找出这个选项！
