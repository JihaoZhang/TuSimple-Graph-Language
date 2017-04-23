type token =
  | SEMI
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | COMMA
  | PLUS
  | MINUS
  | TIMES
  | DIVIDE
  | ASSIGN
  | NOT
  | ADDASSIGN
  | EQ
  | NEQ
  | LT
  | LEQ
  | GT
  | GEQ
  | TRUE
  | FALSE
  | AND
  | OR
  | SINGLELINK
  | RETURN
  | IF
  | ELSE
  | FOR
  | WHILE
  | INT
  | BOOL
  | VOID
  | NODE
  | LITERAL of (int)
  | ID of (string)
  | EOF

open Parsing;;
let _ = parse_error;;
# 4 "parser.mly"
open Ast
# 44 "parser.ml"
let yytransl_const = [|
  257 (* SEMI *);
  258 (* LPAREN *);
  259 (* RPAREN *);
  260 (* LBRACE *);
  261 (* RBRACE *);
  262 (* COMMA *);
  263 (* PLUS *);
  264 (* MINUS *);
  265 (* TIMES *);
  266 (* DIVIDE *);
  267 (* ASSIGN *);
  268 (* NOT *);
  269 (* ADDASSIGN *);
  270 (* EQ *);
  271 (* NEQ *);
  272 (* LT *);
  273 (* LEQ *);
  274 (* GT *);
  275 (* GEQ *);
  276 (* TRUE *);
  277 (* FALSE *);
  278 (* AND *);
  279 (* OR *);
  280 (* SINGLELINK *);
  281 (* RETURN *);
  282 (* IF *);
  283 (* ELSE *);
  284 (* FOR *);
  285 (* WHILE *);
  286 (* INT *);
  287 (* BOOL *);
  288 (* VOID *);
  289 (* NODE *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  290 (* LITERAL *);
  291 (* ID *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\004\000\006\000\006\000\009\000\
\009\000\005\000\005\000\005\000\005\000\007\000\007\000\003\000\
\008\000\008\000\010\000\010\000\010\000\010\000\010\000\010\000\
\010\000\010\000\012\000\012\000\011\000\011\000\011\000\011\000\
\011\000\011\000\011\000\011\000\011\000\011\000\011\000\011\000\
\011\000\011\000\011\000\011\000\011\000\011\000\011\000\011\000\
\011\000\011\000\011\000\013\000\013\000\014\000\014\000\000\000"

let yylen = "\002\000\
\002\000\000\000\002\000\002\000\009\000\000\000\001\000\002\000\
\004\000\001\000\001\000\001\000\001\000\000\000\002\000\003\000\
\000\000\002\000\002\000\002\000\003\000\003\000\005\000\007\000\
\009\000\005\000\000\000\001\000\001\000\001\000\001\000\001\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\002\000\002\000\003\000\003\000\
\005\000\004\000\003\000\000\000\001\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\002\000\000\000\056\000\000\000\010\000\011\000\012\000\013\000\
\001\000\003\000\004\000\000\000\000\000\016\000\000\000\000\000\
\000\000\000\000\008\000\000\000\000\000\014\000\000\000\000\000\
\009\000\015\000\000\000\000\000\000\000\000\000\017\000\005\000\
\000\000\000\000\030\000\031\000\000\000\000\000\000\000\000\000\
\029\000\000\000\018\000\000\000\000\000\000\000\045\000\046\000\
\020\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\019\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\051\000\022\000\
\021\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\035\000\036\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\050\000\000\000\000\000\000\000\000\000\026\000\
\000\000\000\000\000\000\000\000\024\000\000\000\000\000\025\000"

let yydgoto = "\002\000\
\003\000\004\000\010\000\011\000\012\000\017\000\024\000\028\000\
\018\000\043\000\044\000\076\000\079\000\080\000"

let yysindex = "\005\000\
\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\223\254\053\255\000\000\238\255\239\254\
\044\255\045\255\000\000\059\255\238\255\000\000\027\255\238\255\
\000\000\000\000\037\255\048\255\074\255\157\255\000\000\000\000\
\157\255\157\255\000\000\000\000\007\255\077\255\086\255\094\255\
\000\000\160\255\000\000\198\255\149\000\082\255\000\000\000\000\
\000\000\217\255\157\255\157\255\157\255\157\255\157\255\157\255\
\050\255\000\000\157\255\157\255\157\255\157\255\157\255\157\255\
\157\255\157\255\157\255\157\255\157\255\157\255\000\000\000\000\
\000\000\166\000\200\000\098\255\183\000\200\000\103\255\106\255\
\200\000\200\000\104\255\083\255\083\255\000\000\000\000\246\000\
\246\000\020\000\020\000\020\000\020\000\233\000\217\000\132\255\
\157\255\132\255\000\000\157\255\157\255\097\255\236\255\000\000\
\200\000\200\000\132\255\157\255\000\000\117\255\132\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\128\255\000\000\
\000\000\134\255\000\000\000\000\000\000\000\000\000\000\093\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\179\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\108\255\000\000\135\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\009\255\000\000\000\000\010\255\000\000\136\255\
\042\255\129\255\000\000\003\000\034\000\000\000\000\000\043\255\
\132\000\057\000\080\000\103\000\126\000\058\255\061\000\000\000\
\000\000\000\000\000\000\000\000\000\000\121\255\000\000\000\000\
\014\255\142\255\000\000\148\255\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\130\000\000\000\246\255\000\000\000\000\133\000\
\000\000\249\255\226\255\055\000\000\000\000\000"

let yytablesize = 521
let yytable = "\045\000\
\009\000\013\000\047\000\048\000\016\000\001\000\050\000\049\000\
\030\000\028\000\023\000\028\000\054\000\027\000\033\000\054\000\
\055\000\019\000\034\000\055\000\074\000\075\000\077\000\078\000\
\081\000\082\000\035\000\036\000\084\000\085\000\086\000\087\000\
\088\000\089\000\090\000\091\000\092\000\093\000\094\000\095\000\
\041\000\042\000\048\000\037\000\048\000\037\000\020\000\048\000\
\037\000\030\000\021\000\031\000\032\000\014\000\015\000\033\000\
\037\000\037\000\043\000\034\000\043\000\025\000\022\000\043\000\
\037\000\037\000\103\000\035\000\036\000\105\000\106\000\029\000\
\037\000\038\000\014\000\039\000\040\000\075\000\051\000\043\000\
\043\000\041\000\042\000\030\000\083\000\031\000\072\000\052\000\
\102\000\033\000\104\000\061\000\062\000\034\000\017\000\053\000\
\017\000\017\000\097\000\109\000\017\000\035\000\036\000\112\000\
\017\000\099\000\037\000\038\000\027\000\039\000\040\000\100\000\
\017\000\017\000\101\000\041\000\042\000\017\000\017\000\111\000\
\017\000\017\000\023\000\107\000\023\000\023\000\017\000\017\000\
\023\000\047\000\006\000\047\000\023\000\030\000\047\000\031\000\
\007\000\052\000\053\000\033\000\023\000\023\000\049\000\034\000\
\049\000\023\000\023\000\049\000\023\000\023\000\027\000\035\000\
\036\000\026\000\023\000\023\000\037\000\038\000\030\000\039\000\
\040\000\054\000\110\000\046\000\033\000\041\000\042\000\000\000\
\034\000\000\000\055\000\000\000\056\000\000\000\000\000\000\000\
\035\000\036\000\000\000\032\000\000\000\032\000\000\000\057\000\
\032\000\032\000\032\000\032\000\032\000\000\000\041\000\042\000\
\032\000\032\000\032\000\032\000\032\000\032\000\058\000\000\000\
\032\000\032\000\000\000\000\000\059\000\060\000\061\000\062\000\
\000\000\000\000\000\000\063\000\064\000\065\000\066\000\067\000\
\068\000\073\000\000\000\069\000\070\000\000\000\000\000\059\000\
\060\000\061\000\062\000\000\000\000\000\000\000\063\000\064\000\
\065\000\066\000\067\000\068\000\108\000\000\000\069\000\070\000\
\000\000\000\000\059\000\060\000\061\000\062\000\000\000\000\000\
\000\000\063\000\064\000\065\000\066\000\067\000\068\000\000\000\
\000\000\069\000\070\000\033\000\000\000\033\000\000\000\000\000\
\033\000\033\000\033\000\005\000\006\000\007\000\008\000\000\000\
\033\000\033\000\033\000\033\000\033\000\033\000\000\000\000\000\
\033\000\033\000\059\000\060\000\061\000\062\000\005\000\006\000\
\007\000\008\000\034\000\000\000\034\000\000\000\000\000\034\000\
\034\000\034\000\000\000\000\000\000\000\000\000\000\000\034\000\
\034\000\034\000\034\000\034\000\034\000\000\000\000\000\034\000\
\034\000\039\000\000\000\039\000\000\000\044\000\039\000\044\000\
\000\000\000\000\044\000\000\000\000\000\000\000\039\000\039\000\
\039\000\039\000\039\000\039\000\000\000\000\000\039\000\039\000\
\040\000\000\000\040\000\044\000\000\000\040\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\040\000\040\000\040\000\
\040\000\040\000\040\000\000\000\000\000\040\000\040\000\041\000\
\000\000\041\000\000\000\000\000\041\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\041\000\041\000\041\000\041\000\
\041\000\041\000\000\000\000\000\041\000\041\000\042\000\000\000\
\042\000\000\000\000\000\042\000\038\000\000\000\038\000\000\000\
\000\000\038\000\000\000\042\000\042\000\042\000\042\000\042\000\
\042\000\038\000\038\000\042\000\042\000\000\000\000\000\071\000\
\000\000\038\000\038\000\059\000\060\000\061\000\062\000\000\000\
\000\000\000\000\063\000\064\000\065\000\066\000\067\000\068\000\
\096\000\000\000\069\000\070\000\059\000\060\000\061\000\062\000\
\000\000\000\000\000\000\063\000\064\000\065\000\066\000\067\000\
\068\000\098\000\000\000\069\000\070\000\059\000\060\000\061\000\
\062\000\000\000\000\000\000\000\063\000\064\000\065\000\066\000\
\067\000\068\000\000\000\000\000\069\000\070\000\059\000\060\000\
\061\000\062\000\000\000\000\000\000\000\063\000\064\000\065\000\
\066\000\067\000\068\000\000\000\000\000\069\000\070\000\059\000\
\060\000\061\000\062\000\000\000\000\000\000\000\063\000\064\000\
\065\000\066\000\067\000\068\000\000\000\000\000\069\000\059\000\
\060\000\061\000\062\000\000\000\000\000\000\000\063\000\064\000\
\065\000\066\000\067\000\068\000\059\000\060\000\061\000\062\000\
\000\000\000\000\000\000\000\000\000\000\065\000\066\000\067\000\
\068\000"

let yycheck = "\030\000\
\000\000\035\001\033\000\034\000\015\000\001\000\037\000\001\001\
\002\001\001\001\021\000\003\001\003\001\024\000\008\001\006\001\
\003\001\035\001\012\001\006\001\051\000\052\000\053\000\054\000\
\055\000\056\000\020\001\021\001\059\000\060\000\061\000\062\000\
\063\000\064\000\065\000\066\000\067\000\068\000\069\000\070\000\
\034\001\035\001\001\001\001\001\003\001\003\001\003\001\006\001\
\006\001\002\001\006\001\004\001\005\001\001\001\002\001\008\001\
\014\001\015\001\001\001\012\001\003\001\035\001\004\001\006\001\
\022\001\023\001\097\000\020\001\021\001\100\000\101\000\035\001\
\025\001\026\001\001\001\028\001\029\001\108\000\002\001\022\001\
\023\001\034\001\035\001\002\001\035\001\004\001\005\001\002\001\
\096\000\008\001\098\000\009\001\010\001\012\001\002\001\002\001\
\004\001\005\001\001\001\107\000\008\001\020\001\021\001\111\000\
\012\001\003\001\025\001\026\001\001\001\028\001\029\001\006\001\
\020\001\021\001\011\001\034\001\035\001\025\001\026\001\003\001\
\028\001\029\001\002\001\027\001\004\001\005\001\034\001\035\001\
\008\001\001\001\003\001\003\001\012\001\002\001\006\001\004\001\
\003\001\003\001\003\001\008\001\020\001\021\001\001\001\012\001\
\003\001\025\001\026\001\006\001\028\001\029\001\003\001\020\001\
\021\001\024\000\034\001\035\001\025\001\026\001\002\001\028\001\
\029\001\002\001\108\000\031\000\008\001\034\001\035\001\255\255\
\012\001\255\255\011\001\255\255\013\001\255\255\255\255\255\255\
\020\001\021\001\255\255\001\001\255\255\003\001\255\255\024\001\
\006\001\007\001\008\001\009\001\010\001\255\255\034\001\035\001\
\014\001\015\001\016\001\017\001\018\001\019\001\001\001\255\255\
\022\001\023\001\255\255\255\255\007\001\008\001\009\001\010\001\
\255\255\255\255\255\255\014\001\015\001\016\001\017\001\018\001\
\019\001\001\001\255\255\022\001\023\001\255\255\255\255\007\001\
\008\001\009\001\010\001\255\255\255\255\255\255\014\001\015\001\
\016\001\017\001\018\001\019\001\001\001\255\255\022\001\023\001\
\255\255\255\255\007\001\008\001\009\001\010\001\255\255\255\255\
\255\255\014\001\015\001\016\001\017\001\018\001\019\001\255\255\
\255\255\022\001\023\001\001\001\255\255\003\001\255\255\255\255\
\006\001\007\001\008\001\030\001\031\001\032\001\033\001\255\255\
\014\001\015\001\016\001\017\001\018\001\019\001\255\255\255\255\
\022\001\023\001\007\001\008\001\009\001\010\001\030\001\031\001\
\032\001\033\001\001\001\255\255\003\001\255\255\255\255\006\001\
\007\001\008\001\255\255\255\255\255\255\255\255\255\255\014\001\
\015\001\016\001\017\001\018\001\019\001\255\255\255\255\022\001\
\023\001\001\001\255\255\003\001\255\255\001\001\006\001\003\001\
\255\255\255\255\006\001\255\255\255\255\255\255\014\001\015\001\
\016\001\017\001\018\001\019\001\255\255\255\255\022\001\023\001\
\001\001\255\255\003\001\023\001\255\255\006\001\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\014\001\015\001\016\001\
\017\001\018\001\019\001\255\255\255\255\022\001\023\001\001\001\
\255\255\003\001\255\255\255\255\006\001\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\014\001\015\001\016\001\017\001\
\018\001\019\001\255\255\255\255\022\001\023\001\001\001\255\255\
\003\001\255\255\255\255\006\001\001\001\255\255\003\001\255\255\
\255\255\006\001\255\255\014\001\015\001\016\001\017\001\018\001\
\019\001\014\001\015\001\022\001\023\001\255\255\255\255\003\001\
\255\255\022\001\023\001\007\001\008\001\009\001\010\001\255\255\
\255\255\255\255\014\001\015\001\016\001\017\001\018\001\019\001\
\003\001\255\255\022\001\023\001\007\001\008\001\009\001\010\001\
\255\255\255\255\255\255\014\001\015\001\016\001\017\001\018\001\
\019\001\003\001\255\255\022\001\023\001\007\001\008\001\009\001\
\010\001\255\255\255\255\255\255\014\001\015\001\016\001\017\001\
\018\001\019\001\255\255\255\255\022\001\023\001\007\001\008\001\
\009\001\010\001\255\255\255\255\255\255\014\001\015\001\016\001\
\017\001\018\001\019\001\255\255\255\255\022\001\023\001\007\001\
\008\001\009\001\010\001\255\255\255\255\255\255\014\001\015\001\
\016\001\017\001\018\001\019\001\255\255\255\255\022\001\007\001\
\008\001\009\001\010\001\255\255\255\255\255\255\014\001\015\001\
\016\001\017\001\018\001\019\001\007\001\008\001\009\001\010\001\
\255\255\255\255\255\255\255\255\255\255\016\001\017\001\018\001\
\019\001"

let yynames_const = "\
  SEMI\000\
  LPAREN\000\
  RPAREN\000\
  LBRACE\000\
  RBRACE\000\
  COMMA\000\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIVIDE\000\
  ASSIGN\000\
  NOT\000\
  ADDASSIGN\000\
  EQ\000\
  NEQ\000\
  LT\000\
  LEQ\000\
  GT\000\
  GEQ\000\
  TRUE\000\
  FALSE\000\
  AND\000\
  OR\000\
  SINGLELINK\000\
  RETURN\000\
  IF\000\
  ELSE\000\
  FOR\000\
  WHILE\000\
  INT\000\
  BOOL\000\
  VOID\000\
  NODE\000\
  EOF\000\
  "

let yynames_block = "\
  LITERAL\000\
  ID\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    Obj.repr(
# 33 "parser.mly"
            ( _1 )
# 347 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 36 "parser.mly"
                 ( [], [] )
# 353 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 37 "parser.mly"
               ( (_2 :: fst _1), snd _1 )
# 361 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 38 "parser.mly"
               ( fst _1, (_2 :: snd _1) )
# 369 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 8 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 5 : 'formals_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl_list) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 42 "parser.mly"
     ( { typ = _1;
	 fname = _2;
	 formals = _4;
	 locals = List.rev _7;
	 body = List.rev _8 } )
# 384 "parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 49 "parser.mly"
                  ( [] )
# 390 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 50 "parser.mly"
                  ( List.rev _1 )
# 397 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 53 "parser.mly"
                             ( [(_1,_2)] )
# 405 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 54 "parser.mly"
                             ( (_3,_4) :: _1 )
# 414 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 57 "parser.mly"
        ( Int )
# 420 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 58 "parser.mly"
         ( Bool )
# 426 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 59 "parser.mly"
         ( Void )
# 432 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 60 "parser.mly"
         ( Node )
# 438 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 63 "parser.mly"
                     ( [] )
# 444 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'vdecl_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 64 "parser.mly"
                     ( _2 :: _1 )
# 452 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 67 "parser.mly"
               ( (_1, _2) )
# 460 "parser.ml"
               : 'vdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 70 "parser.mly"
                   ( [] )
# 466 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 71 "parser.mly"
                   ( _2 :: _1 )
# 474 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 74 "parser.mly"
              ( Expr _1 )
# 481 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 75 "parser.mly"
                ( Return Noexpr )
# 487 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 76 "parser.mly"
                     ( Return _2 )
# 494 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 77 "parser.mly"
                            ( Block(List.rev _2) )
# 501 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 78 "parser.mly"
                                            ( If(_3, _5, Block([])) )
# 509 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 79 "parser.mly"
                                            ( If(_3, _5, _7) )
# 518 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : 'expr_opt) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'expr_opt) in
    let _9 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 81 "parser.mly"
     ( For(_3, _5, _7, _9) )
# 528 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 82 "parser.mly"
                                  ( While(_3, _5) )
# 536 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 85 "parser.mly"
                  ( Noexpr )
# 542 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 86 "parser.mly"
                  ( _1 )
# 549 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 89 "parser.mly"
                     ( Literal(_1) )
# 556 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 90 "parser.mly"
                     ( BoolLit(true) )
# 562 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 91 "parser.mly"
                     ( BoolLit(false) )
# 568 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 92 "parser.mly"
                     ( Id(_1) )
# 575 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 93 "parser.mly"
                     ( Binop(_1, Add,   _3) )
# 583 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 94 "parser.mly"
                     ( Binop(_1, Sub,   _3) )
# 591 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 95 "parser.mly"
                     ( Binop(_1, Mult,  _3) )
# 599 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 96 "parser.mly"
                     ( Binop(_1, Div,   _3) )
# 607 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 97 "parser.mly"
                     ( Binop(_1, Equal, _3) )
# 615 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 98 "parser.mly"
                     ( Binop(_1, Neq,   _3) )
# 623 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 99 "parser.mly"
                     ( Binop(_1, Less,  _3) )
# 631 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 100 "parser.mly"
                     ( Binop(_1, Leq,   _3) )
# 639 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 101 "parser.mly"
                     ( Binop(_1, Greater, _3) )
# 647 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 102 "parser.mly"
                     ( Binop(_1, Geq,   _3) )
# 655 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 103 "parser.mly"
                     ( Binop(_1, And,   _3) )
# 663 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 104 "parser.mly"
                     ( Binop(_1, Or,    _3) )
# 671 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 105 "parser.mly"
                         ( Unop(Neg, _2) )
# 678 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 106 "parser.mly"
                     ( Unop(Not, _2) )
# 685 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 107 "parser.mly"
                      ( AddAssign(_1, _3) )
# 693 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 108 "parser.mly"
                     ( Assign(_1, _3) )
# 701 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 109 "parser.mly"
                                 ( SingleLinkAssign(_1, _3, _5) )
# 710 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'actuals_opt) in
    Obj.repr(
# 110 "parser.mly"
                                 ( Call(_1, _3) )
# 718 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 111 "parser.mly"
                       ( _2 )
# 725 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 114 "parser.mly"
                  ( [] )
# 731 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'actuals_list) in
    Obj.repr(
# 115 "parser.mly"
                  ( List.rev _1 )
# 738 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 118 "parser.mly"
                            ( [_1] )
# 745 "parser.ml"
               : 'actuals_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'actuals_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 119 "parser.mly"
                            ( _3 :: _1 )
# 753 "parser.ml"
               : 'actuals_list))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.program)
