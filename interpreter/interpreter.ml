(* interpreter.ml *)

open Absyn

let memory = Hashtbl.create 0

let rec exec stm =
  match stm with
  | CompoundStm (a, b) ->
     exec a;
     exec b
  | AssignStm (v, e) ->
     Hashtbl.replace memory v (eval e)
  | PrintStm lst ->
     List.iter (fun x -> print_float (eval x); print_char ' ') lst;
     print_newline ()

and eval exp =
  match exp with
  | NumExp x -> x
  | IdExp v ->
     (match Hashtbl.find_opt memory v with
      | None -> 0.0
      | Some x -> x
     )
  | OpExp (op, a, b) ->
     let x = eval a in
     let y = eval b in
     let f =
       match op with
       | Plus -> (+.)
       | Minus -> (-.)
       | Times -> ( *.)
       | Div -> (/.)
     in
     f x y
  | EseqExp (s, e) ->
     exec s;
     eval e
