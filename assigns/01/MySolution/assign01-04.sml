use "./../assign01-lib.sml";
use "./../assign01.sml";

val strsub = String.sub;
val ord = Char.ord;
val chr = Char.chr;
val strlen = String.size;

fun str2int_opt(cs: string): int option =
let 
    fun char2int(ch: char):int = (ord ch - ord #"0");

    fun pow(num:int, power:int): int =
        if (power > 0) then num * pow(num, power-1)
        else 1;

    fun loop_error_check(cs: string, pos: int): bool =
        if pos >= strlen(cs)
        then true
        else 
            if ((ord (strsub(cs, pos))) < ( ord #"0")) orelse ((ord (strsub(cs, pos))) > (ord #"9"))
            then false
            else loop_error_check(cs, pos+1);

    fun loop_sum(cs: string, pos: int): int =
        if pos >= strlen(cs)
        then 0
        else char2int(strsub(cs,pos)) * pow(10, (strlen(cs) - 1 - pos)) + loop_sum(cs, pos+1);
    
in 
    if (strlen(cs) > 0) andalso (strsub(cs,0) = #"-") andalso  (loop_error_check(cs,1) = true)
    then SOME( ~1 * loop_sum(cs,1))
    else 
        if (strlen(cs) > 0) andalso (strsub(cs,0) <> #"-") andalso (loop_error_check(cs,0) = true)
        then SOME(loop_sum(cs,0))
        else NONE
end

val x = str2int_opt("");

(* use "assign01-04.sml"; *)