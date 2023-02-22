use "./../../../mysmlib/mysmlib-cls.sml";


val abs =
fn(x:int) => if x>= 0 then x else ~x

val quiz02_02 : (int list * int list) -> bool =
    fn(xs, ys) => 
    list_foldleft(xs, false, fn(r1, x0) =>
        r1 orelse list_foldleft(ys, false, fn(r2, y0) =>
        if abs(y0-x0) < 10
        then true
        else r2))


(* val x1 = [1, 2, 3, 4, 5]
val y1 =[15, 20, 30, 40, ~8]

val x2 = []
val y2 = [1,2,3]

val x3 = [1, 2, 3, 4, 5]
val y3 = [15, 20, 30, 40, 50]

val x4 = []
val y4 = []
 
val a1 = quiz02_02(x1, y1)
val a2 = quiz02_02(x2, y2)
val a3 = quiz02_02(x3, y3)
val a4 = quiz02_02(x4, y4) *)

(* use "quiz02-02.sml"; *)