(* Code generation: translate takes a semantically checked AST and
produces LLVM IR

LLVM tutorial: Make sure to read the OCaml version of the tutorial

http://llvm.org/docs/tutorial/index.html

Detailed documentation on the OCaml LLVM library:

http://llvm.moe/
http://llvm.moe/ocaml/

*)

module L = Llvm
module A = Ast

module StringMap = Map.Make(String)


let translate (globals, functions) =
  let context = L.global_context () in
  let llctx = L.global_context () in
  let customM = L.MemoryBuffer.of_file "Lib/utils.bc" in
  let llm = Llvm_bitreader.parse_bitcode llctx customM in
  let the_module = L.create_module context "TuSimple"
  and i32_t  = L.i32_type  context
  and i8_t   = L.i8_type   context
  and i1_t   = L.i1_type   context
  and void_t = L.void_type context 
  and float_t  = L.double_type context
  and string_t  = L.pointer_type (L.i8_type context)
  and list_t = L.pointer_type (match L.type_by_name llm "struct.List" with
	  None -> raise (Failure "struct.List doesn't defined.")
  | Some x -> x)
  and set_t = (match L.type_by_name llm "struct.Set" with
    None -> raise (Failure "struct.Set doesn't defined.")
  | Some x -> x)
  and map_t = (match L.type_by_name llm "struct.hashmap" with
    None -> raise (Failure "struct.hashmap doesn't defined.")
  | Some x -> x)
  and node_t = (match L.type_by_name llm "struct.Node" with
    None -> raise (Failure "struct.Node doesn't defined.")
  | Some x -> x)
  and graph_t = (match L.type_by_name llm "struct.Graph" with
    None -> raise (Failure "struct.Graph doesn't defined.")
  | Some x -> x)

  in

  let ltype_of_typ = function
	  A.Int -> i32_t
	| A.Bool -> i1_t
	| A.Void -> void_t 
	| A.List(_) -> list_t
  | A.Set(_) -> set_t
  | A.Map(_, _) -> map_t
  | A.String -> string_t
  | A.Float -> float_t
  | A.Node -> node_t
  | A.Graph -> graph_t
  in

  let lconst_of_typ = function
	  A.Int -> L.const_int i32_t 0
  | A.Float -> L.const_int i32_t 1
  | A.Bool -> L.const_int i32_t 2
  | A.String -> L.const_int i32_t 3
   (* | A.Node_t -> L.const_int i32_t 4
  | A.Graph_t -> L.const_int i32_t 5
  | A.Edge_t -> L.const_int i32_t 8
 | A.List_Int_t -> list_t
  | A.Dict_String_t -> dict_t *)
  | _ -> raise (Failure ("[Error] Type Not Found for lconst_of_typ."))

  in
(*
List
*)

  let remove_list_element_t = L.function_type (L.pointer_type i8_t) [|list_t; i32_t|]
  in 
  let remove_list_element_f = L.declare_function "remove_list_element" remove_list_element_t the_module
  in
  let remove_list_element list_ptr llbuilder = 
  		let actuals = [|list_ptr; L.const_int i32_t 0|] in(
  			L.build_call remove_list_element_f actuals "remove_list_element" llbuilder
  		)
  in
  let get_list_element_t = L.function_type (L.pointer_type i8_t) [| list_t ; i32_t |]
  in 
  let get_list_element_f = L.declare_function "get_list_element" get_list_element_t the_module
  in
  let get_list_element list_ptr i llbuilder = 
    let actuals =[|list_ptr; i|] in (
      L.build_call get_list_element_f actuals "get_list_element" llbuilder
    )
  in
 
  let concat_list_t = L.var_arg_function_type list_t [| list_t ; list_t |]
  in

  let concat_list_f = L.declare_function "concat_list" concat_list_t the_module
  in

  let concat_list l1_ptr l2_ptr llbuilder = 
    let actuals = [|l1_ptr; l2_ptr|] in (
      L.build_call concat_list_f actuals "concat_list" llbuilder
    )

  in

  let create_list_t  = L.function_type list_t [| i32_t |]
  in
  let create_list_f  = L.declare_function "create_list" create_list_t the_module
  in
  let create_list typ llbuilder =
	let actuals = [|lconst_of_typ typ|]in (
	  L.build_call create_list_f actuals "create_list" llbuilder
	)
  in

  let add_list_t  = L.var_arg_function_type list_t [| list_t |]
  in

  let add_list_f  = L.declare_function "plus_list" add_list_t the_module
  in

  let add_list l_ptr llbuilder data =
	let actuals = [| l_ptr; data|] in
	  ignore (L.build_call add_list_f actuals "plus_list" llbuilder)
  in



  let add_all_elements_into_list element_list l_ptr llbuilder = 
    List.iter (add_list l_ptr llbuilder) element_list
  in

