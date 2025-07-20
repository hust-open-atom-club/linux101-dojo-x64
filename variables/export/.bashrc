function check_values {
	if [ "$PWN" == "COLLEGE" ]
	then
		fold -s <<< "你已经将 PWN 变量设置为了正确的值！"
		touch /tmp/.pwn-right
		rm -f /tmp/.pwn-wrong
	elif [ -n "$PWN" ]
	then
		fold -s <<< "你设置了 PWN 变量，但它的值似乎不正确。请确保值是 COLLEGE！"
		rm -f /tmp/.pwn-right
		touch /tmp/.pwn-wrong
	elif [ -z "$PWN" ]
	then
		rm -f /tmp/.pwn-right
		rm -f /tmp/.pwn-wrong
	fi

	if [ "$COLLEGE" == "PWN" ]
	then
		fold -s <<< "你已经将 COLLEGE 变量设置为了正确的值！"
		touch /tmp/.college-right
		rm -f /tmp/.college-wrong
	elif [ -n "$COLLEGE" ]
	then
		fold -s <<< "你设置了 COLLEGE 变量，但它的值似乎不正确。请确保值是 PWN！"
		rm -f /tmp/.college-right
		touch /tmp/.college-wrong
	elif [ -z "$COLLEGE" ]
	then
		rm -f /tmp/.college-right
		rm -f /tmp/.college-wrong
	fi
}

PROMPT_COMMAND=check_values
