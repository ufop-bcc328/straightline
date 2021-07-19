(* Driver *)

let main () =
  let lexbuf =
    match Sys.argv with
    | [| _; input |] ->
       let lexbuf = Lexing.from_channel (open_in input) in
       Lexing.set_filename lexbuf input;
       lexbuf
    | _ ->
       Lexing.from_channel stdin
  in
  
  try
    Parser.program Lexer.token lexbuf
  with
  | Error.Error (loc, msg) ->
     Format.printf "%a error: %s\n" Location.pp_location loc msg;
     exit 1
  | Parser.Error ->
     Format.printf "%a error: syntax\n" Location.pp_position lexbuf.Lexing.lex_curr_p;
     exit 2

let _ = main ()
