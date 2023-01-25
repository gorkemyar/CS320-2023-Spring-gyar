use "./../assign00-lib.sml";

fun stringrevHelper(cs:string, pos: int): string =
    if pos >= 0 then str(strsub(cs, pos)) ^ stringrevHelper(cs, pos-1)
    else "";
fun stringrev(cs: string): string =
    stringrevHelper(cs, strlen(cs)-1);