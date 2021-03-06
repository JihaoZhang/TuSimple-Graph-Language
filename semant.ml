(* Semantic checking for the TuSimple compiler *)

open Ast

module StringMap = Map.Make(String)

(* Semantic checking of a program. Returns void if successful,
   throws an exception if something is wrong.

   Check each global variable, then check each function *)

let check (globals, functions) =

  (* Raise an exception if the given list has a duplicate *)
  let report_duplicate exceptf list =
    let rec helper = function
	n1 :: n2 :: _ when n1 = n2 -> raise (Failure (exceptf n1))
      | _ :: t -> helper t
      | [] -> ()
    in helper (List.sort compare list)
  in

  (* Raise an exception if a given binding is to a void type *)
  let check_not_void exceptf = function
      (Void, n) -> raise (Failure (exceptf n))
    | _ -> ()
  in
  
  (* Raise an exception of the given rvalue type cannot be assigned to
     the given lvalue type *)
  let check_assign lvaluet rvaluet err =
     if lvaluet = rvaluet then lvaluet else 
     if rvaluet = Null_t 
     then (match lvaluet with 
        List t1 -> List(t1)
      | Set t1 -> Set(t1)
      |  _ -> raise err) 
    else raise err
  in

  let checkAddAssign lvaluet rvaluet err = 
     if ((lvaluet = Int || lvaluet = Float) && (rvaluet = Int || rvaluet = Float)) || ((rvaluet = String && rvaluet = String))
     then if lvaluet = rvaluet 
                then lvaluet
                else raise err
     else match lvaluet with
       List type1  when type1 = rvaluet -> Void
     | List _ when lvaluet = rvaluet -> Void
     | Set type1  when type1 = rvaluet -> Void
     | Set type1 -> (match rvaluet with
                    List type2 when type1 = type2 -> Void
                  |  Set type2 when type1 = type2 -> Void  
                  | _ -> raise err)
     | Map (type1, _) when  type1 = rvaluet -> Void
     | Map (type1, _ ) -> (match rvaluet with
                    List type2 when type1 = type2 -> Void
                  |  Set type2 when type1 = type2 -> Void  
                  | _ -> raise err)
     | _ -> raise err
  in 
  
  let checkMinusAssign lvaluet rvaluet err =
     if (lvaluet = Int || lvaluet = Float) && (rvaluet = Int || rvaluet = Float) 
     then if lvaluet = rvaluet then lvaluet else raise err
     else match lvaluet with
       List type1  when type1 = rvaluet -> Void
     | Set type1  when type1 = rvaluet -> Void
     | Map (type1, _) when  type1 = rvaluet -> Void
     | _ -> raise err
  in

  let checkLinkAssign node1Type node2Type exprType err=
     if node1Type = node2Type 
     then match node1Type with
     | Node(_) -> (if exprType = Int || exprType = Float
                 then Int 
                 else raise err)
     | _ -> raise err
     else raise err
  in

  let checkBatchLinkAssign t1 t2 t3 err = 
    match t1 with
    | Node _ -> (match t2 with
          List _ -> (match t3 with
                    | List _-> Int
                    | _ -> raise err)
         | _ -> raise err)
    | _ -> raise err
  in

  let checkSubscript varType rt err =
    if varType = String && rt = Int
      then varType
    else match varType with
       List type1  when rt = Int -> type1
     | Map (type1, type2) when  type1 = rt -> type2
     | _ -> raise err
  in

  let checkAddAdd tp err =
    match tp with
       List _ -> tp
      | _         -> raise err
  in
  (**** Checking Global Variables ****)

  List.iter (check_not_void (fun n -> "illegal void global " ^ n)) globals;
   
  report_duplicate (fun n -> "duplicate global " ^ n) (List.map snd globals);

  (**** Checking Functions ****)

  if List.mem "print" (List.map (fun fd -> fd.fname) functions)
  then raise (Failure ("function print may not be defined")) else ();

  report_duplicate (fun n -> "duplicate function " ^ n)
    (List.map (fun fd -> fd.fname) functions);

  (* Function declaration for a named function *)
  let built_in_decls =  StringMap.add "print"
     { typ = Void; fname = "print"; formals = [(Int, "x")];
       locals = []; body = [] } (StringMap.add "prints"
     { typ = Void; fname = "prints"; formals = [(String, "x")];
       locals = []; body = [] } (StringMap.singleton "printbig"
     { typ = Void; fname = "printbig"; formals = [(Int, "x")];
       locals = []; body = [] }))
   in
     
  let function_decls = List.fold_left (fun m fd -> StringMap.add fd.fname fd m)
                         built_in_decls functions
  in

  let function_decl s = try StringMap.find s function_decls
       with Not_found -> raise (Failure ("unrecognized function " ^ s))
  in

  let _ = function_decl "main" in (* Ensure "main" is defined *)

  let check_function func =

    List.iter (check_not_void (fun n -> "illegal void formal " ^ n ^
      " in " ^ func.fname)) func.formals;

    report_duplicate (fun n -> "duplicate formal " ^ n ^ " in " ^ func.fname)
      (List.map snd func.formals);

    List.iter (check_not_void (fun n -> "illegal void local " ^ n ^
      " in " ^ func.fname)) func.locals;

    report_duplicate (fun n -> "duplicate local " ^ n ^ " in " ^ func.fname)
      (List.map snd func.locals);

    (* Type of each variable (global, formal, or local *)
    let symbols = List.fold_left (fun m (t, n) -> StringMap.add n t m)
	   StringMap.empty (globals @ func.formals @ func.locals )
    in

    let type_of_identifier s =
      try StringMap.find s symbols
      with Not_found -> raise (Failure ("undeclared identifier " ^ s))
    in

    let checkHomogeneous elementType err tp = if tp = elementType then ignore(Int) else raise err
    in 

    (* Return the type of an expression or throw an exception *)
    let rec expr = function
	      Literal _ -> Int
      | BoolLit _ -> Bool
      | FloatLit _ -> Float
      | StringLit _ -> String
      | Null -> Null_t
      | New id -> let idTyp = type_of_identifier id
      in 
      let checkNew typ err = 
        (match typ with
        | Node _ -> Null_t
        | List _ -> Null_t
        | Set _  -> Null_t
        | Map(_,_)  -> Null_t
        | Graph -> Null_t
        | _ -> raise err)
      in checkNew idTyp (Failure ("illegal new operation of " ^ string_of_typ idTyp))
      | ListLiteral el ->  let checkListLit el err = 
         match List.length el  with 
           0 -> raise (Failure ("can't define empty list in this way in TuSimple "))
         | _ -> let elementType = expr (List.hd el) 
                in ignore(List.iter (checkHomogeneous elementType err) (List.map expr el)) ; List(elementType)
        in
        checkListLit el (Failure ("illegal list definition" ^ " {" ^ String.concat ", " (List.map string_of_expr el) 
          ^ "}. Type Must be homogeneous in a list"))
      | Id s -> type_of_identifier s
      | AddAdd s -> let tp = type_of_identifier s in
        checkAddAdd tp (Failure ("illegal next operation " ^ string_of_typ tp ^
             " ++ "))
      | Binop(e1, op, e2) as e -> let t1 = expr e1 and t2 = expr e2 in
      	(match op with
            Add | Sub | Mult | Div when t1 = Int && t2 = Int -> Int
          | Add | Sub | Mult | Div when t1 = Float && t2 = Float -> Float
          | Add | Sub | Mult | Div when t1 = Float && t2 = Int -> Float
          | Add | Sub | Mult | Div when t1 = Int && t2 = Float -> Float
          | Add | Sub | Mult | Div when (t1 = Int || t1 = Int) && (t2 = Int || t2 = Int) -> Int
          | Add | Sub | Mult | Div when (t1 = Int || t1 = Float) && (t2 = Float || t2 = Int) -> Float
          | Add when t1 = String && t2 = String -> String
          | Add when t1 = Bool && t2 = Bool -> Bool
          | Mod when t1 = Int && t2 = Int -> Int
        	| Equal | Neq when t1 = t2 -> Bool 
          | Equal | Neq when t1 = Null_t -> Bool
          | Equal | Neq when t2 = Null_t -> Bool
        	| Less | Leq | Greater | Geq when (t1 = Int || t1 = Float) && (t1 = Float || t2 = Int) -> Bool
        	| And | Or when t1 = Bool && t2 = Bool -> Bool
          | _ -> raise (Failure ("illegal binary operator " ^
                      string_of_typ t1 ^ " " ^ string_of_op op ^ " " ^
                      string_of_typ t2 ^ " in " ^ string_of_expr e))
        )
      | Unop(op, e) as ex -> let t = expr e in
      	 (match op with
      	   Neg when t = Int -> Int
         | Neg when t = Float -> Float
      	 | Not when t = Bool -> Bool
         | _ -> raise (Failure ("illegal unary operator " ^ string_of_uop op ^
      	  		   string_of_typ t ^ " in " ^ string_of_expr ex)))
      | Noexpr -> Void
      | Subscript(var, e) as ex -> let varType = type_of_identifier var 
                             and rt = expr e in
        checkSubscript varType rt (Failure ("illegal subscript  " ^ string_of_typ varType ^
             " = " ^ string_of_typ rt ^ " in " ^ 
             string_of_expr ex))
      | Assign(var, e) as ex -> let lt = type_of_identifier var
                                and rt = expr e in
        check_assign lt rt (Failure ("illegal assignment " ^ string_of_typ lt ^
				     " = " ^ string_of_typ rt ^ " in " ^ 
				     string_of_expr ex))              
      | AddAssign(var, e) as ex -> let lt = type_of_identifier var
                                   and rt = expr e in
        checkAddAssign lt rt
                         (Failure ("illegal add assignment " ^ string_of_typ lt ^ " += " ^
                           string_of_typ rt ^ " in " ^ string_of_expr ex))
      | MinusAssign(var, e) as ex -> let lt = type_of_identifier var
                                     and rt = expr e in
        checkMinusAssign lt rt
                         (Failure ("illegal add assignment " ^ string_of_typ lt ^ " -= " ^
                           string_of_typ rt ^ " in " ^ string_of_expr ex))
      | SingleEdge(e1, e2) as ex -> let lt = type_of_identifier e1
                                    and rt = type_of_identifier e2 in
        let err = (Failure ("illegal get edge " ^ string_of_typ lt ^ " -> " ^
                           string_of_typ rt ^ " in " ^ string_of_expr ex))
      in
        (match lt with
        | Node _ -> (match rt with
          | Node _ -> Int
          | _ -> raise err)
        | _ -> raise err)
      | SingleLinkAssign(e1, e) as ex -> let tp1 = expr e1
                                         and tp2 = expr e in
        if tp1 = Int && (tp2 = Int || tp2 = Float)
        then tp2
        else raise (Failure ("illegal single directed edge assignment " ^ string_of_typ tp1 ^ " = " 
                      ^ string_of_typ tp2 ^ " in " ^ string_of_expr ex))
      | DoubleLinkAssign(var1, var2, e) as ex -> let node1Type = type_of_identifier var1
                                                 and node2Type = type_of_identifier var2 
                                                 and exprType = expr e in
        checkLinkAssign node1Type node2Type exprType
                  (Failure ("illegal undirected edge assignment " ^ string_of_typ node1Type ^ " -> " ^
                           string_of_typ node2Type ^ " = " ^ string_of_typ exprType ^ " in " ^ string_of_expr ex))
      | BatchSingleLinkAssign(var1, e2, e3) as ex -> let type1 = type_of_identifier var1 
                                                   and type2 = expr e2
                                                   and type3 = expr e3 in 
        checkBatchLinkAssign type1 type2 type3
                  (Failure ("illegal batch singlelink assignment" ^ string_of_expr ex ^ " in "^ string_of_typ type1 ^ " -> " 
                    ^ string_of_typ type2 ^ " = " ^ string_of_typ type3))
      | BatchDoubleLinkAssign(var1, e2, e3) as ex -> let type1 = type_of_identifier var1 
                                                   and type2 = expr e2
                                                   and type3 = expr e3 in 
        checkBatchLinkAssign type1 type2 type3
                  (Failure ("illegal batch undirected edge assignment" ^ string_of_expr ex ^ " in "^ string_of_typ type1 ^ " -> " 
                    ^ string_of_typ type2 ^ " = " ^ string_of_typ type3))
      | Call(fname, actuals) as call -> let fd = function_decl fname in
         if List.length actuals != List.length fd.formals then
           raise (Failure ("expecting " ^ string_of_int
             (List.length fd.formals) ^ " arguments in " ^ string_of_expr call))
         else
           List.iter2 (fun (ft, _) e -> let et = expr e in
              ignore (check_assign ft et
                (Failure ("illegal actual argument found " ^ string_of_typ et ^
                " expected " ^ string_of_typ ft ^ " in " ^ string_of_expr e))))
             fd.formals actuals;
           fd.typ
       | DotCall(dname, fname, actuals) -> let typ = type_of_identifier dname in
         (match typ with
            Node typn ->
            (match fname with
                "value" -> 
                  if actuals = [] then typn else raise (Failure ("Node get method error"))
              | "name" -> 
                  if actuals = [] then String else raise (Failure ("Node name method error"))
              | "setvalue" -> 
                  (match actuals with
                      [x] when ((expr x) = Int) || ((expr x) = String) 
                            || ((expr x) = Float) || ((expr x) = Bool) -> Null_t
                    | _ -> raise (Failure ("Set setvalue method error")))
              | "iterNode" -> 
                  (match actuals with 
                      [x] when (expr x) = Int -> Node typn
                    | _ -> raise (Failure ("Error! Wrong argument in iterNode")))
              | "length" ->
                  if actuals = [] then Int else raise (Failure ("Error! Wrong argument in Node.length()"))
              | "weightIter" ->
                  (match actuals with
                      [x] when (expr x) = Int -> Int
                    | _ -> raise (Failure ("Set weightIter method error")))
              | _ -> raise (Failure ("Node has no such method"))
            )
          | List ele_type -> 
            (match fname with
                "get" -> 
                  (match actuals with
                      [x] when (expr x) = Int -> ele_type
                    | _ -> raise (Failure ("List get method error")))
              | "pop" -> 
                  if actuals = [] then Null_t else raise (Failure ("List pop method error"))
              | "remove" ->                   
                  (match actuals with
                      [x] when (expr x) = Int -> Null_t
                    | _ -> raise (Failure ("List remove method error")))
              | "length" -> 
                  if actuals = [] then Int else raise (Failure ("List length method error"))
              | "cancat" ->                   
                  (match actuals with
                      [x] when (expr x) = List ele_type -> List ele_type
                    | _ -> raise (Failure ("List cancatenate method error")))
              | "printList" ->
                  if actuals = [] then Null_t else raise (Failure ("List print_list method error"))
              | _ -> raise (Failure ("List has no such method"))
            )
          | Set ele_type ->
            (match fname with
                "put" ->
                  (match actuals with
                      [x] when (expr x) = ele_type -> Null_t
                    | _ -> raise (Failure ("Set put method error")))
              | "length" -> 
                  if actuals = [] then Int else raise (Failure ("Set length method error"))
              | "contain" ->
                  (match actuals with
                      [x] when (expr x) = ele_type -> Bool
                    | _ -> raise (Failure ("Set contain method error")))
              | "remove" ->
                  (match actuals with
                      [x] when (expr x) = ele_type -> Set ele_type
                    | _ -> raise (Failure ("Set remove method error")))
              | _ -> raise (Failure ("Set has no such method"))
            )
          | Map (k_type, v_type) ->
            (match fname with
                "get" ->
                  (match actuals with
                      [x] when (expr x) = k_type -> v_type
                    | _ -> raise (Failure ("Map get method error")))
              | "put" -> 
              (let x = List.nth actuals 0
                   and y =  List.nth actuals 1
                    in  if (expr x) = k_type  && (expr y) = v_type 
                  then Void
                else raise (Failure ("Map put method error")))
              | "size" -> 
                  if actuals = [] then Int else raise (Failure ("Map length method error"))
              | "haskey" -> 
                  (match actuals with
                      [x] when (expr x) = k_type -> Bool
                    | _ -> raise (Failure ("Map haskey method error")))
              | "remove" ->
                    (match actuals with
                      [x] when (expr x) = k_type -> Null_t
                    | _ -> raise (Failure ("Map remove method error")))
              | _ -> raise (Failure ("Sermantic ERROR : Map has no such method"))
            )
          | Graph ->
            (match fname with
                "bfs" -> 
                (match actuals with
                  [x] when (expr x) = Node(Int) -> List(Node(Int))
                | _ -> raise (Failure ("Graph bfs method error")))
              | "dfs" ->
                (match actuals with 
                  [x] when (expr x) = Node(Int) -> List(Node(Int))
                  | _ -> raise (Failure ("Graph dfs method error")))
              | "iterGraph" ->
                (match actuals with 
                  [x] when (expr x) = Int -> Node(Int)
                  | _ -> raise (Failure ("Graph iterGraph method error")))
              | "findGraphNode" ->
                (match actuals with
                  [x] when (expr x) = String -> Node(Int)
                  | _ -> raise (Failure ("Graph findGraphNode method error")))
              | "init" -> 
                if actuals = [] then Void else raise (Failure ("Graph init method error"))
              | "addNode" ->
                (match actuals with
                  [x] when Node(Int) = (expr x) -> Void
                  | _ -> raise (Failure ("Graph add node method error")))
              | "addEdge" -> 
                (match actuals with
                  [x1;x2;x3] when (expr x1) = Node(Int) &&
                                  (expr x2) = Node(Int) &&
                                  (expr x3) = Int -> Void
                  | _ -> raise (Failure ("Graph add edge method error")))
              | "combine" -> 
                    (match actuals with
                      [x] when (expr x) = Graph -> Graph
                    | _ -> raise (Failure ("Graph combine method error")))
              | "relax" ->                     
                    (match actuals with
                      [x] when (expr x) = Node(Int) -> Void
                    | _ -> raise (Failure ("Graph relax method error")))
              | "expand" -> 
                    (match actuals with
                      [x] when (expr x) = Node(Int) -> Void
                    | _ -> raise (Failure ("Graph expand method error")))
              | "length" ->
                    if actuals = [] then Int else raise (Failure ("Graph length method error"))
              | "printGraph" ->
                    if actuals = [] then Null_t else raise (Failure ("Graph print_graph method error"))
              | _ -> raise (Failure ("Graph has no such method"))
            )
          | _ -> raise (Failure ("unsupported type for method call")))
    in

    let check_bool_expr e = if expr e != Bool
     then raise (Failure ("expected Boolean expression in " ^ string_of_expr e))
     else () in

    (* Verify a statement or throw an exception *)
    let rec stmt = function
	     Block sl -> let rec check_block = function
           [Return _ as s] -> stmt s
         | Return _ :: _ -> raise (Failure "nothing may follow a return")
         | Block sl :: ss -> check_block (sl @ ss)
         | s :: ss -> stmt s ; check_block ss
         | [] -> ()
        in check_block sl
      | Expr e -> ignore (expr e)
      | Return e -> let t = expr e in if t = func.typ then () else
         raise (Failure ("return gives " ^ string_of_typ t ^ " expected " ^
                         string_of_typ func.typ ^ " in " ^ string_of_expr e))
           
      | If(p, b1, b2) -> check_bool_expr p; stmt b1; stmt b2
      | For(e1, e2, e3, st) -> ignore (expr e1); check_bool_expr e2;
                               ignore (expr e3); stmt st
      | While(p, s) -> check_bool_expr p; stmt s
    in

    stmt (Block func.body)
   
  in
  List.iter check_function functions
