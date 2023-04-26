(* ****** ****** *)

open SMLofNJ.Cont

(* ****** ****** *)

fun fact(n) =
if n > 0 then n * fact(n-1) else 1

(* ****** ****** *)

(* Continuation-Passing-Style-style *)

(* ****** ****** *)

fun
fact1(n: int): int =
if n > 0 then
n *
callcc
(fn k => throw k (fact1(n-1))) else 1

(* ****** ****** *)

fun
fact2(n: int): int =
callcc(fn k => kfact(n, k))

and
kfact(n: int, k: int cont): int =
if n <= 0
then throw k 1
else n * callcc(fn k => kfact(n-1, k))


fun
compose_func_cont
(f0: 'a -> 'b, k0: 'b cont): 'a cont =
callcc
(
fn ret =>
throw k0 (f0(callcc(fn k1 => throw ret k1))))

(* ****** ****** *)

fun
kfact2
(n: int, k0: int cont): int =
if n <= 0
then throw k0 1 else
kfact2
(n-1, compose_func_cont(fn res => n * res, k0))


fun foo (x, k)=
  if x > 0 then
    (print("positive\n"); foo(x-1,k))
  else
    throw k ()

val result1 = callcc(fn k=> foo( 3, k)) (* returns 4 *)

val result2 = callcc(fn k=> foo (~1, k))

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-kfact.sml] *)