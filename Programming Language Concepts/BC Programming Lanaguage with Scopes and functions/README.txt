By Michael Gordon
Hello welcome to my implementation of the BC programming language. 

Getting Started:
To run you must first generate java code from the gammar using a command like  "antlr4 BC.g4 -visitor".
Next compile the with "javac *.java". Make sure that the classpath has the antlr4 library.
Run using exprList as the top rule: java Main testFile.bc

What's in the box?

1. Comments ex: /* Junk here */
Test using commentTest.bc

2. Basic Expressions with variable (Example code seperated by ';')
a++; a--;
--a; a++;
a = 5;
a+=b; a-=b; a*=b; a/=b; a%=b; a^=b;
a*b+c*(-d+f)^2;

Test using VarOpsTest.bc

3. Boolean Expressions:
a && b || !c

Test using BooleanTest.bc (grun BC exprList  BooleanTest.bc -gui)

4. Precedence: From bc manual https://www.gnu.org/software/bc/manual/html_mono/bc.html#SEC12 
(lowest to highest)
|| operator, left associative
&& operator, left associative
! operator, nonassociative
Relational operators, left associative
Assignment operator, right associative
+ and - operators, left associative
*, / and % operators, left associative
^ operator, right associative
unary - operator, nonassociative
++ and -- operators, nonassociative

Test using PrecedenceTest.bc

5. read();
Examples in readTest.bc

6. Printing 
All expressions in global scope are printed. Expressions in lower scopes can be printed using 'print expression;'
See PrintingTest.bc

7. Math Library plus sqrt()
s, c , l, e and sqrt implemented

See fctTest.bc for examples

8. if statements
If statements follow the format
if( expression )
{
statementblock
} else
{
}

Test using ifStateTest.bc

The else part is optional. An expression is an valid bc expression. The statement block is a any combination of statements.
9. while loops
while loops follow the format

while( expression) 
{
statementblock
}

The expressions and statements blocks work the same as for if statements

test using whileTest.bc

10. For loops
Format: for( expression1, expression2, expression3)
{
statementblock
}

Equilivent to

expression1
while(expression2)
{
statementblock
expression3
}

Note expression1 is executed only once. Expression2 is checked before continuing to the next iteration and expression3 is executed at the end of each iteration.

Test using forLoopTest.bc

11. User defined functions.
Format: define functionName(params)
{
statementblock
}

The function name can be any valid variable name and the function and variable names do not clash. A function can have zero or more parameters. Functions need to return a value.

Test using funcTest.bc

12. Scoping rules
Every assignment outside of an if-else, while, for, or function is in the global scope. Everytime a block is entcountered a new scope is added onto the stack of scopes. 

If an assignment is encountered two things can happen.
 1) The variable has been previously assigned, so the variable is updated in its original scope. 
2) The variable has not been assigned and must be created, so it is added in the current scope.

Example: 
b=2;
if(5>4)
{
if(5>4)
{
c=2;
}
b=c*b;
}
b;
c;

In this example, b is assigned to 2 in the global scope. Inside the first if a new scope is created, so on in thside the second if. In the second if c is created and assigned to 2.
However, when b=*c; is excecuted c does not exist in this scope so the calculation b=0*2 is preformed, assigning 0 to b; . Since b is defined in an upper scope,
this assignment is peserved so b; prints 0, and c; prints 0 since c is not defined.

If a function is called, the current enviornment of scopes is saved and pushed onto a stack. A new enviornment is created and inside that enviornment the function can still access global variables.
If a function is called within a function, this process is repeated. When the functions returns, the enviornment is destroyed, and the previous enviornment is popped from the stack.

Use factorialTest.bc, and scopingTest.bc for tests