(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
Please put your implementation here for quiz04-02
*)


fun 
stream_dupremov(fxs: int stream): int stream = fn() =>
 case fxs() of
  strcon_nil => strcon_nil
| strcon_cons(x1, fxs) =>
  strcon_cons(x1, filter(fxs, x1))
and

filter( fxs: int stream, x0: int): int stream = fn() =>
case fxs() of
  strcon_nil => strcon_nil
| strcon_cons(x1, fxs) =>
    if x1 = x0
    then filter(fxs, x1)()
    else strcon_cons(x1, filter(fxs, x1))




(* use "quiz04-02.sml"; *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-quizzes-quiz04-02.sml] *)