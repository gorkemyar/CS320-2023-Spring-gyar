(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-04-07: 20 points
Given a list xs, stream_permute_list(xs) returns
a stream of ALL the permutations of xs.
For instance, if xs = [1,2,3], then the returned
stream should enumerate the following 6 lists:
[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2] and [3,2,1]
//
fun
stream_permute_list(xs: 'a list): 'a list stream = ...
//
*)

(* fun permute(xs: 'a list): 'a list list =
let
  val pre = ref []
  val later = ref xs
  val last = ref nil
in
  list_foldleft(xs, [], fn(r0, x0) =>
  let
    val (h::t) = !later
  in
    (later := t; pre := !pre@(!last); last := [x0]; r0@[x0::(!pre)@(!later)])
  end
)
end *)

fun permute2(xs: 'a list): 'a list list = 
let
    fun helper(xs: 'a list, pre: 'a list, res: 'a list list): 'a list list =
    case xs of
    nil => res
    | x1::xs => helper(xs, pre@[x1], (x1::pre@xs)::res)
in
    helper(xs, [], [])
end

fun position_permute(xs: 'a list, pos: int): 'a list list = 
let
    val rmn = ref []
    val first = foreach_to_ifoldleft(list_foreach)(xs, [], 
        fn(r0, idx, x0) =>
        if idx < pos
        then r0@[x0]
        else (rmn := !rmn@[x0]; r0)
    )
    val perm = permute2(!rmn)
in
    list_foldleft(perm, [], fn(r0, x0) => r0@[first@x0])
end

fun
stream_permute_list(xs: 'a list): 'a list stream = 
let
    val size = list_length(xs)
    fun
    helper(fxs: 'a list stream, pos: int): 'a list stream = fn() =>
    case fxs() of
    strcon_nil => strcon_nil
    | strcon_cons(x0, fxs) =>
    if pos < size-1
    then 
        let
            val lists = position_permute(x0, pos)
        in
            list_foldleft(lists, fxs, fn(r0, x1) => helper(stream_cons(x1, r0), pos+1))()
        end
    else strcon_cons(x0, fxs)
in
    helper(stream_cons(xs, stream_nil()), 0)
end
    

(* val () = print_int(stream_length
(stream_permute_list[1,2,3,4,5,6])) *)
val fxs = stream_permute_list([1,2,3,4])

(* val a = position_permute([1,2,3,4], 3) *)

val strcon_cons(a1, fxs) = fxs()
val strcon_cons(a2, fxs) = fxs()
(* val strcon_cons(a3, fxs) = fxs()
val strcon_cons(a4, fxs) = fxs()
val strcon_cons(a5, fxs) = fxs() 
val strcon_cons(a6, fxs) = fxs()
val strcon_cons(a7, fxs) = fxs()
val strcon_cons(a8, fxs) = fxs()
val strcon_cons(a9, fxs) = fxs()
val strcon_cons(a10, fxs) = fxs()
val strcon_cons(a11, fxs) = fxs() 
val strcon_cons(a12, fxs) = fxs()
val strcon_cons(a13, fxs) = fxs()
val strcon_cons(a14, fxs) = fxs()
val strcon_cons(a15, fxs) = fxs()
val strcon_cons(a16, fxs) = fxs()
val strcon_cons(a17, fxs) = fxs() 
val strcon_cons(a18, fxs) = fxs()
val strcon_cons(a19, fxs) = fxs()
val strcon_cons(a20, fxs) = fxs()
val strcon_cons(a21, fxs) = fxs()
val strcon_cons(a22, fxs) = fxs()
val strcon_cons(a23, fxs) = fxs() 
val strcon_cons(a24, fxs) = fxs()  *)

(* use "assign08-01.sml";  *)
(* use "assign08-01-test.sml";  *)


(* ****** ****** *)

(* end of [CS320-2023-Spring-assign08-01.sml] *)
