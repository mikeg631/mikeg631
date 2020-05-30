(* Sum type to encode efficiently polynomial expressions *)
type pExp =
  | Term of int*int (*
      First int is the constant
      Second int is the power of x 
      10  -> Term(10,0)
      2x -> Term(2,1)
      3x^20 -> Term(3, 20)
    *)
  | Plus of pExp list
  (*
    List of terms added
    Plus([Term(2,1); Term(1,0)])
  *)
  | Times of pExp list (* List of terms multiplied *)


(*
  Function to traslate betwen AST expressions
  to pExp expressions
*)

let rec addToExp (e:pExp list) (i:int) =
  if(i = 1) then
  List.append e [(List.hd e);]
  else
  addToExp (List.append e [(List.hd e);]) (i-1)
  

let rec from_expr (_e: Expr.expr) : pExp =
    match _e with
    | Pos(e) -> (from_expr e)
    | Neg(e) -> Times([Term(-1,0); (from_expr e);])
    | Pow(e,i) -> (match e with 
    | Var(c) -> Term(1,i)
    | _ -> if(i=0) then Term(1,0)
    else if(i=1) then (from_expr e)
    else Times(addToExp [(from_expr e);] (i-1)))
    | Mul(e1,e2) -> Times([(from_expr e1); (from_expr e2);])
    | Add(e1,e2) -> Plus([(from_expr e1); (from_expr e2);])
    | Sub(e1,e2) -> Plus([(from_expr e1); Times( [(Term(-1,0)); (from_expr e2);] );])
    | Var(c) -> Term(1,1)
    | Num(i) -> Term(i,0)
(* 
  Compute degree of a polynomial expression.

  Hint 1: Degree of Term(n,m) is m
  Hint 2: Degree of Plus[...] is the max of the degree of args
  Hint 3: Degree of Times[...] is the sum of the degree of args 
*)

let rec degree (_e:pExp): int = 
  match _e with
  | Term(n,m) -> m
  | Plus(l1) -> let rec maxValue l n = if((List.length l) > 1) then begin if((degree (List.hd l)) > n)  then (maxValue (List.tl l) (degree (List.hd l))) 
  else (degree (List.hd l)) end
  else begin if((degree (List.hd l)) > n) then (degree (List.hd l))
  else n end in (maxValue l1 0)
  | Times(l2) -> let rec sumDegree l s = 
    if((List.length l) > 1) then (sumDegree (List.tl l) ((degree (List.hd l)) + s))
    else  ((degree (List.hd l)) + s) in (sumDegree l2 0)

  


  

 
(* 
  Comparison function useful for sorting of Plus[..] args 
  to "normalize them". This way, terms that need to be reduced
  show up one after another.
  *)
let compare (e1: pExp) (e2: pExp) : int =
 if(degree e1 > degree e2) then
 0
 else if (degree e1 < degree e2) then
 1
 else
 0

(* Print a pExpr nicely 
  Term(3,0) -> 3
  Term(5,1) -> 5x 
  Term(4,2) -> 4x^2
  Plus... -> () + () 
  Times ... -> ()() .. ()

  Hint 1: Print () around elements that are not Term() 
  Hint 2: Recurse on the elements of Plus[..] or Times[..]
*)
let rec print_pExp (_e: pExp): unit =
  (* TODO *)
  match _e with 
  | Term(n,m) -> (if(m = 0) then  (Printf.printf "%i" n)
   else if(m = 1 && n = 1) then (Printf.printf "x") 
   else if(m = 1 && n != 1) then (Printf.printf "%ix" n) 
   else if(n = 1 && m != 1) then (Printf.printf "x^%i" m) 
   else  (Printf.printf"%ix^%i" n m))
  | Plus l1 ->  
   let rec plusPrint l = 
 
      if(List.length l > 1)
      then 
      begin
       Printf.printf("(");
  (print_pExp (List.hd l)); 
  Printf.printf(")"); 
      (Printf.printf "+");
      (plusPrint (List.tl l))
      end
      else
      begin
       Printf.printf("(");
  (print_pExp (List.hd l)); 
  Printf.printf(")"); 
      end
      in plusPrint l1
  | Times l2 ->
   let rec timesPrint l = 
      if(List.length l > 1) then begin
  Printf.printf("(");
  (print_pExp (List.hd l)); 
  Printf.printf(")"); 
      (timesPrint (List.tl l))
      end
      else if(List.length l = 1) then
      begin
      Printf.printf("(");
  (print_pExp (List.hd l)); 
  Printf.printf(")")
      end
      in timesPrint l2

   
      


