let tabs = "    "

let mutated_tabs = ref tabs

let rec compile = function
  | Parser.ListNode tl ->
      let res =
        ref
          ("#include <stdio.h>\n\nint main(void) {\n" ^ !mutated_tabs
         ^ "char array[30000] = { 0 };\n" ^ !mutated_tabs
         ^ "char *ptr = array;\n")
      in
      for i = 0 to List.length tl - 1 do
        res := !res ^ compile (List.nth tl i)
      done;
      res := !res ^ !mutated_tabs ^ "return 0;\n}\n";
      !res
  | Parser.LshiftNode -> !mutated_tabs ^ "--ptr;\n"
  | Parser.RshiftNode -> !mutated_tabs ^ "++ptr;\n"
  | Parser.PlusNode -> !mutated_tabs ^ "++*ptr;\n"
  | Parser.MinusNode -> !mutated_tabs ^ "--*ptr;\n"
  | Parser.DotNode -> !mutated_tabs ^ "putchar(*ptr);\n"
  | Parser.CommaNode -> !mutated_tabs ^ "*ptr = getchar();\n"
  | Parser.LbraceNode ->
      let res = !mutated_tabs ^ "while (*ptr) {\n" in
      mutated_tabs := !mutated_tabs ^ tabs;
      res
  | Parser.RbraceNode ->
      mutated_tabs :=
        String.sub !mutated_tabs 0
          (String.length !mutated_tabs - String.length tabs);
      !mutated_tabs ^ "}\n"
