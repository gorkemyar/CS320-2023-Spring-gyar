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




val xs = [4, 1, 2, 1, 3, 8, 9, 5, 6, 7, 1, 1, 1, 1, 1, 1, 1];
val a = list_longest_ascend(xs)


(* use "assign03-04.sml"; *)
(* use "assign03-04-test.sml"; *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign03-04.sml] *)


(*
    




fun list_longest_ascend(xs: int list): int=
let 
    exception BOUND1 of int
    exception BOUND2 of int

    fun listLen(xs : int list, len: int): int =
        case xs of
        nil => len
        | x1::xs => listLen(xs, len+1)

    fun fill(n:int, res: int list): int list =
        if n = 0
        then []
        else fill(n-1, 1::res)

    fun listNth(n:int, xs: int list): int =
        case xs of 
        nil => raise BOUND1 n
        | x1::xs =>(
            if n = 0
            then x1
            else listNth(n-1, xs)
        )

    fun changeNth(n: int, newElement: int ,xs: int list): int list =
        case xs of
        nil => raise BOUND2 n
        | x1::xs =>(
            if n = 0
            then newElement::xs
            else changeNth(n-1, newElement, xs)
        )

    fun memoUpdate(j: int, i: int, memo: int list): int list = 
        let 
            val memoI = listNth(i, memo)
            val memoJ = listNth(j, memo) + 1
        in
            if listNth(i, xs) > listNth(j, xs) andalso memoI < memoJ 
            then changeNth(i, memoJ, memo)
            else memo
        end

    fun innerLoop(j: int, i: int, memo: int list): int list = 
        let
            val memo = memoUpdate(j, i, memo)
        in
            if j < i -1
            then innerLoop(j+1, i, memo)
            else memo
        end

    fun outerLoop(i: int, n: int, memo: int list): int list =
        let
            val memo = innerLoop(0, i, memo)
        in 
            if i < n 
            then outerLoop(i+1, n, memo)
            else memo
        end

    fun findMax(xs: int list, maxElement: int) =
        case xs of
        nil => maxElement
        | x1::xs => (
            if x1 > maxElement 
            then findMax(xs, x1)
            else findMax(xs, maxElement)
        )
    val memo = fill(listLen(xs, 0), [])

in
    findMax(outerLoop(1, listLen(xs, 0) - 1, memo), 1)
end

*)