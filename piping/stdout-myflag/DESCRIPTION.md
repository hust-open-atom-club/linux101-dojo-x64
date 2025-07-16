当然，除了重定向 `echo` 的输出，你也可以重定向任何命令的输出。
在这一关里，`/challenge/solve` 会再一次给你一个flag，但前提是你必须将其输出重定向到 `myflag` 文件。
你的flag，自然也就会保存在 `myflag` 文件里！

你会注意到，尽管你重定向了 stdout，`/challenge/solve` 依然会在你的终端上输出信息。
这是因为它通过标准错误（standard error）来传达指令和反馈，而只通过标准输出（standard out）来打印旗标！
