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
  | MINUSASSIGN
  | MOD
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
  | DOUBLELINK
  | ADDADD
  | RETURN
  | IF
  | ELSE
  | FOR
  | WHILE
  | INT
  | BOOL
  | VOID
  | NODE
  | FLOAT
  | LITERAL of (int)
  | FLOAT_LITERAL of (float)
  | ID of (string)
  | EOF

open Parsing;;
let _ = parse_error;;
# 4 "parser.mly"
open Ast
# 50 "parser.ml"
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
  270 (* MINUSASSIGN *);
  271 (* MOD *);
  272 (* EQ *);
  273 (* NEQ *);
  274 (* LT *);
  275 (* LEQ *);
  276 (* GT *);
  277 (* GEQ *);
  278 (* TRUE *);
  279 (* FALSE *);
  280 (* AND *);
  281 (* OR *);
  282 (* SINGLELINK *);
  283 (* DOUBLELINK *);
  284 (* ADDADD *);
  285 (* RETURN *);
  286 (* IF *);
  287 (* ELSE *);
  288 (* FOR *);
  289 (* WHILE *);
  290 (* INT *);
  291 (* BOOL *);
  292 (* VOID *);
  293 (* NODE *);
  294 (* FLOAT *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  295 (* LITERAL *);
  296 (* FLOAT_LITERAL *);
  297 (* ID *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\004\000\006\000\006\000\009\000\
\009\000\005\000\005\000\005\000\005\000\005\000\007\000\007\000\
\003\000\008\000\008\000\010\000\010\000\010\000\010\000\010\000\
\010\000\010\000\010\000\012\000\012\000\011\000\011\000\011\000\
\011\000\011\000\011\000\011\000\011\000\011\000\011\000\011\000\
\011\000\011\000\011\000\011\000\011\000\011\000\011\000\011\000\
\011\000\011\000\011\000\011\000\011\000\011\000\011\000\011\000\
\011\000\013\000\013\000\014\000\014\000\000\000"

let yylen = "\002\000\
\002\000\000\000\002\000\002\000\009\000\000\000\001\000\002\000\
\004\000\001\000\001\000\001\000\001\000\001\000\000\000\002\000\
\003\000\000\000\002\000\002\000\002\000\003\000\003\000\005\000\
\007\000\009\000\005\000\000\000\001\000\001\000\001\000\001\000\
\001\000\001\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\002\000\
\002\000\002\000\003\000\003\000\003\000\005\000\005\000\004\000\
\003\000\000\000\001\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\002\000\000\000\062\000\000\000\010\000\011\000\012\000\013\000\
\014\000\001\000\003\000\004\000\000\000\000\000\017\000\000\000\
\000\000\000\000\000\000\008\000\000\000\000\000\015\000\000\000\
\000\000\009\000\016\000\000\000\000\000\000\000\000\000\018\000\
\005\000\000\000\000\000\032\000\033\000\000\000\000\000\000\000\
\000\000\030\000\031\000\000\000\019\000\000\000\000\000\000\000\
\049\000\050\000\021\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\048\000\020\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\057\000\023\000\022\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\037\000\038\000\047\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\056\000\000\000\000\000\000\000\000\000\
\000\000\027\000\000\000\000\000\000\000\000\000\000\000\025\000\
\000\000\000\000\026\000"

let yydgoto = "\002\000\
\003\000\004\000\011\000\012\000\013\000\018\000\025\000\029\000\
\019\000\045\000\046\000\082\000\085\000\086\000"

let yysindex = "\005\000\
\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\217\254\030\255\000\000\034\000\
\225\254\013\255\015\255\000\000\053\255\034\000\000\000\012\255\
\034\000\000\000\000\000\020\255\054\255\070\255\179\255\000\000\
\000\000\179\255\179\255\000\000\000\000\007\255\080\255\098\255\
\103\255\000\000\000\000\184\255\000\000\241\255\208\000\094\255\
\000\000\000\000\000\000\006\000\179\255\179\255\179\255\179\255\
\179\255\179\255\179\255\067\255\068\255\000\000\000\000\179\255\
\179\255\179\255\179\255\179\255\179\255\179\255\179\255\179\255\
\179\255\179\255\179\255\179\255\000\000\000\000\000\000\227\000\
\009\001\109\255\246\000\009\001\111\255\106\255\009\001\009\001\
\009\001\108\255\114\255\003\255\003\255\000\000\000\000\000\000\
\061\001\061\001\082\255\082\255\082\255\082\255\046\001\028\001\
\144\255\179\255\144\255\000\000\179\255\179\255\179\255\089\255\
\033\000\000\000\009\001\009\001\009\001\144\255\179\255\000\000\
\127\255\144\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\142\255\
\000\000\000\000\146\255\000\000\000\000\000\000\000\000\000\000\
\099\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\220\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\141\255\000\000\147\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\066\255\000\000\000\000\014\255\000\000\151\255\152\255\187\255\
\193\255\000\000\000\000\058\000\083\000\000\000\000\000\000\000\
\048\255\189\000\108\000\133\000\158\000\183\000\112\255\049\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\139\255\
\000\000\000\000\057\255\202\255\203\255\000\000\154\255\000\000\
\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\134\000\000\000\245\255\000\000\000\000\128\000\
\000\000\219\255\225\255\044\000\000\000\000\000"

let yytablesize = 594
let yytable = "\047\000\
\010\000\014\000\049\000\050\000\017\000\001\000\052\000\051\000\
\031\000\020\000\024\000\066\000\067\000\028\000\034\000\021\000\
\060\000\068\000\035\000\060\000\022\000\080\000\081\000\083\000\
\084\000\087\000\088\000\089\000\036\000\037\000\015\000\016\000\
\092\000\093\000\094\000\095\000\096\000\097\000\098\000\099\000\
\100\000\101\000\102\000\103\000\104\000\042\000\043\000\044\000\
\039\000\046\000\039\000\046\000\026\000\039\000\046\000\031\000\
\023\000\032\000\033\000\061\000\030\000\034\000\061\000\039\000\
\039\000\035\000\029\000\112\000\029\000\114\000\015\000\039\000\
\039\000\046\000\113\000\036\000\037\000\115\000\116\000\117\000\
\120\000\053\000\038\000\039\000\123\000\040\000\041\000\081\000\
\064\000\065\000\066\000\067\000\042\000\043\000\044\000\031\000\
\068\000\032\000\078\000\054\000\018\000\034\000\018\000\018\000\
\055\000\035\000\018\000\090\000\091\000\106\000\018\000\109\000\
\045\000\108\000\045\000\036\000\037\000\045\000\110\000\118\000\
\018\000\018\000\038\000\039\000\111\000\040\000\041\000\018\000\
\018\000\122\000\018\000\018\000\042\000\043\000\044\000\045\000\
\045\000\018\000\018\000\018\000\024\000\028\000\024\000\024\000\
\006\000\031\000\024\000\032\000\007\000\058\000\024\000\034\000\
\053\000\059\000\053\000\035\000\028\000\053\000\027\000\048\000\
\024\000\024\000\121\000\000\000\000\000\036\000\037\000\024\000\
\024\000\000\000\024\000\024\000\038\000\039\000\000\000\040\000\
\041\000\024\000\024\000\024\000\031\000\000\000\042\000\043\000\
\044\000\056\000\034\000\051\000\000\000\051\000\035\000\000\000\
\051\000\052\000\057\000\052\000\058\000\059\000\052\000\000\000\
\036\000\037\000\054\000\055\000\054\000\055\000\000\000\054\000\
\055\000\060\000\061\000\062\000\000\000\000\000\000\000\000\000\
\000\000\042\000\043\000\044\000\034\000\000\000\034\000\000\000\
\000\000\034\000\034\000\034\000\034\000\034\000\000\000\000\000\
\000\000\000\000\034\000\034\000\034\000\034\000\034\000\034\000\
\034\000\063\000\000\000\034\000\034\000\000\000\000\000\064\000\
\065\000\066\000\067\000\000\000\000\000\000\000\000\000\068\000\
\069\000\070\000\071\000\072\000\073\000\074\000\079\000\000\000\
\075\000\076\000\000\000\000\000\064\000\065\000\066\000\067\000\
\000\000\000\000\000\000\000\000\068\000\069\000\070\000\071\000\
\072\000\073\000\074\000\000\000\000\000\075\000\076\000\000\000\
\000\000\119\000\005\000\006\000\007\000\008\000\009\000\064\000\
\065\000\066\000\067\000\000\000\000\000\000\000\000\000\068\000\
\069\000\070\000\071\000\072\000\073\000\074\000\000\000\000\000\
\075\000\076\000\035\000\000\000\035\000\000\000\000\000\035\000\
\035\000\035\000\000\000\005\000\006\000\007\000\008\000\009\000\
\000\000\035\000\035\000\035\000\035\000\035\000\035\000\000\000\
\000\000\035\000\035\000\036\000\000\000\036\000\000\000\000\000\
\036\000\036\000\036\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\036\000\036\000\036\000\036\000\036\000\036\000\
\000\000\000\000\036\000\036\000\041\000\000\000\041\000\000\000\
\000\000\041\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\041\000\041\000\041\000\041\000\041\000\
\041\000\000\000\000\000\041\000\041\000\042\000\000\000\042\000\
\000\000\000\000\042\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\042\000\042\000\042\000\042\000\
\042\000\042\000\000\000\000\000\042\000\042\000\043\000\000\000\
\043\000\000\000\000\000\043\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\043\000\043\000\043\000\
\043\000\043\000\043\000\000\000\000\000\043\000\043\000\044\000\
\000\000\044\000\000\000\000\000\044\000\040\000\000\000\040\000\
\000\000\000\000\040\000\000\000\000\000\000\000\044\000\044\000\
\044\000\044\000\044\000\044\000\040\000\040\000\044\000\044\000\
\000\000\000\000\077\000\000\000\040\000\040\000\064\000\065\000\
\066\000\067\000\000\000\000\000\000\000\000\000\068\000\069\000\
\070\000\071\000\072\000\073\000\074\000\105\000\000\000\075\000\
\076\000\064\000\065\000\066\000\067\000\000\000\000\000\000\000\
\000\000\068\000\069\000\070\000\071\000\072\000\073\000\074\000\
\107\000\000\000\075\000\076\000\064\000\065\000\066\000\067\000\
\000\000\000\000\000\000\000\000\068\000\069\000\070\000\071\000\
\072\000\073\000\074\000\000\000\000\000\075\000\076\000\064\000\
\065\000\066\000\067\000\000\000\000\000\000\000\000\000\068\000\
\069\000\070\000\071\000\072\000\073\000\074\000\000\000\000\000\
\075\000\076\000\064\000\065\000\066\000\067\000\000\000\000\000\
\000\000\000\000\068\000\069\000\070\000\071\000\072\000\073\000\
\074\000\000\000\000\000\075\000\064\000\065\000\066\000\067\000\
\000\000\000\000\000\000\000\000\068\000\069\000\070\000\071\000\
\072\000\073\000\074\000\064\000\065\000\066\000\067\000\000\000\
\000\000\000\000\000\000\068\000\000\000\000\000\071\000\072\000\
\073\000\074\000"

let yycheck = "\031\000\
\000\000\041\001\034\000\035\000\016\000\001\000\038\000\001\001\
\002\001\041\001\022\000\009\001\010\001\025\000\008\001\003\001\
\003\001\015\001\012\001\006\001\006\001\053\000\054\000\055\000\
\056\000\057\000\058\000\059\000\022\001\023\001\001\001\002\001\
\064\000\065\000\066\000\067\000\068\000\069\000\070\000\071\000\
\072\000\073\000\074\000\075\000\076\000\039\001\040\001\041\001\
\001\001\001\001\003\001\003\001\041\001\006\001\006\001\002\001\
\004\001\004\001\005\001\003\001\041\001\008\001\006\001\016\001\
\017\001\012\001\001\001\105\000\003\001\107\000\001\001\024\001\
\025\001\025\001\106\000\022\001\023\001\109\000\110\000\111\000\
\118\000\002\001\029\001\030\001\122\000\032\001\033\001\119\000\
\007\001\008\001\009\001\010\001\039\001\040\001\041\001\002\001\
\015\001\004\001\005\001\002\001\002\001\008\001\004\001\005\001\
\002\001\012\001\008\001\041\001\041\001\001\001\012\001\006\001\
\001\001\003\001\003\001\022\001\023\001\006\001\011\001\031\001\
\022\001\023\001\029\001\030\001\011\001\032\001\033\001\029\001\
\030\001\003\001\032\001\033\001\039\001\040\001\041\001\024\001\
\025\001\039\001\040\001\041\001\002\001\001\001\004\001\005\001\
\003\001\002\001\008\001\004\001\003\001\003\001\012\001\008\001\
\001\001\003\001\003\001\012\001\003\001\006\001\025\000\032\000\
\022\001\023\001\119\000\255\255\255\255\022\001\023\001\029\001\
\030\001\255\255\032\001\033\001\029\001\030\001\255\255\032\001\
\033\001\039\001\040\001\041\001\002\001\255\255\039\001\040\001\
\041\001\002\001\008\001\001\001\255\255\003\001\012\001\255\255\
\006\001\001\001\011\001\003\001\013\001\014\001\006\001\255\255\
\022\001\023\001\001\001\001\001\003\001\003\001\255\255\006\001\
\006\001\026\001\027\001\028\001\255\255\255\255\255\255\255\255\
\255\255\039\001\040\001\041\001\001\001\255\255\003\001\255\255\
\255\255\006\001\007\001\008\001\009\001\010\001\255\255\255\255\
\255\255\255\255\015\001\016\001\017\001\018\001\019\001\020\001\
\021\001\001\001\255\255\024\001\025\001\255\255\255\255\007\001\
\008\001\009\001\010\001\255\255\255\255\255\255\255\255\015\001\
\016\001\017\001\018\001\019\001\020\001\021\001\001\001\255\255\
\024\001\025\001\255\255\255\255\007\001\008\001\009\001\010\001\
\255\255\255\255\255\255\255\255\015\001\016\001\017\001\018\001\
\019\001\020\001\021\001\255\255\255\255\024\001\025\001\255\255\
\255\255\001\001\034\001\035\001\036\001\037\001\038\001\007\001\
\008\001\009\001\010\001\255\255\255\255\255\255\255\255\015\001\
\016\001\017\001\018\001\019\001\020\001\021\001\255\255\255\255\
\024\001\025\001\001\001\255\255\003\001\255\255\255\255\006\001\
\007\001\008\001\255\255\034\001\035\001\036\001\037\001\038\001\
\255\255\016\001\017\001\018\001\019\001\020\001\021\001\255\255\
\255\255\024\001\025\001\001\001\255\255\003\001\255\255\255\255\
\006\001\007\001\008\001\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\016\001\017\001\018\001\019\001\020\001\021\001\
\255\255\255\255\024\001\025\001\001\001\255\255\003\001\255\255\
\255\255\006\001\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\016\001\017\001\018\001\019\001\020\001\
\021\001\255\255\255\255\024\001\025\001\001\001\255\255\003\001\
\255\255\255\255\006\001\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\016\001\017\001\018\001\019\001\
\020\001\021\001\255\255\255\255\024\001\025\001\001\001\255\255\
\003\001\255\255\255\255\006\001\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\016\001\017\001\018\001\
\019\001\020\001\021\001\255\255\255\255\024\001\025\001\001\001\
\255\255\003\001\255\255\255\255\006\001\001\001\255\255\003\001\
\255\255\255\255\006\001\255\255\255\255\255\255\016\001\017\001\
\018\001\019\001\020\001\021\001\016\001\017\001\024\001\025\001\
\255\255\255\255\003\001\255\255\024\001\025\001\007\001\008\001\
\009\001\010\001\255\255\255\255\255\255\255\255\015\001\016\001\
\017\001\018\001\019\001\020\001\021\001\003\001\255\255\024\001\
\025\001\007\001\008\001\009\001\010\001\255\255\255\255\255\255\
\255\255\015\001\016\001\017\001\018\001\019\001\020\001\021\001\
\003\001\255\255\024\001\025\001\007\001\008\001\009\001\010\001\
\255\255\255\255\255\255\255\255\015\001\016\001\017\001\018\001\
\019\001\020\001\021\001\255\255\255\255\024\001\025\001\007\001\
\008\001\009\001\010\001\255\255\255\255\255\255\255\255\015\001\
\016\001\017\001\018\001\019\001\020\001\021\001\255\255\255\255\
\024\001\025\001\007\001\008\001\009\001\010\001\255\255\255\255\
\255\255\255\255\015\001\016\001\017\001\018\001\019\001\020\001\
\021\001\255\255\255\255\024\001\007\001\008\001\009\001\010\001\
\255\255\255\255\255\255\255\255\015\001\016\001\017\001\018\001\
\019\001\020\001\021\001\007\001\008\001\009\001\010\001\255\255\
\255\255\255\255\255\255\015\001\255\255\255\255\018\001\019\001\
\020\001\021\001"

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
  MINUSASSIGN\000\
  MOD\000\
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
  DOUBLELINK\000\
  ADDADD\000\
  RETURN\000\
  IF\000\
  ELSE\000\
  FOR\000\
  WHILE\000\
  INT\000\
  BOOL\000\
  VOID\000\
  NODE\000\
  FLOAT\000\
  EOF\000\
  "

let yynames_block = "\
  LITERAL\000\
  FLOAT_LITERAL\000\
  ID\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    Obj.repr(
# 35 "parser.mly"
            ( _1 )
# 391 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 38 "parser.mly"
                 ( [], [] )
# 397 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 39 "parser.mly"
               ( (_2 :: fst _1), snd _1 )
# 405 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 40 "parser.mly"
               ( fst _1, (_2 :: snd _1) )
# 413 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 8 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 5 : 'formals_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl_list) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 44 "parser.mly"
     ( { typ = _1;
	 fname = _2;
	 formals = _4;
	 locals = List.rev _7;
	 body = List.rev _8 } )
# 428 "parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 51 "parser.mly"
                  ( [] )
# 434 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 52 "parser.mly"
                  ( List.rev _1 )
# 441 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 55 "parser.mly"
                             ( [(_1,_2)] )
# 449 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 56 "parser.mly"
                             ( (_3,_4) :: _1 )
# 458 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 59 "parser.mly"
        ( Int )
# 464 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 60 "parser.mly"
         ( Bool )
# 470 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 61 "parser.mly"
         ( Void )
# 476 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 62 "parser.mly"
         ( Node )
# 482 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 63 "parser.mly"
          ( Float )
# 488 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 66 "parser.mly"
                     ( [] )
# 494 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'vdecl_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 67 "parser.mly"
                     ( _2 :: _1 )
# 502 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 70 "parser.mly"
               ( (_1, _2) )
# 510 "parser.ml"
               : 'vdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 73 "parser.mly"
                   ( [] )
# 516 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 74 "parser.mly"
                   ( _2 :: _1 )
# 524 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 77 "parser.mly"
              ( Expr _1 )
# 531 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 78 "parser.mly"
                ( Return Noexpr )
# 537 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 79 "parser.mly"
                     ( Return _2 )
# 544 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 80 "parser.mly"
                            ( Block(List.rev _2) )
# 551 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 81 "parser.mly"
                                            ( If(_3, _5, Block([])) )
# 559 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 82 "parser.mly"
                                            ( If(_3, _5, _7) )
# 568 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : 'expr_opt) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'expr_opt) in
    let _9 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 84 "parser.mly"
     ( For(_3, _5, _7, _9) )
# 578 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 85 "parser.mly"
                                  ( While(_3, _5) )
# 586 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 88 "parser.mly"
                  ( Noexpr )
# 592 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 89 "parser.mly"
                  ( _1 )
# 599 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 92 "parser.mly"
                     ( Literal(_1) )
# 606 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 93 "parser.mly"
                     ( FloatLit(_1) )
# 613 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 94 "parser.mly"
                     ( BoolLit(true) )
# 619 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 95 "parser.mly"
                     ( BoolLit(false) )
# 625 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 96 "parser.mly"
                     ( Id(_1) )
# 632 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 97 "parser.mly"
                     ( Binop(_1, Add,   _3) )
# 640 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 98 "parser.mly"
                     ( Binop(_1, Sub,   _3) )
# 648 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 99 "parser.mly"
                     ( Binop(_1, Mult,  _3) )
# 656 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 100 "parser.mly"
                     ( Binop(_1, Div,   _3) )
# 664 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 101 "parser.mly"
                     ( Binop(_1, Equal, _3) )
# 672 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 102 "parser.mly"
                     ( Binop(_1, Neq,   _3) )
# 680 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 103 "parser.mly"
                     ( Binop(_1, Less,  _3) )
# 688 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 104 "parser.mly"
                     ( Binop(_1, Leq,   _3) )
# 696 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 105 "parser.mly"
                     ( Binop(_1, Greater, _3) )
# 704 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 106 "parser.mly"
                     ( Binop(_1, Geq,   _3) )
# 712 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 107 "parser.mly"
                     ( Binop(_1, And,   _3) )
# 720 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 108 "parser.mly"
                     ( Binop(_1, Or,    _3) )
# 728 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 109 "parser.mly"
                     ( Binop(_1, Mod,   _3) )
# 736 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 110 "parser.mly"
              ( AddAdd(_1) )
# 743 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 111 "parser.mly"
                         ( Unop(Neg, _2) )
# 750 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 112 "parser.mly"
                     ( Unop(Not, _2) )
# 757 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 113 "parser.mly"
                      ( AddAssign(_1, _3) )
# 765 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 114 "parser.mly"
                        ( MinusAssign(_1, _3) )
# 773 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 115 "parser.mly"
                     ( Assign(_1, _3) )
# 781 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 116 "parser.mly"
                                 ( SingleLinkAssign(_1, _3, _5) )
# 790 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 117 "parser.mly"
                                 ( DoubleLinkAssign(_1, _3, _5) )
# 799 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'actuals_opt) in
    Obj.repr(
# 118 "parser.mly"
                                 ( Call(_1, _3) )
# 807 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 119 "parser.mly"
                       ( _2 )
# 814 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 122 "parser.mly"
                  ( [] )
# 820 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'actuals_list) in
    Obj.repr(
# 123 "parser.mly"
                  ( List.rev _1 )
# 827 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 126 "parser.mly"
                            ( [_1] )
# 834 "parser.ml"
               : 'actuals_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'actuals_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 127 "parser.mly"
                            ( _3 :: _1 )
# 842 "parser.ml"
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
