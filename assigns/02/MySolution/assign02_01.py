####################################################
import sys
sys.path.append('..')
from assign02 import *
####################################################
print("[import ./../assign02.py] is done!")
####################################################
#
# Please implement (20 points)
# mylist_append (see list_append in assign02.sml)
# mylist_rappend (see list_rappend in assign02.sml)
# mylist_reverse (see list_reverse in assign02.sml)
#
####################################################
def mylist_append(xs, ys):
    if (xs.ctag > 0):
        return mylist_cons(xs.cons1, mylist_append(xs.cons2, ys))
    else:
        return ys


def mylist_rappend(xs, ys):
    if (xs.ctag > 0):
        return mylist_rappend(xs.cons2, mylist_cons(xs.cons1,ys))
    else:
        return ys

def mylist_reverse(xs):
    if (xs.ctag > 0):
        return mylist_rappend(xs, mylist_nil())
    else:
        return mylist_nil()
