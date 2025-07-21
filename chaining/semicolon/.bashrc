function checker {
	if [ -f /tmp/.pwn ] && [ -f /tmp/.college ]
	then
		echo "是的！你成功链接了 /challenge/pwn 和 /challenge/college！"
		echo "这是你的 flag："
		cat /tmp/.$FLA-$FLB
	elif [ -f /tmp/.pwn ]
	then
		echo "看起来你运行了 /challenge/pwn，但没有将它与 /challenge/college 链接起来。"
		echo "请再试一次！记住，你可以使用 ';' 来分隔两个命令，让它们一个接一个地运行。"
	fi

	rm -f /tmp/.pwn /tmp/.college
}

PROMPT_COMMAND="checker"
