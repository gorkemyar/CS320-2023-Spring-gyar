(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-03-01: midterm1-01: 10 points
*)
(* ****** ****** *)
(*
Given a list xs, list_pairing(xs) returns
a list of pairs and an option; the 1st pair
consists of the first and last elements in xs,
and the 2nd pair consists of the second and the
second last elements in xs, and so on and so forth;
and the option is NONE if |xs| is even, and it is
SOME(xm) if |xs| is odd and xm is the middle element
in xs.
//
For instance, we have:
//
list_pairing([]) = ([], NONE)
list_pairing([1]) = ([], SOME(1))
list_pairing([1,2]) = ([(1,2)], NONE)
list_pairing([1,2,3]) = ([(1,3)], SOME(2))
list_pairing([1,2,3,4]) = ([(1,4),(2,3)], NONE)
//
*)
(* ****** ****** *)
(*
fun
list_pairing
(xs: 'a list): ('a * 'a) list * 'a option = ...
*)
(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm1-list_pairing.sml] *)


fun
list_pairing
(xs: 'a list): ('a * 'a) list * 'a option =
let 
    
    val size = list_length(xs)
    val half = size div 2
    
    exception Done of 'a list
    val xs_r = list_reverse(xs)
    
    fun 
    zip( xs: 'a list, ys: 'a list, idx: int) : ('a * 'a) list =
    if idx >= half
    then nil
    else case xs of
        nil => nil
        | x1 :: xs =>
        (
        case ys of
            nil => nil
        | y1 :: ys =>
            (x1, y1) :: zip(xs, ys, idx+1))
    
    val zipped = zip(xs, xs_r, 0)

in
    if size mod 2 = 0
    then (zipped, NONE)
    else (zipped, SOME(list_get_at(xs,half)))
end 


val a0 = list_pairing([])
val a1 = list_pairing([1])
val a2 = list_pairing([1,2])
val a3 = list_pairing([1,2,3])
val a4 = list_pairing([1,2,3,4])

(* use "list_pairing.sml"; *)
(* use "midterm1-02-test.sml"; *)