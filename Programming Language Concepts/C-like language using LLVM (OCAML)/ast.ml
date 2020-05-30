
type expr = 
  | Double of float
  | Int of int
  | FunCall of string*(funArg list)
  | Var of string
  | Add of expr*expr
  | Sub of expr*expr
  | Mul of expr*expr
  | Divide of expr*expr
  | Pow of expr*expr
  | Pos of expr
  | Neg of expr
  | Equal of expr*expr
  | NotEqual of expr*expr
  | LessThanEqual of expr*expr
  | GreaterThanEqual of expr*expr
  | LessThan of expr*expr
  | GreaterThan of expr*expr
  | Comp of expr
  | And of expr*expr
  | Or of expr*expr
  | Not of expr
  | Boolean of bool
    
  and funArg = 
  | Arg of expr
  | VarArg of string
  | ArgString of stringExpr
and stringExpr = 
    | String of string
    | VarString of string
    | ConcatString of stringExpr*stringExpr
    | ConcatExprString of expr*stringExpr
    | ConcatSEExpr of stringExpr*expr

    
    type increment =
      | PreInc of string
      | PostInc of string
      | PreDec of string
      | PostDec of string
      

type argList =
  (string*string) list
  

type assignment = 
  | DeclareVarAssign of string*string*expr
  | AssignVar of string*expr
  | AssignVarString of string*stringExpr
  | AssignVarBool of string*expr

  type declare =
    | DeclareVar of string*string
    | DeclareVarAssign of string*string*expr
    | DeclareVarAssignBool of string*string*expr
    | DeclareVarAssignString of string*string*stringExpr
  

  type funStatement =
    | FunIf of (expr*funCodeblock) list
    | FunFor of assignment*expr*increment*funCodeblock
    | FunWhile of expr*funCodeblock
    | StatementDeclare of declare
    | StatementAssign of assignment
    | Expr of expr
    | Return of expr
    | ReturnBool of expr
    | ReturnString of stringExpr
    | EmptyReturn of string
    | ReturnVar of string
    | Printf of stringExpr
    | Println of stringExpr
      and  
      funCodeblock = funStatement list
      
      type global = 
        | DefineFunc of string*string*argList*funCodeblock
        | Global of declare
        | Global2 of expr
        | DeclareFunc of string*string*argList


  type top = global list