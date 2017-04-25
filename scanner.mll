(* Ocamllex scanner for TuSimple *)

{ open Parser 
  let unescape s =
    	Scanf.sscanf ("\"" ^ s ^ "\"") "%S%!" (fun x -> x)
}

let digit = ['0'-'9']
let float = '-'?(digit+) ['.'] digit+
let escape = '\\' ['\\' ''' '"' 'n' 'r' 't']
let ascii = ([' '-'!' '#'-'[' ']'-'~'])

rule token = parse
  [' ' '\t' '\r' '\n'] { token lexbuf } (* Whitespace *)
| "/*"     { comment lexbuf }           (* Comments *)
| '('      { LPAREN }
| ')'      { RPAREN }
| '{'      { LBRACE }
| '}'      { RBRACE }
| '[' 	   { LEFTSQUAREBRACKET }
| ']' 	   { RIGHTSQUAREBRACKET }
| ';'      { SEMI }
| ','      { COMMA }
| '+'      { PLUS }
| '-'      { MINUS }
| '*'      { TIMES }
| '/'      { DIVIDE }
| '='      { ASSIGN }
| "+="     { ADDASSIGN }
| "-="	   { MINUSASSIGN }
| "=="     { EQ }
| "!="     { NEQ }
| '<'      { LT }
| "<="     { LEQ }
| ">"      { GT }
| ">="     { GEQ }
| "&&"     { AND }
| "||"     { OR }
| "!"      { NOT }
| "->"	   { SINGLELINK }
| "--"	   { DOUBLELINK }
| "@"      { AT }
| "//"	   { signleLineComment lexbuf }
| "."	   { DOT }

| "maxint" { MAXINT }
| "minint" { MININT }


| "%"	   { MOD }
| "++" 	   { ADDADD }
| "if"     { IF }
| "else"   { ELSE }
| "for"    { FOR }
| "while"  { WHILE }
| "return" { RETURN }

| "int"    { INT }
| "float"  { FLOAT }
| "bool"   { BOOL }
| "void"   { VOID }
| "string" { STRING }

| "node"   { NODE }
| "list"   { LIST }
| "set"    { SET }
| "map"    { MAP }
| "graph"  { GRAPH }

| "true"   { TRUE }
| "false"  { FALSE }
| "null"   { NULL }

| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']* as lxm { ID(lxm) }
| ['0'-'9']+ as lxm { LITERAL(int_of_string lxm) }
| float as lxm { FLOAT_LITERAL(float_of_string lxm) }
| '"' ((ascii | escape)* as lit) '"' { STRING_LITERAL(unescape lit) }
| eof { EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and comment = parse
  "*/" { token lexbuf }
| _    { comment lexbuf }

and signleLineComment = parse
  "\n" { token lexbuf }
| _ {signleLineComment lexbuf}
