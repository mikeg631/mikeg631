
open Llvm
open Llvm_executionengine
open Llvm_target
open Llvm_scalar_opts


exception Error of string

type llvar = string*llvalue
let context = global_context()
let the_module = create_module context "my jit"
let null_byte = '\x00'
let builder = builder context
let double_type = double_type context
let int_type = i32_type context
let bool_type = i1_type context
let char_type = i8_type context
let string_type = pointer_type char_type
let named_values:(string, string*llvalue) Hashtbl.t = Hashtbl.create 15
let func_values:(string, string*llvalue) Hashtbl.t = Hashtbl.create 15
let global_values:(string, string*llvalue) Hashtbl.t = Hashtbl.create 15
let global_funcs:(string, string*llvalue) Hashtbl.t = Hashtbl.create 15



let getType (n:llvalue) : string = 
  let tempType = (type_of n) in
  match (classify_type tempType) with
  | 	Llvm.TypeKind.Void -> "void"
| Llvm.TypeKind.Half ->  "double"
| Llvm.TypeKind.Float -> "double"
| Llvm.TypeKind.Double -> "double"
| 	Llvm.TypeKind.Integer -> let d = integer_bitwidth tempType in 
if d = 1 then "bool" else if d = 32 then "int" else if d = 8 then "string" else raise (Error "unsupported bitwidth for integer")
| 	Llvm.TypeKind.Function -> "function"
| 	Llvm.TypeKind.Array ->   "array"
| 	Llvm.TypeKind.Pointer -> "pointer"
| _ -> "not expected?"


let getType2 (tempType:lltype) : string = 
  match (classify_type tempType) with
  | 	Llvm.TypeKind.Void -> "void"
| Llvm.TypeKind.Half ->  "double"
| Llvm.TypeKind.Float -> "double"
| Llvm.TypeKind.Double -> "double"
| 	Llvm.TypeKind.Integer -> let d = integer_bitwidth tempType in 
if d = 1 then "bool" else if d = 32 then "int" else raise (Error "unsupported bitwidth for integer")
| 	Llvm.TypeKind.Function -> "function"
| 	Llvm.TypeKind.Array ->   "array"
| 	Llvm.TypeKind.Pointer -> "pointer"
| _ -> "not expected?"

