use "./../../../mysmlib/mysmlib-cls.sml";

(*
HX-2023-02-16: 30 points

Here is an implementation of the famous 8-queen puzzle:
https://ats-lang.sourceforge.net/DOCUMENT/INT2PROGINATS/HTML/x631.html
*)

val N = 8

type board_l = int list
type board_t =
int * int * int * int * int * int * int * int

exception NotFound
exception Found of int


val print_dots = fn(i: int) =>
  int1_foldright(i, 0, fn(i, r0) => (print("."); 0))

val print_row = fn(i: int) =>
let 
  val a = print_dots (i); 
  val () = print "Q "; 
  val b = print_dots (N-1-i); 
  val () = print "\n"; 
in 
    true
end

val print_board = 
fn(bd) =>
list_foldleft(bd, 0, fn(r0, x0) => (print_row(x0); 0))

 
val board_get = 
fn (bd: board_t, i: int) =>
let 
    val (x0, x1, x2, x3, x4, x5, x6, x7) = bd
in
    if i = 0 then x0
    else if i = 1 then x1
    else if i = 2 then x2
    else if i = 3 then x3
    else if i = 4 then x4
    else if i = 5 then x5
    else if i = 6 then x6
    else if i = 7 then x7
    else ~1
end

val board_set = 
fn (bd: board_t, i: int, j:int) =>
(let
  val (x0, x1, x2, x3, x4, x5, x6, x7) = bd
in
  if i = 0 then let
    val x0 = j in (x0, x1, x2, x3, x4, x5, x6, x7)
  end else if i = 1 then let
    val x1 = j in (x0, x1, x2, x3, x4, x5, x6, x7)
  end else if i = 2 then let
    val x2 = j in (x0, x1, x2, x3, x4, x5, x6, x7)
  end else if i = 3 then let
    val x3 = j in (x0, x1, x2, x3, x4, x5, x6, x7)
  end else if i = 4 then let
    val x4 = j in (x0, x1, x2, x3, x4, x5, x6, x7)
  end else if i = 5 then let
    val x5 = j in (x0, x1, x2, x3, x4, x5, x6, x7)
  end else if i = 6 then let
    val x6 = j in (x0, x1, x2, x3, x4, x5, x6, x7)
  end else if i = 7 then let
    val x7 = j in (x0, x1, x2, x3, x4, x5, x6, x7)
  end else bd 
end ): board_t

(* val board_get = 
fn (bd: board_l, i: int) => 
let
in
list_foldleft(bd, 0, fn(r0, x0) =>
   if x0 = i0
   then raise Found r0
   else 
      if (r0 + 1) < N
      then r0 + 1
      else raise Found ~1)
end
handle Found i => i

val board_set =
fn (bd: board_l, i: int, j: int) =>
list_foldleft(bd, [], fn(r0, x0) => 

 ) *)




val abs = 
fn(x: int) =>
if x > 0
then x
else ~1*x

val safety_test1 = 
fn(i0: int, j0: int, i: int, j: int) =>
(j0 <> j)
andalso 
(abs(i0-i) <> abs(j0-j))

val safety_test2 =
fn(i0: int, j0: int, bd: board_t, i: int) => 
int1_foldright(i, true, fn(x0: int, res: bool) =>
    res andalso safety_test1(i0, j0, x0, board_get(bd, x0))
)



val find_column = fn (row: int, col_default: int, bd: board_t, N: int) =>
    int1_foldleft(N+1, ~1, fn(res: int, col: int) =>
    if col > col_default
    then
        if safety_test2(row, col, bd, row)
        then (raise Found col)
        else N + 1
    else N + 1
)


val find_all_possible_columns = fn(row: int, bd: board_t, N: int) =>
let
    val col_default = ref(0)
in
int1_foldleft(N, [], fn(r0: board_t list, col: int) =>  
    if !col_default <> N+1
    then
        let 
            val tmp = find_column(row, !col_default, bd, N)
        in
            col_default := tmp;
            (r0)
        end
        handle Found i => 
        let
            val bd1 = board_set(bd, row, i)
        in
        (col_default := i; bd1::r0)
        end
    else r0
)
end


val queen8_puzzle_solve = fn() =>
let 
    val bds = [(0, 0, 0, 0, 0, 0, 0, 0)]
in
    int1_foldleft(N, bds, fn(r0: board_t list, row: int) => 
    let
    val res = list_foldleft(r0, [], fn(r0, bd) => 
    (find_all_possible_columns(row, bd, N)@r0))
    in 
        res
    end
    )
end : board_t list


(* ****** ****** *)

(* end of [CS320-2023-Spring-assign04-04.sml] *)

(* use "assign04-04-test.sml"; *)
(* use "assign04-04.sml"; *)