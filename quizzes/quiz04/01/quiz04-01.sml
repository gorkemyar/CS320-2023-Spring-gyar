(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
Please put your implementation here for quiz04-01
*)

val theAlphabet ="ABCDEFGHIJKLMNOPQRSTUVWXYZ"

fun alphabet_cycling_list()= 
    let 
        fun
        find_next_char(ch: char): char stream = fn() =>
        if ch = #"Z"
        then strcon_cons(ch, find_next_char(#"A"))
        else strcon_cons(ch, find_next_char(chr(ord(ch)+1)))
    in
        find_next_char(#"A")()
    end

(* ****** ****** *)

val fxs = alphabet_cycling_list
val strcon_cons(c1, fxs) = fxs()
val strcon_cons(c2, fxs) = fxs()
(* use "quiz04-01.sml"; *)

(* end of [CS320-2023-Spring-quizzes-quiz04-01.sml] *)