(* Hashmap *)
	let create_hashmap_t = L.function_type map_t [| i32_t; i32_t |]
	in

	let create_hashmap_f = L.declare_function "create_hashmap" create_hashmap_t the_module
	in
	let create_hashmap kType vType llbuilder =
		let actuals = [| kType; vType |] in
			ignore(L.build_call create_hashmap_f actuals "create_hashmap" llbuilder)
	in

	let hashmap_put_t = L.var_arg_function_type map_t [| map_t |]
	in

	let hashmap_put_f = L.declare_function "hashmap_put" hashmap_put_t the_module
	in

	let hashmap_put m_ptr llbuilder data = 
		let actuals = [| m_ptr; data |] in
			ignore(L.build_call hashmap_put_f actuals "hashmap_put" llbuilder)
	in

	let hashmap_remove_t = L.var_arg_function_type map_t [| map_t |]
	in

	let hashmap_remove_f = L.declare_function "hashmap_remove" hashmap_put_t the_module
	in

	let hashmap_remove m_ptr llbuilder data =
		let actuals = [| m_ptr; data |] in
			ignore(L.build_call hashmap_remove_f actuals "hashmap_remove" llbuilder)
	in

	let hashmap_get_t = L.var_arg_function_type (L.pointer_type i8_t) [| map_t |]
	in

	let hashmap_get_f = L.declare_function "hashmap_get" hashmap_get_t the_module
	in

	let hashmap_get m_ptr llbuilder data =
		let actuals = [| m_ptr; data |] in
			L.build_call hashmap_get_f actuals "hashmap_get" llbuilder
	in


