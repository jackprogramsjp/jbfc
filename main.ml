let main =
  if Array.length Sys.argv = 2 then (
    let ic = open_in Sys.argv.(1) in
    try
      let code = really_input_string ic (in_channel_length ic) in
      close_in ic;
      let oc = open_out (Sys.argv.(1) ^ ".c") in
      output_string oc (Parser.parse code |> Compiler.compile);
      close_out oc
    with e ->
      close_in_noerr ic;
      raise e)
  else print_endline "usage: jbfc [file]"
