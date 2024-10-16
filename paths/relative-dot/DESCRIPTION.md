在这一级，我们将探索更明确的相对路径。在大多数操作系统中，包括 Linux，每个目录都有两个隐式条目：`.` 和 `..`。

第一个 `.`，指的是同一个目录，所以以下路径彼此都是相同的：

- `/challenge`
- `/challenge/.`
- `/challenge/././././././././././`
- `/./././challenge/././`

第二个 `..`，指的是上级目录，所以以下路径彼此都是相同的：

- `/challenge`
- `/challenge/../challenge`
- `/challenge/./././../challenge`
- `/challenge/../challenge/./../challenge/`

当然，如果你的当前工作目录是 `/`，上级目录还是根目录 `/`。

这个挑战你可以使用 `.` 和 `..`。你需要执行位于 `/` 目录中的 `challenge` 目录中的 `solve` 文件。如果你正确调用了挑战程序，它会给你提供 `flag`。

祝你好运！