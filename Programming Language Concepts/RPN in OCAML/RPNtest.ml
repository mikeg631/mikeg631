let decide (op : string) (a : float) (b : float) : float =
match op with
| "^" -> (a ** b)
| "*" -> (a *. b)
| "/" -> (a /. b)
| "+" -> (a +. b)
| "-" -> (a -. b);;

let op = Str.regexp "[-/*^+]$";;
let wrongNum = Str.regexp "\\([0-9]*[.]\\)?[0-9]+";;
let num = Str.regexp "\\([0-9]*\\)?[.]?[0-9]+$";;

(* parseExpr code*)
let parseExpr expr = 
let exprList = Str.split (Str.regexp "[ \t]+") expr in (*making list of tokens*)
let numStack = Stack.create () in (* make stack for floating point number storage*)
let rec eval tokens =
if(((Stack.length numStack) = 1) && ((List.length tokens) = 0)) then (string_of_float(Stack.pop numStack))
else if(((Stack.length numStack) != 1) && ((List.length tokens) = 0)) then "Error: not enough arguments to evaluate all numbers"
else if((Str.string_match op (List.hd tokens) 0)  && ((Stack.length numStack) > 1)) 
then begin Stack.push (decide (List.hd tokens) (Stack.pop numStack) (Stack.pop numStack)) numStack;  (*pop two operands and evaluate*)
eval (List.tl tokens); end
else if(Str.string_match num (List.hd tokens) 0) then begin Stack.push (float_of_string (List.hd tokens)) numStack; (*push number on stack*)
eval (List.tl tokens); end
else if(Str.string_match wrongNum (List.hd tokens) 0) then "Error: incorrect number format"
else if(not(Str.string_match op (List.hd tokens) 0) && not(Str.string_match num (List.hd tokens) 0)) then "Error: incorrect operator"
else  "Error: not enough operands" in
eval exprList;;