function check_cmd {
	BCMD=($BASH_COMMAND)

	[ "${BCMD[0]}" != "bash" ] && [ "${BCMD[0]}" != "sh" ] && return 0

	if [ "${#BCMD[@]}" -gt 2 ]
	then
		echo "请暂时不要使用 bash 的附加选项或参数！"
		echo "请只用 'bash x.sh' 来运行你的脚本。"
	fi

	if [[ "${BCMD[1]}" != *.sh ]]
	then
		echo "请用 '.sh' 后缀来命名你的脚本。虽然这最终并非是严格要求，"
		echo "但在接下来的几个关卡中，我们将保持这种明确的规范。"
		return 1
	fi

	BASH_ENV=/challenge/.hook bash "${BCMD[1]}"
	return 1
}

shopt -s extdebug
PROMPT_COMMAND="trap check_cmd debug"
