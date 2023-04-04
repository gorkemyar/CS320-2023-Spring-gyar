####################################################
#!/usr/bin/env python3
####################################################
import sys
####################################################
sys.path.append('../../../07')
sys.path.append('./../../../../mypylib')
####################################################
from dictwords import *
from mypylib_cls import *
from mypylib_ind import *
from assign05_02 import *
####################################################
"""
HX-2023-03-24: 10 points
Solving the doublet puzzle
"""
####################################################
"""
Please revisit assign06_04.py.
######
Given a word w1 and another word w2, w1 and w2 are a
1-step doublet if w1 and w2 differ at exactly one position.
For instance, 'water' and 'later' are a 1-step doublet.
The doublet relation is the reflexive and transitive closure
of the 1-step doublet relation. In other words, w1 and w2 are
a doublet if w1 and w2 are the first and last of a sequence of
words where every two consecutive words form a 1-step doublet.
<Here is a little website where you can use to check if two words
for a doublet or not:
http://ats-lang.github.io/EXAMPLE/BUCS320/Doublets/Doublets.html
######
"""
####################################################
def doublet_bfs_test(w1, w2):
    """
    Given two words w1 and w2, this function should
    return None if w1 and w2 do not for a doublet. Otherwise
    it returns a path connecting w1 and w2 that attests to the
    two words forming a doublet.
    """
    
    def word_neighbors_pylistize(word):
        AB = "abcdefghijklmnopqrstuvwxyz"

        def string_ifoldleft(xs, r0, ifopr_func):
            return foreach_to_ifoldleft(string_foreach)(xs, r0, ifopr_func)
        def pylist_filter(xs, test_func):
            return foreach_to_filter_pylist(pylist_foreach)(xs, test_func)

        return pylist_filter(
                    pylist_concat(string_imap_pylist(word, 
                                lambda i, c1: \
                                        string_imap_pylist(AB, lambda _, c2: \
                                            string_ifoldleft(word, "", lambda r0, j, c3: \
                                                r0 + c3 if i != j else r0 + c2 )  \
                                    if c1 != c2 \
                                    else None)
                                )
                            ),
                    lambda x0: x0 != None and word_is_legal(x0)
                    )
    def stream_find(fxs, fopr_func):
        return foreach_to_find(stream_foreach)(fxs, fopr_func)
    
    fxs = gpath_bfs((w1,), word_neighbors_pylistize)
    return stream_find(fxs, lambda path: path[-1] == w2)
    

# r1 = foreach_to_find(pylist_foreach)([1,2,3,4,5,6], lambda x0: x0 > 2.5)
# print(r1)
# res = doublet_bfs_test("cat", "bat")
# print(res)
####################################################
