(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-03-31: 20 points
Please implement the following function
that enumerates all the pairs (i, j) of natural
numbers satisfying $i <= j$; a pair (i1, j1) must
be enumerated ahead of another pair (i2, j2) if the
following condition holds:
  i1*i1*i1 + j1*j1*j1 < i2*i2*i2 + j2*j2*j2
//
val
theNatPairs_cubesum: (int * int) stream = fn () =>
//
*)

fun 
find_nextpair(y1: int, y2: int): (int * int) stream = fn() =>
let
  val z1 = ref (y1 + 2)
  val z2 = ref (y2 + 2)
  val a = 
  int1_foldleft(y2 + 2, 0, 
    fn(r2, x2) =>
    int1_foldleft(x2 + 1, 0, 
      fn(r1, x1) =>
      if (x2*x2*x2 + x1*x1*x1) > (y1*y1*y1 + y2*y2*y2) andalso (x2*x2*x2 + x1*x1*x1) < (!z1 * !z1 * !z1 + !z2 * !z2 * !z2)
      then (z2 := x2; z1 := x1; r1)
      else r1
    )
  )
in
  strcon_cons((!z1,!z2), find_nextpair(!z1, !z2))
end


val
theNatPairs_cubesum: (int * int) stream = fn () =>
  strcon_cons((0,0), find_nextpair(0,0))


(* val fxs = theNatPairs_cubesum
val strcon_cons(ax, fxs) = fxs()
val strcon_cons(bx, fxs) = fxs()
val strcon_cons(cx, fxs) = fxs()
val strcon_cons(dx, fxs) = fxs()
val strcon_cons(ex, fxs) = fxs()
val strcon_cons(fx, fxs) = fxs()
val strcon_cons(gx, fxs) = fxs()
val strcon_cons(hx, fxs) = fxs()
val strcon_cons(x1, fxs) = fxs()
val strcon_cons(x2, fxs) = fxs()
val strcon_cons(x3, fxs) = fxs()
val strcon_cons(x4, fxs) = fxs()
val strcon_cons(x5, fxs) = fxs()
val strcon_cons(x6, fxs) = fxs()
val strcon_cons(x7, fxs) = fxs()
val strcon_cons(x8, fxs) = fxs()
val strcon_cons(x9, fxs) = fxs()
val strcon_cons(x10, fxs) = fxs()
val strcon_cons(x11, fxs) = fxs()
val strcon_cons(x12, fxs) = fxs()
val strcon_cons(x13, fxs) = fxs()
val strcon_cons(x14, fxs) = fxs()
val strcon_cons(x15, fxs) = fxs()
val strcon_cons(x16, fxs) = fxs() *)



(* ****** ****** *)


(* use "assign07-02.sml"; *)
(* use "assign07-02-test.sml"; *)

(* end of [CS320-2023-Spring-assign07-02.sml] *)
