/* match functions by unifying with arguments 
    and infering the result
*/

:- dynamic gvar/2.
:- dynamic lvar/2.



   typeExp(For, T):-
    \+ var(For), 
    \+ atom(For),
    \+ number(For), 
    functor(For,for,3),
    !, /* ensure we have a functor */
    For =.. [for, Expr1,Expr2,Code|_],
    typeExp(Expr1,int),
    typeExp(Expr2, int),
    typeCode(Code,T). 

    typeExp(If,T):- 
     \+ var(If), 
    \+ atom(If), 
    \+ number(If),
    functor(If,if,1), /* ensure we have a functor */
    !,
    If =.. [if,If2 | _],
    is_list(If2),
    typeIf2(If2,T).

    typeExp(While, T):-
    \+ var(While), 
    \+ atom(While),
    \+ number(While), 
    functor(While,while,2),
    !,
    While =.. [while,Expr1, Code | _],
    typeExp(Expr1,bool),
    typeCode(Code,T). /* if we make it here we do not try anything else */


typeExp(Fct, T):-
    \+ var(Fct), /* make sure Fct is not a variable */ 
    \+ atom(Fct), /* or an atom */
    \+ number(Fct), /* or an atom */
    functor(Fct, Fname, _Nargs3), /* ensure we have a functor */
    !, /* if we make it here we do not try anything else */
    Fct =.. [Fname|Args], /* get list of arguments */
    typeExpList(Args,G),
    append(G, [T], FType), /* make it loook like a function signature */
    functionType(Fname, TArgs), /* get type of arguments from definition */
    typeExpList(FType, TArgs). /* recurisvely match types */


typeExp(Var,T):-
    \+ is_list(Var),
    atom(Var),
    findVar(Var,T).




    typeExp(Int,T):-
        integer(Int),
        !,
        typeExp(int,T).

    typeExp(Float,T):-
        float(Float),
        !,
        typeExp(float,T).



/* propagate types */
typeExp(T, T).

checkBool(true).
checkBool(false).
/* list version to allow function mathine */
typeExpList([], []).
typeExpList([Hin|Tin], [Hout|Tout]):-
    typeExp(Hin, Hout), /* type infer the head */
    typeExpList(Tin, Tout). /* recurse */

/* TODO: add statements types and their type checking */
/* global variable definition
    Example:
        gvLet(v, T, int) ~ let v = 3;
 */

 
typeStatement(lvLet(Name, Args, Code, Code2), T2):-
    atom(Name),
    is_list(Args),
    !, /* make sure we have a bound name */
    typeCode(Code, T), /* infer the type of Code and ensure it is T */
    bType(T), /* make sure we have an infered type */
    append(Args, [T], FType),
    asserta(lvar(Name, FType)),
    typeCode(Code2,T2),
    retract(lvar(Name,FType)). 

typeStatement(lvLet(Name, Code, Code2), T2):-
    atom(Name), /* make sure we have a bound name */
    !,
    typeExp(Code, T), /* infer the type of Code and ensure it is T */
    bType(T), 
    asserta(lvar(Name, T)),
    typeCode(Code2,T2),
    retract(lvar(Name,T)). 


typeStatement(gvLet(Name, Args, Code), T):-
    atom(Name), /* make sure we have a bound name */
    is_list(Args),
    !,
    typeCode(Code, T), /* infer the type of Code and ensure it is T */
    bType(T), /* make sure we have an infered type */
    append(Args, [T], FType),
    asserta(gvar(Name, FType)). /* add definition to database */

typeStatement(gvLet(Name, Code), T):-
    atom(Name),
    !, /* make sure we have a bound name */
    typeExp(Code, T), /* infer the type of Code and ensure it is T */
    bType(T), /* make sure we have an infered type */
    asserta(gvar(Name, T)). /* add definition to database */




 typeStatement(Code,T):-
    typeExp(Code,T).

/* Code is simply a list of statements. The type is 
    the type of the last statement 
*/
typeCode(S,T):- 
\+ is_list(S),
typeExp(S,T).

typeCode([S], T):-typeStatement(S, T).
typeCode([S, S2|Code], T):-
    typeStatement(S,_T),
    typeCode([S2|Code], T).



/* top level function */
infer(Code, T) :-
    is_list(Code), /* make sure Code is a list */
    deleteGVars(), /* delete all global definitions */
    deleteLVars(),
    typeCode(Code, T).

/* Basic types
    TODO: add more types if needed
 */
bType(bool).
bType(int).
bType(float).
bType(string).
bType(unit). /* unit type for things that are not expressions */
/*  functions type.
    The type is a list, the last element is the return type
    E.g. add: int->int->int is represented as [int, int, int]
    and can be called as add(1,2)->3
 */
bType([H]):- bType(H).
bType([H|T]):- bType(H), bType(T).

/*
    TODO: as you encounter global variable definitions
    or global functions add their definitions to 
    the database using:
        asserta( gvar(Name, Type) )
    To check the types as you encounter them in the code
    use:
        gvar(Name, Type) with the Name bound to the name.
    Type will be bound to the global type
    Examples:
        g

    Call the predicate deleveGVars() to delete all global 
    variables. Best wy to do this is in your top predicate
*/

deleteGVars():-retractall(gvar(_,_)), asserta(gvar(_X,_Y):-false()).


deleteLVars():-retractall(lvar(_,_)), asserta(lvar(_X,_Y):-false()).


/*  builtin functions
    Each definition specifies the name and the 
    type as a function type

    TODO: add more functions
*/
fType(and,[bool,bool,bool]).
fType(or,[bool,bool,bool]).
fType(bnot,[bool,bool]).
fType(iequals, [int,int,bool]).
fType(fequals, [float,float,bool]).
fType(idne, [int,int,bool]).
fType(fdne, [float,float,bool]).
fType(igreater, [int,int,bool]).
fType(fgreater, [float,float,bool]).
fType(ilesser, [int,int,bool]).
fType(flesser, [float,float,bool]).
fType(iplus, [int,int,int]).
fType(isub, [int,int,int]).
fType(imultiply, [int,int,int]).
fType(idivide, [int,int,int]).
fType(fplus, [float, float, float]).
fType(fsub, [float, float, float]).
fType(fmultiply, [float, float, float]).
fType(fdivide, [float, float, float]).
fType(fToInt, [float,int]).
fType(iToFloat, [int,float]).
fType(print, [_X, unit]). /* simple print */


/* Find function signature
   A function is either buld in using fType or
   added as a user definition with gvar(fct, List)
*/
typeIf3(Test, T):-
    functor(Test,cond,2),
    Test =.. [cond,Expr1,Code | _],
    typeExp(Expr1,bool),
typeCode(Code,T).



typeIf2([S, S2|Tail], T):-
    write(T),
    typeIf2([S2|Tail], T),
    typeIf3(S,T).

typeIf2([S|[]], T):-
    typeIf3(S,T).

% Check the user defined functions first
functionType(Name, Args):-
    gvar(Name, Args),
    is_list(Args). % make sure we have a function not a simple variable

functionType(Name, Args):-
    lvar(Name, Args),
    is_list(Args).

% Check first built in functions
functionType(Name, Args) :-
    fType(Name, Args), !. % make deterministic

    
findVar(Name,T):-
    gvar(Name,T).

findVar(Name,T):-
    lvar(Name,T).




% This gets wiped out but we have it here to make the linter happy