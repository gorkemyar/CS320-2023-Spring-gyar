use "./../../../mysmlib/mysmlib-cls.sml";

val strlen =
foreach_to_length(string_foreach)
val strsub =
foreach_to_get_at(string_foreach)

fun 
quiz02_01
(word: string): char -> int =
    fn (ch) =>
    int1_foldleft(strlen(word), 0,
        fn(r0, x0) =>
        if strsub(word, x0) = ch
        then r0 +1
        else r0)



(* val () = assert320(quiz02_01("$abb^cccdddd")(#"0") = 0)
val () = assert320(quiz02_01("$abb^cccdddd")(#"1") = 0)
val () = assert320(quiz02_01("$abb^cccdddd")(#"a") = 1)
val () = assert320(quiz02_01("$abb^cccdddd")(#"b") = 2)
val () = assert320(quiz02_01("$abb^cccdddd")(#"c") = 3)
val () = assert320(quiz02_01("$abb^cccdddd")(#"d") = 4)
val () = assert320(quiz02_01("$abb^cccdddd")(#"X") = 0)
val () = assert320(quiz02_01("$abb^cccdddd")(#"Y") = 0)
val () = assert320(quiz02_01("$abb^cccdddd")(#"Z") = 0)
val () = assert320(quiz02_01("$abb^cccdddd")(#"$") = 1)
val () = assert320(quiz02_01("$abb^cccdddd")(#"^") = 1) *)

(* use "quiz02-01.sml"; *)