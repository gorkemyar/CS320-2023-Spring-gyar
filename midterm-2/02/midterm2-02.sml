(* ****** ****** *)

use "./../../mysmlib//mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
The mytree datatype is defined as follows.
Each node in mytree contains a stored element
plus a list of children, where the list can be
empty.
//
Please implement a function mytree_dfs_streamize
that enumerates a given mytree in a depth-first manner.
//
*)
(* ****** ****** *)

datatype 'a mytree =
  mytree_node of 'a * ('a mytree list)

(* ****** ****** *)


fun
mytree_dfs_streamize(t0: 'a mytree): 'a stream = 
let
  fun
  helper(fxs: 'a stream) = 
  case fxs() of 
  strcon_nil => strcon_nil 
  | strcon_cons(tnode, fxs) => 
  let
    val (r, xs) = tnode
    val list_reduce_right(xs, fxs, fn(r0, x0) = stream_cons(x0, r0))
  in  
    fn() => 
  end
in
end





(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-02.sml] *)
