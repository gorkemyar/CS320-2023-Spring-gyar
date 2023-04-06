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
theNatPairs_cubesum() = 
let
  fun
  stream_couples
  ( n0: int): (int*int) stream =
  let
    fun
    fmain1
    (i0: int): (int*int) stream = fn() =>
      strcon_cons((n0,i0), fmain1(i0+1))
  in
      fmain1(n0)
  end

  val lte3 = fn(x: int*int, y: int*int) =>
  let 
    val (x0, x1) = x
    val (y0, y1) = y
  in
    if x0*x0*x0 + x1*x1*x1 <= y0*y0*y0 + y1*y1*y1
    then true
    else false
  end

  fun
  merge_couples(fx1: (int*int) stream): (int*int) stream = fn() =>
  case fx1() of
  strcon_nil => strcon_nil
  | strcon_cons(x1, fx1) => 
      let 
        val (z1, z2) = x1
      in
        if  z1 = z2 
        then strcon_cons(x1, merge_couples(stream_merge2(fx1, stream_couples(z1+1), lte3)))
        else strcon_cons(x1, merge_couples(fx1))
      end
      
in
  merge_couples(stream_couples(0))()
end

(* val fxs = theNatPairs_cubesum()
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


val a = stream_get_at(theNatPairs_cubesum, 100000)

(* ****** ****** *)


(* use "assign07-02.sml"; *)
(* use "assign07-02-test.sml"; *)

(* end of [CS320-2023-Spring-assign07-02.sml] *)

(* 0,0 0,1 0,2 0,3 0,4
    1,1 1,2 1,3 1,4
        2,2 2,3 2,4
            3,3 3,3
                4,4 *)