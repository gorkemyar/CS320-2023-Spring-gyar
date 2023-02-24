use "./../../../mysmlib/mysmlib-cls.sml";

(*
HX-2023-02-16: 30 points

Here is an implementation of the famous 8-queen puzzle:
https://ats-lang.sourceforge.net/DOCUMENT/INT2PROGINATS/HTML/x631.html
*)

(* *********** *)
(* For Different N Update This part of the solution *)
(* *********** *)

val N = 8

type board_t =
int * int * int * int * int * int * int * int

val initialBoard = (0, 0, 0, 0, 0, 0, 0, 0)

val
board_foreach =
fn
( bd: board_t
, work: int -> unit) =>
let
val (x0, x1, x2, x3, x4, x5, x6, x7) = bd
in
  work(x0); work(x1); work(x2); work(x3);
  work(x4); work(x5); work(x6); work(x7); ()
end

val 
board_tabulate = 
fn(bd: board_t
, work: int*int->int) =>
let
val (x0, x1, x2, x3, x4, x5, x6, x7) = bd
in
  (work(x0, 0), work(x1, 1), work(x2, 2), work(x3, 3),
  work(x4, 4), work(x5, 5), work(x6, 6), work(x7, 7))
end


(* *********** *)
(* After this point my solution is generic *)
(* *********** *)

val 
board_get = foreach_to_get_at(board_foreach)

val board_set = 
fn(bd: board_t
, i: int, j: int) => 
  board_tabulate(bd, fn(x, idx) =>
  if i = idx
  then j
  else x
  )


exception Found of int

val safety_test1 = 
fn(i0: int, j0: int, i: int, j: int) =>
(j0 <> j)
andalso 
(abs_int(i0-i) <> abs_int(j0-j))

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
    val bds = [initialBoard]
in
    int1_foldleft(N, bds, fn(r0: board_t list, row: int) => 
    let
    val res = list_foldleft(r0, [], fn(r1, bd) => 
    (find_all_possible_columns(row, bd, N)@r1))
    in 
        res
    end
    )
end : board_t list


(* ****** ****** *)

(* end of [CS320-2023-Spring-assign04-04.sml] *)

(* use "assign04-04-test.sml"; *)
(* use "assign04-04.sml"; *)
