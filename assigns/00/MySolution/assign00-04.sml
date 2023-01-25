use "./../assign00-lib.sml";

fun char2int(ch: char):int = (ord ch - ord #"0");
fun pow(num:int, power:int): int =
    if (power > 0) then num * pow(num, power-1)
    else 1;

fun str2intHelper(cs: string, pos: int): int =
    if pos < strlen(cs) then char2int(strsub(cs, pos)) * pow(10, (strlen(cs) - 1 - pos)) + str2intHelper(cs, pos+1)
    else 0;
fun str2int(cs: string): int = 
    str2intHelper(cs, 0);
