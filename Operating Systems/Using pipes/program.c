#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/types.h>
#include<string.h>
#include<sys/wait.h>
int main()
{
	// We use 4 pipes
	// First pipe to send input string from parent
	// Second pipe to send concatenated string from child
	// Third pipe to send concat string from parent
	// Fourth pipe to send reversed string from child
	int pipe1[2], pipe2[2], pipe3[2], pipe4[2];
	char fixed_str[] = " world";
	char input_str[100];
	char concat[106];
	char output[106];
	pipe(pipe1);
	pipe(pipe2);
	pipe(pipe3);
	pipe(pipe4);
	pid_t p;
	fgets(input_str, 100, stdin);
	close(pipe1[0]);
	write(pipe1[1], input_str, sizeof(input_str));
	close(pipe1[1]);
	p = fork();
	if (p < 0)
	{
		fprintf(stderr, "fork Failed");
		return 1;
	}
	// Parent process
	else if (p > 0)
	{
		wait(NULL);
		close(pipe2[1]);
		read(pipe2[0], concat, size(concat));
		close(pipe2[0]);
		close(pipe3[0]);
		write(pipe3[1], concat, size(concat));
		close(pipe3[1]);
		p = fork();
		if (p < 0)
		{
			fprintf(stderr, "fork Failed");
			return 1;
		}
		else if (p > 0)
		{
			wait(NULL);
			close(pipe4[1]);
			read(pipe4[0], output, sizeof(concat));
			close(pipe4[0]);
			printf("%s", output);
		}
		else // child process
		{
			close(pipe3[1]);
			read(pipe3[0], concat, sizeof(concat));
			close(pipe3[0]);
			stringrev(concat);
			close(pipe4[0]);
			write(pipe4[1], output, sizeof(concat));
			close(pipe4[1]);
			exit(0);
		}
	}
	// first child process
	else
	{
		close(pipe1[1]);
		read(pipe1[0], input_str, sizeof(input_str));
		strcpy(concat, input_str);
		strcat(concat, fixed_str);
		close(pipe1[1]);
		close(pipe2[0]);
		write(pipe2[1], concat, size(concat));
		close(pipe2[1]);
		exit(0);
	}
}
}