#ifndef _BUILTINS_H_
#define _BUILTINS_H_

#include "shell.h"

/* 描述一个 Shell 内建命令的结构体 */
typedef struct builtin {
  char *name;           /* 内建命令的名称 */
  int (*function)();    /* 实现该命令的函数指针 */
  int flags;            /* 标志位, 如 BUILTIN_ENABLED */
  char **long_doc;      /* 详细的帮助文档 */
  char *short_doc;      /* 简短的用法摘要 */
  char *handle;         /* 内部使用 */
} BUILTIN;

#endif /* _BUILTINS_H_ */
