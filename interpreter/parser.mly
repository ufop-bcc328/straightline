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

%%

program :
| EOF { }
