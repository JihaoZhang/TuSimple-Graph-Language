type token =
  | SEMI
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | COMMA
  | LEFTSQUAREBRACKET
  | RIGHTSQUAREBRACKET
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
  | AT
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
  | STRING
  | LIST
  | SET
  | MAP
  | GRAPH
  | ID of (string)
  | LITERAL of (int)
  | FLOAT_LITERAL of (float)
  | STRING_LITERAL of (string)
  | EOF

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.program
