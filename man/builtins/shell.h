#ifndef _SHELL_H_
#define _SHELL_H_

#include "variables.h"

/* WORD_LIST 的 `word` 部分 */
typedef struct word_desc {
  char *word;
  int flags;
} WORD_DESC;

/* 单词列表结构体 */
typedef struct word_list {
  struct word_list *next;
  WORD_DESC *word;
} WORD_LIST;

/* 执行返回值宏 */
#define EXECUTION_SUCCESS 0
#define EXECUTION_FAILURE 1

#endif /* _SHELL_H_ */
