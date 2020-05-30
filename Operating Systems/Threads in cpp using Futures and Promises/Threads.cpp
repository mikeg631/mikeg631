#include <iostream>       // std::cout
#include <thread>// std::thread
#include <unistd.h>
#include <stdio.h>      /* printf, scanf, NULL */ 
#include <stdlib.h>     /* malloc, free, rand */
#include <future>
#include <functional>
#include <unistd.h>
/*If you forget to wait for a thread to finish running,it is possible that main will finish first 
and theprogram will exit killing the previously created thread*/


void bar(std::future<int>& fut) {
int len = fut.get();//ask for value
char *buff;
buff = (char*) malloc(len * sizeof(char));// memory allocated for string buffer
srand(getpid());
for (int n=0; n<len; n++)
buff[n]=rand()%26+'a';
buff[len]='\0';
std::cout << "\nvalue: " << buff << '\n';
free(buff);// memory deallocated using free
}

void foo() // get integer
{
std::promise<int> j;// declaring promise
std::future<int> fut = j.get_future();//initializing future and engaging the promise with the future
std::thread t2(bar, std::ref(fut));//sends future to the new thread
int i,n;
 printf ("How long do you want the string? ");
 scanf ("%d", &i);
j.set_value(i);// gives the thread the promised value
t2.join();// wait for thread to finish
 }

 int main() {
std::thread t1(foo); //creates new thread
t1.join();// wait for it to finish
 return 0;
 }
