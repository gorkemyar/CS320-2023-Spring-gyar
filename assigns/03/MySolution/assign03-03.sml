(* ****** ****** *)
(*
use "./../assign03.sml";
use "./../assign03-lib.sml";
*)
(* ****** ****** *)

(*
//
HX-2023-02-10: 10 points
The function list_tabulate takes an integer
[n] and a function [f] and returns a list that
equals [f(0), f(1), ..., f(n-1)]
//
list_tabulate(n: int, f: int -> 'a): 'a list
//
*)

fun list_tabulate(n: int, f: int -> 'a): 'a list =
let
    fun loop(pos: int, n: int, res: 'a list) =
    if pos >= n
    then res
    else loop(pos+1, n, res@[f(pos)])
in
    loop(0,n,[])
end

(* use "assign03-03-test.sml"; *)
(* use "assign03-03.sml"; *)
(* ****** ****** *)

(* end of [CS320-2023-Spring-assign03-03.sml] *)
