%{
    open Ast
%}

%token <int> INT
%token INTD DOUBLED BOOLD STRINGD VOID
%token <float> DOUBLE
%token <string> STRING
%token TRUE
%token FALSE
%token <string> VAR
%token IF FOR WHILE ELSE
%token PRINTF
%token PRINTLN
%token SEMICOLON
%token LBRACE RBRACE
%token NOT
%token OR 
%token AND 
%token EQUAL
%token INCREMENT
%token DECREMENT
%token TCEQ TCNE TCLE TCGE TCGT TCLT
%token PLUS MINUS TIMES DIVIDE POW
%token LPAR RPAR
%token COMMA
%token RETURN
 %token EOF
 %token EOL
 %token ELSEIF
 %token DECLARE


%right EQUAL
%left OR
%left AND
%left TCEQ TCNE
%left TCLE TCGE TCGT TCLT
%left PLUS MINUS
%left TIMES DIVIDE
%nonassoc INCREMENT  DECREMENT
%type <Ast.top> main
%start main
%%

/* figure out how to make multiline if and multine arg funcs */

main:
top EOF                    { $1 }
;

top:  g=global+ { g }

global:
|  f=funcDefine { f }
|  v=vardeclare { Global(v) }
| e=expr SEMICOLON { Global2(e) }
| DECLARE t=typeP v=VAR args=argsList SEMICOLON { DeclareFunc(t,v,args) }
;




funCodeblock: LBRACE  fs=funStatement* RBRACE { fs }
;

printf:
| PRINTF LPAR  s=stringExpr  RPAR { Printf(s) }
| PRINTF LPAR  s=VAR  RPAR { Printf(VarString(s)) }
| PRINTF LPAR  e=expr  RPAR { Printf(ConcatExprString(e,String(""))) }

println:
| PRINTLN LPAR  s=stringExpr  RPAR { Println(s) }
| PRINTLN LPAR  s=VAR  RPAR { Println(VarString(s)) }
| PRINTLN LPAR  e=expr  RPAR { Println(ConcatExprString(e,String(""))) }


funcDefine: typeP VAR argsList funCodeblock { DefineFunc($1,$2,$3,$4) };

argsList:
| LPAR RPAR { [] }
| LPAR  p1=pair(typeP,VAR)   RPAR { [p1;] }
| LPAR p1=pair(typeP,VAR) p2=listOfArg+ RPAR {(List.append [p1;] p2) }
 ;


listOfArg:
COMMA typeP VAR {($2,$3)};


funCall: 
|  v=VAR LPAR  e=expr e2=funArgs+ RPAR { FunCall(v,(List.append [Arg(e);] e2)) }
|  v=VAR LPAR  e=VAR e2=funArgs+ RPAR { FunCall(v,(List.append [VarArg(e);] e2)) }
|  v=VAR LPAR  e=VAR RPAR { FunCall(v,[VarArg(e);]) }
|  v=VAR LPAR  e=stringExpr RPAR { FunCall(v,[ArgString(e);]) }
|   v=VAR LPAR  e=expr RPAR { FunCall(v,[Arg(e);]) }
|  v=VAR LPAR  RPAR { FunCall(v,[]) }
;
funArgs:
| COMMA e=expr {Arg(e)}
| COMMA s=VAR { VarArg(s)}
| COMMA e=stringExpr { ArgString(e) }

expr:
|   v_expr                      { $1 }
|   LPAR  e=expr   RPAR              { e }
|   e1=expr  TIMES  e2=expr             { Mul(e1,e2) }
|   e1=expr  DIVIDE  e2=expr            { Divide(e1,e2) }
|   e1=expr  PLUS  e2=expr              { Add(e1, e2) }
|   e1=expr  MINUS  e2=expr             { Sub(e1, e2) }
|   MINUS expr                  { Neg($2) }
|   e1=VAR  TIMES  e2=VAR             { Mul(Var(e1),Var(e2)) }
|   e1=VAR  DIVIDE  e2=VAR           { Divide(Var(e1),Var(e2)) }
|    e1=VAR  PLUS  e2=VAR             { Add(Var(e1), Var(e2)) }
|    e1=VAR  MINUS  e2=VAR            { Sub(Var(e1), Var(e2)) }
|   e1=VAR  TIMES  e2=expr             { Mul(Var(e1),e2) }
|   e1=VAR  DIVIDE  e2=expr            { Divide(Var(e1), e2) }
|   e1=VAR  PLUS  e2=expr              { Add(Var(e1), e2) }
|   e1=VAR  MINUS  e2=expr             { Sub(Var(e1), e2) }
|   e1=expr  TIMES  e2=VAR             { Mul(e1,Var(e2)) }
|   e1=expr  DIVIDE  e2=VAR             { Divide(e1,Var(e2)) }
|   e1=expr  PLUS  e2=VAR               { Add(e1, Var(e2)) }
|   e1=expr  MINUS  e2=VAR              { Sub(e1, Var(e2)) }
;



