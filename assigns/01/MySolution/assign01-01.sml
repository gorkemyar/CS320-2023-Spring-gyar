use "./../assign01-lib.sml";
use "./../assign01.sml";

fun xlist_size(xs: 'a xlist): int =
let 
    fun 
    loop (xs: 'a xlist, res: int): int =(
        case xs of
        xlist_nil => res |
        xlist_cons(x1, xs) => loop(xs, res +1) |
        xlist_snoc(xs, x1) => loop(xs, res +1) |
        xlist_append(xs, ys) => res + loop(xs, 0) + loop(ys,0) |
        xlist_reverse(xs) => loop(xs, res)
    )
in
    loop(xs,0)
end

(* use "assign01-01.sml"; *)

(* val xs = xlist_nil;
val xs = xlist_cons(1, xs);
val xs = xlist_snoc(xs, 2);
val xs = xlist_reverse(xs);
val xs = xlist_append(xs, xs);
val xs = xlist_cons(1, xs);
val xs = xlist_snoc(xs, 2);
val xs = xlist_append(xs, xs);
val xs = xlist_cons(1, xs);
val xs = xlist_snoc(xs, 2);

val list_size = List.length;
list_size(list_of_xlist(xs));
xlist_size(xs);  *)

