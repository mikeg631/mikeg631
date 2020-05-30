open Lexing
open Parser
open Lexer
open Codegen
open Ast

let filename = Sys.argv.(1)

let () = 
  open_in filename |>
  Lexing.from_channel |>
  Parser.main Lexer.token |>
runCode