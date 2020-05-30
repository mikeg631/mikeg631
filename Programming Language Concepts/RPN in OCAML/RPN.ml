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

let matchAndDo tokens numStack = 
  begin
  match (List.hd tokens) with
  | op -> if((Stack.length numStack) > 1) then Stack.push (decide (List.hd tokens) (Stack.pop numStack) (Stack.pop numStack)) numStack
else begin "Error: not enough operands";
end
  | num -> Stack.push (float_of_string (List.hd tokens))
  | wrongNum -> "Error: incorrect number format"
  | _ -> "Error: incorrect operator";
end


  if()
(* parseExpr code*)
let parseExpr expr = 
let exprList = Str.split (Str.regexp "[ \t]+") expr in (*making list of tokens*)
let numStack = Stack.create () in (* make stack for floating point number storage*)
let rec eval tokens =
if(((Stack.length numStack) = 1) && ((List.length tokens) = 0)) then (string_of_float(Stack.pop numStack))
else if(((Stack.length numStack) != 1) && ((List.length tokens) = 0)) then "Error: not enough arguments to evaluate all numbers"
else  begin
  match (List.hd tokens) with
  | op -> if((Stack.length numStack) > 1) then begin Stack.push (decide (List.hd tokens) (Stack.pop numStack) (Stack.pop numStack)) numStack;
  eval (List.t1 tokens);
end
else begin "Error: not enough operands";
end
  | num -> Stack.push (float_of_string (List.hd tokens));
  eval (List.t1 tokens);
  | wrongNum -> "Error: incorrect number format";
  | _ -> "Error: incorrect operator";
end
eval (List.t1 tokens);
end
eval exprList;;


(*infinite Loop exit with crtl+c*)
let rec run a = 
  print_string (parseExpr a); print_string "\n"; let b = read_line() in run b;;
  
  let test = read_line() in
  run test;