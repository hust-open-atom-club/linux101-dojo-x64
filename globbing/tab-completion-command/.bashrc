function check_wildcard {
	[ "${#FUNCNAME[@]}" -gt 1 ] && return # only trigger on direct user input
	if [[ "$BASH_COMMAND" == *\** ]]
	then
		echo "本关不允许使用 * 通配符！"
		return 1
	fi

	return 0
}

shopt -s extdebug
set -T
trap 'check_wildcard' debug
PROMPT_COMMAND="trap 'check_wildcard' debug"
