use "./../assign01-lib.sml";
use "./../assign01.sml";


(* function from the assign 1*)
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

fun xlist_sub(xs: 'a xlist, i0: int): 'a =
let 
    fun 
    loop (xs: 'a xlist, i0: int) = (
        case xs of 
        xlist_nil => raise XlistSubscript |
        xlist_cons(x1, xs) => (
            if i0 = 0
            then x1
            else loop(xs, i0 - 1)
        )|
        xlist_snoc(xs,x1) => (
            if (i0 - xlist_size(xs) = 0)
            then x1
            else loop(xs, i0)
        )|
        xlist_append(xs, ys) => (
            if xlist_size(xs) > i0
            then loop(xs, i0)
            else loop(ys, i0 - xlist_size(xs))
        )|
        xlist_reverse(xs) => (
            if xlist_size(xs) > i0  
            then  loop(xs, xlist_size(xs) - 1 - i0)
            else raise XlistSubscript)
    )
in
    loop(xs, i0)
end