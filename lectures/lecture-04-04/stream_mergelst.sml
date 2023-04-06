(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

exception MyError

(* ****** ****** *)



fun
stream_mergelst
( fxs1: 'a stream list
, lte3: 'a * 'a -> bool): 'a stream = fn() => 
case fxs1 of
nil => strcon_nil
| x0::fxs1 => 
list_foldleft(fxs1, x0, fn(r1, x1) => 
  stream_merge2(r1, x1, lte3))()

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-stream_mergelst.sml] *)