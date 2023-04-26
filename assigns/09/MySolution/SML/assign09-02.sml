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

fun
fgenerator_make_stream(fxs: 'a stream): 'a fgenerator = 
generator_make_fun
(
fn
(ret0: 'a option cont ref, cret: unit cont ref) =>
(fgenerator_make_stream2(fxs, ret0, cret)): 'a option
)

and

fgenerator_make_stream2(fxs: 'a stream, 
                        ret0: 'a option cont ref, 
                        cret: unit cont ref): 'a option =
case fxs() of
strcon_nil => 
    let 
    val () = generator_yield(NONE, ret0, cret)
    in
    NONE
    end
| strcon_cons(x, fxs: 'a stream) =>
    let
    val () = generator_yield(SOME(x), ret0, cret)
    in
    fgenerator_make_stream2(fxs, ret0, cret)
    end 



(* ****** ****** *)




