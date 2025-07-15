#include "loadables.h"
#include "bashansi.h"
#include <config.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>
#include <errno.h>

#ifndef SECRET_VALUE
#define SECRET_VALUE "asdf"
#endif

int challenge_builtin(WORD_LIST *list)
{
	if (!list)
	{
		puts("用法不正确!请阅读 challenge 内建命令的帮助页面!");
		return EXECUTION_FAILURE;
	}

	if (!strcmp(list->word->word, "--fortune"))
	{
		system("/usr/games/fortune");
	}
	else if (!strcmp(list->word->word, "--version"))
	{
		puts("我就是我所需要的那个版本!");
	}
	else if (!strcmp(list->word->word, "--secret"))
	{
		if (!list->next)
		{
			puts("错误: --secret 选项缺少参数.");
			return EXECUTION_FAILURE;
		}
		if (strcmp(list->next->word->word, SECRET_VALUE))
		{
			puts("错误: --secret 选项的参数不正确.请阅读帮助页面!");
			return EXECUTION_FAILURE;
		}
		puts("正确!这是你的 flag!");

		if (!find_variable("FLA") || !find_variable("FLB"))
		{
			puts("错误: 环境问题.这不是你的错;请将此问题报告给老师.");
			return EXECUTION_FAILURE;
		}

		char flag_path[1024];
		sprintf(flag_path, "/tmp/.%s-%s", get_variable_value(find_variable("FLA")), get_variable_value(find_variable("FLB")));
		char flag[1024] = { 0 };
		int fd = open(flag_path, 0);
		read(fd, flag, 1024);
		puts(flag);
	}
	else
	{
		puts("用法不正确!请阅读 challenge 内建命令的帮助页面!");
		return EXECUTION_FAILURE;
	}

  	return EXECUTION_SUCCESS;
}

int challenge_builtin_load(char *name)
{
	//bind_global_variable("PWN", "COLLEGE", 0);
  	return (1); // 0 == 失败
}

void challenge_builtin_unload(char *name)
{
}

char *challenge_doc[] = {
	"这个内建命令在给定正确参数时,会为你读取 flag!",
	(
	 ""
	 "\n"
	 "    选项:\n"
	 "      --fortune		显示一句祝福语\n"
	 "      --version		显示版本号\n"
	 "      --secret VALUE	如果 VALUE 正确，则打印 flag\n"
	 "\n"
	 "    你必须确保为 --secret 提供正确的值.那个值就是 \"" SECRET_VALUE "\"."
	),
	(char *)NULL
};

// 定义内建命令的结构体
struct builtin challenge_struct = {
	"challenge",			/* 内建命令名称 */
	challenge_builtin,		/* 实现该内建命令的函数 */
	BUILTIN_ENABLED,		/* 内建命令的初始标志 */
	challenge_doc,			/* 长文档字符串数组。 */
	"challenge [--fortune] [--version] [--secret SECRET]",	/* 用法摘要；会成为 short_doc */
	0				/* 内部使用保留 */
};
