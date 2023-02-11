(* ****** ****** *)
(*
use "./../assign03.sml";
use "./../assign03-lib.sml";
*)
(* ****** ****** *)

(*
//
HX-2023-02-09: 10 points
//
The function find_root(f0)
finds the first root of [f0] in
the following sequence:
0, 1, -1, 2, -2, 3, -3, 4, -4, ...
*)

fun
find_root(f0: int -> int): int = 
let
   exception ZERO of int
   fun loop(x1: int): int =
        if f0(x1) = 0 
        then raise ZERO(x1)
        else 
            if f0(x1 * ~1) = 0
            then raise ZERO(x1 * ~1)
            else loop(x1+1)
in
    loop(0) handle ZERO i => i
end


(* ****** ****** *)

(* end of [CS320-2023-Spring-assign03-01.sml] *)

(* use "assign03-01-test.sml"; *)