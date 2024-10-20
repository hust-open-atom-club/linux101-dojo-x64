function cd {
	[ "${#FUNCNAME[@]}" -gt 1 ] && return # 仅在用户输入时触发
	fold -s <<< "你使用了 'cd'！在这一关，我不允许你更改工作目录——你必须通过 'cat' 命令传递绝对路径来获取我放置在文件系统中的内容（它在 $(cat /tmp/.flag-path 2>/dev/null)/flag）。"
}

fold -s <<< "在这一关你不能使用 'cd' 命令，必须通过绝对路径获取旗标。而且，我把旗标藏在了不同的目录中！你可以在文件 $(cat /tmp/.flag-path 2>/dev/null)/flag 中找到它。去用 'cat' 命令获取它 **而不是** 直接进入那个目录！"
