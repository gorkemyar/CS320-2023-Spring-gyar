####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../../../../mypylib')
from mypylib_cls import *
####################################################
#
# HX-2023-03-14: 20 points
# Please *translate* into Python the posted solution
# on Piazza for word_neighbors (which is writtend in SML)
#



def word_neighbors(word):
    """
    Note that this function should returns a fnlist
    (not a pylist)
    Your implementation should be combinator-based very
    much like the posted solution.
    """
    AB = "abcdefghijklmnopqrstuvwxyz"

    def string_ifoldleft(xs, r0, ifopr_func):
        return foreach_to_ifoldleft(string_foreach)(xs, r0, ifopr_func)
    def fnlist_filter(xs, test_func):
        return foreach_to_filter_fnlist(fnlist_foreach)(xs, test_func)

    return fnlist_filter(
                fnlist_concat(string_imap_fnlist(word, 
                            lambda i, c1: \
                                    string_imap_fnlist(AB, lambda _, c2: \
                                        string_ifoldleft(word, "", lambda r0, j, c3: \
                                            r0 + c3 if i != j else r0 + c2 )  \
                                if c1 != c2 \
                                else None)
                            )
                        ),
                lambda x0: x0 != None
                )


#
####################################################