(* 
  Function to simplify (one pass) pExpr

  n1 x^m1 * n2 x^m2 -> n1*n2 x^(m1+m2)
  Term(n1,m1)*Term(n2,m2) -> Term(n1*n2,m1+m2)

  Hint 1: Keep terms in Plus[...] sorted
  Hint 2: flatten plus, i.e. Plus[ Plus[..], ..] => Plus[..]
  Hint 3: flatten times, i.e. times of times is times
  Hint 4: Accumulate terms. Term(n1,m)+Term(n2,m) => Term(n1+n2,m)
          Term(n1, m1)*Term(n2,m2) => Term(n1*n2, m1+m2)
  Hint 5: Use distributivity, i.e. Times[Plus[..],] => Plus[Times[..],]
    i.e. Times[Plus[Term(1,1); Term(2,2)]; Term(3,3)] 
      => Plus[Times[Term(1,1); Term(3,3)]; Times[Term(2,2); Term(3,3)]]
      => Plus[Term(2,3); Term(6,5)]
  Hint 6: Find other situations that can arise
*)

let check (check:pExp) = 
    match check with
    | Times(l1) ->
    if(List.length l1 = 1) then
    List.hd l1
    else
    Times(l1)
    | Plus(l2) -> if(List.length l2 = 1) then
    List.hd l2
    else
    Plus(l2)
    | Term(n,m) -> Term(n,m)

let rec distribute (p1:pExp ) (p2:pExp list) : pExp list =
            if(List.length p2 > 1) then
            (List.append [Times([p1; (List.hd p2);]);] (distribute p1 (List.tl p2)))
            else
            [Times([p1; (List.hd p2);]);]


let rec simplifyTimes (e:pExp list) =
  if(List.length e = 1) then
  List.hd e
  else if(List.length e = 2) then
  (simplifyTimes1 (List.hd e) (List.nth e 1))
  else 
  simplifyTimes (List.append [(simplifyTimes1 (List.hd e) (List.nth e 1));]  (List.tl (List.tl e)))
and


simplifyTimes1 (e1:pExp) (e2:pExp) =
            match e1 with 
            | Term(n1,m1) -> if(n1 = 0) then Term(0,0) else ( match e2 with 
              | Term(n2,m2) -> if(n2 = 0) then Term(0,0) else  Term(n1*n2,m1+m2)
              | Times(l1)  -> Times(List.append [Term(n1,m1);] l1)
              | Plus(l2) ->  Plus((distribute e1 (simplifyPlus l2))))
            | Times(l3) -> ( match e2 with 
              | Term(n3,m3) -> if(n3 = 0) then Term(0,0) else Times((List.append l3 [Term(n3,m3);]))
              | Times(l4) -> Times(List.append l3 l4)
              | Plus(l5) -> Plus((distribute (simplifyTimes l3) (simplifyPlus l5))))
            | Plus(l6) -> (match e2 with 
              | Term(n4,m4) -> if(n4 = 0) then Term(0,0) else Plus(distribute (Term(n4,m4)) (simplifyPlus l6))
              | Times(l7) -> Plus((distribute (simplifyTimes l7) (simplifyPlus l6)))
              | Plus(l8) -> Plus((distribute e1 (simplifyPlus l8))))
and
 simplifyPlus (e:pExp list) = 
    if(List.length e = 1) then
    let head = (List.hd e) in 
    match head with 
    | Plus(l1) -> l1
    | Times(l2) -> [(simplifyTimes l2);]
    | Term(n,m) -> [head;]
    else if (List.length e = 2) then
    let temp = (simplifyPlus1 (List.hd e) (List.nth e 1)) in
    (match temp with 
    | Plus(l1) -> l1
    | _ -> [temp;])
    else 
     let temp = (simplifyPlus1 (List.hd e) (List.nth e 1)) in
    (match temp with 
    | Plus(l2) -> List.append l2 (simplifyPlus (List.tl (List.tl e)))
    | _ -> List.append [temp;] (simplifyPlus (List.tl (List.tl e))))
