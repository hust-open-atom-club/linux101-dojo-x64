原来，你可以“省去中间环节”，避免像上一关那样，需要将结果存储到文件中。
你可以通过使用 `|`（管道）操作符来实现这一点。
管道符左侧命令的标准输出，会被连接到（*通过管道传送给*）管道符右侧命令的标准输入。
例如：

```console
hacker@dojo:~$ echo no-no | grep yes
hacker@dojo:~$ echo yes-yes | grep yes
yes-yes
hacker@dojo:~$ echo yes-yes | grep no
hacker@dojo:~$ echo no-no | grep no
no-no
```

现在你来亲自试试吧！`/challenge/solve` 将会输出十万行文本，其中包含旗标。
用 `grep` 来搜索旗标吧！
