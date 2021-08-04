// parser.mly

%{
    let memory = Hashtbl.create 0

    let rec print_list lst =
      match lst with
      | [] -> print_newline ()
      | [x] -> print_float x; print_newline ()
      | x::rest -> print_float x; print_string " "; print_list rest
    
    let variable v =
      match Hashtbl.find_opt memory v with
      | None -> 0.0
      | Some x -> x
%}

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
| x=ID ASSIGN e=exp { Hashtbl.replace memory  x e}
| PRINT LPAREN l=explist RPAREN { print_list l }
;

exp:
| v=ID { variable v }
| c=NUM { c }
| a=exp f=binop b=exp { f a b }
| LPAREN stm COMMA x=exp RPAREN { x }
;

explist:
| l=separated_nonempty_list(COMMA, exp) { l }
;

%inline binop:
| PLUS { (+.) }
| MINUS { (-.) }
| TIMES { ( *.) }
| DIV { (/.) }
;