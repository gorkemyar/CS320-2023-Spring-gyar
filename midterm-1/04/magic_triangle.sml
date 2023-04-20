(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-03-01: midterm1-04: 10 points
*)
(* ****** ****** *)
(*
Magic Triangle:
             1
           1   1
         1   2   1
       1   3   3   1
     1   4   6   4   1
   1   5   10  10  5   1
 1   6   15  20  15  6   1

THe magic triangle has the following structure:
- All numbers on the left and right borders are 1.
- All numbers in the interior (non-border) are the sum of the
  numbers in the row directly above it.

The following example shows how row 5 is computed from row 4.

row 4:      1     4     6     4    1
           / \   / \   / \   / \  / \
row 5:    1   1+4   4+6   6+4  4+1   1


We can represent a magic triangle in SML as an int list list where each row
is stored as a nested int list.

row 0  [[1]
row 1   [1,  1]
row 2   [1,  2,  1]
row 3   [1,  3,  3,  1]
row 4   [1,  4,  6,  4,  1]
row 5   [1,  5,  10, 10, 5,  1]
row 6   [1,  6,  15, 20, 15, 6,  1]]
...


Please implement a function that produces a magic triangle with n row.

triangle 0 = [[1]]
triangle 1 = [[1], [1, 1]]
triangle 2 = [[1], [1, 1], [1, 2, 1]]
triangle 3 = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1]]
triangle 4 = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]
...
triangle n = ???

Hint: You might want a helper function to compute the current row from
the previous.

*)

(* ****** ****** *)


fun
magic_triangle (n : int) : int list list = 
let
  val res = ref []
in
  if n = 0
  then [[1]]
  else
    (int1_foldleft(n+1, [[1]], fn(r0, x0) =>
      let
          val pre = ref 0
          val ans = ref 0
      in 
       (res := (!res)@r0; [
        list_map(hd(r0), fn(x1) =>
          (ans := !pre + x1;
           pre := x1;
            !ans)
        )@[1]])
      end 
    ); !res)

end



fun calc_pascal(n: int, i: int): int =
let
  val n_fact = int1_foldleft(n, 1, fn(r0,x0) => r0*(x0+1))
  val div1 = int1_foldleft(i, n_fact, fn(r0, x0) => r0 div (x0+1))
  val div2 = int1_foldleft(n-i, div1, fn(r0, x0) => r0 div (x0+1))
in
  div2
end

fun magic_triangle2(n :int): int list list =
  list_reverse(int1_foldleft(n, [[1]], fn(r0, x0) => 
    foreach_to_ifoldleft(list_foreach)(hd(r0), [1], fn(r1, idx, x1) => 
        r1@[calc_pascal(x0+1, idx+1)]
      )::r0))


fun magic_triangle3(n :int): int list list =
  list_reverse(int1_foldleft(n, [[1]], fn(r0, x0) => 
    (foreach_to_ifoldleft(list_foreach)(hd(r0), [], fn(r1, idx, x1) => 
        if idx = 0
        then [1]
        else r1@[x1+list_get_at(hd(r0), idx-1)]
      )@[1])::r0))




val a1 = magic_triangle(5)
val a2 = magic_triangle2(5)
val a3 = magic_triangle3(5)
  

(* use "magic_triangle.sml"; *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm1-magic_triangle.sml] *)
