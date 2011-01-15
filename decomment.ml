module B = Buffer

let decomment ib =
  let l = B.length ib in
  let ob = B.create l in
  let cat = B.add_char ob in
  let rec next k i = let s = i+1 in if s < l then k s else ob
  and accept i = match B.nth ib i with
    | '/' -> next comment i
    | c -> cat c; next accept i
  and comment i = match B.nth ib i with
    | '/' -> cat ' '; next line i
    | '*' -> cat ' '; next block i
    | c -> cat '/'; cat c; next accept i
  and line i = match B.nth ib i with
    | '\n' -> cat '\n'; next accept i
    | _ -> next line i
  and block i = match B.nth ib i with
    | '\n' -> cat '\n'; next block i
    | '*' -> next endblock i
    | _ -> next block i
  and endblock i = match B.nth ib i with
    | '/' -> next accept i
    | _ -> next block (i-1) (* "... condemned to repeat it." *)
  in if l <> 0 then next accept (-1) else ob

let rec spool b =
  if (try (B.add_string b (input_line stdin); true) with End_of_file -> false)
  then (B.add_char b '\n'; spool b) else b
;;
B.output_buffer stdout (decomment (spool (B.create 80)))
