即使用户没有犯错，他们也可能在不经意间将自己置于风险之中。
例如，一个典型用户家目录中的许多文件*默认都是对所有人可读的*，尽管它们经常被用来存储敏感信息。
信不信由你，你的 `.bashrc` 文件就是对所有人可读的，除非你明确更改过它的权限！

```console
hacker@dojo:~$ ls -l ~/.bashrc
-rw-r--r-- 1 hacker hacker 148 Jun  7 05:56 /home/hacker/.bashrc
hacker@dojo:~$
```

你可能会想，“嘿，至少它默认不是对所有人可写的”！
但即使只是对所有人可读，它也可能造成危害。
由于 `.bashrc` 在 shell 启动时会被处理，所以人们通常会在这里放置他们想要自定义的任何环境变量的初始化代码。
大多数时候，这都是些无害的东西，比如 `PATH`，但有时人们会为了方便访问而将 API 密钥存储在那里。
例如，在这个挑战中：

```
zardus@dojo:~$ echo "FLAG_GETTER_API_KEY=sk-XXXYYYZZZ" > ~/.bashrc
```

之后，Zardus 就可以轻松地引用这个 API 密钥了。
在这一关里，用户可以使用一个有效的 API 密钥来获取 flag：

```
zardus@dojo:~$ flag_getter --key $FLAG_GETTER_API_KEY
Correct API key! Do you want me to print the key (y/n)? y
pwn.college{HACKED}
zardus@dojo:~$
```

很自然地，Zardus 将他的密钥存储在了 `.bashrc` 文件中。
你能窃取这个密钥并获取 flag 吗？

----
**注意：**
当你获取到 API 密钥后，直接以 `hacker` 用户身份执行 `flag_getter` 即可。
本挑战的 `/challenge/victim` 只是为了营造主题氛围：你不需要使用它。
