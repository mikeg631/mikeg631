#include <sys/stat.h>
#include <sys/types.h>
#include <fcntl.h>
#include <unistd.h>
#include "classification.h"
#include <stdio.h>
int get_classification(const char* filename)
{
	int fd = open(filename, O_RDONLY);//comments bellow apply here.
	printf("\n%s: %d", filename, fd);
	int temp = -1;
	if(fd != -1)
		temp = syscall(332,fd);
	close(fd);
	return temp;
}

int set_classification(const char* filename, int new_class)
{
	int fd = open(filename, O_WRONLY);//will be -1 if can't. If user doesn't have proper pressmisions open will fail
	int temp = -1;//return for error
	printf("\n%s: %d",filename, fd);
	if(fd != -1)//file opened
		temp = syscall(333,fd, new_class);
	else
	{
	fd = open(filename, (O_DIRECTORY | O_RDONLY));
	int result = access(filename, W_OK);
	if(fd != -1 && result == 0)
		temp = syscall(333,fd, new_class);
	}
	close(fd);
	return temp;
}
