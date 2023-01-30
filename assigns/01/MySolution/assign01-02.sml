use "./../assign01-lib.sml";
use "./../assign01.sml";
use "./assign01-01.sml";
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

(* use "assign01-02.sml"; *)

val xs = xlist_nil;
val xs = xlist_cons(1, xs);
val xs = xlist_snoc(xs, 2);
val xs = xlist_reverse(xs);
val xs = xlist_append(xs, xs);
val xs = xlist_cons(3, xs);
val xs = xlist_cons(71, xs);
val xs = xlist_cons(82, xs);
val xs = xlist_reverse(xs);
val xs = xlist_cons(93, xs);
val xs = xlist_snoc(xs, 4);
val xs = xlist_append(xs, xs);
val xs = xlist_cons(5, xs);
val xs = xlist_cons(7, xs);
val xs = xlist_append(xs, xs);
val xs = xlist_cons(8, xs);
val xs = xlist_reverse(xs);
val xs = xlist_cons(9, xs);
val xs = xlist_snoc(xs, 6);
(* 
val list_size = List.length;
list_size(list_of_xlist(xs));

*)
val b = List.nth(list_of_xlist(xs), 0);
val a = xlist_sub(xs, 0); 

fun test(count: int) =
    if (count >= 0 andalso List.nth(list_of_xlist(xs), count) = xlist_sub(xs, count))
    then test(count-1)
    else count;

val count = test(xlist_size(xs)-1);
