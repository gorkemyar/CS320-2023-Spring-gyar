(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
A sequence xs of integers captures '231'
if there are three integers a, b, and c
appearing as a subsequence of in satisfying
c < a < b. Note that a, b, and c doe not have
to appear consecutively in xs.

For instance, [1,3,4,2] does capture '231'
For instance, [1,2,4,3] does not capture '231'
For instance, [1,2,3,4] does not capture '231'
*)

(* ****** ****** *)

exception found 

fun
perm_capture_231(xs: int list): bool = 
let
 fun
 helper(xs) =
 case xs of
 nil => false
 | x1::xs => 
 let 
 val idx1 = ref 0
 val idx2 = ref 0
 in
 if list_exists(xs, fn(x2) => (idx1 := !idx1 + 1; x2 > x1)) 
    andalso 
    list_exists(xs, fn(x2) => (idx2 := !idx2 + 1; (x2 < x1) andalso ((!idx2) > (!idx1))))
 then raise found
 else helper(xs)
 end
in 
    helper(xs)
    handle found => true
end

val a = perm_capture_231([1,3,4,2])

(* use "midterm2-05.sml"; *)
(* use "midterm2-05-test.sml"; *)




(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-05.sml] *)
