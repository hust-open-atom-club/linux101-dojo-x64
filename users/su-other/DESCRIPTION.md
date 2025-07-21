如果不带参数，`su` 会（在通过 root 密码验证后）启动一个 root shell。
然而，你也可以提供一个用户名作为参数，以切换到*那个*用户，而不是 root。
例如：

```console
hacker@dojo:~$ su some-user
Password:
some-user@dojo:~$
```

太棒了！
在这一关中，你必须切换到 `zardus` 用户，然后运行 `/challenge/solve`。
Zardus 的密码是 `dont-hack-me`。
祝你好运！
