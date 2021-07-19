// parser.mly

%token                 EOF
%token                 PLUS
%token                 MINUS
%token                 TIMES
%token                 DIV
%token                 LPAREN
%token                 RPAREN
%token                 COMMA
%token                 SEMICOLON
%token                 ASSIGN
%token                 PRINT
%token <float>         NUM
%token <Symbol.symbol> ID

%start <unit> program

%left SEMICOLON
%left PLUS MINUS
%left TIMES DIV

%%

program:
| stm EOF { }
;

stm:
| stm SEMICOLON stm { }
| ID ASSIGN exp { }
| PRINT LPAREN explist  RPAREN { }
;

exp:
| ID { }
| NUM { }
| exp binop exp { }
| LPAREN stm COMMA exp RPAREN { }
;

explist:
| separated_nonempty_list(COMMA, exp) { }
;

%inline binop:
| PLUS { }
| MINUS { }
| TIMES { }
| DIV { }
;