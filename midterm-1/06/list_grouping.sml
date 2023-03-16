(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-03-02: midterm-06: 20 points
//
Given a list of integers xs, list_grouping(xs)
returns a list of pairs (n, x) where n indicates
the number of times x occurs in xs; for each x in
xs, there must be a pair (n, x) for some n in the
returned list.
//
For instance,
list_grouping([1,2]) = [[1,1], [1,2]]
list_grouping([1,2,2,2,1]) = [[2,1], [3,2]]
list_grouping([1,2,1,2,3]) = [[2,1], [2,2], [1,3]]
//
In order to receive full credit, your implementation
should be able to handle a list containing 1M elements
in less than 10 seconds (mine can do it in less than
two seconds)
//
*)
(* ****** ****** *)


fun list_mergesort(xs: int list): int list =
let
  fun split(xs: int list): int list * int list =(
    case xs of
      nil => ([], [])
    | x1 :: xs =>(
      case xs of
        nil => ([x1], [])|
        x2 :: xs =>
          let
            val
            (ys, zs) = split(xs)
          in
            (x1 :: ys, x2 :: zs)
          end
    )
  )
  fun merge( ys: int list, zs: int list): int list =(
    case ys of
      nil => zs
    | y1 :: ys =>
    (
      case zs of
        nil => y1 :: ys| 
        z1 :: zs =>
        if y1 <= z1
        then y1 :: merge(ys, z1 :: zs)
        else z1 :: merge(y1 :: ys, zs)
    )
  )
in
  case xs of
    nil => []
  | x1 :: xs =>
  (
    case xs of
      nil => [x1]
    | x2 :: xs =>
      let
        val (ys, zs) = split(xs)
      in
        merge(list_mergesort(x1 :: ys), list_mergesort(x2 :: zs))
      end
  )

end (* end-of-[list_mergesort]: let *)


fun
list_grouping(xs: int list): (int * int) list = 
let
    val sorted = list_mergesort(xs)
    val pre = ref (hd(sorted))
    val count = ref 0
    val a = list_foldleft(sorted, [], fn(r0, x0) =>
        if x0 <> !pre
        then (
            let
                val tmp_val = !pre
                val tmp_count = !count
            in
                ( count := 1; pre := x0;
                  (tmp_count, tmp_val)::r0)
            end
        )
        else (count := !count + 1; r0)
    )
in
    a@[(!count, !pre)]
end


(* ****** ****** *)

(*
Some testing code:

val N = 1000000
val nxs = list_grouping(int1_map_list(N, fn i => N-i))
*)
(* ****** ****** *)

(*
Some testing code:
Your implementation needs to be efficient to pass the
following test:

val N = 1000000
val nxs = list_grouping(int1_map_list(N, fn i => N-i))
*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm1-list_grouping.sml] *)

(* use "list_grouping.sml"; *)
(* use "midterm1-06-test.sml"; *)