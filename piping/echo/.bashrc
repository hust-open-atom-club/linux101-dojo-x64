function give_flag {
	if [ -f "PWN" ] && [ ! -f "COLLEGE" ]
	then
		fold -s <<< "你可能创建了名为 PWN 的文件，而不是 COLLEGE 文件。"
		return
	fi

	[ -f "COLLEGE" ] || return
	read VAL < COLLEGE

	if [ "$VAL" != "PWN" ]
	then
		fold -s <<< "你已经创建了 COLLEGE 文件，但写入的内容不正确。请确保将 PWN 写入 COLLEGE 文件。"
		return
	fi

	if [ ! -f /tmp/.redirected ]
	then
		fold -s <<< "你创建了COLLEGE文件并写入了正确的内容,但看起来你似乎不是通过输入重定向完成的."
		return
	fi

	fold -s <<< "正确！你成功地将 'PWN' 重定向到了 'COLLEGE' 文件！这是你的flag:"
	cat /tmp/.$FLA-$FLB
}

function monitor_redirect {
	[ "${#FUNCNAME[@]}" -gt 1 ] && return # only trigger on direct user input
	TARGET=${BASH_COMMAND#*> }
	[ "$TARGET" == "$BASH_COMMAND" ] && return
	[ "$TARGET" == "COLLEGE" ] || return
	touch /tmp/.redirected
}

trap monitor_redirect DEBUG
PROMPT_COMMAND="give_flag; rm -f /tmp/.redirected; trap monitor_redirect DEBUG"
