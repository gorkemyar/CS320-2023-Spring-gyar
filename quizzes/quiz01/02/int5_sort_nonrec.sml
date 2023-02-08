(* ****** ****** *)
(*
HX-2023-02-07: 50 points
*)
(* ****** ****** *)

type int2 = int * int
type int3 = int * int * int
type int4 = int * int * int * int
type int5 = int * int * int * int * int

(* ****** ****** *)

(*
The following function int5_sort
is based on ListMergeSort.sort, which is
defined recursively. Given a tuple of 5
integers, int5_sort returns an ordered tuple
of the same 5 integers. For instance,
int5_sort(1,2, 1, 2, 2) = (1,1, 2, 2, 2)
int5_sortval a = (3, 1, 2, 5, 2) = (1,2, 2, 3, 5)
int5_sortval a = (3, 1, 2, 5, 4) = (1,2, 3, 4, 5)
*)

(*
val
int5_sort =
fn(xs: int5): int5 =
let
val (x1, x2, x3, x4, x5) = xs
val ys =
ListMergeSort.sort(op>=)[x1,x2,x3,x4,x5]
val y1 = hd(ys) and ys = tl(ys)
val y2 = hd(ys) and ys = tl(ys)
val y3 = hd(ys) and ys = tl(ys)
val y4 = hd(ys) and ys = tl(ys)
val y5 = hd(ys) and ys = tl(ys)
in
  (y1, y2, y3, y4, y5)
end
*)

(* ****** ****** *)
(*
Please give a non-recursive implementation of int5_sort
as int5_sort_nr. That is, please implement int5_sort_nr
in a non-recursive manner such that int5_sort(xs) equals
int5_sort_nr(xs) for every 5-tuple xs of the type int5.
*)
(* ****** ****** *)




fun
int5_sort_nr(xs: int5): int5 =
(*
Please Give your implementation as follows:
*)
let
  val (x1, x2, x3, x4, x5) = xs

