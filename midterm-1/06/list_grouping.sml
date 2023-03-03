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
in
    list_foldleft(sorted, [], fn(r0, x0) =>
        if x0 <> !pre
        then (
            let
                val tmp_val = !pre
                val tmp_count = !count
            in
                ( count := 1; pre := x0;
                  r0@[(tmp_count, tmp_val)])
            end
        )
        else (count := !count + 1; r0)
    )
end



(* fun list_grouping(xs: int list): (int * int) list = 
    let
        fun
        loop(xs: (int * int)list, key: int, res: (int * int) list): (int * int) list =
        case xs of
        nil => res@[(1, key)]
        | x1::xs =>
            if #2 x1 = key
            then res@[(#1 x1 + 1, key)]@xs
            else loop(xs, key, res@[x1])
    in
        list_foldleft(xs, [], fn(r0,x0) =>
            loop(r0, x0, []))
    end *)
         
(* fun list_grouping(xs: int list): (int * int) list = 
    let
        fun
        checkExistence(xs: (int * int)list, key: int ): bool =
        case xs of
        nil => false
        | x1::xs =>
            if #2 x1 = key
            then true
            else checkExistence(xs, key)
        
        fun
        addToList(xs: int list, key: int, count: int): (int * int) =
        case xs of
        nil => (count, key)
        | x1::xs =>
            if x1 = key
            then addToList(xs, key, count+1)
            else addToList(xs, key, count)
    in
        list_foldleft(xs, [], fn(r0,x0) =>
            if checkExistence(r0, x0)
            then r0
            else r0@[addToList(xs,x0, 0)]
        )
    end *)

(* ****** ****** *)

(*
Some testing code:
*)
val N = 100000
val nxs = list_grouping(int1_map_list(N, fn i => N-i))

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