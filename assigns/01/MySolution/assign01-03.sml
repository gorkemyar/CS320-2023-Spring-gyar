use "./../assign01-lib.sml";
use "./../assign01.sml";


fun xlist_remove_reverse(xs: 'a xlist): 'a xlist =
let 
    fun
    loop(xs: 'a xlist, reverse: bool): 'a xlist =(
        case xs of
        xlist_nil => xlist_nil |
        xlist_cons(x1, xs) => (
            if reverse = true
            then xlist_snoc(loop(xs, reverse), x1)
            else xlist_cons(x1, loop(xs, reverse))
        ) |
        xlist_snoc(xs, x1) => (
            if reverse = true
            then xlist_cons(x1, loop(xs, reverse))
            else xlist_snoc(loop(xs, reverse), x1)
        ) |
        xlist_append(xs, ys) =>(
            if reverse = true
            then xlist_append(loop(ys, reverse), loop(xs, reverse))
            else xlist_append(loop(xs, reverse), loop(ys, reverse))
        ) |
        xlist_reverse(xs) => loop(xs, not reverse)
    ) 
in
    loop(xs, false)
end

(* use "assign01-03.sml"; *)
