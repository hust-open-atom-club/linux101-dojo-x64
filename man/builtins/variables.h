#ifndef _VARIABLES_H_
#define _VARIABLES_H_

/* Shell 变量的结构体 */
typedef struct shell_var {
  char *name;
  char *value;
  int attributes;
  struct shell_var *next;
} SHELL_VAR;

SHELL_VAR *find_variable(char*);
char *get_variable_value(SHELL_VAR*);
//int bind_global_variable(char*, char*, int); 

#endif /* _VARIABLES_H_ */