let  getStringFormat s = 
  match lookup_global s the_module with
  | Some format -> format
  | None -> raise (Error "Couldn't find format stored in globals")

  let castToType (n:llvalue) (valueType:string) (castTo:string) =
    match castTo with 
      | "double" -> ( match valueType with 
      | "double" -> n (*no cast required*)
      | "int" -> build_sitofp n double_type "castIntToFloat" builder
      | "bool" -> build_sitofp n double_type "castBoolToFloat" builder
      | _ -> n
      )
      | "int" -> ( match valueType with 
      | "int" -> n
      | "bool" -> build_intcast n int_type "castBoolToInt" builder
      | "double" -> build_fptosi n int_type "castDoubleToInt" builder
      | _ -> n
      )
      | "bool" -> ( match valueType with 
      | "bool" -> n
      | "int" -> build_intcast n bool_type "castIntToBool" builder
      | "double" -> build_fptosi n bool_type "castDoubleToBool" builder
      | _ -> n
      )
      | _ -> n (*No other types are defined that you can cast to so this shouldn't happen*)
  

      let castToType2 (n:llvalue) (castTo:string) : llvalue =
        let valueType = getType n in
        match castTo with 
          | "double" -> ( match valueType with 
          | "double" -> n (*no cast required*)
          | "int" -> build_sitofp n double_type "castIntToFloat" builder
          | "bool" -> build_sitofp n double_type "castBoolToFloat" builder
          | _ -> n
          )
          | "int" -> ( match valueType with 
          | "int" -> n
          | "bool" -> build_intcast n int_type "castBoolToInt" builder
          | "double" -> build_fptosi n int_type "castDoubleToInt" builder
          | _ -> n
          )
          | "bool" -> ( match valueType with 
          | "bool" -> n
          | "int" -> build_intcast n bool_type "castIntToBool" builder
          | "double" -> build_fptosi n bool_type "castDoubleToBool" builder
          | _ -> n
          )
          | _ -> n (*No other types are defined that you can cast to so this shouldn't happen*)
      
  
  

let loadVariable name =
if((Hashtbl.mem named_values name)) then 
let (varType,load) = (Hashtbl.find named_values name) in (varType,(build_load load name builder))
else let (varType,load) = (try Hashtbl.find func_values name with
| Not_found -> (try Hashtbl.find global_values name with
| Not_found -> raise (Error (String.concat "Unknown variable:" [name;])))) in (varType,load)

    let buildStore n1 temp builder2 =
      match temp with
      | (varType,n2) -> (build_store n1 n2 builder2)


  let codegen_callsnprint (n: llvalue) : llvalue =
    let callee = (match lookup_function "snprintf" the_module with
    | Some func -> func 
    | None -> raise (Error "can't call") )in 
     let tempNull2 = const_null string_type in
     let tempNull = (build_array_malloc char_type (const_int int_type 0)  "test" builder) in
     let zero = const_int int_type 0 in
     let format = (match (getType n) with
     | "int" -> (getStringFormat "%d")
     | "bool" -> (getStringFormat "%d")
     | "double" ->(getStringFormat "%f") 
     | "string" -> (getStringFormat "%s")
     | _ -> getStringFormat "%s"  ) in 
     let args1 = Array.make 4 tempNull in (Array.set args1 0 tempNull; Array.set args1 1 zero; Array.set args1 2 format ; Array.set args1 3 n;
    let size1 = (build_call callee args1 "snprintf" builder) in
    let size = build_add size1 (const_int int_type 1) "" builder in
    build_free tempNull builder;
    let buf = (build_array_malloc char_type size "arrayAlloc" builder) in
    ((Array.set args1 0 buf);
    (Array.set args1 1 size);
    (build_call callee args1 "snprintf2" builder);
    buf))
    
  
    let codegen_callconcat (n1: llvalue) (n2: llvalue) : llvalue =
      let arrayCharT = Llvm.array_type char_type (1) in
      let stringPT_type = Llvm.pointer_type arrayCharT in
      let castedPointer1 = build_bitcast n1 stringPT_type "cast" builder in
      let castedPointer2 = build_bitcast n2 stringPT_type "cast" builder in
      let value1 = (Int64.to_int ( (Llvm_target.DataLayout.size_in_bits (type_of castedPointer1))))/8 in
      let value2 = (Int64.toInt (Llvm_target.DataLayout.size_in_bits (type_of castedPointer2)))/8 in
      let buf = build_array_malloc char_type (const_int int_type (value1 + value2+1))  "buildString" builder in
      let castedPointer3 = build_bitcast buf stringPT_type "cast" builder in
      (for i = 0 to value1 do
        let thisPointer = (build_gep  castedPointer1 [|(const_int int_type 0);(const_int int_type i);|] "LoadIndex" builder) in
        let tempChar = build_load thisPointer "loadChar" builder in
        let nextPointer = (build_gep  castedPointer3 [|(const_int int_type 0);(const_int int_type i);|] "LoadIndex" builder) in
         build_store tempChar nextPointer builder;
      done);
      (for i = 0 to value2 do
        let thisPointer = (build_gep  castedPointer1 [|(const_int int_type 0);(const_int int_type i);|] "LoadIndex" builder) in
        let tempChar = build_load thisPointer "loadChar" builder in
        let nextPointer = (build_gep  castedPointer3 [|(const_int int_type 0);(const_int int_type (value1+i));|] "LoadIndex" builder) in
         build_store tempChar nextPointer builder;
      done); buf

    
      let rec makeCorrectType paramType param =
        let expectedType = (getType paramType) in
        match param with 
        | Ast.VarArg(s) -> let (varType,load) = loadVariable s in (match varType with
        | "string" -> load (* no possible cast, will just let call instruction check for correctness here*)
        | "bool" -> (castToType load varType expectedType)
        | "int" -> (castToType load varType expectedType)
        | "double" -> (castToType load varType expectedType)
        | _ -> raise (Error "unexpected type in function call!!!"))
        | Ast.ArgString(sE) -> (codegen_stringExpr sE)
        | Ast.Arg(e) -> let temp = codegen_expr e in (castToType temp (getType temp) expectedType)
        
        and makeString s =
        let strLen = ((String.length s)+1) in
        let buf = build_array_malloc char_type (const_int int_type strLen)  "buildString" builder in
        let arrayCharT = Llvm.array_type char_type (1) in
        let stringPT_type = Llvm.pointer_type arrayCharT in
        let castedPointer = build_bitcast buf stringPT_type "cast" builder
         in
        (for  i = 0 to (strLen -2) do
       let thisChar = (const_int char_type (Char.code (String.get s i))) in
       let thisPointer = (build_gep  castedPointer [|(const_int int_type 0);(const_int int_type i);|] "LoadIndex" builder)
       in build_store thisChar thisPointer builder
      done); buf


and buildCall callee2 argList2 =
let argList =  Array.of_list argList2 in
let callee = 
match lookup_function callee2 the_module with
| Some callee3 -> callee3
| None ->  raise (Error (String.concat "unknown function referenced:" [callee2;])) in 
let params = params callee in
if Array.length params == Array.length argList then () else
        raise (Error (String.concat "Incorrect number of arguments for: " [callee2;]));
      let args2 = (Array.map2 makeCorrectType params argList) in
      build_call callee args2 "" builder
and codegen_callPrintf (sE: Ast.stringExpr) = 
  let ptr = (codegen_stringExpr sE) in
  let args = [|ptr|] in
  let callee = (match lookup_function "printf" the_module with
    | Some func -> func
    | None -> raise (Error "Can't call printf")) in
  build_call callee args "printf" builder
  and codegen_callPrintf2 (ptr:llvalue) = 
  let args = [|ptr|] in
  let callee = (match lookup_function "printf" the_module with
    | Some func -> func
    | None -> raise (Error "Can't call printf")) in
  build_call callee args "printf" builder
  
  and codegen_stringExpr (sE: Ast.stringExpr) : llvalue =
  match sE with
| Ast.String(s) -> makeString s
| Ast.VarString(name) -> let (varType,succ) = (loadVariable name) in
(codegen_callsnprint succ)
| Ast.ConcatString(s1,s2) -> codegen_callconcat (codegen_stringExpr s1) (codegen_stringExpr s2)
| Ast.ConcatExprString(e,s2) -> codegen_callconcat (codegen_callsnprint (codegen_expr e)) (codegen_stringExpr s2)
| Ast.ConcatSEExpr(s1,e) -> codegen_callconcat (codegen_stringExpr s1) (codegen_callsnprint (codegen_expr e))

and codegen_expr (d: Ast.expr) = 
match d with 
  | Ast.Double(f) -> (const_float double_type f)
  | Ast.Int(i) -> (const_float double_type (float_of_int i))
  | Ast.Var(name) ->
  let (typeV ,value) = loadVariable name in
      (match typeV with
    | "int" -> build_sitofp value double_type "intTofloat" builder
    | "double" -> value
    | "bool" -> build_sitofp  value double_type "boolTofloat" builder
    | "string" -> value)
| Ast.Add(l, r) -> (build_fadd (castToType2 (codegen_expr l) "double") (castToType2 (codegen_expr r) "double") "addtmp" builder)
| Ast.Sub(l, r) -> (build_fsub (castToType2 (codegen_expr l) "double") (castToType2 (codegen_expr r) "double") "subtmp" builder)
| Ast.Mul(l, r) -> (build_fmul (castToType2 (codegen_expr l) "double") (castToType2 (codegen_expr r) "double") "multmp" builder)
| Ast.Divide(l, r) -> (build_fdiv (castToType2 (codegen_expr l) "double") (castToType2 (codegen_expr r) "double") "dividetmp" builder)
| Ast.Pos(e) ->    codegen_expr e 
| Ast.Neg(e) ->    (build_neg (codegen_expr e) "negtmp" builder)
| Ast.FunCall(callee, argsList) -> buildCall callee argsList
| _ -> build_fpcast (codegen_condition d) double_type "boolTofloat" builder 


and codegen_condition (cond: Ast.expr) : llvalue = 
  match cond with 
| Ast.Boolean(b) -> if(b) then const_int bool_type 1 else const_int bool_type 0
| Ast.Var(name) -> (let (typeKind,value) = (loadVariable name) in
    (match typeKind with
    | "double" -> (build_fptosi value bool_type "floatToInt" builder)
    | "int"  -> (build_intcast value bool_type "IntToBool" builder)
    | "bool" -> value
    | "string" -> raise (Error "String found in boolean expression")))
| Ast.Comp(c) -> build_fptosi (codegen_comparison c) bool_type "intCastComparison" builder
| Ast.And(c1,c2)  -> (build_and (codegen_condition c1) (codegen_condition c2) "andtemp" builder)
| Ast.Or(c1,c2)  -> (build_or (codegen_condition c1) (codegen_condition c2) "ortemp" builder)
| Ast.Not(c) -> (build_not (codegen_condition c) "nottemp" builder)
| _ -> (build_fptosi (codegen_expr cond) bool_type "floatTobool" builder)
and 
codegen_comparison (e: Ast.expr) = 
match e with 
| Ast.Equal(e1,e2) -> (build_fcmp Fcmp.Ueq (codegen_expr e1) (codegen_expr e2) "equaltmp" builder)
| Ast.NotEqual(e1,e2) -> (build_fcmp Fcmp.Une (codegen_expr e1) (codegen_expr e2) "notequaltmp" builder)
| Ast.LessThanEqual(e1,e2) -> (build_fcmp Fcmp.Ule (codegen_expr e1) (codegen_expr e2) "lessthanequaltmp" builder)
| Ast.GreaterThanEqual(e1,e2) -> (build_fcmp Fcmp.Uge (codegen_expr e1) (codegen_expr e2) "greaterthanequaltmp" builder)
| Ast.LessThan(e1,e2) -> (build_fcmp Fcmp.Ult (codegen_expr e1) (codegen_expr e2) "lessthantmp" builder)
| Ast.GreaterThan(e1,e2) -> (build_fcmp Fcmp.Ugt (codegen_expr e1) (codegen_expr e2) "greaterthanetmp" builder) 
| _ -> (codegen_expr e)


let rec codegen_FunCodeblock statementList = 
 if(List.length statementList = 1) then
 (match (List.hd statementList) with
 | Ast.Return(e) -> (codegen_expr e) 
 | Ast.ReturnString(sE) -> (codegen_stringExpr sE) 
 | Ast.ReturnBool(cond) -> (codegen_condition cond)
 | Ast.ReturnVar(s) ->   let (varType,value)  = (loadVariable s) in value
 | Ast.EmptyReturn(s2) -> (const_null double_type)
 | _ -> codegen_funStatement (List.hd statementList))
else if (List.length statementList > 1) then (
  match (List.hd statementList) with
  | Ast.Return(e) -> (codegen_expr e) 
 | Ast.ReturnString(sE) -> (codegen_stringExpr sE) 
 | Ast.ReturnBool(cond) -> (codegen_condition cond)
 | Ast.ReturnVar(s) ->   let (varType,value)  = (loadVariable s) in value
 | Ast.EmptyReturn(s2) -> (const_null double_type)
 | _ -> let l = codegen_funStatement (List.hd statementList) in
 codegen_FunCodeblock (List.tl statementList))
else
const_null int_type

and codegen_funStatement (statement: Ast.funStatement) : llvalue = 
match statement with
| Ast.Printf(sE) -> codegen_callPrintf sE
| Ast.Println(sE) -> (codegen_callPrintf sE); (codegen_callPrintf2 (getStringFormat "\n"))
| Ast.FunIf clauses -> codegen_FunifStmt clauses
| Ast.FunFor(assign,cond,inc,code) -> codegen_FunFor assign cond inc code
| Ast.FunWhile(code, cond) -> codegen_FunWhile code cond
| Ast.StatementDeclare(d) -> (match d with 
| Ast.DeclareVar(varType,name) -> 
(let fail = not (Hashtbl.mem named_values name) in    
 match fail with    
| true ->( match varType with 
  | "int" -> (Hashtbl.add named_values name (varType,(build_alloca int_type name builder))); const_null int_type;
 |  "double" -> Hashtbl.add named_values name (varType,(build_alloca double_type name builder)); const_null double_type;
 | "bool" -> Hashtbl.add named_values name (varType,(build_alloca bool_type name builder)); const_null bool_type;
 | "string" -> Hashtbl.add named_values name (varType,(build_alloca char_type name builder)); const_null string_type;
 | _ -> raise (Error (String.concat "unrecognized variable type: Only int, double , bool and String are supported. for" [name;]))
 ) | false -> raise (Error  "Error, variable already declared");)
 | Ast.DeclareVarAssign(varType,name,e) -> 
 (let fail = not (Hashtbl.mem named_values name)     
 in match fail with  
   | true -> (match varType with 
   | "int" ->  let alloc = (build_alloca int_type name builder) in (Hashtbl.add named_values name (varType,alloc)); (build_store (build_fptosi (codegen_expr e) int_type "intCastAssign" builder) alloc builder); const_null int_type;
  |  "double" -> let alloc = (build_alloca double_type name builder) in (Hashtbl.add named_values name (varType,alloc)); (build_store (codegen_expr e) alloc builder); const_null double_type;
  | _ -> raise (Error (String.concat "unrecognized variable type: Expected: Int or double for var" [name;]))
  )  | false -> raise (Error (String.concat "Error, variable already declared:" [name;])) ;)
  | Ast.DeclareVarAssignBool(varType,name,cond) -> 
  (let fail = not (Hashtbl.mem named_values name)     
      in match fail with   
   | true -> (match varType with 
    | "bool" -> let alloc = (build_alloca bool_type name builder) in (Hashtbl.add named_values name (varType,alloc)); (build_store (build_intcast (codegen_condition cond) bool_type "intCastAssign" builder) alloc builder); const_null bool_type;
   | _ -> raise (Error "unrecognized assignment Expected: Bool.")
   )  | false -> raise (Error (String.concat "Error, variable already declared:" [name;])) ;)
   | Ast.DeclareVarAssignString(varType,name,sE) -> 
   (let fail = not (Hashtbl.mem named_values name)  
      in match fail with    
   | true -> (match varType with (* figure out string type TO DO *)
     | "string" -> let temp = (codegen_stringExpr sE) in (Hashtbl.add named_values name ("string",temp)); temp
    | _ -> raise (Error "unrecognized variable type: Expected: string.")
    )  | false -> raise (Error (String.concat "Error, variable already declared:" [name;])) ;))
    | Ast.StatementAssign(d) -> ( match d with 
    | Ast.DeclareVarAssign(varType,name,e) -> 
 (let fail = not (Hashtbl.mem named_values name)  
  in match fail with
   | true -> (match varType with 
   | "int" ->  let alloc = (build_alloca int_type name builder) in (Hashtbl.add named_values name (varType,alloc)); (build_store (build_fptosi (codegen_expr e) int_type "intCastAssign" builder) alloc builder); const_null int_type;
  |  "double" -> let alloc = (build_alloca double_type name builder) in (Hashtbl.add named_values name (varType,alloc)); (build_store (codegen_expr e) alloc builder); const_null double_type;
   | _ -> raise (Error "unrecognized variable type: Expected: Int or double.")
  )  | false -> raise (Error (String.concat "Error, variable already declared:" [name;]));)
    | Ast.AssignVar(name,e) -> 
    (let (varType,succ) = try Hashtbl.find named_values name with
    | Not_found -> raise (Error (String.concat "Error, variable not declared:" [name;]))
      in (match varType with
     | "int" -> let temp = (build_fptosi (codegen_expr e)  int_type "intCast" builder) in (buildStore temp (Hashtbl.find named_values name) builder); temp
     |   "double" -> let temp = (codegen_expr e) in  (buildStore temp (Hashtbl.find named_values name) builder); temp
     | "string" -> let temp = (codegen_stringExpr (Ast.ConcatExprString(e,VarString("")))) in (buildStore temp (Hashtbl.find named_values name) builder); temp
     | "bool" -> let temp = (build_fptosi (codegen_expr e)  bool_type "intCast" builder) in (buildStore temp (Hashtbl.find named_values name) builder); temp
     | _ -> raise (Error "Wrong type."))) 
     | Ast.AssignVarString(name,sE) -> 
     (let (varType,succ) = try Hashtbl.find named_values name with
       | Not_found -> raise (Error (String.concat "Error, variable not declared:" [name;]))
       in ( match varType with
      | "string" -> let temp = (codegen_stringExpr sE) in (buildStore (codegen_stringExpr sE) (Hashtbl.find named_values name) builder); temp
      | _ -> raise (Error (String.concat "Error, wrong type:" [name;]));))
      | Ast.AssignVarBool(name,cond) -> 
      (let (varType,succ) = (try Hashtbl.find named_values name with
        | Not_found -> raise (Error (String.concat "Error, variable not declared:" [name;])))
        in (match varType with
       | "bool" -> let temp = (codegen_condition cond) in (buildStore temp (Hashtbl.find named_values name) builder); temp
       | _ -> raise (Error (String.concat "Wrong type:" [name;]));)))
| Ast.Expr(e) -> codegen_expr e


and codegen_FunFor assign cond incre code =
let temp = (match assign with 
| Ast.DeclareVarAssign(varType,name,e) -> (codegen_funStatement (Ast.StatementDeclare(Ast.DeclareVarAssign(varType,name,e)))); name
| Ast.AssignVar(name,e) -> (codegen_funStatement (Ast.StatementAssign(Ast.AssignVar(name,e)))); name
| _ -> raise (Error (String.concat "Wrony Type of assignment in for loop:" ["";]))) in
(codegen_expr (Var(temp)));
let preheader_bb = insertion_block builder in
let the_function = block_parent preheader_bb in
let loop_bb = append_block context "Forloop" the_function in
let end_cond1 = (codegen_condition cond) in
position_at_end loop_bb builder;
codegen_FunCodeblock code;
codegen_increment incre;
let end_cond2 = (codegen_condition cond) in
      (let loop_end_bb = insertion_block builder in
      let after_bb = append_block context "afterForloop" the_function in
      build_cond_br end_cond2 loop_bb after_bb builder;
      position_at_end preheader_bb builder;
      build_cond_br end_cond1 loop_bb after_bb builder;
      position_at_end after_bb builder); (const_null double_type)

and codegen_FunWhile cond code =
let preheader_bb = insertion_block builder in
let the_function = block_parent preheader_bb in
let loop_bb = append_block context "Whileloop" the_function in
let end_cond1 = codegen_condition cond in
position_at_end loop_bb builder;
codegen_FunCodeblock code;
let end_cond2 = codegen_condition cond in
      let loop_end_bb = insertion_block builder in
      let after_bb = append_block context "afterWhileloop" the_function in
      position_at_end loop_bb builder;
      build_cond_br end_cond2 loop_bb after_bb builder;
      position_at_end preheader_bb builder;
      build_cond_br end_cond1 loop_bb after_bb builder;
      position_at_end after_bb builder;
      (const_null double_type)
      and codegen_FunifStmt l =
      let endL = (List.length l) in
      let start_bb = insertion_block builder in
      let the_function = block_parent start_bb in
      let then_bbs = (Array.make  endL start_bb) in
      let new_then_bbs = (Array.make endL start_bb) in
      let cond_bbs = (Array.make endL start_bb) in
      (*Generate each branch's blocks keeping their basic blocks in an array*)
      (for i = 0 to (endL-1) do
        let cond_bb = append_block context "IfCond" the_function in
        position_at_end cond_bb builder;
        let then_bb = append_block context "then" the_function in
        position_at_end then_bb builder;
        let (cond,code) = (List.nth l i) in
        codegen_FunCodeblock code;
        position_at_end then_bb builder; 
        let new_then_bb = insertion_block builder in
        (Array.set then_bbs i then_bb);
        (Array.set new_then_bbs i new_then_bb);
        (Array.set cond_bbs i cond_bb)
      done);
      (*Grab basic block at end of the conditions hold onto it *)
      let merge_bb = append_block context "ifcont" the_function in
      position_at_end merge_bb builder;
      position_at_end start_bb builder;
      build_br (Array.get cond_bbs 0) builder;
      (for i = 0 to (endL-2) do
      position_at_end (Array.get cond_bbs i) builder;
      let (tempCond,tempCode) = (List.nth  l i) in
      build_cond_br (codegen_condition tempCond) (Array.get then_bbs i) (Array.get cond_bbs (i+1)) builder;
      done);
      position_at_end (Array.get cond_bbs (endL-1)) builder;
      let (tempCond,tempCode) = (List.nth  l (endL-1)) in
      build_cond_br (codegen_condition tempCond) (Array.get then_bbs (endL-1)) merge_bb builder;
      (*Finish by adding a branch at the end of each codeblock leading back to the end*)
      (for i = 0 to ((List.length l)-1) do
        position_at_end (Array.get new_then_bbs i) builder; ignore (build_br merge_bb builder)
      done);
      position_at_end merge_bb builder;
      const_null int_type
and
codegen_increment = function
       | Ast.PreInc(s) -> codegen_funStatement (Ast.StatementAssign(Ast.AssignVar(s,Add(Var(s),Int(1)))))
       | Ast.PostInc(s) -> codegen_funStatement (Ast.StatementAssign(Ast.AssignVar(s,Add(Var(s),Int(1)))))
       | Ast.PreDec(s) -> codegen_funStatement (Ast.StatementAssign(Ast.AssignVar(s,Sub(Var(s),Int(1)))))
       | Ast.PostDec(s) -> codegen_funStatement (Ast.StatementAssign(Ast.AssignVar(s,Sub(Var(s),Int(1)))))

let getArgTypes (args:Ast.argList) =
  if(List.length args < 1) then [||] else
  let argTypes = (Array.make (List.length args) double_type) in
  ignore((for i = 0 to ((List.length args)-1) do
    (match (List.nth args i) with
    | (varType,name) ->(match varType with 
      | "int" -> (Array.set argTypes i int_type)
      | "double" -> (Array.set argTypes i double_type)
      | "bool" -> (Array.set argTypes i bool_type)
      | "string" -> (Array.set argTypes i string_type)
      | _ -> raise (Error (String.concat "Error, unkown type in function:" [name;]))
      ) 
    | _ -> raise (Error "Wrong type? Parsing error?"))
  done));
  argTypes

  let getArgNames (args:Ast.argList) =
    if(List.length args < 1) then [||] else
    let argNames = (Array.make (List.length args) "") in
    (for i = 0 to ((List.length args)-1) do
      match (List.nth args i) with
      | (varType,name) -> (Array.set argNames i name)
      | _ -> raise (Error "Wrong type? Parsing error?")
    done);
    argNames

    let getStringTypes (args:Ast.argList) =
      if(List.length args < 1) then [||] else
      let types = (Array.make (List.length args) "") in
      (for i = 0 to ((List.length args)-1) do
        match (List.nth args i) with
        | (varType,name) -> (Array.set types i varType)
        | _ -> raise (Error "Wrong type? Parsing error?")
      done);
      types

let codegen_proto (varType: string) (name: string) (args: Ast.argList) =
let paramTY = getArgTypes args in
let varNames = getArgNames args in
let varStypes = getStringTypes args in
let fType = (match varType with 
      | "int" -> int_type
      | "double" -> double_type
      | "bool" -> bool_type
      | "string" -> string_type
      | "void" -> void_type context
      | _ -> raise (Error (String.concat "Error, unkown type in function:" [name;]))
      ) in
let ft = function_type fType paramTY in
let f =( match lookup_function name the_module with
  | None -> declare_function name ft the_module
  | Some f ->
      (if block_begin f <> At_end f then
        raise (Error (String.concat "Error, redifintion of function:" [name;]));
      if element_type (type_of f) <> ft then
        raise (Error (String.concat "redefinition of function with different # args" [name;])) ;
      f))
in
Array.iteri (fun i a ->
        let n = varNames.(i) in
        let t = varStypes.(i) in
        set_value_name n a;
        Hashtbl.add func_values n (t,a);
      ) (params f);
      f


let codegen_funcDefine the_fpm s =
  Hashtbl.clear func_values;
  Hashtbl.clear named_values;
   match s with
   | Ast.DefineFunc(varType,name,args,code) ->
   (let the_function = (codegen_proto varType name args) in
   let bb = append_block context "entry" the_function in
      position_at_end bb builder;
      let ret_value = (codegen_FunCodeblock code) in
      (match varType with 
      | "string" -> build_ret ret_value builder
      | "void" -> build_ret_void builder
      | _ -> build_ret (castToType ret_value (getType ret_value) varType) builder );
      Llvm_analysis.assert_valid_function the_function;
      let _ = PassManager.run_function the_function the_fpm in
      the_function)
    |  _ -> raise (Error "Error not a function")


let codegen_global the_fpm = function
  | Ast.DefineFunc(s1,s2,args,code) -> 
  if(s2 = "main") then codegen_funcDefine the_fpm (Ast.DefineFunc(s1,"realMain",args,code)) else  codegen_funcDefine the_fpm (Ast.DefineFunc(s1,s2,args,code))
  | Ast.DeclareFunc(t,n,args) -> codegen_proto t n args
  | Ast.Global2(e) -> codegen_expr e;
  | Ast.Global(d) -> (match d with 
  | Ast.DeclareVar(varType,name) -> raise (Error "Global variables must be initalized when they are declared")
 | Ast.DeclareVarAssign(varType,name,e) -> 
 (let fail = not (Hashtbl.mem named_values name)     
   in match fail with    
   | true ->(match varType with 
   | "int" ->  let globalV = declare_global int_type name the_module in set_initializer (castToType2 (codegen_expr e) "int") globalV; Hashtbl.add global_values name (varType, globalV); const_null int_type
  |  "double" -> let globalV = declare_global double_type name the_module in  set_initializer (codegen_expr e) globalV; Hashtbl.add global_values name (varType, globalV); const_null double_type
    | _ -> raise (Error "unrecognized variable type: Expected: Int or double.")
   ) | false -> raise (Error "Error, variable already declared. Global variables are constant");)
  | Ast.DeclareVarAssignBool(varType,name,cond) -> 
  (let fail = not (Hashtbl.mem global_values name)     
  in match fail with    
  | true -> ( match varType with 
    | "bool" ->  let globalV = declare_global bool_type name the_module in  set_initializer (castToType2 (codegen_condition cond) "bool") globalV; Hashtbl.add global_values name (varType, globalV); const_null bool_type
   | _ -> raise (Error "unrecognized assignment Expected: Bool."))
     | false -> raise (Error "Error, variable already declared"))
   | Ast.DeclareVarAssignString(varType,name,sE) -> 
   (let fail = not (Hashtbl.mem global_values name)    
   in match fail with    
   | true -> (match varType with (* figure out string type TO DO *)
     | _ -> raise (Error "Sorry can't make a global variable as a string.")
     | _ -> raise (Error "unrecognized variable type: Expected: String.")
    )  | false -> raise (Error "Error, variable already declared")))

let rec codegen_top the_fpm globalList = 
  if(List.length globalList = 1) then codegen_global the_fpm (List.hd globalList)
else if (List.length globalList > 1) then
(codegen_global the_fpm (List.hd globalList);
codegen_top the_fpm (List.tl globalList);)
else
raise (Error "no code?")

let dump the_fpm globalList =
  let printf_t = (var_arg_function_type int_type [| (pointer_type (i8_type context)) |]) in 
  (declare_function "printf" printf_t the_module);
  let snprintf_t =  (var_arg_function_type int_type [| (pointer_type (i8_type context)) |])
  in (declare_function "snprintf" snprintf_t the_module);
let the_function = (codegen_proto "int" "main" []) in
  let bb = append_block context "Entry" the_function in
     position_at_end bb builder;
     build_global_stringptr "%s" "%s" builder;
     build_global_stringptr "%d" "%d" builder;
     build_global_stringptr "%f" "%f" builder;
     build_global_stringptr "\n" "\n" builder;
  codegen_top the_fpm globalList;
  position_at_end bb builder;
  let callee = (match lookup_function "realMain" the_module with
  | Some func -> buildCall "realMain" []
  | None ->  Printf.eprintf "Couldn't find main func for this file. Nothing will be ran:\n "; const_null int_type )
  in 
 
  build_ret (const_int int_type 1) builder;
  Llvm_analysis.assert_valid_function the_function;
     PassManager.run_function the_function the_fpm;
      Llvm_analysis.assert_valid_module the_module 

  

let rec runCode stream =
  let test = initialize() in
  let triple = Llvm_target.Target.default_triple () in
  let the_execution_engine = create the_module in
  let lltarget  = Llvm_target.Target.by_triple triple in
  let llmachine = Llvm_target.TargetMachine.create ~triple:triple lltarget in
  let lldly     = Llvm_target.TargetMachine.data_layout llmachine in
  set_target_triple (Llvm_target.TargetMachine.triple llmachine) the_module;
  set_data_layout (Llvm_target.DataLayout.as_string lldly) the_module;
  let the_fpm = PassManager.create_function the_module in
 add_instruction_combination the_fpm;
  add_reassociation the_fpm;
  add_constant_propagation;
  add_gvn the_fpm;
  add_cfg_simplification the_fpm;
  ignore (PassManager.initialize the_fpm);
  dump the_fpm stream;
  let s = (string_of_llmodule the_module) in
 (Printf.printf "%s" s)
