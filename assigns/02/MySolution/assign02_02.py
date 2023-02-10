####################################################
import sys
sys.path.append('../MySolution')
from assign02_01 import *
####################################################
print("[import ./../assign02.py] is done!")
####################################################
#
# Please implement (10 points)
# mylist_quicksort (see list_quicksort in assign02.sml)
#
####################################################


### null and type checks needed
### ask teacher about mylist_append

def mylist_quicksort(xs):
    def qsort(xs):
        if (xs.ctag > 0):
            ys, zs = qpart(xs.cons2, xs.cons1)
            return mylist_append(qsort(ys), mylist_cons(xs.cons1, qsort(zs)))
        else:
            return mylist_nil()

    def qpart(xs, x1):
        if (xs.ctag > 0):
            ys, zs = qpart(xs.cons2, x1)
            if (xs.cons1 < x1):
                return mylist_cons(xs.cons1, ys), zs
            else:
                return ys, mylist_cons(xs.cons1, zs)
        else:
            return mylist_nil(), mylist_nil()

    return qsort(xs)
