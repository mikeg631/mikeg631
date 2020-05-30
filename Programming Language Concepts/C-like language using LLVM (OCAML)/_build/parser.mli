
(* The type of tokens. *)

type token = 
  | WHILE
  | VOID
  | VAR of (string)
  | TRUE
  | TIMES
  | TCNE
  | TCLT
  | TCLE
  | TCGT
  | TCGE
  | TCEQ
  | STRINGD
  | STRING of (string)
  | SEMICOLON
  | RPAR
  | RETURN
  | RBRACE
  | PRINTLN
  | PRINTF
  | POW
  | PLUS
  | OR
  | NOT
  | MINUS
  | LPAR
  | LBRACE
  | INTD
  | INT of (int)
  | INCREMENT
  | IF
  | FOR
  | FALSE
  | EQUAL
  | EOL
  | EOF
  | ELSEIF
  | ELSE
  | DOUBLED
  | DOUBLE of (float)
  | DIVIDE
  | DECREMENT
  | DECLARE
  | COMMA
  | BOOLD
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.top)
