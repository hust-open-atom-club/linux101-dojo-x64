function give_flag {
	if [ "$PWN" == "COLLEGE" ]
	then
		echo "你已经正确设置了 PWN 变量！按照约定，这是 flag："
		cat "/tmp/.$FLA-$FLB"
	elif [ "${PWN^^}" == "COLLEGE" ]
	then
		echo "你设置了 PWN 变量，但似乎没有将其设置为全大写的 COLLEGE。本次变量检查是区分大小写的！"
	elif [ -n "$PWN" ]
	then
		echo "你设置了 PWN 变量，但它的值似乎不正确。请确保值是 COLLEGE！"
	elif [ -n "$pwn" ]
	then
		echo "你设置了 'pwn' 变量，但你需要设置的是 'PWN' 变量！请记住，变量名是区分大小写的。"

	fi
}

PROMPT_COMMAND=give_flag
