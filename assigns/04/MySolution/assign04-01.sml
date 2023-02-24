(* ****** ****** *)
use
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(* HX-2023-02-16: 10 points *)


val findRoot = fn(n0) =>
int1_foldleft(n0, 0, fn(r0,x0) => (
  if (x0*x0) > n0
  then r0
  else r0+1
  )
);

val 
isPrime = fn(n0) => 
if n0 < 2
then false
else int1_forall(
    findRoot(n0),
    fn(i) =>  (
      if i >= 2 
      then (n0 mod i) <> 0
      else true
    )
);


(* use "assign04-01.sml"; *)
(* use "assign04-01-test.sml"; *)

(* end of [CS320-2023-Spring-assign04-01.sml] *)
