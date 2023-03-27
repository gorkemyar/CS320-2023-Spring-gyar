(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-03-24: 10 points
Please enumerate all the pairs of natural
numbers. Given pairs (i1, j1) and (i2, j2),
(i1, j1) should be enumerated ahead of (i2, j2)
if i1+j1 < i2+j2.
*)

(* ****** ****** *)


val theNatPairs: (int*int) stream = fn () => 
    let
        fun reduceLeft(left, right) = fn () => 
            if left = 0
            then strcon_cons((left, right), reduceRight(0, right+1))
            else strcon_cons((left, right), reduceLeft(left-1, right+1))
        and reduceRight(left, right) = fn () =>
            if right = 0
            then strcon_cons((left, right), reduceLeft(left+1, 0))
            else strcon_cons((left, right), reduceRight(left+1, right-1))
    in
        reduceLeft(0,0)()
    end


(* use "assign06-02.sml"; *)
(* use "assign06-02-test.sml"; *)
(* ****** ****** *)

(* end of [CS320-2023-Spring-assign06-02.sml] *)
