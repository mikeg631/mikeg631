{
    open Parser
    exception Eof
}
let int = ['0'-'9'] ['0'-'9']*
let stringRegex2 = ['"'][^ '(' ')' '"']*['"']
let stringRegex = ['"']['A' -'Z' 'a' - 'z' '0' - '9' ' ']*['"']
let digit = ['0'-'9']
let frac = '.' digit+
let float = digit+ frac
(* ['A'-'Z' 'a' - 'z' '0' - '9' '!' '@' '#' '$' '%' '^' '&' '*' '(' ')' '-' '+' '{' '}' ';' '.' '<' '?' '>' ',' '/' ':' '|' '[' ']' ' ' '=']*[*)
rule token = parse
  | [' ' '\t']          { token lexbuf }
  | ['\n']              { Lexing.new_line lexbuf; token lexbuf  }
  | int as lxm   { INT (int_of_string lxm) }
  | float as lxm { DOUBLE (float_of_string lxm) }
    | stringRegex2 as lxm    { STRING(lxm) }
  | "=="                { TCEQ }
  | "!="                { TCNE }
  | "++"                { INCREMENT }
  | "--"                { DECREMENT }
  | "<="                { TCLE }
  | ">="                { TCGE }
  | '>'                 { TCGT }
  | '<'                 { TCLT }
  | "&&"                {  AND }
  | "||"                {  OR   }
  | '!'                 { NOT   }
  | '+'                 { PLUS }
  | '-'                 { MINUS }
  | '*'                 { TIMES }
  | '/'                 { DIVIDE }
  | '('                 { LPAR }
  | ')'                 { RPAR }
  | '{'                 { LBRACE }
  | '}'                 { RBRACE }
  | ','                 { COMMA }
  | '='                 { EQUAL }
  | "DECLARE"           { DECLARE }
  | "else if"           { ELSEIF }
  | "printf"            { PRINTF }
  | "println"            { PRINTF }
  | "return"               { RETURN }
  | "if"                { IF }
  | "for"               { FOR }
  | "while"             { WHILE }
  | "else"              { ELSE }
  | "int"               { INTD }
  | "double"            { DOUBLED }
  | "bool"              { BOOLD }
  | "string"            { STRINGD }
  | "void"              { VOID }
  | "true"              { TRUE }
  | "false"             { FALSE }
  | ['A'-'Z' 'a'-'z' ]+ as lxm   { VAR(lxm) }
  | ';'                 { SEMICOLON }
  | eof                 { EOF }