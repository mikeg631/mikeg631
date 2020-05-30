:- begin_tests(typeInf).
:- include(typeInf). 

/* Note: when writing tests keep in mind that 
    the use of of global variable and function definitions
    define facts for gvar() predicate. Either test
    directy infer() predicate or call
    delegeGVars() predicate to clean up gvar().
*/

/*test for loop, last result is expression value for loops must start and go to an int*/
test(testFor_infer) :-
    infer([for(int,int,[fplus(X,Y),iplus(Z,20)])],T),
    assertion(X == float), assertion( Y == float),
    assertion(Z == int), assertion( T == int).

%X and Y will be inferred as ints
test(testFor_infer2) :-
    infer([for(X,Y,fplus(A,B))],T),
    assertion(X == int), assertion(Y == int),
    assertion(A == float), assertion(B == float),
    assertion(T == float).

%below fails because for requires ints
test(testFor_infer3, [fail]) :-
    infer([for(0.0,5.0,fplus(A,B))],T).



/*test if, format for if ([ cond(bool,CodeBlock), cond(bool2,Codeblock2) ] ... )
notice last statement in codeblock is the return.  */
test(testIf_infer) :-
infer([if([cond(bool,iplus(X,Y)),cond(bool,[fplus(A,B),iplus(Y,Z)])])],T),
    assertion(A == float), assertion( B == float),
    assertion(X == int), assertion( Y == int),
    assertion(Z == int), assertion( T == int).

%test if using some boolean operations
test(testIf_infer2) :-
infer([if([cond(igreater(X,Y),iplus(X,Y)),cond(and(bool,bool),[fplus(A,B),iplus(Y,Z)])])],T),
    assertion(A == float), assertion( B == float),
    assertion(X == int), assertion( Y == int),
    assertion(Z == int), assertion( T == int).



test(testType_Code) :- /* same test but from typeCode*/
    typeCode([for(int,int,[fplus(X,Y),iplus(Z,20)])],T),
    assertion(X == float), assertion( Y == float),
    assertion(Z == int), assertion( T == int).

%infer bool, testings inference on boolean functions int, int -> bool
test(testBool) :-
typeExp(flesser(X,Y),T),
 assertion(X == float),
assertion(Y == float), assertion( T == bool).

%infer bool, testings inference on boolean functions bool, bool -> bool
test(testBool2) :-
typeExp(and(X,Y),T),
 assertion(X == bool),
assertion(Y == bool), assertion( T == bool).




/* test func definitions, and func call*/
test(funcCall1):-
    infer([gvLet(add,[X,Y],iplus(X,Y)),gvLet(multiply,[B,C],imultiply(B,C)),multiply(add(5,4),10)],T),
    assertion(X == int), assertion( Y == int),
    assertion(B == int), assertion( C == int),
    assertion(T == int).

%below fails because multiply is not defined
test(funCall2,[fail]):-
    infer([gvLet(add,[X,Y],iplus(X,Y)), multiply(add(5,4),10)],T).

%below fails because it is called with the wrong types of arguments
test(funCall3,[fail]):-
    infer([gvLet(add,[X,Y],iplus(X,Y)), add(5.0,4.0),10],T).

%below fails because the function fmultiply expects an float, but recieves an int
test(funCall4,[fail]):-
    infer([gvLet(add,[X,Y],fmultiply(fplus(X,Y), 2)), add(5.0,4.0)],T).

%Modified verison of funCall4, this succeeds as 2 is casted to an float
test(funCall5):-
    infer([gvLet(add,[X,Y],fmultiply(fplus(X,Y), iToFloat(2))), add(5.0,4.0)],T),
    assertion(X == float), assertion( Y == float),
    assertion(T == float).
%Demonstrating that the last result is type of the func. [Float, float, int , int ] -> float
test(funCall6):-
    infer([gvLet(temp,[X,Y,A,B],[iplus(A,B),fmultiply(X, Y)]), temp(5.0,4.0,1,2)],T),
    assertion(X == float), assertion( Y == float),
    assertion(A == int), assertion(B == int),
    assertion(T == float).

%demonstrating local declare
test(localVarDeclare) :-
infer([lvLet(temp,5,iplus(temp,X))],T),
assertion(X == int),
assertion(T == int).

%below will fail as local variable is not accessible outside of in
test(localVarDeclare2,[fail]) :-
infer([lvLet(temp,5,iplus(temp,X)),imultiply(5,temp)],T).
%Demonstrating local function declare

test(localFunDeclare) :-
infer([lvLet(temp,[A,B],iplus(A,B),temp(5,4))],T),
assertion(A == int), assertion(B == int),
assertion(T == int).



%This will faill as the function was declared locally.
test(localFunDeclare2, [fail]) :-
infer([lvLet(temp,[A,B],iplus(A,B),temp(5,4)),temp(C,D)],T).

test(varDeclare) :-
infer([gvLet(temp,iplus(X,Y)),temp],T),
assertion(X == int), assertion(Y == int),
assertion(T == int).

%test declaring global var with if
test(varDeclareIf) :-
infer([gvLet(temp,if([cond(idne(X,Y),imultiply(X,Y)),cond(bool,isub(X,Y))])),temp],T),
assertion(X == int), assertion(Y == int),
assertion(T == int).
%Will fail because the codeblocks of the if statement do not match
test(varDeclareIf2, [fail]) :-
infer([gvLet(temp,if([cond(idne(X,Y),fmultiply(3.0,4.0)),cond(bool,isub(X,Y))])),temp],T).

%Will fail because the conditions are not all bools
test(varDeclareIf3,[fail]) :-
infer([gvLet(temp,if([cond(idne(X,Y),imultiply(X,Y)),cond(isub(X,Y),0)])),temp],T).




%Test some arthimetic operations with casts
test(castingFloat) :-
    typeExp(imultiply(4,fToInt(Y)),T),
     assertion(Y == float), assertion( T == int).

    test(castingInt) :-
    typeExp(fdivide(4.0,iToFloat(Y)),T),
     assertion(Y == int), assertion( T == float).




% tests for typeExp
test(typeExp_iplus) :- 
    typeExp(iplus(int,int), int).

% this test should fail
test(typeExp_iplus_F, [fail]) :-
    typeExp(iplus(int, int), float).

test(typeExp_iplus_T, [true(T == int)]) :-
    typeExp(iplus(int, int), T).

% NOTE: use nondet as option to test if the test is nondeterministic


% test custom function with mocked definition
test(mockedFct, [nondet]) :-
    deleteGVars(), % clean up variables since we cannot use infer
    asserta(gvar(my_fct, [int, float])), % add my_fct(int)-> float to the gloval variables
    typeExp(my_fct(X), T), % infer type of expression using or function
    assertion(X==int), assertion(T==float). % make sure the types infered are correct

:-end_tests(typeInf).
