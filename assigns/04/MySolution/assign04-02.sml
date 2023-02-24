(* ****** ****** *)
(* ****** ****** *)
use
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(* HX-2023-02-16: 10 point*)
(* ****** ****** *)


val
list_subsets =
fn(xs: 'a list) => 
list_foldright(xs, [[]], 
  fn(r1, x1) => 
    r1@list_map(r1, fn(x2) => x2@[x1])
)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign04-02.sml] *)

(* use "assign04-02.sml"; *)
(* use "assign04-02-test.sml"; *)
