(* A product of all list elements is *)
(* first element multiplied by the product of remaining elements *)
(* (In SML, we only have recursion) *)

fun list_product (someList: int list) =
  if null someList then
    1
  else
    hd someList * list_product(tl someList)

(* create a list of elements from n to 1 *)
(* e.g. [5, 4, 3, 2, 1] *)

fun countdown(number: int) =
  if number <= 0 then
    []
  else
    number::countdown(number - 1)


(* e.g. [1, 2, 3], [5, 6] gives [1, 2, 5, 6] *)
(* append(x, y) *)
(* head(x) :: append (tail(x), y) *)
fun append(x: 'a list, y: 'a list) =
  if null x
    then y
  else
    (hd x)::append(tl x, y)

fun sum_pairs(x: (int * int) list) =
  if null x then
    0
  else
    #1 (hd x) + #2 (hd x) + sum_pairs(tl x);

(* firsts([(1, 2), (3, 4), (5, 6)]) --> [1, 3, 5]*)
fun firsts(x: (int * int) list) =
  if null x then
    []
  else
    (#1 (hd x))::firsts(tl x)

(* count(1, 4) --> [1, 2, 3] *)
fun count(from: int, to: int) =
  if from >= to then
    []
  else
    from::count(from + 1, to)

(* maxOfNonEmpty only accepts list of at least one element *)
fun maxOfNonEmpty(x: int list) =
  if null (tl x) then
    hd x
  else
    let val restMax = maxOfNonEmpty(tl x)
    in
      if hd x > restMax then
        hd x
      else restMax
    end

(* max returns NONE for empty list and SOME for a non-empty list *)
(* fun max(x: int list) =
  if null x then
    NONE
  else
    let val tailMax = max(tl x) val head = hd x in
      if isSome tailMax andalso valOf tailMax > head then
        tailMax
      else
        SOME head
    end *)

(* max returns NONE for empty list and SOME for a non-empty list *)
fun max(x: int list) =
  if null x then
    NONE
  else
    SOME (maxOfNonEmpty x)
