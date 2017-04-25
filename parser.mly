/* Ocamlyacc parser for TuSimple */

%{
open Ast
%}

%token SEMI LPAREN RPAREN LBRACE RBRACE COMMA LEFTSQUAREBRACKET RIGHTSQUAREBRACKET
%token PLUS MINUS TIMES DIVIDE ASSIGN NOT ADDASSIGN MINUSASSIGN MOD
%token EQ NEQ LT LEQ GT GEQ TRUE FALSE AND OR SINGLELINK DOUBLELINK ADDADD AT NULL
%token RETURN IF ELSE FOR WHILE INT BOOL VOID NODE FLOAT STRING LIST SET MAP GRAPH

%token <string> ID

%token <int> LITERAL
%token <float> FLOAT_LITERAL
%token <string> STRING_LITERAL
%token EOF

%nonassoc NOELSE
%nonassoc ELSE
%right ASSIGN ADDASSIGN MINUSASSIGN
%left OR
%left AND
%left EQ NEQ
%left LT GT LEQ GEQ
%left PLUS MINUS
%left TIMES DIVIDE MOD
%right NOT NEG
%left ADDADD
%left SINGLELINK DOUBLELINK

%start program
%type <Ast.program> program

%%

program:
  decls EOF { $1 }

decls:
   /* nothing */ { [], [] }
 | decls vdecl { ($2 :: fst $1), snd $1 }
 | decls fdecl { fst $1, ($2 :: snd $1) }

fdecl:
   typ ID LPAREN formals_opt RPAREN LBRACE vdecl_list stmt_list RBRACE
     { { typ = $1;
	 fname = $2;
	 formals = $4;
	 locals = List.rev $7;
	 body = List.rev $8 } }

formals_opt:
    /* nothing */ { [] }
  | formal_list   { List.rev $1 }

formal_list:
    typ ID                   { [($1,$2)] }
  | formal_list COMMA typ ID { ($3,$4) :: $1 }

typ:
    INT { Int }
  | BOOL { Bool }
  | VOID { Void }
  | NODE { Node }
  | FLOAT { Float }
  | STRING { String }
  | GRAPH { Graph }
  | LIST AT LBRACE typ RBRACE { List($4) }
  | SET AT LBRACE typ RBRACE { Set($4) }
  | MAP AT LBRACE typ COMMA typ RBRACE { Map($4, $6) }


vdecl_list:
    /* nothing */    { [] }
  | vdecl_list vdecl { $2 :: $1 }

vdecl:
    typ ID SEMI { ($1, $2) }

stmt_list:
    /* nothing */  { [] }
  | stmt_list stmt { $2 :: $1 }

stmt:
    expr SEMI { Expr $1 }
  | RETURN SEMI { Return Noexpr }
  | RETURN expr SEMI { Return $2 }
  | LBRACE stmt_list RBRACE { Block(List.rev $2) }
  | IF LPAREN expr RPAREN stmt %prec NOELSE { If($3, $5, Block([])) }
  | IF LPAREN expr RPAREN stmt ELSE stmt    { If($3, $5, $7) }
  | FOR LPAREN expr_opt SEMI expr SEMI expr_opt RPAREN stmt
     { For($3, $5, $7, $9) }
  | WHILE LPAREN expr RPAREN stmt { While($3, $5) }

expr_opt:
    /* nothing */ { Noexpr }
  | expr          { $1 }

expr:
    LITERAL          { Literal($1) }
  | FLOAT_LITERAL    { FloatLit($1) }
  | STRING_LITERAL   { StringLit($1) }
  | TRUE             { BoolLit(true) }
  | FALSE            { BoolLit(false) }
  | NULL             { Null }
  | ID               { Id($1) }
  | expr PLUS   expr { Binop($1, Add,   $3) }
  | expr MINUS  expr { Binop($1, Sub,   $3) }
  | expr TIMES  expr { Binop($1, Mult,  $3) }
  | expr DIVIDE expr { Binop($1, Div,   $3) }
  | expr EQ     expr { Binop($1, Equal, $3) }
  | expr NEQ    expr { Binop($1, Neq,   $3) }
  | expr LT     expr { Binop($1, Less,  $3) }
  | expr LEQ    expr { Binop($1, Leq,   $3) }
  | expr GT     expr { Binop($1, Greater, $3) }
  | expr GEQ    expr { Binop($1, Geq,   $3) }
  | expr AND    expr { Binop($1, And,   $3) }
  | expr OR     expr { Binop($1, Or,    $3) }
  | expr MOD    expr { Binop($1, Mod,   $3) }
  | ID ADDADD { AddAdd($1) }
  | MINUS expr %prec NEG { Unop(Neg, $2) }
  | NOT expr         { Unop(Not, $2) }
  | ID ADDASSIGN expr { AddAssign($1, $3) }
  | ID MINUSASSIGN expr { MinusAssign($1, $3) }
  | ID ASSIGN expr   { Assign($1, $3) }
  | subscript ASSIGN expr { SubscriptAssign($1, $3) }
  | singleEdge ASSIGN expr { SingleLinkAssign($1, $3) }
  | ID DOUBLELINK ID ASSIGN expr { DoubleLinkAssign($1, $3, $5) }
  | ID LPAREN actuals_opt RPAREN { Call($1, $3) }
  | LPAREN expr RPAREN { $2 } 
  | ID SINGLELINK lists ASSIGN lists { BatchSingleLinkAssign($1, $3, $5) }
  | ID DOUBLELINK lists ASSIGN lists { BatchDoubleLinkAssign($1, $3, $5) }  
  | lists { $1 }
  | singleEdge { $1 }
  | subscript { $1 }

singleEdge:
   ID SINGLELINK ID { SingleEdge($1, $3) }


subscript:
   ID LEFTSQUAREBRACKET expr RIGHTSQUAREBRACKET { Subscript($1, $3) }

lists:
  | AT LBRACE list_literals { ListLiteral($3) } 


 list_literals:
    RBRACE { [] }
 | listElements RBRACE { List.rev $1 }

listElements:
    expr    { [$1] }
  | listElements COMMA expr  { $3 :: $1 } 



actuals_opt:
    /* nothing */ { [] }
  | actuals_list  { List.rev $1 }

actuals_list:
    expr                    { [$1] }
  | actuals_list COMMA expr { $3 :: $1 }
