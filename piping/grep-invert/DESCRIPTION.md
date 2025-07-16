`grep` 命令有一个非常有用的选项：`-v`（反向匹配）。
常规的 `grep` 会显示*匹配*某个模式的行，而 `grep -v` 则会显示*不匹配*该模式的行：

```console
hacker@dojo:~$ cat data.txt
hello hackers!
hello world!
hacker@dojo:~$ cat data.txt | grep -v world
hello hackers!
hacker@dojo:~$
```

有时候，要筛选出你想要的数据，唯一的方法就是过滤掉你*不*想要的数据。
在这个挑战中，`/challenge/solve` 会将flag输出到 stdout，但同时它也会输出超过1000个混在真flag中的假flag（这些假flag的某处会包含 `DECOY` 这个词）。
你需要过滤掉这些假flag，同时保留真的flag！

请使用 `grep -v` 来过滤掉所有包含 "DECOY" 的行，从而找出真正的flag！
