(* Abstract Syntax Tree and functions for printing it *)

type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater | Geq |
          And | Or  | Mod

type uop = Neg | Not

type typ = Int | Bool | Void | Node of typ | Float | String | List of typ | Set of typ | Map of typ * typ | Graph | Edge | Null_t

type bind = typ * string

type expr =
    Literal of int
  | BoolLit of bool
  | Null  
  | FloatLit of float
  | StringLit of string
  | Id of string
  | Binop of expr * op * expr
  | Unop of uop * expr
  | Assign of string * expr
  | AddAssign of string * expr
  | MinusAssign of string * expr
  | AddAdd of string 
  | SingleEdge of  string * string
  | Call of string * expr list
  | DotCall of string * string * expr list
  | Subscript of string * expr
  | ListLiteral of expr list
  | Noexpr
  | SingleLinkAssign of expr * expr
  | DoubleLinkAssign of string * string * expr
  | SubscriptAssign of expr * expr
  | BatchSingleLinkAssign of string * expr * expr
  | New of string
  | BatchDoubleLinkAssign of string * expr * expr

type stmt =
    Block of stmt list
  | Expr of expr
  | Return of expr
  | If of expr * stmt * stmt
  | For of expr * expr * expr * stmt
  | While of expr * stmt

type func_decl = {
    typ : typ;
    fname : string;
    formals : bind list;
    locals : bind list;
    body : stmt list;
  }

type program = bind list * func_decl list

(* Pretty-printing functions *)

let string_of_op = function
    Add -> "+"
  | Sub -> "-"
  | Mult -> "*"
  | Div -> "/"
  | Equal -> "=="
  | Neq -> "!="
  | Less -> "<"
  | Leq -> "<="
  | Greater -> ">"
  | Geq -> ">="
  | And -> "&&"
  | Or -> "||"
  | Mod -> "%"

let string_of_uop = function
    Neg -> "-"
  | Not -> "!"

let rec string_of_expr = function
    Literal(l) -> string_of_int l
  | FloatLit(f) -> string_of_float f
  | StringLit(s) -> "\"" ^ s ^ "\""
  | BoolLit(true) -> "true"
  | BoolLit(false) -> "false"
  | Null -> "null"
  | Id(s) -> s
  | AddAdd(s) -> s ^ "++"
  | New(s) -> "new " ^ s
  | Binop(e1, o, e2) ->
      string_of_expr e1 ^ " " ^ string_of_op o ^ " " ^ string_of_expr e2
  | Unop(o, e) -> string_of_uop o ^ string_of_expr e
  | Assign(v, e) -> v ^ " = " ^ string_of_expr e
  | SubscriptAssign(subscript, e) -> string_of_expr subscript ^ " = " ^ string_of_expr e
  | AddAssign(v, e) -> v ^ " += " ^ string_of_expr e
  | MinusAssign(v, e) -> v ^ " -= " ^ string_of_expr e
  | SingleEdge(e1, e2) ->  e1 ^ " -> " ^  e2
  | SingleLinkAssign(e1 , e) -> string_of_expr e1 ^ " = " ^ string_of_expr e
  | DoubleLinkAssign(n1, n2, e) -> n1 ^ " -- " ^ n2 ^ " = " ^ string_of_expr e
  | Call(f, el) ->
      f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
  | DotCall(d, f, el) ->
     d ^ "." ^ f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
  | Noexpr -> ""
  | Subscript(var1, e) -> var1 ^ "[" ^ string_of_expr e ^ "]" 
  | ListLiteral(el) -> "@{" ^ String.concat ", " (List.map string_of_expr el) ^ "}"
  | BatchSingleLinkAssign(var1, e2, e3) ->  var1 ^ " -> " ^ string_of_expr e2 ^ " = " ^ string_of_expr e3
  | BatchDoubleLinkAssign(var1, e2, e3) ->  var1 ^ " -- " ^ string_of_expr e2 ^ " = " ^ string_of_expr e3

let rec string_of_stmt = function
    Block(stmts) ->
      "{\n" ^ String.concat "" (List.map string_of_stmt stmts) ^ "}\n"
  | Expr(expr) -> string_of_expr expr ^ ";\n";
  | Return(expr) -> "return " ^ string_of_expr expr ^ ";\n";
  | If(e, s, Block([])) -> "if (" ^ string_of_expr e ^ ")\n" ^ string_of_stmt s
  | If(e, s1, s2) ->  "if (" ^ string_of_expr e ^ ")\n" ^
      string_of_stmt s1 ^ "else\n" ^ string_of_stmt s2
  | For(e1, e2, e3, s) ->
      "for (" ^ string_of_expr e1  ^ " ; " ^ string_of_expr e2 ^ " ; " ^
      string_of_expr e3  ^ ") " ^ string_of_stmt s
  | While(e, s) -> "while (" ^ string_of_expr e ^ ") " ^ string_of_stmt s

let rec string_of_typ = function
    Int -> "int"
  | Bool -> "bool"
  | Void -> "void"
  | Node(t1) -> "node" ^ "@{" ^ string_of_typ t1 ^ "}"
  | Float -> "float"
  | String -> "string"
  | List(t1) -> "list" ^ "@{" ^ string_of_typ t1 ^ "}"
  | Set(t1) -> "set" ^ "@{" ^ string_of_typ t1 ^ "}"
  | Map(t1, t2) -> "map" ^ "@{" ^ string_of_typ t1 ^ ", " ^ string_of_typ t2 ^ "}"
  | Graph -> "graph"
  | Edge -> "edge"
  | Null_t -> "null"

let string_of_vdecl (t, id) = string_of_typ t ^ " " ^ id ^ ";\n"

let string_of_fdecl fdecl =
  string_of_typ fdecl.typ ^ " " ^
  fdecl.fname ^ "(" ^ String.concat ", " (List.map snd fdecl.formals) ^
  ")\n{\n" ^
  String.concat "" (List.map string_of_vdecl fdecl.locals) ^
  String.concat "" (List.map string_of_stmt fdecl.body) ^
  "}\n"

let string_of_program (vars, funcs) =
  String.concat "" (List.map string_of_vdecl vars) ^ "\n" ^
  String.concat "\n" (List.map string_of_fdecl funcs)
