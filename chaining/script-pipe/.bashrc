function set_secret {
	rm -f /tmp/.pwn-secret
	echo $RANDOM > /tmp/.pwn-secret
}

function check_cmd {
	BCMD=($BASH_COMMAND)

	if [ "${BCMD[0]}" != "bash" ] && [ "${BCMD[0]}" != "sh" ]
	then
		unset BASH_ENV
		return 0
	fi

	if [ "${#BCMD[@]}" -gt 2 ]
	then
		fold -s <<< "请暂时不要使用 bash 的附加选项或参数！请只用 'bash x.sh' 来运行你的脚本。"
	fi

	if [[ "${BCMD[1]}" != *.sh ]]
	then
		fold -s <<< "请用 '.sh' 后缀来命名你的脚本。虽然这最终并非是严格要求，但在接下来的几个关卡中，我们将保持这种明确的规范。"
		return 1
	fi

	export BASH_ENV=/challenge/.hook
}

shopt -s extdebug
PROMPT_COMMAND="trap check_cmd debug; set_secret; $PROMPT_COMMAND"
