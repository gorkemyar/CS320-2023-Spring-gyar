(* ****** ****** *)
(*
use "./../assign03.sml";
use "./../assign03-lib.sml";
*)
(* ****** ****** *)

(*
HX-2023-02-10: 20 points
Given a list of integers xs,
please implement a function that find
the longest ascending subsequences of [xs].
If there are more than one such sequences,
the left most one should be returned.

fun list_longest_ascend(xs: int list): int list
*)



fun list_longest_ascend(xs: int list): int list =
let 
    fun listLen(xs : int list, len: int): int =
        case xs of
        nil => len
        | x1::xs => listLen(xs, len+1)

    fun loop(xs: int list, last: int, res: int list, lenList: int): int list =
    case xs of
    nil => res
    | x1::xs => (
        if x1 >= last 
        then (
            let 
                val withNew = loop(xs, x1, res@[x1], lenList+1)  
                val withoutNew = loop(xs, last, res, lenList)  
            in 
                if (listLen(withNew, 0)) >= (listLen(withoutNew, 0))
                then withNew
                else withoutNew
            end
        )
        else (
            let 
                val oldList = loop(xs, last, res, lenList)  
                val newList= loop(xs, x1, [x1], 1)  
            in 
                if (listLen(oldList, 0)) >= (listLen(newList, 0))
                then oldList
                else newList
            end
        )
    )
in
    case xs of
    nil => []
    | x1::xs => loop(xs, x1, [x1], 1)
end


(* use "assign03-04.sml"; *)
(* use "assign03-04-test.sml"; *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign03-04.sml] *)