funStatement: 
|  st=if_Funstmt { st }
|  st=for_Funstmt { st }
|  st=while_Funstmt { st }
|  st=vardeclare { StatementDeclare(st)}
|  st=assignment { StatementAssign(st)}
| s= increment SEMICOLON {  StatementAssign(match s with | PreInc(s) -> AssignVar(s,Add(Var(s),Int(1))) | PostInc(s) -> AssignVar(s,Add(Var(s),Int(1))) | PostDec(s) -> AssignVar(s ,Sub(Var(s),Int(1))) |  PreDec(s) -> AssignVar(s ,Sub(Var(s),Int(1))))  }
|  RETURN  c=condition  SEMICOLON { ReturnBool(c) }
|  RETURN  e=expr  SEMICOLON { Return(e) }
|  RETURN s=VAR SEMICOLON { ReturnVar(s) }
|  RETURN  s=stringExpr  SEMICOLON {ReturnString(s) }
|  RETURN SEMICOLON { EmptyReturn("")}
|  e=expr  SEMICOLON { Expr(e) }
|  p=printf SEMICOLON {p }
|  p=println SEMICOLON { p }

; 



typeP: 
| BOOLD { "bool" }
| INTD  { "int" }
| DOUBLED { "double" }
| STRINGD {"string"}
| VOID { "void" }
;

vardeclare: 
| typeP  v=VAR  SEMICOLON { DeclareVar($1,v) }
| BOOLD  v=VAR  EQUAL  c=condition  SEMICOLON { DeclareVarAssignBool("bool", v, c)}
| STRINGD  v=VAR EQUAL  s=stringExpr  SEMICOLON { DeclareVarAssignString("string", v, s) }
| STRINGD  v=VAR EQUAL  s=VAR  SEMICOLON { DeclareVarAssignString("string", v, VarString(s)) }
| STRINGD  v=VAR EQUAL  s=expr  SEMICOLON { DeclareVarAssignString("string", v, ConcatExprString(s, String("")) ) }
| STRINGD  v=VAR EQUAL  s=expr  SEMICOLON { DeclareVarAssignString("string", v, ConcatExprString(s, String("")) ) }
| typeP v=VAR EQUAL  e=expr  SEMICOLON { DeclareVarAssign($1, v, e) }
| typeP v=VAR EQUAL  e=VAR  SEMICOLON { DeclareVarAssign($1, v, Var(e)) }
;

assignment:
| typeP  v=VAR EQUAL  e=expr  SEMICOLON { DeclareVarAssign($1, v, e)}
| v=VAR  EQUAL  e=expr  SEMICOLON { AssignVar(v,e) } 
| v=VAR  EQUAL  c=condition  SEMICOLON { AssignVarBool(v,c) } 
| v=VAR  EQUAL  s=stringExpr  SEMICOLON    { AssignVarString(v,s)}
| v=VAR EQUAL  e=VAR SEMICOLON { AssignVar(v,Var(e)) }
;

if_Funstmt: /* TO DO: try to add if { } else if {} elise if {} .... else */
| IF LPAR  c=condition  RPAR  code=funCodeblock  else1=funElse_if+  { FunIf((List.append [(c,code);] else1)) }
| IF LPAR  c=condition  RPAR  code=funCodeblock  else1=funElse_if+  ELSE  else2=funCodeblock { FunIf(List.append (List.append [(c,code);] else1) [(Boolean(true),else2);]) }
| IF LPAR  c=condition  RPAR  code=funCodeblock  ELSE  else1=funCodeblock  { FunIf([(c,code); (Boolean(true),else1);]) } 
| IF LPAR  c=condition  RPAR  code=funCodeblock { FunIf([(c,code);])}
| IF LPAR  c=VAR  RPAR  code=funCodeblock  else1=funElse_if+  { FunIf((List.append [(Var(c),code);] else1)) }
| IF LPAR  c=VAR  RPAR  code=funCodeblock  else1=funElse_if+  ELSE  else2=funCodeblock { FunIf(List.append (List.append [(Var(c),code);] else1) [(Boolean(true),else2);]) }
| IF LPAR  c=VAR  RPAR  code=funCodeblock  ELSE  else1=funCodeblock  { FunIf([(Var(c),code); (Boolean(true),else1);]) } 
| IF LPAR  c=VAR  RPAR  code=funCodeblock { FunIf([(Var(c),code);])}
;



funElse_if: 
| ELSEIF LPAR  c=condition  RPAR code=funCodeblock { (c,code) }
| ELSEIF LPAR  c=VAR  RPAR code=funCodeblock { (Var(c),code) }
;



