function give_flag {
	if [ "$PWN" == "COLLEGE" ] && [ "$READ_NAME" == "PWN" ]
	then
		fold -s <<< "你已经正确设置了 PWN 变量！按照约定，这是 flag："
		cat "/tmp/.$FLA-$FLB"
	elif [ "$PWN" == "COLLEGE" ]
	then
		fold -s <<< "你已将 PWN 变量设置正确，但你似乎没有使用 'read' 命令来完成。请用 'read' 来设置它。"
	elif [ -n "$PWN" ]
	then
		fold -s <<< "你设置了 PWN 变量，但它的值似乎不正确。请确保值是 COLLEGE！"
	elif [ -n "$pwn" ]
	then
		fold -s <<< "你设置了 'pwn' 变量，但你需要设置的是 'PWN' 变量！请记住，变量名是区分大小写的。"

	fi
}

function check_subshell {
	[ "${#FUNCNAME[@]}" -gt 1 ] && return # only trigger on direct user input
	[ "$BASH_SUBSHELL" -eq 0 ] && return
	fold -s <<< '你似乎正在调用一个子 shell。举个例子，这可能是因为你在执行类似 PWN=$(echo COLLEGE) 的操作。你应该改用 read 命令来设置 PWN 变量。' >&2
	exit
}

function check_read {
	[ "${#FUNCNAME[@]}" -gt 1 ] && return # only trigger on direct user input
	[ "${BASH_COMMAND// *}" != "read" ] && return
	READ_NAME="${BASH_COMMAND//* }"

	if [ "$READ_NAME" != "PWN" ]
	then
		fold -s <<< "你调用了 'read' 命令，但似乎没有指定 PWN 变量！你需要将输入读取到 PWN 变量中才能通过这一关。"
	fi
}

set -T
trap 'check_subshell; check_read' debug
PROMPT_COMMAND="give_flag; trap 'check_subshell; check_read' debug"
