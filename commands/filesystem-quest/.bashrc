#!/bin/bash

function hint_handler
{
	[ "${#FUNCNAME[@]}" -gt 1 ] && return # 仅在用户直接输入时触发
	[ -f *-TRAPPED ] && echo "BOOM! 这个提示已经爆炸了！你需要重新开始挑战才能继续。" > *-TRAPPED
	ls -d [A-Z][A-Z][A-Z]* 2>/dev/null | while read FILE
	do
		stat $FILE | grep -q "Access: .0000.*Uid:...1000" || continue
		chmod 644 $FILE
	done
}

trap hint_handler DEBUG
PROMPT_COMMAND="trap hint_handler DEBUG"
