就像你可以重定向程序的*输出*一样，你也可以将输入重定向*到*程序中！
这可以通过 `<` 符号来实现，如下所示：

```console
hacker@dojo:~$ echo yo > message
hacker@dojo:~$ cat message
yo
hacker@dojo:~$ rev < message
oy
```

利用输入重定向，你可以对许多不同的程序实现一些有趣的操作！
在这一关中，我们将练习使用 `/challenge/solve`。该程序要求你将 `PWN` 文件重定向给它，并且 `PWN` 文件的内容必须是 `COLLEGE`！
要将这个值写入 `PWN` 文件，请回想一下之前关于 `echo` 输出重定向的挑战！