in
  if x1 < x2 then (* correct *)
    if x2 < x3 then
      if x3 < x4 then
        if x4 < x5 then
          (x1, x2, x3, x4, x5)
        else
          if x3 < x5 then
            (x1, x2, x3, x5, x4)
          else
            if x2 < x5 then
              (x1, x2, x5, x3, x4)
            else
              if x1 < x5 then
                (x1, x5, x2, x3, x4)
              else
                (x5, x1, x2, x3, x4)
      else (* correct *)
        if x3 < x5 then
          if x2 < x4 then
            (x1, x2, x4, x3, x5)
          else
            if x1 < x4 then
              (x1, x4, x2, x3, x5)
            else
              (x4, x1, x2, x3, x5)
        else (* correct *)
          if x4 < x5 then (* correct *)
            if x2 < x4 then
              (x1, x2, x4, x5, x3)
            else 
              if (x1 < x4) then
                if (x2 < x5) then
                  (x1, x4, x2, x5, x3)
                else 
                  (x1, x4, x5, x2, x3)   
              else
                if (x2 < x5) then
                  (x4, x1, x2, x5, x3)
                else
                  if (x1 < x5) then
                    (x4, x1, x5, x2, x3)
                  else
                    (x4, x5, x1, x2, x3)
          else (* correct *)
            if x2 < x5 then
              (x1, x2, x5, x4, x3)
            else
              if x1 < x5 then
                if (x2 < x4) then
                  (x1, x5, x2, x4, x3)
                else
                  (x1, x5, x4, x2, x3)
              else
                if (x2 < x4) then
                  (x5, x1, x2, x4, x3)
                else
                  if (x1 < x4) then
                    (x5, x1, x4, x2, x3)
                  else
                    (x5, x4, x1, x2, x3)
            
    else (* correct *)
      if x1 < x3 then (* correct *)
        if x2 < x4 then (* correct *)
          if x4 < x5 then
            (x1, x3, x2, x4, x5)
          else
            if x2 < x5 then
              (x1, x3, x2, x5, x4)
            else
              if x3 < x5 then
                (x1, x3, x5, x2, x4)
              else
                if x1 < x5 then
                  (x1, x5, x3, x2, x4)
                else
                  (x5, x1, x3, x2, x4)
        else (* correct *)
          if x2 < x5 then (* correct *)
            if x3 < x4 then
              (x1, x3, x4, x2, x5)
            else
              if x1 < x4 then
                (x1, x4, x3, x2, x5)
              else
                (x4, x1, x3, x2, x5)
          else (* correct *)
            if x4 < x5 then
              if (x3 < x4) then
                (x1, x3, x4, x5, x2)
              else
                if (x1 < x4) then
                  if (x3 < x5) then
                    (x1, x4, x3, x5, x2)
                  else
                    (x1, x4, x5, x3, x2)
                else 
                  if (x3 < x5) then
                    (x4, x1, x3, x5, x2)
                  else
                    if (x1 < x5) then
                      (x4, x1, x5, x3, x2)
                    else
                      (x4, x5, x1, x3, x2)
            else 
              if (x3 < x5) then
                (x1, x3, x5, x4, x2)
              else 
                if (x1 < x5) then
                  if (x3 < x4) then
                    (x1, x5, x3, x4, x2)
                  else
                    (x1, x5, x4, x3, x2)
                else
                  if (x3 < x4) then
                    (x5, x1, x3, x4, x2)
                  else
                    if (x1 < x4) then
                      (x5, x1, x4, x3, x2)
                    else
                      (x5, x4, x1, x3, x2)

           
      else (* correct *)
        if x2 < x4 then (* correct *)
          if x4 < x5 then
            (x3, x1, x2, x4, x5)
          else
            if x2 < x5 then
              (x3, x1, x2, x5, x4)
            else
              if x1 < x5 then
                (x3, x1, x5, x2, x4)
              else
                if x3 < x5 then
                  (x3, x5, x1, x2, x4)
                else
                  (x5, x3, x1, x2, x4)
        else  (* correct *)
          if x2 < x5 then (* correct *)
            if x1 < x4 then
              (x3, x1, x4, x2, x5)
            else
              if x3 < x4 then
                (x3, x4, x1, x2, x5)
              else
                (x4, x3, x1, x2, x5)
          else (* correct *)
            if x4 < x5 then
              if (x1 < x4) then
                (x3, x1, x4, x5, x2)
              else
                if (x3 < x4) then
                  if (x1 < x5) then
                    (x3, x4, x1, x5, x2)
                  else
                    (x3, x4, x5, x1, x2)
                else
                  if (x1 < x5) then
                    (x4, x3, x1, x5, x2)
                  else
                    if (x3 < x5) then
                      (x4, x3, x5, x1, x2)
                    else
                      (x4, x5, x3, x1, x2)
            else (* correct *)
              if (x1 < x5) then
                (x3, x1, x5, x4, x2)
              else 
                if (x3 < x5) then
                  if (x1 < x4) then
                    (x3, x5, x1, x4, x2)
                  else
                    (x3, x5, x4, x1, x2)
                else
                  if (x1 < x4) then
                    (x5, x3, x1, x4, x2)
                  else
                    if (x3 < x4) then
                      (x5, x3, x4, x1, x2)
                    else
                      (x5, x4, x3, x1, x2)
  else (* now *)
    if x1 < x3 then (* correct *)
      if x3 < x4 then (* correct *)
        if x4 < x5 then
          (x2, x1, x3, x4, x5)
        else
          if x3 < x5 then
            (x2, x1, x3, x5, x4)
          else
            if x1 < x5 then
              (x2, x1, x5, x3, x4)
            else
              if x2 < x5 then
                (x2, x5, x1, x3, x4)
              else
                (x5, x2, x1, x3, x4)
      else (* correct *)
        if x3 < x5 then
          if x1 < x4 then
            (x2, x1, x4, x3, x5)
          else
            if x2 < x4 then
              (x2, x4, x1, x3, x5)
            else
              (x4, x2, x1, x3, x5)
        else (* correct *)
          if x4 < x5 then (* correct *)
            if x1 < x4 then
              (x2, x1, x4, x5, x3)
            else
              if x2 < x4 then
                if (x1 < x5) then
                  (x2, x4, x1, x5, x3)
                else
                  (x2, x4, x5, x1, x3)
              else
                if (x1 < x5) then
                  (x4, x2, x1, x5, x3)
                else
                  if (x2 < x5) then
                    (x4, x2, x5, x1, x3)
                  else
                    (x4, x5, x2, x1, x3)
          else  (* correct *)
            if (x1 < x5) then
              (x2, x1, x5, x4, x3)
            else
              if (x2 < x5) then
                if (x1 < x4) then
                  (x2, x5, x1, x4, x3)
                else
                  (x2, x5, x4, x1, x3)
              else
                if (x1 < x4) then
                  (x5, x2, x1, x4, x3)
                else
                  if (x2 < x4) then
                    (x5, x2, x4, x1, x3)
                  else
                    (x5, x4, x2, x1, x3)
            
    else
      if x2 < x3 then (* correct *)
        if x1 < x4 then (* correct *)
          if x4 < x5 then (* correct *)
            (x2, x3, x1, x4, x5)
          else
            if x1 < x5 then
              (x2, x3, x1, x5, x4)
            else
              if x3 < x5 then
                (x2, x3, x5, x1, x4)
              else
                if x2 < x5 then
                  (x2, x5, x3, x1, x4)
                else
                  (x5, x2, x3, x1, x4)
        else (* correct *)
          if x1 < x5 then (* correct *)
            if x3 < x4 then
              (x2, x3, x4, x1, x5)
            else
              if x2 < x4 then
                (x2, x4, x3, x1, x5)
              else
                (x4, x2, x3, x1, x5)
          else
            if x4 < x5 then
              if x3 < x4 then
                (x2, x3, x4, x5, x1)
              else
                if x2 < x4 then
                  if x3 < x5 then
                    (x2, x4, x3, x5, x1)
                  else
                    (x2, x4, x5, x3, x1)
                else
                  if x3 < x5 then
                    (x4, x2, x3, x5, x1)
                  else
                    if x2 < x5 then
                      (x4, x2, x5, x3, x1)
                    else
                      (x4, x5, x2, x3, x1)
            else
              if x3 < x5 then
                (x2, x3, x5, x4, x1)
              else
                if x2 < x5 then
                  if x3 < x4 then
                    (x2, x5, x3, x4, x1)
                  else
                    (x2, x5, x4, x3, x1)
                else
                  if x3 < x4 then
                    (x5, x2, x3, x4, x1)
                  else
                    if x2 < x4 then
                      (x5, x2, x4, x3, x1)
                    else
                      (x5, x4, x2, x3, x1)
            
      else
        if x1 < x4 then
          if x4 < x5 then
            (x3, x2, x1, x4, x5)
          else
            if x1 < x5 then
              (x3, x2, x1, x5, x4)
            else
              if x2 < x5 then
                (x3, x2, x5, x1, x4)
              else
                if x3 < x5 then
                  (x3, x5, x2, x1, x4)
                else
                  (x5, x3, x2, x1, x4)
        else
          if x1 < x5 then
            if x2 < x4 then
              (x3, x2, x4, x1, x5)
            else
              if x3 < x4 then
                (x3, x4, x2, x1, x5)
              else
                (x4, x3, x2, x1, x5)
          else
            if x4 < x5 then
              if x2 < x4 then
                (x3, x2, x4, x5, x1)
              else
                if x3 < x4 then
                  if x2 < x5 then
                    (x3, x4, x2, x5, x1)
                  else
                    (x3, x4, x5, x2, x1)
                else
                  if x2 < x5 then
                    (x4, x3, x2, x5, x1)
                  else
                    if x3 < x5 then
                      (x4, x3, x5, x2, x1)
                    else
                      (x4, x5, x3, x2, x1)
            else
              if x2 < x5 then
                (x3, x2, x5, x4, x1)
              else
                if x3 < x5 then
                  if x2 < x4 then
                    (x3, x5, x2, x4, x1)
                  else
                    (x3, x5, x4, x2, x1)
                else
                  if x2 < x4 then
                    (x5, x3, x2, x4, x1)
                  else
                    if x3 < x4 then
                      (x5, x3, x4, x2, x1)
                    else
                      (x5, x4, x3, x2, x1)  
        

end


(* ****** ****** *)

(* end of [CS320-2023-Spring-quiz01-int5_sort_nonrec.sml] *)

(* use "int5_sort_nonrec_test.sml" *)
(* use "int5_sort_nonrec.sml"; *)
