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
    if (type(xs).__name__ ==  'mylist_cons' or type(xs).__name__ == 'mylist_nil') \
    and (type(ys).__name__ ==  'mylist_cons' or type(ys).__name__ == 'mylist_nil'):
        if (xs.ctag > 0):
            return mylist_cons(xs.cons1, mylist_append(xs.cons2, ys))
        else:
            return ys
    else:
        raise Exception("Type Error")

def mylist_rappend(xs, ys):
    if (type(xs).__name__ ==  'mylist_cons' or type(xs).__name__ == 'mylist_nil') \
    and (type(ys).__name__ ==  'mylist_cons' or type(ys).__name__ == 'mylist_nil'):
        if (xs.ctag > 0):
            return mylist_rappend(xs.cons2, mylist_cons(xs.cons1,ys))
        else:
            return ys
    else:
        raise Exception("Type Error")
def mylist_reverse(xs):
    if (type(xs).__name__ ==  'mylist_cons' or type(xs).__name__ == 'mylist_nil'):
        if (xs.ctag > 0):
            return mylist_rappend(xs, mylist_nil())
        else:
            return mylist_nil()
    else:
        raise Exception("Type Error")