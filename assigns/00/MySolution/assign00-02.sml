fun isPrimeHelper(n0:int, counter:int):bool =
    if counter * counter > n0 then true
    else if (n0 div counter)*counter = n0 then false
    else isPrimeHelper(n0,counter+1);
    
fun isPrime (n0: int): bool=
    if n0 <= 1 then false
    else if n0 = 2 then true
    else isPrimeHelper(n0, 2);