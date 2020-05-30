#include <linux/syscalls.h>
#include <linux/pid.h>

asmlinkage long sys_set_level(int pid, int level)
{
struct pid *pid_struct1;
struct pid *pid_struct2;
struct task_struct *p1;
struct task_struct *p2;

int currPID = sys_getpid();
pid_struct1 = find_get_pid(currPID);
pid_struct2 = find_get_pid(pid);
p1 = pid_task(pid_struct1, PIDTYPE_PID);
p2 = pid_task(pid_struct2, PIDTYPE_PID);
int currSecurity = p1->securitylevel;
if(p2 == NULL)
{
return -1;
}

uid_t euid = sys_geteuid();
if(euid == 0)//check if super user
{
p2->securitylevel = level;//if so we can do this regardless
return p2->securitylevel;
}

if((p2->securitylevel < currSecurity) || currPID  == pid)//if not super user we must che these
{
if(level <= currSecurity)// must also check that the  change is lower or equal
{
p2->securitylevel = level;
return p2->securitylevel;
}
}
return -1;// if the conditions are violated the change will fail and return -1
}

asmlinkage long sys_get_level(int pid)
{
struct pid *pid_struct;
struct task_struct *p;
pid_struct = find_get_pid(pid);
p = pid_task(pid_struct, PIDTYPE_PID);
if(p == NULL)
{
return -1;
}
return  p->securitylevel;
}
