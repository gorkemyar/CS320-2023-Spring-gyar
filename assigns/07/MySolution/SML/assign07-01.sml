(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-03-31: 10 points
Please implement the following function
that turns a list of streams into stream of
lists.
//
fun
stream_ziplst('a stream list): 'a list stream
//
If we use a list of streams to represent a
list of rows of a matrix, then the returned
stream consist of lists that are columns of the
matrix.
*)


fun
stream_ziplst(fxs: 'a stream list): 'a list stream = fn() =>
let
    val rmn = ref []
    val nil_flag = ref false
    val value = 
    list_foldleft(fxs, [], fn(r0, x0) =>
        case x0() of
        strcon_nil => (nil_flag := true; r0)
        | strcon_cons(x1, xs) =>(rmn := !rmn@[xs]; r0@[x1])
        )
    
in
    if !nil_flag = false
    then strcon_cons(value, stream_ziplst(!rmn))
    else strcon_nil

end

(* val xs1 =
list_streamize[1]
val xs2 =
list_streamize[2,2,2]
val xs3 =
list_streamize[3,3]
val fxss =
stream_ziplst([xs1, xs2, xs3])
val (  ) =
assert320(1 = stream_length(fxss))

val a = stream_get_at(fxss,0) *)
(* use "assign07-01.sml"; *)
(* use "assign07-01-test.sml"; *)
(* ****** ****** *)

(* end of [CS320-2023-Spring-assign07-01.sml] *)
