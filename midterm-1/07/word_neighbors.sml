(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-03-01: midterm1-07: 20 points
*)
(* ****** ****** *)
(*
Note that you are not allowed to define
recursive functions for solving this one.
*)
(* ****** ****** *)
(*
Here are some functions that you
can use in your solution to this one.
*)
val
strsub = String.sub
val
string_length = String.size
val
string_implode = String.implode
val
string_filter =
foreach_to_filter_list(string_foreach)
val
string_tabulate =
fn(len, fopr) =>
string_implode(list_tabulate(len, fopr))

(* ****** ****** *)

(*
A word here is defined to be a (possibly empty)
sequence of lowcase letters in the English alphabet.
Two words w1 and w2 are neighbors if they are of the
same length and differ by exactly one letter.
//
For instance, [water] and [later] are neighbors.
For instance, [abcde] and [abxde] are neighbors.
For instance, [abcde] and [abcde] are not neighbors.
//
Given a word, the function [word_neighbors] returns
a list consisting of *all* the neighbors of the word.
//
fun word_neighbors(word: string): string list = ...
//
Please give an implementation of word_neighbors.
Note that you are NOT allowed to define recursive functions
in your implementation
//
*)

(* ****** ****** *)

val AB =
"abcdefghijklmnopqrstuvwxyz"

(* ****** ****** *)

val
string_iforeach =
foreach_to_iforeach(string_foreach)
val
string_imap_list =
fn(cs, ifopr) =>
foreach_to_map_list(string_iforeach)(cs, ifopr)



val word_neighbors = fn(word: string) =>
let
    val len = string_length(word)
    val ans = ref []
in
    (string_iforeach(word, 
        fn(i, x0) =>
            ans := (!ans)
            @string_foldleft(AB, [], 
            fn(r1, x1) =>
                if x0 <> x1
                then r1@[

                    string_implode(
                        int1_foldleft(i, [], fn(res, elem) => 
                            res@[strsub(word, elem)]) 

                        @ [x1]

                        @ int1_foldleft(len-i-1, [], fn(res, elem) => 
                            res@[strsub(word, elem + i +1)]
                    ))
                ]
                else r1
            )
        );
    !ans)
end

val a = word_neighbors("aaa")


(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm1-word_neighbors.sml] *)

(* use "word_neighbors.sml"; *)
(* use "midterm1-07-test.sml"; *)