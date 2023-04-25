(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)
(*
HX-2023-04-20:
Given a finite or infinite stream fxss of
infinite streams: fxs_0, fxs_1, fxs_2, ...,
stream_zipstrm(fxss) returns an infinite stream
of streams: gxs_0, gxs_1, gxs_2, ..., where we have
gxs_j[i] = fxs_i[j]. Note that this is just the
stream version of stream_ziplst (see Assign07-01).
*)
(* ****** ****** *)


fun
stream_zipstrm
( fxss
: 'a stream stream): 'a stream stream  = 
let 
    val head = stream_make_map(
        fxss, fn(fxs) =>
        stream_head(fxs)
    )
    val tail = stream_make_map(
        fxss, fn(fxs) =>
        stream_tail(fxs)
    )
in
    fn () => strcon_cons(head, stream_zipstrm(tail))
end 




(* use "midterm2-03.sml"; *)
(* use "midterm2-03-test.sml"; *)
(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-03.sml] *)
