(* ****** ****** *)
(*
use "./../assign03.sml";
use "./../assign03-lib.sml";
*)
(* ****** ****** *)

(*
//
HX-2023-02-10: 10 points
list_range(x, y) returns a list consisting
of all the integers i satisfying x <= i < y.
//
For instance,
list_range(1, 1) = []
list_range(2, 1) = []
list_range(0, 5) = [0,1,2,3,4]
//
Please give a tail-recusive implementation of
the list_range function
//
*)

fun list_range(start: int, finish: int): int list =
let
    fun loop(start: int, finish: int, res: int list): int list =
        if start >= finish
        then res
        else loop(start+1, finish, res@[start]) 
in 
    loop(start, finish, [])
end

(* 
val a = list_range(1, 1);
val b = list_range(2, 1);
val c = list_range(1, 5); *)

(* use "assign03-02-test.sml"; *)
(* use "assign03-02.sml"; *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign03-02.sml] *)