and
  simplifyPlus1 (e1:pExp) (e2:pExp) =
            match e1 with 
            | Term(n1,m1) ->( match e2 with 
              | Term(n2,m2) -> if(n1 = 0) then e2 else  (if(n2 = 0) then e1 else if(m1 = m2) then Term(n1+n2,m1)
                else Plus([Term(n1,m1); Term(n2,m2);]))
              | Times(l1) -> if(n1 = 0) then (simplifyTimes l1) else  Plus([Term(n1,m1); (simplifyTimes l1);])
              | Plus(l2) ->  if(n1 = 0) then Plus(simplifyPlus l2)  else Plus(List.append [Term(n1,m1);] (simplifyPlus l2)))
            | Times(l3) -> (match e2 with 
              | Term(n3,m3) -> if(n3 = 0) then (simplifyTimes l3) else Plus([(simplifyTimes l3); Term(n3,m3);])
              | Times(l4) -> Plus([(simplifyTimes l3); (simplifyTimes l4);])
              | Plus(l5) -> Plus(List.append [(simplifyTimes l3);] (simplifyPlus l5)))
            | Plus(l6) -> (match e2 with 
              | Term(n4,m4) ->if(n4 = 0) then Plus((simplifyPlus l6)) else Plus(List.append (simplifyPlus l6) [Term(n4,m4);])
              | Times(l7) -> Plus(List.append (simplifyPlus l6) [(simplifyTimes l7);])
              | Plus(l8) -> Plus(List.append (simplifyPlus l6) (simplifyPlus l8)))




  let isTerm (p:pExp) : bool = 
    match p with
    | Term(n,m) -> true
    | _ -> false

    let isTermN (i:int) (p:pExp) : bool = 
    match p with
    | Term(n,m) -> if(i = m) then true else false
    | _ -> false


    let rec mergeSameTerm (e:pExp list) (i:int) : (pExp list) =
        match (List.hd e) with
      | Term(n1,m1) -> 
      if(List.length e > 2) then
      (match (List.nth e 1) with 
      | Term(n2,m2) -> (List.append [Term(n2+n1,i);] (mergeSameTerm (List.tl (List.tl e)) i) ))
      else if(List.length e = 2) then
      (match (List.nth e 1) with
      | Term(n2,m2) -> [Term(n2+n1,i);])
      else
      [Term(n1,m1);]

    

    let rec mergeTerms (e:pExp list) : (pExp list) = 
      match (List.hd e) with
      | Term(n,m) ->
      let l1, l2 = (List.partition (isTermN m) e) in
      if(List.length l1 = 1 && List.length l2 > 1) then
      (List.append l1 (mergeTerms l2))
      else if(List.length l1 > 1 && List.length l2 > 1) then
      (List.append (mergeSameTerm l1 m) (mergeTerms l2))
      else if(List.length l2 < 2 && List.length l1 > 1) then
       (List.append (mergeSameTerm l1 m) l2)
      else
      e

let addSameTerms (e:pExp list) =
      let l1,l2 = (List.partition isTerm e) in
    if(List.length l1 > 1) then
    (List.append (mergeTerms l1) l2)
    else
    e



let simplify1 (e:pExp): pExp =
    match e with
    | Term(n,m) -> Term(n,m)
    | Plus(l1) -> (if(List.length l1 = 1) then
    let head = List.hd l1 in
    (match head with
    | Term(n,m) -> Term(n,m)
    | Plus(l3) ->   Plus(simplifyPlus (List.stable_sort compare (addSameTerms (List.stable_sort compare l3))))
    | Times(l4) -> simplifyTimes l4)
    else
    Plus(simplifyPlus (List.stable_sort compare (addSameTerms (List.stable_sort compare l1)))))
    | Times(l2) -> simplifyTimes l2


(* 
  Compute if two pExp are the same 
  Make sure this code works before you work on simplify1  
*)
let rec equal_pExp (_e1: pExp) (_e2: pExp) :bool =
  match _e1 with
  | Term(n1,m1) ->  (match _e2 with 
  | Term (n2,m2) -> if(n1 = n2 && m1 = m2) then true else false
  | _ -> false)
  | Times (l1) -> (match _e2 with
  | Times(l2) -> if(List.length l1 = List.length l2) then listEqual l1 l2 else false
  | _ -> false)
  | Plus (l3) -> (match _e2 with
  | Plus (l4) -> if(List.length l3 = List.length l4) then listEqual l3 l4 else false
  | _ -> false)
  and 
  listEqual (l1: pExp list) (l2: pExp list) : bool =
  if(equal_pExp (List.hd l1) (List.hd l2)) then
  (if(List.length l1 > 1) then
  listEqual (List.tl l1) (List.tl l2)
  else true)
  else false


(* Fixed point version of simplify1 
  i.e. Apply simplify1 until no 
  progress is made
*)    

(*let rec simplify2 (e:pExp) (i:int): pExp =
    let rE = simplify1(e) in
      print_pExp rE;
      print_newline ();
      if (i=0) then
        e
      else  
        (simplify2 rE (i-1))
and*)
 let rec simplify (e:pExp): pExp =
    let rE = simplify1(e) in
      print_pExp rE;
      print_newline ();
      if (equal_pExp e rE) then
        rE
      else  
        simplify(rE)