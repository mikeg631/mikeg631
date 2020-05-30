#include <unistd.h>
#include "securitylevel.h"
#include <stdlib.h>

int set_security_level(int pid, int new_level)
{
return syscall(332, pid, new_level);
}

int get_security_level(int pid)
{
return syscall(333, pid);
}

int* retrieve_set_security_params(int pid, int new_level)
{
int *p;
p = malloc(4 * sizeof(*p));
p[0] = 332;
p[1] = 2;
p[2] = pid;
p[3] = new_level;
return p;
}

int* retrieve_get_security_params(int pid)
{
int *p;
p = malloc(3 * sizeof(*p));
p[0] = 333;
p[1] = 1;
p[2] = pid;
return p;
} 

int interpret_get_security_result(int ret_value)
{
return ret_value;
}

int interpret_set_security_result(int ret_value)
{
return ret_value;
}
