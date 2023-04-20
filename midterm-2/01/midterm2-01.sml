(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
Given a stream fxs of real numbers a0, a1, a2, ...
and a real number x0, stream_evaluate(fxs, x0)
returns another stream of real number that enumerates
all of the following partial sums:
a0, a0 + a1*x0, a0 + a1*x0 + a2*x0^2, ...
The general form of the enumerated sums is given as follows:
(a0 + a1*x0 + a2*x0^2 + ... + an * x0^n)
//
Assume:
a0 = 0, a1 = 1, a2 = -1/2, a3 = 1/3, a4 = -1/4, ...
Then we have ln2 = stream_evaluate(fxs, 1.0) // see Assign06-01
//
*)



fun
stream_evaluate
(fxs: real stream, x0: real): real stream = 
let
    val power = ref 1.0
    val last = ref 0.0
    val first = ref true
in
    stream_make_map(fxs, fn(x1) => 
    if !first
    then (last := !power*x1; first := false; !last)
    else (((power := !power*x0);(last := !last + (!power*x1)); !last)))
end

(* val fxs1 =
stream_tabulate(~1, fn n => 1.0)
val fxs2 = stream_evaluate(fxs1, 1.0/2.0)

val strcon_cons(a1, fx2) = fxs2()
val strcon_cons(a2, fx2) = fxs2()
val strcon_cons(a3, fx2) = fxs2() *)
(* val fxs = stream_evaluate() *)

(* ****** ****** *)

(* use "midterm2-01.sml"; *)
(* use "midterm2-01-test.sml"; *)

(* end of [CS320-2023-Spring-midterm2-01.sml] *)


(* ****** ****** *)
    (* val r_stream = stream_tabulate(~1, fn x => 1.0 / (Real.fromInt(x)+1.0))
    val n_stream = stream_make_imap(r_stream, 
    fn (idx, x) => 
    if idx mod 2 = 0
    then ~1.0*x
    else x
    ) *)