(*
================================================================
  Set
================================================================
*)

	let put_set_from_list_t = L.function_type set_t [| set_t; list_t |]
	in
	let put_set_from_list_f = L.declare_function "put_set_from_list" put_set_from_list_t the_module
	in
	let put_set_from_list s_ptr l_ptr llbuilder = 
		let actuals = [| s_ptr; l_ptr |] in (
			L.build_call put_set_from_list_f actuals "put_set_from_list" llbuilder
		)
	in

	let create_set_t = L.function_type set_t [| i32_t |]
	in

	let create_set_f = L.declare_function "create_set" create_set_t the_module
	in

	let create_set typ llbuilder =
		let actuals = [| lconst_of_typ typ |] in
			ignore(L.build_call create_set_f actuals "create_set" llbuilder)
	in

	let put_set_t = L.var_arg_function_type set_t [| set_t |]
	in

	let put_set_f = L.declare_function "put_set" put_set_t the_module
	in

	let put_set s_ptr llbuilder data =
		let actuals = [| s_ptr; data |] in
			ignore(L.build_call put_set_f actuals "put_set" llbuilder)
	in

	let remove_set_element_t = L.var_arg_function_type set_t [| set_t |]
	in

	let remove_set_element_f = L.declare_function "remove_set_element" remove_set_element_t the_module
	in

	let remove_set_element s_ptr llbuilder data =
		let actuals = [| s_ptr; data |] in
			ignore(L.build_call remove_set_element_f actuals "remove_set_element" llbuilder)
	in

	let get_set_elements_t = L.var_arg_function_type list_t [| set_t |]
	in

	let get_set_elements_f = L.declare_function "get_set_elements" get_set_elements_t the_module
	in

	let get_set_elements s_ptr llbuilder data =
		let actuals = [| s_ptr; data |] in
			L.build_call get_set_elements_f actuals "get_set_elements" llbuilder
	in

 (* cast *)
	let voidToInt_t = L.function_type i32_t [|L.pointer_type i8_t|]
	in
	let voidToInt_f = L.declare_function "voidToint" voidToInt_t the_module
	in
	let voidToInt v_ptr llbuilder = 
		let actuals = [|v_ptr|] in  
		L.build_call voidToInt_f actuals "voidToint" llbuilder
	in
	let voidTofloat_t = L.function_type float_t [|L.pointer_type i8_t|]
	in
	let voidTofloat_f = L.declare_function "voidTofloat" voidTofloat_t the_module
	in
	let voidTofloat v_ptr llbuilder = 
		let actuals = [|v_ptr|] in  
		L.build_call voidTofloat_f actuals "voidTofloat" llbuilder
	in
	let voidTobool_t = L.function_type i1_t [|L.pointer_type i8_t|]
	in
	let voidTobool_f = L.declare_function "voidTobool" voidTobool_t the_module
	in
	let voidTobool v_ptr llbuilder = 
		let actuals = [|v_ptr|] in  
		L.build_call voidTobool_f actuals "voidTobool" llbuilder
	in
	let voidTostring_t = L.function_type string_t [|L.pointer_type i8_t|]
	in
	let voidTostring_f = L.declare_function "voidTostring" voidTostring_t the_module
	in
	let voidTostring v_ptr llbuilder = 
		let actuals = [|v_ptr|] in  
		L.build_call voidTostring_f actuals "voidTostring" llbuilder
	in
	let voidTonode_t = L.function_type node_t [|L.pointer_type i8_t|]
	in
	let voidTonode_f = L.declare_function "voidTonode" voidTonode_t the_module
	in
	let voidTonode v_ptr llbuilder = 
		let actuals = [|v_ptr|] in  
		L.build_call voidTonode_f actuals "voidTonode" llbuilder
	in
	let voidTograph_t = L.function_type graph_t [|L.pointer_type i8_t|]
	in
	let voidTograph_f = L.declare_function "voidTograph" voidTograph_t the_module
	in
	let voidTograph v_ptr llbuilder = 
		let actuals = [|v_ptr|] in  
		L.build_call voidTograph_f actuals "voidTograph" llbuilder
	in
	(* Declare each global variable; remember its value in a map *)
	let global_vars =
		let global_var m (t, n) =
			let init = L.const_int (ltype_of_typ t) 0
			in StringMap.add n (L.define_global n init the_module, t) m in
		List.fold_left global_var StringMap.empty globals in

	(* Declare printf(), which the print built-in function will call *)
	let printf_t = L.var_arg_function_type i32_t [| L.pointer_type i8_t |] in
	let printf_func = L.declare_function "printf" printf_t the_module in

	(* Declare the built-in printbig() function *)
	let printbig_t = L.function_type i32_t [| i32_t |] in
	let printbig_func = L.declare_function "printbig" printbig_t the_module in

	(* Define each function (arguments and return type) so we can call it *)
	let function_decls =
		let function_decl m fdecl =
			let name = fdecl.A.fname
			and formal_types =
	Array.of_list (List.map (fun (t,_) -> ltype_of_typ t) fdecl.A.formals)
			in let ftype = L.function_type (ltype_of_typ fdecl.A.typ) formal_types in
			StringMap.add name (L.define_function name ftype the_module, fdecl) m in
		List.fold_left function_decl StringMap.empty functions in
	
	(* Fill in the body of the given function *)
	let build_function_body fdecl =
		let (the_function, _) = StringMap.find fdecl.A.fname function_decls in
		let builder = L.builder_at_end context (L.entry_block the_function) in

		let int_format_str = L.build_global_stringptr "%d\n" "fmt" builder in
		
		(* Construct the function's "locals": formal arguments and locally
			 declared variables.  Allocate each on the stack, initialize their
			 value, if appropriate, and remember their values in the "locals" map *)
		let local_vars =
			let add_formal m (t, n) p = L.set_value_name n p;
				let local = L.build_alloca (ltype_of_typ t) n builder in
				ignore (L.build_store p local builder);
				StringMap.add n (local, t) m in

			let add_local m (t, n) =
				let local_var = L.build_alloca (ltype_of_typ t) n builder
				in StringMap.add n (local_var, t) m in

			let formals = List.fold_left2 add_formal StringMap.empty fdecl.A.formals
				(Array.to_list (L.params the_function)) in
				List.fold_left add_local formals fdecl.A.locals in

		(* Return the value/type tuple for a variable or formal argument *)
		let lookup n = try StringMap.find n local_vars
			with Not_found -> StringMap.find n global_vars
		in

    let get_llvm_from_llvm_asttype_tuple (ltype,_) = ltype
    in

		(* Construct code for an expression; return its value/type tuple *)
		let rec expr builder = function
			  A.Literal i -> (L.const_int i32_t i, A.Int)
			| A.BoolLit b -> (L.const_int i1_t (if b then 1 else 0), A.Bool)
			| A.Noexpr -> (L.const_int i32_t 0, A.Void)
			| A.Id s -> (L.build_load (fst (lookup s)) s builder, (snd (lookup s)))
      | A.ListLiteral el -> 
        let listLiteral_type = snd (expr builder (List.hd el))
        in
        let listPtr = create_list listLiteral_type builder
        in 
          ignore(add_all_elements_into_list 
          (List.map get_llvm_from_llvm_asttype_tuple (List.map (expr builder) el)) 
          listPtr
          builder)
          ;(listPtr, listLiteral_type)
      | A.Subscript (var, e) -> let (var', typ) = lookup var and (s', t') = expr builder e in
      ((match typ with
      | A.List typeList -> (
      	let elementPtr = get_list_element (L.build_load var' var builder) s' builder
      in match typeList with
      | A.Int -> voidToInt elementPtr builder
      | A.Float -> voidTofloat elementPtr builder
      | A.Bool -> voidTobool elementPtr builder
      | A.Node -> voidTonode elementPtr builder
      | A.Graph -> voidTograph elementPtr builder
      | _ -> raise (Failure (" undefined operator[] "))
      )
      | _ -> raise (Failure (" undefined operator[] "))), typ)
      | A.AddAdd var -> let (var', typ) = lookup var in
		  remove_list_element (L.build_load var' var builder) builder; (var',typ)
			| A.Binop (e1, op, e2) ->
				let (e1', t1') = expr builder e1
				and (e2', t2') = expr builder e2 in
				((match op with
					A.Add when t1' = A.Int    -> L.build_add
        | A.Add when t1' = A.Bool   -> L.build_and 
				| A.Sub     -> L.build_sub
				| A.Mult    -> L.build_mul
				| A.Div     -> L.build_sdiv
				| A.And     -> L.build_and
				| A.Or      -> L.build_or
				| A.Equal   -> L.build_icmp L.Icmp.Eq
				| A.Neq     -> L.build_icmp L.Icmp.Ne
				| A.Less    -> L.build_icmp L.Icmp.Slt
				| A.Leq     -> L.build_icmp L.Icmp.Sle
				| A.Greater -> L.build_icmp L.Icmp.Sgt
				| A.Geq     -> L.build_icmp L.Icmp.Sge
				) e1' e2' "tmp" builder, t1')
			| A.Unop(op, e) ->
					let (e', t') = expr builder e in
					((match op with
						A.Neg     -> L.build_neg
					| A.Not     -> L.build_not) e' "tmp" builder, t')
			| A.Assign (s, e) -> 
          let (e', t') = expr builder e in
           ignore (L.build_store e' (fst (lookup s)) builder); (e', t')
      | A.AddAssign (var, e) -> 
          let (var', typ) =  lookup var and (s', t') = expr builder e in
          ((match typ with
          | A.List _ -> concat_list (L.build_load var' var builder) s' builder 
          | A.Set typeSet -> let temp_set = create_set typeSet builder in
          		put_set_from_list (L.build_load var' var builder) s' builder
          | _ -> raise (Failure (" undefined += "))), typ)

      | A.Call ("print", [e]) | A.Call ("printb", [e]) ->
				 (L.build_call printf_func [| int_format_str ; (fst (expr builder e)) |]
			   "printf" builder, (snd (expr builder e)))
			| A.Call ("printbig", [e]) ->
				 (L.build_call printbig_func [| (fst (expr builder e)) |] 
         "printbig" builder, (snd (expr builder e)))
			| A.Call (f, act) ->
				 let (fdef, fdecl) = StringMap.find f function_decls in
		     let actuals = List.rev (List.map fst (List.map (expr builder) (List.rev act))) in
		     let result = (match fdecl.A.typ with A.Void -> ""
																						| _ -> f ^ "_result") in
				 (L.build_call fdef (Array.of_list actuals) result builder, fdecl.A.typ)
		in

		(* Invoke "f builder" if the current block doesn't already
			 have a terminal (e.g., a branch). *)
		let add_terminal builder f =
			match L.block_terminator (L.insertion_block builder) with
				Some _ -> ()
			| None -> ignore (f builder) in
	
		(* Build the code for the given statement; return the builder for
			 the statement's successor *)
		let rec stmt builder = function
			  A.Block sl -> List.fold_left stmt builder sl
			| A.Expr e -> ignore (fst (expr builder e)); builder
			| A.Return e -> ignore (match fdecl.A.typ with
				A.Void -> L.build_ret_void builder
				| _ -> L.build_ret (fst (expr builder e)) builder); builder
			| A.If (predicate, then_stmt, else_stmt) ->
				 let bool_val = fst (expr builder predicate) in
				 let merge_bb = L.append_block context "merge" the_function in

				 let then_bb = L.append_block context "then" the_function in
				 add_terminal (stmt (L.builder_at_end context then_bb) then_stmt)
					 (L.build_br merge_bb);

				 let else_bb = L.append_block context "else" the_function in
				 add_terminal (stmt (L.builder_at_end context else_bb) else_stmt)
					 (L.build_br merge_bb);

				 ignore (L.build_cond_br bool_val then_bb else_bb builder);
				 L.builder_at_end context merge_bb

			| A.While (predicate, body) ->
				let pred_bb = L.append_block context "while" the_function in
				ignore (L.build_br pred_bb builder);

				let body_bb = L.append_block context "while_body" the_function in
				add_terminal (stmt (L.builder_at_end context body_bb) body)
					(L.build_br pred_bb);

				let pred_builder = L.builder_at_end context pred_bb in
				let bool_val = fst (expr pred_builder predicate) in

				let merge_bb = L.append_block context "merge" the_function in
				ignore (L.build_cond_br bool_val body_bb merge_bb pred_builder);
				L.builder_at_end context merge_bb

			| A.For (e1, e2, e3, body) -> stmt builder
			( A.Block [A.Expr e1 ; A.While (e2, A.Block [body ; A.Expr e3]) ] )
		in

		(* Build the code for each statement in the function *)
		let builder = stmt builder (A.Block fdecl.A.body) in

		(* Add a return if the last block falls off the end *)
		add_terminal builder (match fdecl.A.typ with
				A.Void -> L.build_ret_void
			| t -> L.build_ret (L.const_int (ltype_of_typ t) 0))
	in

	List.iter build_function_body functions;
	the_module
