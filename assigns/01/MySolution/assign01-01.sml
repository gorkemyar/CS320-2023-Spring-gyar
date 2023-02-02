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

