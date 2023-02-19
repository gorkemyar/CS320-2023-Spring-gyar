(* ****** ****** *)
(* ****** ****** *)
use
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-02-16: 10 point
The function [list_subsets]
returns all the subsets of a given
set (where sets are represented as lists)
//
fun
list_subsets
(xs: 'a list): 'a list list =
(
case xs of
  nil => [[]]
| x1 :: xs =>
  let
    val res = list_subsets(xs)
  in
    res @ list_map(res, fn(xs) => x1 :: xs)
  end
)
//
Please give a NON-RECURSIVE implementation of
list_subsets based on list-combinators. Note that
the order of the elements in a list representation
of a set is insignificant.
//
*)
(* ****** ****** *)


val
list_subsets =
fn(xs: 'a list) => 
list_foldright(xs, [[]], 
  fn(r1, x1) => 
    r1@list_map(r1, fn(x2) => x2@[x1])
)

(* val xs = [1,2,3,4,5,6]
val xss = list_subsets(xs)
val len = list_length(xss) *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign04-02.sml] *)

(* use "assign04-02.sml"; *)
(* use "assign04-02-test.sml"; *)
