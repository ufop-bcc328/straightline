(* absyntree.ml *)
(* Convert abstract syntax trees to generic trees of list of string *)

open Absyn

(* Concatenate the lines of text in the node *)
let flat_nodes tree =
  Tree.map (String.concat "\n") tree

(* Make a tree *)
let mktree root children = Tree.mkt [root] children

(* Make a leaf tree *)
let mkleaf root = mktree root []

(* Convert a binary operator to a string *)
let string_of_oper op =
  match op with
  | Plus   -> "+"
  | Minus  -> "-"
  | Times  -> "*"
  | Div    -> "/"

(* Convert a statement to a generic tree *)
let rec tree_of_stm stm =
  match stm with
  | CompoundStm (s1, s2) -> mktree "CompoundStm" [tree_of_stm s1; tree_of_stm s2]
  | AssignStm (v, e)     -> mktree "AssignStm" [mkleaf (Symbol.name v); tree_of_exp e]
  | PrintStm es          -> mktree "PrintStm" (List.map tree_of_exp es)

(* Convert an expression to a generic tree *)
and tree_of_exp exp =
  match exp with
  | NumExp x           -> mkleaf ("NumExp " ^ string_of_float x)
  | IdExp x            -> mkleaf ("IdExp " ^ Symbol.name x)
  | OpExp (op, e1, e2) -> mktree ("OpExp " ^ string_of_oper op) [tree_of_exp e1; tree_of_exp e2]
  | EseqExp (s, e)     -> mktree "EseqExp" [tree_of_stm s; tree_of_exp e]
