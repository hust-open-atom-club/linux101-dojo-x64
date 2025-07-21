当你为 `su` 输入密码时，它会将其与该用户存储的密码进行比较。
这些密码*曾经*存储在 `/etc/passwd` 文件中，但因为 `/etc/passwd` 是一个全局可读的文件，这对存储密码来说很不安全，所以它们被移到了 `/etc/shadow` 文件中。
下面是来自上一关的 `/etc/shadow` 文件示例：

```console
root:$6$s74oZg/4.RnUvwo2$hRmCHZ9rxX56BbjnXcxa0MdOsW2moiW8qcAl/Aoc7NEuXl2DmJXPi3gLp7hmyloQvRhjXJ.wjqJ7PprVKLDtg/:19921:0:99999:7:::
daemon:*:19873:0:99999:7:::
bin:*:19873:0:99999:7:::
sys:*:19873:0:99999:7:::
sync:*:19873:0:99999:7:::
games:*:19873:0:99999:7:::
man:*:19873:0:99999:7:::
lp:*:19873:0:99999:7:::
mail:*:19873:0:99999:7:::
news:*:19873:0:99999:7:::
uucp:*:19873:0:99999:7:::
proxy:*:19873:0:99999:7:::
www-data:*:19873:0:99999:7:::
backup:*:19873:0:99999:7:::
list:*:19873:0:99999:7:::
irc:*:19873:0:99999:7:::
gnats:*:19873:0:99999:7:::
nobody:*:19873:0:99999:7:::
_apt:*:19873:0:99999:7:::
systemd-timesync:*:19901:0:99999:7:::
systemd-network:*:19901:0:99999:7:::
systemd-resolve:*:19901:0:99999:7:::
mysql:!:19901:0:99999:7:::
messagebus:*:19901:0:99999:7:::
sshd:*:19901:0:99999:7:::
hacker::19916:0:99999:7:::
zardus:$6$bEFkpM0w/6J0n979$47ksu/JE5QK6hSeB7mmuvJyY05wVypMhMMnEPTIddNUb5R9KXgNTYRTm75VOu1oRLGLbAql3ylkVa5ExuPov1.:19921:0:99999:7:::
```

由 `:` 分隔，每行的第一个字段是用户名，第二个字段是密码。
值为 `*` 或 `!` 实际上意味着该账户的密码登录功能已被禁用，一个空字段意味着没有密码（这是一个并不少见的错误配置，在某些设置下允许无密码使用 `su`），而像 Zardus 那样的长字符串 `$6$bEFkpM0w/6J0n979$47ksu/JE5QK6hSeB7mmuvJyY05wVypMhMMnEPTIddNUb5R9KXgNTYRTm75VOu1oRLGLbAql3ylkVa5ExuPov1.` 则是对上一关 Zardus 的密码（在这里是 `dont-hack-me`）进行单向加密（哈希）后得到的结果。
该文件中的其他字段还有其他含义，你可以[在这里](https://www.cyberciti.biz/faq/understanding-etcshadow-file/)阅读更多相关信息。

当你向 `su` 输入密码时，它会对其进行单向加密（哈希），并将结果与存储的值进行比较。
如果结果匹配，`su` 就会授予你对该用户的访问权限！

但如果你不知道密码怎么办？
如果你有密码的哈希值，你就可以*破解*它！
尽管 `/etc/shadow` 文件默认只有 root 用户可读，但泄露仍可能发生！
例如，备份文件常常未经加密且保护不充分地存储在文件服务器上，这已经导致了无数次的数据泄露事件。

如果黑客获取到泄露的 `/etc/shadow` 文件，他们就可以开始破解密码并大搞破坏。
破解工作可以通过著名的 [John the Ripper](https://www.openwall.com/john/) 工具来完成，如下所示：

```console
hacker@dojo:~$ john ./my-leaked-shadow-file
Loaded 1 password hash (crypt, generic crypt(3) [?/64])
Will run 32 OpenMP threads
Press 'q' or Ctrl-C to abort, almost any other key for status
password1337      (zardus)
1g 0:00:00:22 3/3 0.04528g/s 10509p/s 10509c/s 10509C/s lykys..lank
Use the "--show" option to display all of the cracked passwords reliably
Session completed
hacker@dojo:~$
```

在这里，John the Ripper 破解了 Zardus 泄露的密码哈希，找到了真实密码 `password1337`。可怜的 Zardus！

这一关模拟了这样的情景，在 `/challenge/shadow-leak` 为你提供了一个泄露的 `/etc/shadow` 文件。
破解它（这可能需要几分钟），`su` 到 `zardus` 用户，然后运行 `/challenge/solve` 来获取 flag！
