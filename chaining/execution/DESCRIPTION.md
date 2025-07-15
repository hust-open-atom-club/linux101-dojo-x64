你已经写好了你的第一个 shell 脚本，但是通过 `bash script.sh` 来调用它很麻烦。
为什么需要那个 `bash` 呢？

当你调用 `bash script.sh` 时，你当然是在启动 `bash` 命令，并将 `script.sh` 作为其参数。这会告诉 bash 从 `script.sh` 文件而不是从标准输入中读取命令，这样你的 shell 脚本就被执行了。

事实证明，你可以不必手动调用 `bash`。
如果你的 shell 脚本文件是*可执行的*（回想一下[感知权限](./permissions)）模块，你就可以直接通过它的相对或绝对路径来调用它！
例如，如果你在你的家目录中创建了 `script.sh` 文件，*并将其设为可执行*，你就可以通过 `/home/hacker/script.sh`、`~/script.sh` 或者（如果你的工作目录是 `/home/hacker`）`./script.sh` 来调用它。

现在就在这里试试吧！
创建一个能够调用 `/challenge/solve` 的 shell 脚本，将它设为可执行，然后在不明确调用 `bash` 的情况下运行它！
