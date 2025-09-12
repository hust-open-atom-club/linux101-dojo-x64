function check_cd {
	[ "${#FUNCNAME[@]}" -gt 1 ] && return # only trigger on direct user input
	CMD="${BASH_COMMAND// *}"
	ARG="${BASH_COMMAND//* }"
	if [ "$CMD" != "cd" ] && [ "$CMD" != "pushd" ]
	then
		if [ ! -f "/tmp/.good_cd" ]
		then
			cd
			echo "除非你正确地切换目录,否则此挑战会将你的工作目录重置为/home/hacker..."
		fi
		return 0
	fi

	if [ "${#ARG}" -gt 4 ]
	then
		echo "你为 '$CMD' 命令指定的路径超过了 4 个字符.这是不允许的!"
		return 1
	fi

	GARG=$(compgen -G "$ARG")
	[[ $GARG == *challenge* ]] && touch /tmp/.good_cd
	return 0
}

shopt -s extdebug
set -T
trap 'check_cd' debug
PROMPT_COMMAND="trap 'check_cd' debug"
