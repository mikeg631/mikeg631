By Michael Gordon
How to run tests:
The individual order is 
make 
make tests
make compile
make compile2

or in one step, make all. compile makes llvm to .S assembily using llc and then compile2 uses the gcc compiler to make object files. Reconfigure to your own compiler if desired. You may need to change the target from x864-64 to another platform.  make tests/test1.out will run the program.

Program notes:
Global "variables" ( implemented as constants in llvm) can be defined only outside of functions
Ex: 
int d = 5;

void fun { }
int c = d;
...
No strings outside of functions
No expressions or statements are allowed outside of functions.
functions must be defined before use. A function can be called inside of itself. Currently there is no mechanism to declare functions. 
A void main function should be included if you want any code to run. If a main function is not provided
a main function will be defined, but it will be empty and effectively no code will run.
Expressions must be terminated by semi-colon.
Only one return statement allowed and it must be end at of function
variables and functions must be lowercase
Bool and string defined functions seem not to work. Mainly functions of int and double type are supported. 
Please don't use keywords outside of their intended use:


String expressions:
Array of 8 bit chars
Strings can be initalized via 
String concatcation doesn't seem to work :L
printf(var) or printf("stringhere")
Paranethesis are excluded from strings as they seem to break things.



int type:
32 bit int. Auto casts to double for arthimetic. Casts back to int when nessecary

double type:
64 bit float

boolean type: stored as 1 bit integer
true
false

Comparisons and conditions are supported:
a && b
a || b
!a
a >= b
a <= b
a < b
a > b
a == b
a != b


For function:
format:
for(assignment; condition; increment)
{
code here
}
ex:
for(int i = 0; a < b; i++)
{
code here
}
While statement
while( condition )
{
code block
}
Assignment can only be to a double or int. Condition should be some comparison ,true , or false.
Can't


