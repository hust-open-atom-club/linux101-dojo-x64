在上一关中，你滥用了 Zardus 的 `~/.bashrc` 文件，让他为你运行命令。

这一次，Zardus 登录后不会将 flag 存放在一个可读的文件中了。
取而代之的是，他会运行一个名为 `flag_checker` 的命令，并手动将 flag 输入其中进行验证。

你的任务就是利用你仍然拥有的对 Zardus 的 `.bashrc` 的写权限，来截获这个 flag。
还记得你在[探索 PATH](../path)模块中是如何劫持命令的吗？
你能利用这项能力来劫持 `flag_checker` 吗？

----
**提示：**
Zardus 对你的劫持起了疑心吗？
他很小心——他会检查 `flag_checker` 是否有 `Type the flag` 这个提示。
请确保你的劫持脚本也打印出这个提示（例如，`echo "Type the flag"`）。
除了打印那个提示之外，你伪造的 `flag_checker` 可以 a) 直接用 `cat` 将 Zardus 的输入输出到标准输出（例如，不带参数的 `cat`），或者 b) 用 `read` 将其读入一个变量，然后再用 `echo` 打印出来。
由你决定！

----
**提示：**
别忘了把你伪造的 `flag_checker` 设置为可执行文件，就像你在[感知权限](../permissions)模块中学到的那样！
