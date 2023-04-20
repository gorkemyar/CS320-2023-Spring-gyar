(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
// 10 points for stream_take
// 10 points for stream_drop
//
Given a stream fxs, stream_take(fxs, n)
returns another stream containing the first
n items in fxs (or all the elements of fxs if
fxs contains fewer than n elements).
//
Given a stream fxs, stream_drop(fxs, n)
returns another stream containing all but the
first n elements of fxs.
//
*)

(* ****** ****** *)

(*
fun
auxmain(i0, fxs): unit =
(
case fxs() of
  strcon_nil => ()
| strcon_cons(x1, fxs) =>
  (iwork(i0, x1); auxmain(i0+1, fxs))
)
in
  auxmain(0, fxs)

*)


fun
stream_take
(fxs: 'a stream, n: int): 'a stream =
let 
    val idx = ref 0
    fun
    helper(fxs) = fn() =>
    if !idx >= n
    then strcon_nil
    else case fxs() of
    strcon_nil => strcon_nil
    | strcon_cons(x1, fxs) => (idx := !idx+1; strcon_cons(x1, helper(fxs)))
in
    helper(fxs)
end


(* ****** ****** *)

fun
stream_drop
(fxs: 'a stream, n: int): 'a stream = 
stream_make_ifilter(fxs, fn(idx, x) => 
if idx < n
then false
else true
)



(* use "midterm2-00.sml"; *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-00.sml] *)
