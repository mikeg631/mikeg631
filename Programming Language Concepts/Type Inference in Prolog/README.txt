Type inference in Prolog by Michael Gordon

README:

Top level is infer(CodeBlock).

Codeblocks can be one expression or a list of expression (.ie [Expr1, Expr2...])

Booleans: Where booleans apply enter bool or a function of bools. (True or false doesn't work)

If statement: Format if ([ cond(bool,CodeBlock), cond(bool2,Codeblock2) ] ... )
ex: infer([if([cond(bool,iplus(X,Y)),cond(bool,[fplus(A,B),iplus(Y,Z)])])],T)


For statement: Format for( Expr1 , Expr2, CodeBlock )
Expr1 and Expr2 must be ints.

Functions: global functions are defined by gvLet( functionName, [Arg1, Arg2, ...] , CodeBlock )
global variables are defined by gvLet( Name, CodeBlock )

local functions are defined by lvLet( functionName, [Arg1, Arg2, ...] , CodeBlock , Codeblock2 ) i.e let functionName Arg1 Arg2 ... = codeBlock in codeblock2
local variables are defined by lvLet( Name, CodeBlock ,Codeblock2 ) e.r let Name  = codeBlock in CodeBlock2


Supported functions

Boolean operations: and(bool, bool), or(bool, bool), bnot(bool) , iequals(int,int), igreater(int, int) , ilesser(int, int), idne(int,int)
For floating counterpart replace i with f.

Arthimetic: iplus(int,int), isub(int,int), imulitply(int,int), idivide(int,int).
For floating counterpart replace i with f.

Also included fToInt(float) - > int and iToFloat(int) -> float