for_Funstmt: 
| FOR LPAR  a=assignment c=condition  SEMICOLON  i=increment  RPAR  f=funCodeblock { FunFor(a,c, i,f)}
| FOR LPAR  a=assignment c=VAR  SEMICOLON  i=increment  RPAR  f=funCodeblock { FunFor(a,Var(c), i,f)}
;


while_Funstmt:
 | WHILE LPAR  c=condition  RPAR  f=funCodeblock { FunWhile(c, f) }
 |  WHILE LPAR  c=VAR  RPAR  f=funCodeblock { FunWhile(Var(c), f) }
;

increment:  
| INCREMENT VAR { PreInc($2) }
| VAR INCREMENT  { PostInc($1) }
| DECREMENT VAR  { PreDec($2) }
| VAR DECREMENT  { PostDec($1) }
;


comparison: 
| LPAR  c=comparison  RPAR              { c }
| e1=expr  TCEQ  e2=expr { Equal(e1, e2) }
| e1=expr  TCNE  e2=expr{ NotEqual(e1, e2) }
| e1=expr  TCLE  e2=expr { LessThanEqual(e1, e2) }
| e1=expr  TCGE  e2=expr { GreaterThanEqual(e1, e2) }
| e1=expr  TCGT  e2=expr { GreaterThan(e1, e2) }
| e1=expr  TCLT  e2=expr {  LessThan(e1, e2) }
| e1=VAR  TCEQ  e2=expr{ Equal(Var(e1), e2) }
| e1=VAR  TCNE  e2=expr { NotEqual(Var(e1), e2) }
| e1=VAR  TCLE  e2=expr{ LessThanEqual(Var(e1), e2) }
| e1=VAR  TCGE  e2=expr { GreaterThanEqual(Var(e1), e2) }
| e1=VAR  TCGT  e2=expr { GreaterThan(Var(e1), e2) }
| e1=VAR  TCLT  e2=expr {  LessThan(Var(e1), e2) }
| e1=VAR  TCEQ  e2=VAR { Equal(Var(e1), Var(e2)) }
| e1=VAR TCNE  e2=VAR { NotEqual(Var(e1), Var(e2)) }
| e1=VAR  TCLE  e2=VAR { LessThanEqual(Var(e1), Var(e2)) }
| e1=VAR  TCGE  e2=VAR { GreaterThanEqual(Var(e1), Var(e2)) }
| e1=VAR  TCGT  e2=VAR { GreaterThan(Var(e1), Var(e2)) }
| e1=VAR  TCLT  e2=VAR {  LessThan(Var(e1), Var(e2)) }
| e1=expr  TCEQ  e2=VAR { Equal(e1, Var(e2)) }
| e1=expr  TCNE  e2=VAR { NotEqual(e1, Var(e2)) }
| e1=expr  TCLE  e2=VAR { LessThanEqual(e1, Var(e2)) }
| e1=expr  TCGE  e2=VAR { GreaterThanEqual(e1, Var(e2)) }
| e1=expr  TCGT  e2=VAR { GreaterThan(e1, Var(e2)) }
| e1=expr  TCLT  e2=VAR {  LessThan(e1, Var(e2)) }
;


condition: 
| VAR { Var($1) }
| TRUE { Boolean(true) }
| FALSE { Boolean(false) }
| v_expr { $1}
| comparison { Comp($1) }
| c1=condition  AND  c2=condition { And(c1,c2) }
| c1=condition  OR   c2=condition { Or(c1,c2) }
| NOT condition { Not($2) }
| LPAR  c=condition  RPAR              { c }
| c1=VAR  AND  c2=condition { And(Var(c1),c2) }
| c1=VAR  OR  c2=condition { Or(Var(c1),c2) }
| NOT VAR { Not(Var($2)) }
| c1=condition  AND  c2=VAR { And(c1,Var(c2)) }
| c1=condition  OR  c2=VAR { Or(c1,Var(c2)) }
| c1=VAR  AND   c2=VAR { And(Var(c1),Var(c2)) }
| c1=VAR  OR  c2=VAR { Or(Var(c1),Var(c2)) }
;



stringExpr:
| s=STRING    { String(String.sub s 1 ((String.length s )- 2)) }
| s1=stringExpr  PLUS  s2=stringExpr { ConcatString(s1,s2) }
| s1=expr  PLUS s2=stringExpr { ConcatExprString(s1,s2) }
| s1=stringExpr PLUS  s2=expr { ConcatSEExpr(s1,s2) }
| s1=stringExpr  PLUS  s2=VAR { ConcatString(s1,VarString(s2)) }
| s1=VAR  PLUS  s2=stringExpr { ConcatString(VarString(s1),s2) }
;





v_expr:
    | funCall                       { $1 }
    | INT                           { Int($1)} 
    | DOUBLE                        {Double($1)}
    ;




