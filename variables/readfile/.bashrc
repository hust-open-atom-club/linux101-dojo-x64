function give_flag {
	read CORRECT < /challenge/read_me
	if [ "$PWN" == "$CORRECT" ]
	then
		echo "你已经正确设置了 PWN 变量！按照约定，这是 flag："
		cat "/tmp/.$FLA-$FLB"
	elif [ -n "$PWN" ]
	then
		echo "你设置了 PWN 变量，但值不正确。请使用输入重定向和 'read' 内置命令，将它的值设置为 /challenge/read_me 的内容。"
		/challenge/.reset_read_me
	else
		/challenge/.reset_read_me
	fi
}

function check_subshell {
	[ "${#FUNCNAME[@]}" -gt 1 ] && return # only trigger on direct user input
	[ "$BASH_SUBSHELL" -eq 0 ] && return
	echo '你似乎正在调用一个子 shell。举个例子，这可能是因为你在执行类似 PWN=$(echo COLLEGE) 的操作。你应该改用 read 命令来设置 PWN 变量。' >&2
	exit
}

function check_read {
	[ "${#FUNCNAME[@]}" -gt 1 ] && return # only trigger on direct user input
	[ "${BASH_COMMAND// *}" != "read" ] && return

	if [[ "$BASH_COMMAND" != *PWN* ]]
	then
		echo "你调用了 'read' 命令，但似乎没有指定 PWN 变量！你需要将输入读取到 PWN 变量中才能通过这一关。"
	elif [[ "$BASH_COMMAND" != *"<"* ]]
	then
		echo "你调用了 'read' 命令,但似乎没有对它进行文件重定向! 请使用标准输入(<)重定向来修正."
	elif [[ "$BASH_COMMAND" != *read_me* ]]
	then
		echo "你调用了 'read' 命令，但似乎没有将 /challenge/read_me 文件重定向到它！"
	fi
}

set -T
trap 'check_subshell; check_read' debug
PROMPT_COMMAND="give_flag; trap 'check_subshell; check_read' debug"
