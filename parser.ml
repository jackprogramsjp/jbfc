type tree =
  | ListNode of tree list
  | LshiftNode
  | RshiftNode
  | PlusNode
  | MinusNode
  | DotNode
  | CommaNode
  | LbraceNode
  | RbraceNode

let rec tree_str = function
  | ListNode tl -> String.concat " " (List.map tree_str tl)
  | LshiftNode -> "LshiftNode"
  | RshiftNode -> "RshiftNode"
  | PlusNode -> "PlusNode"
  | MinusNode -> "MinusNode"
  | DotNode -> "DotNode"
  | CommaNode -> "CommaNode"
  | LbraceNode -> "LbraceNode"
  | RbraceNode -> "RbraceNode"

let rec parse l text =
  try
    let result = String.sub text 1 (String.length text - 1) in
    let genparse node = parse (node :: l) result in
    match text.[0] with
    | '<' -> genparse LshiftNode
    | '>' -> genparse RshiftNode
    | '+' -> genparse PlusNode
    | '-' -> genparse MinusNode
    | '.' -> genparse DotNode
    | ',' -> genparse CommaNode
    | '[' -> genparse LbraceNode
    | ']' -> genparse RbraceNode
    | _ -> parse l result
    (* ignore other characters *)
  with Invalid_argument _ -> ListNode (List.rev l)

let parse = parse []
