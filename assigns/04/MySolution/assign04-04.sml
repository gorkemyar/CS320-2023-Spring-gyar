(* ****** ****** *)
use
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-02-16: 30 points
//
Here is an implementation of the famous 8-queen puzzle:
https://ats-lang.sourceforge.net/DOCUMENT/INT2PROGINATS/HTML/x631.html
//
Please give a NON-RECURSIVE implementation that solves the 8-queen puzzle.
//
type board_t =
int * int * int * int * int * int * int * int
//
fun
queen8_puzzle_solve(): board_t list =
(*
returns a list of boards consisting of all the solutions to the puzzle.
*)
//
*)

type board_t =
int * int * int * int * int * int * int * int



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
let
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
end 

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

fun
queen8_puzzle_solve(): board_t =
let 
    val bd = (0, 0, 0, 0, 0, 0, 0, 0)
    exception NotFound
    exception Found of int
in
    int1_foldright(8, 0, fn(res: int, row1: int) =>

        int1_foldleft(row1 - 1, 0, fn(res: int, col1 int) =>
            if safety_test2(row1, col1, bd, row1-1)

            then 
            let
                val bd1 = board_set(bd, row1, col1)
            in
                int1_foldleft(8, -1, fn(res: bool, col: int) =>
                if safety_test2(row2, col, bd1, row2-1)
                then ()
                else ()
                )
            end
            else ()
        )
    ) 

end


(* ****** ****** *)

(* end of [CS320-2023-Spring-assign04-04.sml] *)

(* use "assign04-04-test.sml"; *)
(* use "assign04-04.sml"; *)









(* 
fun print_dots (i: int) =
  if i > 0 then (print ". "; print_dots (i-1)) else ()

fun print_row (i: int) =
let 
  val () = print_dots (i); 
  val () = print "Q "; 
  val () = print_dots (7-i); 
  val () = print "\n"; 
in 
    true
end

fun print_board (bd: board_t) =
let 
    val (x0, x1, x2, x3, x4, x5, x6, x7) = bd
in
    print_row (x0); print_row (x1); print_row (x2); print_row (x3);
    print_row (x4); print_row (x5); print_row (x6); print_row (x7);  
end *)