(* ****** ****** *)

(*
Assign04-03:
HX-2023-02-16: 10 point
*)

(* ****** ****** *)
type
('xs, 'x0) forall_t =
'xs * ('x0 -> bool) -> bool
type
('xs, 'x0) exists_t =
'xs * ('x0 -> bool) -> bool
(* ****** ****** *)


val
forall_to_exists = fn(forall: ('xs,'x0)forall_t) =>
    (fn(xs: 'xs, test: 'x0 -> bool)
        => not(forall(xs, fn(x0) => not(test(x0)))) 
    ): ('xs,'x0)exists_t


(* ****** ****** *)

(* end of [CS320-2023-Spring-assign04-03.sml] *)

(* use "assign04-03-test.sml"; *)
(* use "assign04-03.sml"; *)

