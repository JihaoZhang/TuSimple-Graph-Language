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
  | ARROW
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
# 43 "parser.ml"
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
  269 (* ARROW *);
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
  280 (* RETURN *);
  281 (* IF *);
  282 (* ELSE *);
  283 (* FOR *);
  284 (* WHILE *);
  285 (* INT *);
  286 (* BOOL *);
  287 (* VOID *);
  288 (* NODE *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  289 (* LITERAL *);
  290 (* ID *);
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
\009\000\005\000\000\000\001\000\001\000\001\000\001\000\002\000\
\001\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\002\000\002\000\005\000\
\003\000\004\000\003\000\000\000\001\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\002\000\000\000\056\000\000\000\010\000\011\000\013\000\012\000\
\001\000\003\000\004\000\000\000\000\000\016\000\000\000\000\000\
\000\000\000\000\008\000\000\000\000\000\014\000\000\000\000\000\
\009\000\015\000\000\000\000\000\000\000\000\000\017\000\005\000\
\000\000\000\000\030\000\031\000\000\000\000\000\000\000\000\000\
\000\000\029\000\000\000\018\000\000\000\000\000\000\000\046\000\
\047\000\020\000\000\000\000\000\000\000\000\000\032\000\000\000\
\000\000\000\000\019\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\051\000\
\022\000\021\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\036\000\037\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\050\000\000\000\000\000\000\000\000\000\026\000\
\000\000\000\000\000\000\000\000\024\000\000\000\000\000\025\000"

let yydgoto = "\002\000\
\003\000\004\000\010\000\011\000\012\000\017\000\024\000\028\000\
\018\000\044\000\045\000\077\000\080\000\081\000"

let yysindex = "\012\000\
\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\224\254\063\255\000\000\114\255\241\254\
\026\255\045\255\000\000\040\255\114\255\000\000\025\255\114\255\
\000\000\000\000\043\255\064\255\081\255\201\255\000\000\000\000\
\201\255\201\255\000\000\000\000\041\255\091\255\098\255\101\255\
\070\255\000\000\003\255\000\000\254\255\201\000\097\255\000\000\
\000\000\000\000\027\000\201\255\201\255\201\255\000\000\201\255\
\201\255\073\255\000\000\201\255\201\255\201\255\201\255\201\255\
\201\255\201\255\201\255\201\255\201\255\201\255\201\255\000\000\
\000\000\000\000\218\000\252\000\112\255\235\000\252\000\111\255\
\110\255\252\000\115\255\085\255\085\255\000\000\000\000\038\255\
\038\255\166\255\166\255\166\255\166\255\029\001\013\001\157\255\
\201\255\157\255\000\000\201\255\201\255\107\255\046\000\000\000\
\252\000\252\000\157\255\201\255\000\000\120\255\157\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\133\255\000\000\
\000\000\134\255\000\000\000\000\000\000\000\000\000\000\190\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\235\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\138\255\000\000\000\000\137\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\049\255\000\000\000\000\014\255\000\000\
\144\255\080\255\000\000\069\000\092\000\000\000\000\000\105\255\
\165\255\115\000\138\000\161\000\184\000\057\255\005\255\000\000\
\000\000\000\000\000\000\000\000\000\000\130\255\000\000\000\000\
\084\255\109\255\000\000\145\255\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\117\000\000\000\250\255\000\000\000\000\118\000\
\000\000\170\255\226\255\044\000\000\000\000\000"

let yytablesize = 560
let yytable = "\046\000\
\009\000\013\000\048\000\049\000\056\000\045\000\051\000\045\000\
\016\000\102\000\045\000\104\000\001\000\057\000\023\000\058\000\
\054\000\027\000\019\000\054\000\109\000\075\000\076\000\078\000\
\112\000\079\000\082\000\045\000\020\000\084\000\085\000\086\000\
\087\000\088\000\089\000\090\000\091\000\092\000\093\000\094\000\
\095\000\050\000\030\000\022\000\060\000\061\000\062\000\063\000\
\033\000\028\000\021\000\028\000\034\000\066\000\067\000\068\000\
\069\000\044\000\025\000\044\000\035\000\036\000\044\000\014\000\
\015\000\030\000\103\000\031\000\032\000\105\000\106\000\033\000\
\041\000\042\000\043\000\034\000\029\000\076\000\044\000\044\000\
\049\000\014\000\049\000\035\000\036\000\049\000\055\000\037\000\
\038\000\055\000\039\000\040\000\052\000\062\000\063\000\041\000\
\042\000\043\000\030\000\053\000\031\000\073\000\054\000\055\000\
\033\000\038\000\083\000\038\000\034\000\048\000\038\000\048\000\
\097\000\099\000\048\000\100\000\035\000\036\000\038\000\038\000\
\037\000\038\000\111\000\039\000\040\000\101\000\038\000\038\000\
\041\000\042\000\043\000\023\000\107\000\023\000\023\000\006\000\
\007\000\023\000\027\000\052\000\026\000\023\000\005\000\006\000\
\007\000\008\000\053\000\027\000\047\000\023\000\023\000\110\000\
\000\000\023\000\023\000\000\000\023\000\023\000\030\000\000\000\
\031\000\023\000\023\000\023\000\033\000\039\000\000\000\039\000\
\034\000\000\000\039\000\000\000\060\000\061\000\062\000\063\000\
\035\000\036\000\039\000\039\000\037\000\038\000\000\000\039\000\
\040\000\000\000\039\000\039\000\041\000\042\000\043\000\017\000\
\000\000\017\000\017\000\000\000\000\000\017\000\000\000\000\000\
\000\000\017\000\030\000\000\000\000\000\000\000\000\000\000\000\
\033\000\017\000\017\000\000\000\034\000\017\000\017\000\000\000\
\017\000\017\000\000\000\000\000\035\000\036\000\017\000\017\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\041\000\042\000\043\000\033\000\000\000\033\000\000\000\000\000\
\033\000\033\000\033\000\033\000\033\000\000\000\000\000\000\000\
\033\000\033\000\033\000\033\000\033\000\033\000\059\000\000\000\
\033\000\033\000\000\000\000\000\060\000\061\000\062\000\063\000\
\000\000\000\000\000\000\064\000\065\000\066\000\067\000\068\000\
\069\000\000\000\000\000\070\000\071\000\000\000\000\000\000\000\
\000\000\000\000\000\000\074\000\000\000\005\000\006\000\007\000\
\008\000\060\000\061\000\062\000\063\000\000\000\000\000\000\000\
\064\000\065\000\066\000\067\000\068\000\069\000\108\000\000\000\
\070\000\071\000\000\000\000\000\060\000\061\000\062\000\063\000\
\000\000\000\000\000\000\064\000\065\000\066\000\067\000\068\000\
\069\000\000\000\000\000\070\000\071\000\034\000\000\000\034\000\
\000\000\000\000\034\000\034\000\034\000\000\000\000\000\000\000\
\000\000\000\000\034\000\034\000\034\000\034\000\034\000\034\000\
\000\000\000\000\034\000\034\000\035\000\000\000\035\000\000\000\
\000\000\035\000\035\000\035\000\000\000\000\000\000\000\000\000\
\000\000\035\000\035\000\035\000\035\000\035\000\035\000\000\000\
\000\000\035\000\035\000\040\000\000\000\040\000\000\000\000\000\
\040\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\040\000\040\000\040\000\040\000\040\000\040\000\000\000\000\000\
\040\000\040\000\041\000\000\000\041\000\000\000\000\000\041\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\041\000\
\041\000\041\000\041\000\041\000\041\000\000\000\000\000\041\000\
\041\000\042\000\000\000\042\000\000\000\000\000\042\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\042\000\042\000\
\042\000\042\000\042\000\042\000\000\000\000\000\042\000\042\000\
\043\000\000\000\043\000\000\000\000\000\043\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\043\000\043\000\043\000\
\043\000\043\000\043\000\072\000\000\000\043\000\043\000\060\000\
\061\000\062\000\063\000\000\000\000\000\000\000\064\000\065\000\
\066\000\067\000\068\000\069\000\096\000\000\000\070\000\071\000\
\060\000\061\000\062\000\063\000\000\000\000\000\000\000\064\000\
\065\000\066\000\067\000\068\000\069\000\098\000\000\000\070\000\
\071\000\060\000\061\000\062\000\063\000\000\000\000\000\000\000\
\064\000\065\000\066\000\067\000\068\000\069\000\000\000\000\000\
\070\000\071\000\060\000\061\000\062\000\063\000\000\000\000\000\
\000\000\064\000\065\000\066\000\067\000\068\000\069\000\000\000\
\000\000\070\000\071\000\060\000\061\000\062\000\063\000\000\000\
\000\000\000\000\064\000\065\000\066\000\067\000\068\000\069\000\
\000\000\000\000\070\000\060\000\061\000\062\000\063\000\000\000\
\000\000\000\000\064\000\065\000\066\000\067\000\068\000\069\000"

let yycheck = "\030\000\
\000\000\034\001\033\000\034\000\002\001\001\001\037\000\003\001\
\015\000\096\000\006\001\098\000\001\000\011\001\021\000\013\001\
\003\001\024\000\034\001\006\001\107\000\052\000\053\000\054\000\
\111\000\056\000\057\000\023\001\003\001\060\000\061\000\062\000\
\063\000\064\000\065\000\066\000\067\000\068\000\069\000\070\000\
\071\000\001\001\002\001\004\001\007\001\008\001\009\001\010\001\
\008\001\001\001\006\001\003\001\012\001\016\001\017\001\018\001\
\019\001\001\001\034\001\003\001\020\001\021\001\006\001\001\001\
\002\001\002\001\097\000\004\001\005\001\100\000\101\000\008\001\
\032\001\033\001\034\001\012\001\034\001\108\000\022\001\023\001\
\001\001\001\001\003\001\020\001\021\001\006\001\003\001\024\001\
\025\001\006\001\027\001\028\001\002\001\009\001\010\001\032\001\
\033\001\034\001\002\001\002\001\004\001\005\001\002\001\034\001\
\008\001\001\001\034\001\003\001\012\001\001\001\006\001\003\001\
\001\001\003\001\006\001\006\001\020\001\021\001\014\001\015\001\
\024\001\025\001\003\001\027\001\028\001\011\001\022\001\023\001\
\032\001\033\001\034\001\002\001\026\001\004\001\005\001\003\001\
\003\001\008\001\001\001\003\001\024\000\012\001\029\001\030\001\
\031\001\032\001\003\001\003\001\031\000\020\001\021\001\108\000\
\255\255\024\001\025\001\255\255\027\001\028\001\002\001\255\255\
\004\001\032\001\033\001\034\001\008\001\001\001\255\255\003\001\
\012\001\255\255\006\001\255\255\007\001\008\001\009\001\010\001\
\020\001\021\001\014\001\015\001\024\001\025\001\255\255\027\001\
\028\001\255\255\022\001\023\001\032\001\033\001\034\001\002\001\
\255\255\004\001\005\001\255\255\255\255\008\001\255\255\255\255\
\255\255\012\001\002\001\255\255\255\255\255\255\255\255\255\255\
\008\001\020\001\021\001\255\255\012\001\024\001\025\001\255\255\
\027\001\028\001\255\255\255\255\020\001\021\001\033\001\034\001\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\032\001\033\001\034\001\001\001\255\255\003\001\255\255\255\255\
\006\001\007\001\008\001\009\001\010\001\255\255\255\255\255\255\
\014\001\015\001\016\001\017\001\018\001\019\001\001\001\255\255\
\022\001\023\001\255\255\255\255\007\001\008\001\009\001\010\001\
\255\255\255\255\255\255\014\001\015\001\016\001\017\001\018\001\
\019\001\255\255\255\255\022\001\023\001\255\255\255\255\255\255\
\255\255\255\255\255\255\001\001\255\255\029\001\030\001\031\001\
\032\001\007\001\008\001\009\001\010\001\255\255\255\255\255\255\
\014\001\015\001\016\001\017\001\018\001\019\001\001\001\255\255\
\022\001\023\001\255\255\255\255\007\001\008\001\009\001\010\001\
\255\255\255\255\255\255\014\001\015\001\016\001\017\001\018\001\
\019\001\255\255\255\255\022\001\023\001\001\001\255\255\003\001\
\255\255\255\255\006\001\007\001\008\001\255\255\255\255\255\255\
\255\255\255\255\014\001\015\001\016\001\017\001\018\001\019\001\
\255\255\255\255\022\001\023\001\001\001\255\255\003\001\255\255\
\255\255\006\001\007\001\008\001\255\255\255\255\255\255\255\255\
\255\255\014\001\015\001\016\001\017\001\018\001\019\001\255\255\
\255\255\022\001\023\001\001\001\255\255\003\001\255\255\255\255\
\006\001\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\014\001\015\001\016\001\017\001\018\001\019\001\255\255\255\255\
\022\001\023\001\001\001\255\255\003\001\255\255\255\255\006\001\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\014\001\
\015\001\016\001\017\001\018\001\019\001\255\255\255\255\022\001\
\023\001\001\001\255\255\003\001\255\255\255\255\006\001\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\014\001\015\001\
\016\001\017\001\018\001\019\001\255\255\255\255\022\001\023\001\
\001\001\255\255\003\001\255\255\255\255\006\001\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\014\001\015\001\016\001\
\017\001\018\001\019\001\003\001\255\255\022\001\023\001\007\001\
\008\001\009\001\010\001\255\255\255\255\255\255\014\001\015\001\
\016\001\017\001\018\001\019\001\003\001\255\255\022\001\023\001\
\007\001\008\001\009\001\010\001\255\255\255\255\255\255\014\001\
\015\001\016\001\017\001\018\001\019\001\003\001\255\255\022\001\
\023\001\007\001\008\001\009\001\010\001\255\255\255\255\255\255\
\014\001\015\001\016\001\017\001\018\001\019\001\255\255\255\255\
\022\001\023\001\007\001\008\001\009\001\010\001\255\255\255\255\
\255\255\014\001\015\001\016\001\017\001\018\001\019\001\255\255\
\255\255\022\001\023\001\007\001\008\001\009\001\010\001\255\255\
\255\255\255\255\014\001\015\001\016\001\017\001\018\001\019\001\
\255\255\255\255\022\001\007\001\008\001\009\001\010\001\255\255\
\255\255\255\255\014\001\015\001\016\001\017\001\018\001\019\001"

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
  ARROW\000\
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
# 352 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 36 "parser.mly"
                 ( [], [] )
# 358 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 37 "parser.mly"
               ( (_2 :: fst _1), snd _1 )
# 366 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 38 "parser.mly"
               ( fst _1, (_2 :: snd _1) )
# 374 "parser.ml"
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
# 389 "parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 49 "parser.mly"
                  ( [] )
# 395 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 50 "parser.mly"
                  ( List.rev _1 )
# 402 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 53 "parser.mly"
                             ( [(_1,_2)] )
# 410 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 54 "parser.mly"
                             ( (_3,_4) :: _1 )
# 419 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 57 "parser.mly"
        ( Int )
# 425 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 58 "parser.mly"
         ( Bool )
# 431 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 59 "parser.mly"
         ( Node )
# 437 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 60 "parser.mly"
         ( Void )
# 443 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 63 "parser.mly"
                     ( [] )
# 449 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'vdecl_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 64 "parser.mly"
                     ( _2 :: _1 )
# 457 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 67 "parser.mly"
               ( (_1, _2) )
# 465 "parser.ml"
               : 'vdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 70 "parser.mly"
                   ( [] )
# 471 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 71 "parser.mly"
                   ( _2 :: _1 )
# 479 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 74 "parser.mly"
              ( Expr _1 )
# 486 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 75 "parser.mly"
                ( Return Noexpr )
# 492 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 76 "parser.mly"
                     ( Return _2 )
# 499 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 77 "parser.mly"
                            ( Block(List.rev _2) )
# 506 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 78 "parser.mly"
                                            ( If(_3, _5, Block([])) )
# 514 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 79 "parser.mly"
                                            ( If(_3, _5, _7) )
# 523 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : 'expr_opt) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'expr_opt) in
    let _9 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 81 "parser.mly"
     ( For(_3, _5, _7, _9) )
# 533 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 82 "parser.mly"
                                  ( While(_3, _5) )
# 541 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 85 "parser.mly"
                  ( Noexpr )
# 547 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 86 "parser.mly"
                  ( _1 )
# 554 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 89 "parser.mly"
                     ( Literal(_1) )
# 561 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 90 "parser.mly"
                     ( BoolLit(true) )
# 567 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 91 "parser.mly"
                     ( BoolLit(false) )
# 573 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 92 "parser.mly"
                     ( NodeLit(_2) )
# 580 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 93 "parser.mly"
                     ( Id(_1) )
# 587 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 94 "parser.mly"
                     ( Binop(_1, Add,   _3) )
# 595 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 95 "parser.mly"
                     ( Binop(_1, Sub,   _3) )
# 603 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 96 "parser.mly"
                     ( Binop(_1, Mult,  _3) )
# 611 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 97 "parser.mly"
                     ( Binop(_1, Div,   _3) )
# 619 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 98 "parser.mly"
                     ( Binop(_1, Equal, _3) )
# 627 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 99 "parser.mly"
                     ( Binop(_1, Neq,   _3) )
# 635 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 100 "parser.mly"
                     ( Binop(_1, Less,  _3) )
# 643 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 101 "parser.mly"
                     ( Binop(_1, Leq,   _3) )
# 651 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 102 "parser.mly"
                     ( Binop(_1, Greater, _3) )
# 659 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 103 "parser.mly"
                     ( Binop(_1, Geq,   _3) )
# 667 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 104 "parser.mly"
                     ( Binop(_1, And,   _3) )
# 675 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 105 "parser.mly"
                     ( Binop(_1, Or,    _3) )
# 683 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 106 "parser.mly"
                         ( Unop(Neg, _2) )
# 690 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 107 "parser.mly"
                     ( Unop(Not, _2) )
# 697 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 108 "parser.mly"
                             ( Assign_Edge(_1, _3, _5) )
# 706 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 109 "parser.mly"
                     ( Assign(_1, _3) )
# 714 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'actuals_opt) in
    Obj.repr(
# 110 "parser.mly"
                                 ( Call(_1, _3) )
# 722 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 111 "parser.mly"
                       ( _2 )
# 729 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 114 "parser.mly"
                  ( [] )
# 735 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'actuals_list) in
    Obj.repr(
# 115 "parser.mly"
                  ( List.rev _1 )
# 742 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 118 "parser.mly"
                            ( [_1] )
# 749 "parser.ml"
               : 'actuals_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'actuals_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 119 "parser.mly"
                            ( _3 :: _1 )
# 757 "parser.ml"
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
