(* fun fact (n: int): int =
    if n = 0 then 1
    else n * fact(n-1);

fun fact 0 = 1
    | fact n = n * fact(n-1); 

fact(0);
fact(5); *)


(*Assign:02 isPrime *)
(* 

isPrime(0);
isPrime(16);
isPrime(83);
isPrime(57);
isPrime(101);
isPrime(17);
isPrime(49); *)

(*Assign 03*)

fun int2str(i0: int): string = 
    if (i0 div 10) = 0 then str(Char.chr (Char.ord #"0" + (i0 mod 10)))
    else int2str(i0 div 10) ^ str(Char.chr (Char.ord #"0" + (i0 mod 10)));

val res = int2str(10);
val res2 = int2str(1031231); 

(*Assign 04*)

fun char2int(ch: char):inst = (Char.ord #"9" - Char.ord ch);

fun str2intHelper(cs: string, pos: int): int =
    +  *
fun str2int(cs: string): int =





(* val char = #"a";

Char.chr (Char.ord #"a" + 1);

val word = "abca"; *)


