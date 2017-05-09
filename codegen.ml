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
  and set_t = L.pointer_type (match L.type_by_name llm "struct.Set" with
    None -> raise (Failure "struct.Set doesn't defined.")
  | Some x -> x)
  and map_t = L.pointer_type (match L.type_by_name llm "struct.hashmap" with
    None -> raise (Failure "struct.hashmap doesn't defined.")
  | Some x -> x)
  and node_t = L.pointer_type (match L.type_by_name llm "struct.Node" with
    None -> raise (Failure "struct.Node doesn't defined.")
  | Some x -> x)
  and graph_t = L.pointer_type (match L.type_by_name llm "struct.Graph" with
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
  | A.Node(_) -> node_t
  | A.Graph -> graph_t
  in

  let lconst_of_typ = function
	  A.Int -> L.const_int i32_t 0
  | A.Float -> L.const_int i32_t 1
  | A.Bool -> L.const_int i32_t 2
  | A.String -> L.const_int i32_t 3
  | A.Node _ -> L.const_int i32_t 4
  | A.Graph -> L.const_int i32_t 5
   (* | A.Node_t -> L.const_int i32_t 4
  | A.Graph_t -> L.const_int i32_t 5
  | A.Edge_t -> L.const_int i32_t 8
 | A.List_Int_t -> list_t
  | A.Dict_String_t -> dict_t *)
  | _ -> raise (Failure ("[Error] Type Not Found for lconst_of_typ."))

  in

(*
================================================================
  List Methods
================================================================
*)
 
  let get_list_size_t = L.function_type i32_t [| list_t |]
  in
  let get_list_size_f = L.declare_function "get_list_size" get_list_size_t the_module
  in
  let get_list_size list_ptr llbuilder = 
  		let actuals = [| list_ptr |] in (
  			L.build_call get_list_size_f actuals "get_list_size" llbuilder
  		)
  in

  let pop_list_element_t = L.function_type (L.pointer_type i8_t) [| list_t |]
  in
  let pop_list_element_f = L.declare_function "pop_list_element" pop_list_element_t the_module
  in
  let pop_list_element list_ptr llbuilder = 
  		let actuals = [| list_ptr |] in (
  			L.build_call pop_list_element_f actuals "pop_list_element" llbuilder
  		) 
  in

  let real_remove_list_element_t = L.function_type (L.pointer_type i8_t) [| list_t; i32_t |]
  in
  let real_remove_list_element_f = L.declare_function "remove_list_element" real_remove_list_element_t the_module
  in
  let real_remove_list_element list_ptr index llbuilder = 
  		let actuals = [| list_ptr; index |] in (
  			L.build_call real_remove_list_element_f actuals "remove_list_element" llbuilder
  		)
  in

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


(*
================================================================
  Hashmap Methods
================================================================
*)
	let create_hashmap_t = L.function_type map_t [| i32_t; i32_t |]
	in

	let create_hashmap_f = L.declare_function "create_hashmap" create_hashmap_t the_module
	in
	let create_hashmap kType vType llbuilder =
		let actuals = [| lconst_of_typ kType; lconst_of_typ vType |] in
			(L.build_call create_hashmap_f actuals "create_hashmap" llbuilder)
	in

	let hashmap_put_t = L.var_arg_function_type map_t [| map_t |]
	in

	let hashmap_put_f = L.declare_function "hashmap_put" hashmap_put_t the_module
	in

	let hashmap_put m_ptr key value llbuilder  = 
		let actuals = [| m_ptr; key; value |] in
			L.build_call hashmap_put_f actuals "hashmap_put" llbuilder
	in

	let hashmap_get_t = L.var_arg_function_type (L.pointer_type i8_t) [| map_t |]
	in

	let hashmap_get_f = L.declare_function "hashmap_get" hashmap_get_t the_module
	in

	let hashmap_get m_ptr data llbuilder  =
		let actuals = [| m_ptr; data |] in
			L.build_call hashmap_get_f actuals "hashmap_get" llbuilder
	in

	let hashmap_length_t = L.function_type i32_t [| map_t |]
	in
	let hashmap_length_f = L.declare_function "hashmap_length" hashmap_length_t the_module
	in
	let hashmap_length m_ptr llbuilder = 
		let actuals = [| m_ptr |] in
			L.build_call hashmap_length_f actuals "hashmap_length" llbuilder
	in

	let hashmap_haskey_t = L.var_arg_function_type i1_t [| map_t |]
	in
	let hashmap_haskey_f = L.declare_function "hashmap_haskey" hashmap_haskey_t the_module
	in
	let hashmap_haskey m_ptr data llbuilder = 
		let actuals = [| m_ptr; data |] in (
			L.build_call hashmap_haskey_f actuals "hashmap_haskey" llbuilder
		)
	in

	let hashmap_remove_t = L.var_arg_function_type map_t [| map_t |]
	in 
	let hashmap_remove_f = L.declare_function "hashmap_remove" hashmap_remove_t the_module
	in 
	let hashmap_remove m_ptr data llbuilder = 
		let actuals = [| m_ptr; data |] in (
			L.build_call hashmap_remove_f actuals "hashmap_remove" llbuilder
		)
	in
(*
================================================================
  Set Methdos
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
	let actuals = [|lconst_of_typ typ|] in (
		L.build_call create_set_f actuals "create_set" llbuilder
	)
in

let add_set_t = L.var_arg_function_type set_t [| set_t |]
in
let add_set_f = L.declare_function "put_set" add_set_t the_module
in
let add_set s_ptr data llbuilder = 
	let actuals = [|s_ptr; data|] in
		L.build_call add_set_f actuals "put_set" llbuilder
in 


  let add_all_elements_into_list element_list l_ptr llbuilder = 
    List.iter (add_list l_ptr llbuilder) element_list
  in

  let get_set_size_t = L.function_type i32_t [| set_t |]
  in
  let get_set_size_f = L.declare_function "get_set_size" get_set_size_t the_module
  in
  let get_set_size s_ptr llbuilder = 
  		let actuals = [| s_ptr |] in (
  			L.build_call get_set_size_f actuals "get_set_size" llbuilder
  		)
  in

  let check_set_element_t = L.var_arg_function_type i1_t [| set_t |]
  in
  let check_set_element_f = L.declare_function "check_set_element" check_set_element_t the_module
  in
  let check_set_element s_ptr data llbuilder = 
  		let actuals = [| s_ptr; data |] in (
  			L.build_call check_set_element_f actuals "check_set_element" llbuilder
  		)
  in

  let remove_set_element_t = L.var_arg_function_type set_t [| set_t |]
  in
  let remove_set_element_f = L.declare_function "remove_set_element" remove_set_element_t the_module
  in 
  let remove_set_element s_ptr data llbuilder =
      let actuals = [| s_ptr; data |] in (
          L.build_call remove_set_element_f actuals "remove_set_element" llbuilder
      )
  in


(*
================================================================
  Node Methods
================================================================
*)
let createNode_t = L.function_type node_t [| string_t; i32_t |]
in
let createNode_f = L.declare_function "createNode" createNode_t the_module
in
let createNode s_ptr nodeType llbuilder = 
	let actuals = [| s_ptr; lconst_of_typ nodeType |] in (
		L.build_call createNode_f actuals "createNode" llbuilder
	)
in

let getEdgeValue_t = L.function_type i32_t [| node_t; node_t |]
in
let getEdgeValue_f = L.declare_function "getEdgeValue" getEdgeValue_t the_module
in
let getEdgeValue n1_ptr n2_ptr llbuilder = 
	let actuals = [| n1_ptr; n2_ptr |] in (
		L.build_call getEdgeValue_f actuals "getEdgeValue" llbuilder
	)
in

let addNodeEdge_t = L.function_type i32_t [| node_t; node_t; i32_t |]
in 
let addNodeEdge_f = L.declare_function "addNodeEdge" addNodeEdge_t the_module
in
let addNodeEdge n1_ptr n2_ptr weight llbuilder = 
	let actuals = [| n1_ptr; n2_ptr; weight |] in (
		ignore(L.build_call addNodeEdge_f actuals "addNodeEdge" llbuilder)
	)
in

let addReverseEdge_t = L.function_type i32_t [| node_t; node_t; i32_t |]
in 
let addReverseEdge_f = L.declare_function "addReverseEdge" addReverseEdge_t the_module
in
let addReverseEdge n1_ptr n2_ptr weight llbuilder = 
	let actuals = [| n1_ptr; n2_ptr; weight |] in (
		ignore(L.build_call addReverseEdge_f actuals "addReverseEdge" llbuilder)
	)
in

let getNodeValue_t = L.function_type (L.pointer_type i8_t) [| node_t |]
in
let getNodeValue_f = L.declare_function "getNodeValue" getNodeValue_t the_module
in
let getNodeValue n_ptr llbuilder =
	let actuals = [| n_ptr |] in (
		L.build_call getNodeValue_f actuals "getNodeValue" llbuilder
	)
in

let getNodeName_t = L.function_type string_t [| node_t |]
in
let getNodeName_f = L.declare_function "getNodeName" getNodeName_t the_module
in
let getNodeName n_ptr llbuilder = 
	let actuals = [| n_ptr |] in (
		L.build_call getNodeName_f actuals "getNodeName" llbuilder
	)
in

let setNodeValue_t = L.var_arg_function_type node_t [| node_t |]
in
let setNodeValue_f = L.declare_function "setNodeValue" setNodeValue_t the_module
in
let setNodeValue n_ptr data llbuilder = 
	let actuals = [|n_ptr; data|] in
		L.build_call setNodeValue_f actuals "setNodeValue" llbuilder
in

let iterNode_t = L.function_type node_t [| node_t; i32_t|]
in
let iterNode_f = L.declare_function "iterNode" iterNode_t the_module
in
let iterNode n_ptr index llbuilder =
    let actuals = [|n_ptr; index|] in (
      L.build_call iterNode_f actuals "iterNode" llbuilder
    )
in

let getNodeLength_t = L.function_type i32_t [| node_t |]
in 
let getNodeLength_f = L.declare_function "getNodeLength" getNodeLength_t the_module
in
let getNodeLength n_ptr llbuilder = 
    let actuals = [| n_ptr |] in (
      L.build_call getNodeLength_f actuals "getNodeLength" llbuilder
    )
in

let get_node_value_t = L.function_type (L.pointer_type i8_t) [| node_t |]
in 
let get_node_value_f = L.declare_function "get_node_value" get_node_value_t the_module
in
let get_node_value n_ptr llbuilder = 
    let actuals = [| n_ptr |] in (
        L.build_call get_node_value_f actuals "get_node_value" llbuilder
    )
in

let weigthIterNode_t = L.function_type i32_t [| node_t; i32_t |]
in
let weightIterNode_f = L.declare_function "weightIterNode" weigthIterNode_t the_module
in
let weightIterNode n_ptr index llbuilder =
    let actuals = [|n_ptr; index|] in (
        L.build_call weightIterNode_f actuals "weightIterNode" llbuilder
    )
in


(*
================================================================
  Graph Methods
================================================================
*)
let createGraph_t = L.function_type graph_t [| string_t |]
in
let createGraph_f = L.declare_function "createGraph" createGraph_t the_module
in
let createGraph s_ptr llbuilder =
	let actuals = [| s_ptr |] in (
		L.build_call createGraph_f actuals "createGraph" llbuilder
	)
in

let addGraphNode_t = L.function_type graph_t [| graph_t; node_t |]
in
let addGraphNode_f = L.declare_function "addGraphNode" addGraphNode_t the_module
in
let addGraphNode g_ptr n_ptr llbuilder =
	let actuals = [| g_ptr; n_ptr |] in
		L.build_call addGraphNode_f actuals "addGraphNode" llbuilder
in

let addGraphEdge_t = L.function_type graph_t [| graph_t; node_t; node_t; i32_t |]
in
let addGraphEdge_f = L.declare_function "addGraphEdge" addGraphEdge_t the_module
in
let addGraphEdge g_ptr n1_ptr n2_ptr w llbuilder =
	let actuals = [| g_ptr; n1_ptr; n2_ptr; w |] in
		L.build_call addGraphEdge_f actuals "addGraphEdge" llbuilder
in

let iterGraph_t = L.function_type node_t [| graph_t; i32_t |]
in
let iterGraph_f = L.declare_function "iterGraph" iterGraph_t the_module
in
let iterGraph g_ptr id llbuilder=
	let actuals = [| g_ptr; id |] in
		L.build_call iterGraph_f actuals "iterGraph" llbuilder
in

let findGraphNode_t = L.function_type node_t [| graph_t; string_t |]
in
let findGraphNode_f = L.declare_function "findGraphNode" findGraphNode_t the_module
in
let findGraphNode g_ptr name llbuilder=
	let actuals = [| g_ptr; name |] in
		L.build_call findGraphNode_f actuals "findGraphNode" llbuilder
in

let initTag_t = L.function_type node_t [| graph_t |]
in
let initTag_f = L.declare_function "init_tag" initTag_t the_module
in
let initTag g_ptr llbuilder=
	let actuals = [| g_ptr |] in
		L.build_call initTag_f actuals "init_tag" llbuilder
in

let reduce_t = L.function_type node_t [| graph_t; node_t |]
in
let reduce_f = L.declare_function "reduce" reduce_t the_module
in
let reduce g_ptr n_ptr llbuilder=
	let actuals = [| g_ptr; n_ptr |] in
		L.build_call reduce_f actuals "reduce" llbuilder
in

let expand_t = L.function_type node_t [| graph_t; node_t |]
in
let expand_f = L.declare_function "expand" expand_t the_module
in
let expand g_ptr n_ptr llbuilder=
	let actuals = [| g_ptr; n_ptr |] in
		L.build_call expand_f actuals "expand" llbuilder
in

let combine_t = L.function_type graph_t [| graph_t; graph_t |]
in
let combine_f = L.declare_function "combine" combine_t the_module
in
let combine g1_ptr g2_ptr llbuilder=
	let actuals = [| g1_ptr; g2_ptr |] in
		L.build_call combine_f actuals "combine" llbuilder
in 

let bfs_t = L.function_type list_t [| graph_t; node_t |]
in 
let bfs_f = L.declare_function "bfs" bfs_t the_module
in 
let bfs g_ptr n_ptr llbuilder=
	let actuals = [| g_ptr; n_ptr |] in
		L.build_call bfs_f actuals "bfs" llbuilder
in 

let dfs_t = L.function_type list_t [| graph_t; node_t |]
in 
let dfs_f = L.declare_function "dfs" dfs_t the_module
in 
let dfs g_ptr n_ptr llbuilder=
	let actuals = [| g_ptr; n_ptr |] in
		L.build_call dfs_f actuals "dfs" llbuilder
in 

(*
================================================================
  Cast Methods
================================================================
*)
let voidToint_t = L.function_type i32_t [|L.pointer_type i8_t|]
in
let voidToint_f = L.declare_function "voidToint" voidToint_t the_module
in
let voidToint v_ptr llbuilder = 
	let actuals = [|v_ptr|] in  
	L.build_call voidToint_f actuals "voidToint" llbuilder
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
		let string_format_str = L.build_global_stringptr "%s\n" "fmt" builder
		in
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
    let type_conversion typ elementPtr builder = match typ with
       A.Int -> voidToint elementPtr builder
      | A.Float -> voidTofloat elementPtr builder
      | A.Bool -> voidTobool elementPtr builder
      | A.Node _ -> voidTonode elementPtr builder
      | A.Graph -> voidTograph elementPtr builder
      | A.String -> voidTostring elementPtr builder
      | _ -> raise (Failure (" undefined operator[] "))
     in
		(* Construct code for an expression; return its value/type tuple *)
		let rec expr builder = function
			  A.Literal i -> (L.const_int i32_t i, A.Int)
			| A.FloatLit i -> (L.const_float float_t i, A.Float)
			| A.BoolLit b -> (L.const_int i1_t (if b then 1 else 0), A.Bool)
			| A.StringLit s -> (L.build_global_stringptr s s builder, A.String)
		    | A.Null ->  (L.const_null list_t, A.List(A.Int))
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
      | A.MinusAssign(var, e) -> 
                let (var', typ) =  lookup var and (s', t') = expr builder e in
          ((match typ with
          | A.Int -> let e1' = L.build_load var' var builder
				and (e2', t2') = expr builder e 
				in
				L.build_store (L.build_sub e1' e2' "tmp" builder) var' builder
          | A.Float  -> 
          		let e1' = L.build_load var' var builder
				and (e2', t2') = expr builder e 
				in
				L.build_store (L.build_fsub e1' e2' "tmp" builder) var' builder), typ)
      | A.Subscript (var, e) -> let (var', typ) = lookup var and (s', t') = expr builder e in
      ((match typ with
      | A.List typeList -> (
      	let elementPtr = get_list_element (L.build_load var' var builder) s' builder
      in type_conversion typeList elementPtr builder
      )
      | A.Map(t1, t2) -> (
      	let elementPtr = hashmap_get (L.build_load var' var builder) s' builder
      	in type_conversion t2 elementPtr builder
      )
      | _ -> raise (Failure (" undefined operator[] "))), typ)
      | A.New id -> let (id', typ) = lookup id in 
      	((match typ with 
      	| A.List listType -> L.build_store (create_list listType builder) (fst (lookup id)) builder
      	| A.Set setType -> L.build_store (create_set setType builder) (fst (lookup id)) builder
      	| A.Map(kType, vType) -> L.build_store (create_hashmap kType vType builder) (fst (lookup id)) builder
      	| A.Node nodeType -> let nodeName = L.build_global_stringptr id "" builder
      in L.build_store (createNode nodeName nodeType builder) (fst (lookup id)) builder
      	(* let nodeName = L.const_string builder id in
      	createNode nodeName nodeType builder *)
      	| A.Graph -> let graphName = L.build_global_stringptr id "" builder
      in L.build_store (createGraph graphName builder) (fst (lookup id)) builder
      	| _ -> raise (Failure (" Type not found "))), typ)
      | A.AddAdd var -> let (var', typ) = lookup var in
		  ignore(remove_list_element (L.build_load var' var builder) builder); (var',typ)
			| A.Binop (e1, op, e2) ->
				let (e1', t1') = expr builder e1
				and (e2', t2') = expr builder e2 in
				((match op with
					A.Add    -> L.build_add
				| A.Sub     -> L.build_sub
				| A.Mult    -> L.build_mul
				| A.Div     -> L.build_sdiv
				| A.And     -> L.build_and
				| A.Or      -> L.build_or
				| A.Mod -> L.build_srem
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
          | A.List _ -> L.build_store (concat_list (L.build_load var' var builder) s' builder) (fst (lookup var)) builder
          | A.Int -> let e1' = L.build_load var' var builder
				and (e2', t2') = expr builder e 
				in
				L.build_store (L.build_add e1' e2' "tmp" builder) var' builder
          | A.Float  -> 
          		let e1' = L.build_load var' var builder
				and (e2', t2') = expr builder e 
				in
				L.build_store (L.build_fadd e1' e2' "tmp" builder) var' builder
          | A.Set typeSet -> let s1 = L.build_load var' var builder 
          		and (l1', t1') = expr builder e
          	in put_set_from_list s1 l1' builder
          | _ -> raise (Failure (" undefined += "))), typ)
(* 	 | A.SubscriptAssign(e1, e2) -> 
	 (match e1 with
	  A.Subscript(var, e) -> let (e1', t1') = expr builder e1 and (e2', t2') = expr builder e2 in
           ignore (L.build_store e2' e1' builder); (e1', t1')) 
	 | _ -> raise ((Failure ("illegal Subscript assignment"))) *)


      | A.SingleEdge (n1, n2) -> 
      		((let (n1', typ1) = lookup n1 and (n2', typ2) = lookup n2 in 
      		getEdgeValue (L.build_load n1' n1 builder) (L.build_load n2' n2 builder) builder), A.Float)
      | A.DoubleLinkAssign (var1, var2, e) ->
    		(let (var1', typ1) = lookup var1 and (var2', typ2) = lookup var2 in
    			let (s', t') = expr builder e in
    			(* let node1 = (L.build_load var1' var1 builder) and node2 = (L.build_load var2' var2 builder)
    		in addNodeEdge node1 node2 s'; addNodeEdge node2 node1 s'), A.Float) *)
    		ignore(addNodeEdge (L.build_load var1' var1 builder) (L.build_load var2' var2 builder) s' builder);
    		ignore(addNodeEdge (L.build_load var2' var2 builder) (L.build_load var1' var1 builder) s' builder)); (L.const_int i32_t 0, A.Float)
      | SingleLinkAssign(e1, e) -> 
      ((match e1 with
      | A.SingleEdge(n1, n2) -> let (n1', typ1) = lookup n1 and (n2', typ2) = lookup n2 
       in let(s', t') = expr builder e in 
      ignore((addNodeEdge (L.build_load n1' n1 builder) (L.build_load n2' n2 builder) s' builder)); s'
      | _ -> raise (Failure("illegal edge assignment. "))), A.Int)

      | A.BatchSingleLinkAssign(var, n1, n2) ->
        (
        let getListsOfLit n = 
        (match n with
        | A.ListLiteral li -> li
        | _ -> raise (Failure("Error at BatchSingleLinkAssign: match fail")))
        in
        let f elem = fst (expr builder elem)
        in
        let n1_sequence = List.map f (getListsOfLit n1)
        in
        let n2_sequence = List.map f (getListsOfLit n2)
        in
        let (var', typ) = lookup var 
        in
        let addNodeIter v1 v2 = addNodeEdge (L.build_load var' var builder) v1 v2 builder
        in
          ignore(List.iter2 addNodeIter n1_sequence n2_sequence)

        ); 
        (L.const_int i32_t 0, A.Float)
       
      | A.BatchDoubleLinkAssign(var, n1, n2) ->
        (
        let getListsOfLit n =
        (match n with
        | A.ListLiteral li -> li
        | _ -> raise (Failure("Error at BatchDoubleLinkAssign : match fail")))
    	in
        let f elem = fst (expr builder elem)
        in
        let n1_sequence = List.map f (getListsOfLit n1)
        in
        let n2_sequence = List.map f (getListsOfLit n2)
        in
        let (var', typ) = lookup var
        in
        let addNodeIter v1 v2 = addNodeEdge (L.build_load var' var builder) v1 v2 builder
        in
        let addReverseIter v1 v2 = addReverseEdge (L.build_load var' var builder) v1 v2 builder
        in
          ignore(List.iter2 addNodeIter n1_sequence n2_sequence);
          ignore(List.iter2 addReverseIter  n1_sequence n2_sequence)
        );
        (L.const_int i32_t 0, A.Float)

      | A.DotCall (dname, fname, actuals) -> let (dname', dtype) = lookup dname in
      (match dtype with
      	A.Node n_type -> 
      	(match fname with
      		   "value" ->  (let nodeValuePtr = get_node_value (L.build_load dname' dname builder) builder
      		in type_conversion n_type nodeValuePtr builder, n_type)
      		| "name" -> (getNodeName (L.build_load dname' dname builder) builder, A.String)
      		| "setvalue" -> (setNodeValue (L.build_load dname' dname builder) 
      		   			(fst (expr builder (List.nth actuals 0) )) builder, A.Void)
          | "iterNode" -> (let arg = List.nth actuals 0
              in let index = fst (expr builder arg)
              in iterNode (L.build_load dname' dname builder) index builder, A.Node(n_type))
          | "length" -> (getNodeLength (L.build_load dname' dname builder) builder, A.Int)
          | "weightIter" -> (let arg = List.nth actuals 0
              in let index = fst (expr builder arg)
              in weightIterNode (L.build_load dname' dname builder) index builder, A.Int)
      		| _ -> raise (Failure ("Error! Node has no such method")))
        | A.List ele_type ->
      	(match fname with 
      		    "get" -> (let arg = List.nth actuals 0
      			in let index = fst (expr builder arg) 
      			in let listElementPtr = get_list_element (L.build_load dname' dname builder) index builder
      			in type_conversion ele_type listElementPtr builder, ele_type)
      		  | "pop" -> (let listElementPtr = pop_list_element (L.build_load dname' dname builder) builder
      			in type_conversion ele_type listElementPtr builder, ele_type)
      		  | "remove" -> (let arg = List.nth actuals 0
      		  	in let index = fst (expr builder arg)
      		  	in let listElementPtr = real_remove_list_element (L.build_load dname' dname builder) index builder
      		  	in type_conversion ele_type listElementPtr builder, ele_type)
      		  | "length" -> (get_list_size (L.build_load dname' dname builder) builder, A.Int)
      		  | "cancat" -> (let arg = List.nth actuals 0
      		   	in let listPtr = fst (expr builder arg)
      		    in concat_list (L.build_load dname' dname builder) listPtr builder, ele_type)
      		  | _ -> raise (Failure ("Error! List has no such method"))) 
       | A.Set ele_type ->
      	    (match fname with
      	    	"put" -> 
      	    		(add_set (L.build_load dname' dname builder) 
      		   			(fst (expr builder (List.nth actuals 0) )) builder, A.Void)
              | "length" -> (get_set_size (L.build_load dname' dname builder) builder, A.Int)
              | "contain" -> (check_set_element (L.build_load dname' dname builder) 
          						(fst (expr builder (List.nth actuals 0) )) builder, A.Bool)
              | "remove" -> (remove_set_element
                            (L.build_load dname' dname builder)
                            (fst (expr builder (List.nth actuals 0)))
                            builder, A.Set(ele_type))
      		  | _ -> raise (Failure ("Error! Set has no such method")))
      | A.Map (k_type, v_type) ->
      	(match fname with
          "put" -> (hashmap_put 
      		   	(L.build_load dname' dname builder) 
      		   	(fst (expr builder (List.nth actuals 0))) 
      		   	(fst (expr builder (List.nth actuals 1) )) builder, A.Void)
         | "get" -> (
         	(let listElementPtr = (hashmap_get       		   	
         		(L.build_load dname' dname builder) 
         		(fst (expr builder (List.nth actuals 0))) builder) 
         	in type_conversion v_type listElementPtr builder, v_type)
         )
         | "size" -> (
         	(hashmap_length (L.build_load dname' dname builder) builder, A.Int)

         )
         | "haskey" -> (let arg = List.nth actuals 0
         	in let mapKey = fst (expr builder arg)
         	in hashmap_haskey (L.build_load dname' dname builder) mapKey builder, A.Bool)
         | "remove" -> (let arg = List.nth actuals 0
          	in let mapKey = fst (expr builder arg)
          	in hashmap_remove (L.build_load dname' dname builder) mapKey builder, A.Void)
         | _ -> raise (Failure ("Error! Map has no such method")))
       | A.Graph -> 
      	(match fname with 
              "bfs" -> (let arg = List.nth actuals 0
              in let nodePtr = fst (expr builder arg)
              in bfs (L.build_load dname' dname builder) nodePtr builder, A.List(A.Node(A.Int)))
            | "dfs" -> (let arg = List.nth actuals 0
              in let nodePtr = fst (expr builder arg)
              in dfs (L.build_load dname' dname builder) nodePtr builder, A.List(A.Node(A.Int)))
            | "iterGraph" -> (iterGraph
                        		(L.build_load dname' dname builder)
                        		(fst (expr builder (List.nth actuals 0))) 
                        		builder
                        	, A.Node(A.Int))
            | "findGraphNode" -> (findGraphNode
                                 	(L.build_load dname' dname builder)
                                 	(fst (expr builder (List.nth actuals 0))) 
                                 	builder
                            , A.Node(A.Int))
            | "init" -> (initTag (L.build_load dname' dname builder) builder, A.Void)
      		| "addNode" -> (addGraphNode (L.build_load dname' dname builder)
      						  			   (fst (expr builder (List.nth actuals 0)))
      						  			   builder
      						, A.Void)
      		| "addEdge" -> (addGraphEdge (L.build_load dname' dname builder)
      		  							   (fst (expr builder (List.nth actuals 0)))
      		  							   (fst (expr builder (List.nth actuals 1)))
      		  							   (fst (expr builder (List.nth actuals 2)))
      		  							   builder
      						, A.Void)
      		| "reduce" -> (reduce (L.build_load dname' dname builder)
      		  						(fst (expr builder (List.nth actuals 0)))
      		  						builder
      						, A.Node(A.Int))
      		| "expand" -> (expand (L.build_load dname' dname builder)
      		  						(fst (expr builder (List.nth actuals 0)))
      		  						builder
      						, A.Node(A.Int))
      		| "combine" -> (combine (L.build_load dname' dname builder)
      		  						(fst (expr builder(List.nth actuals 0)))
      		  						builder
      						, A.Graph)
      		| _ -> raise (Failure ("Error! Graph has no such method"))) 
      	| _ -> raise (Failure ("Error! Do not support such type")))
      | A.Call ("print", [e]) -> (L.build_call printf_func [| int_format_str ; (fst (expr builder e)) |]
			   "printf" builder, (snd (expr builder e)))
      | A.Call ("prints", [e]) ->
				 (L.build_call printf_func [| string_format_str ; (fst (expr builder e)) |]
			   "printf" builder, (snd (expr builder e)))
(* 		| A.Call("prints",[e]) ->
				 (L.build_call printf_func [| string_format_str ; (fst (expr builder e)) |]
			   "printf" builder, (snd (expr builder e))) *)			
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