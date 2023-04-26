(* ****** ****** *)
use "./../../MySolution/SML/generator.sml";
(* ****** ****** *)
use "./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
There is an implementation of infinite generators
in [generator.sml]. Please study the implementation.
How do you use it to give an implementation of generators
that are possibily finite?
*)

(* ****** ****** *)

type 'a fgenerator = 'a option generator

(* ****** ****** *)

(*
//
HX-2023-04-15: 20 points
//
Please implement the following function that converts
a stream into a generator that is possibly finite.
(*
There is not much code to write here; the problem mainly
test your understanding of continuations.
*)
//
fun
fgenerator_make_stream(fxs: 'a stream): 'a fgenerator = ...
//
*)
exception EndList

fun
fgenerator_make_stream(fxs: 'a stream): 'a fgenerator = 
generator_make_fun
(
fn
(ret0: 'a cont ref, cret: unit cont ref) =>
fgenerator_make_stream2(fxs, ret0, cret)
)handle EndList => NONE

and

fgenerator_make_stream2(fxs: 'a stream, ret0: 'a cont ref, cret): 'a =
case fxs() of
strcon_nil => raise EndList
| strcon_cons(x, fxs: 'a stream) =>
let

val () = generator_yield(x, ret0, cret)
in

fgenerator_make_stream2(fxs, ret0, cret)
end 

(* val plus1 = fn (a:int) => 
(if a > 0 
then SOME("asda")
else NONE):string option

val b = plus1 4
val c = plus1 0 *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assigns-assign09-02.sml] *)
