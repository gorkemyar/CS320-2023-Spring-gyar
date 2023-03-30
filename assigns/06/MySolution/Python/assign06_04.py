####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../../../../mypylib')
from mypylib_cls import *
import queue
####################################################
"""
HX-2023-03-24: 30 points
Solving the doublet puzzle
"""
####################################################

import nltk
nltk.download('words')
from nltk.corpus import words
################################################
setofwords = set(words.words())
################################################
def word_is_legal(word):
    return word in setofwords

def doublet_stream_from(word):
    """
    Please revisit assign05_02.py.
    ######
    Given a word w1 and another word w2, w1 and w2 are a
    1-step doublet if w1 and w2 differ at exactly one position.
    For instance, 'water' and 'later' are a 1-step doublet.
    The doublet relation is the reflexive and transitive closure
    of the 1-step doublet relation. In other words, w1 and w2 are
    a doublet if w1 and w2 are the first and last of a sequence of
    words where every two consecutive words form a 1-step doublet.
    Here is a little website where you can use to check if two words
    for a doublet or not:
    http://ats-lang.github.io/EXAMPLE/BUCS320/Doublets/Doublets.html
    ######
    Given a word, the function [doublet_stream_from] returns a stream
    enumerating *all* the tuples such that the first element of the tuple
    is the given word and every two consecutive words in the tuple form a
    1-step doublet. The enumeration of tuples should be done so that shorter
    tuples are always enumerated ahead of longer ones.
    ######
    """
    def word_neighbors(tuple_word):
        list_word = list(tuple_word)
        word = list_word[-1]
        AB = "abcdefghijklmnopqrstuvwxyz"

        def string_ifoldleft(xs, r0, ifopr_func):
            return foreach_to_ifoldleft(string_foreach)(xs, r0, ifopr_func)
        def pylist_filter(xs, test_func):
            return foreach_to_filter_pylist(pylist_foreach)(xs, test_func)

        neighbours=  pylist_filter(
                    pylist_concat(string_imap_pylist(word, 
                                lambda i, c1: \
                                        string_imap_fnlist(AB, lambda _, c2: \
                                            string_ifoldleft(word, "", lambda r0, j, c3: \
                                                r0 + c3 if i != j else r0 + c2 )  \
                                    if c1 != c2 \
                                    else None)
                                )
                            ),
                    lambda x0: x0 != None and word_is_legal(x0)
                    )
        
        return pylist_foldleft(neighbours, [], lambda r0, x0: r0 + [tuple(list_word[:] + [x0])])
    
    def gtree_bfs(nxs, fchildren):
        def helper(nxs):
            if nxs.empty():
                return strcon_nil()
            else:
                nx1 = nxs.get()
                # print("gtree_bfs: helper: nx1 = ", nx1)
                for nx2 in fchildren(nx1):
                    nxs.put(nx2)
                return strcon_cons(nx1, lambda: helper(nxs))
        # end-of-(if(not nxs)-then-else)
        return lambda: helper(nxs)

    qnxs = queue.Queue()
    qnxs.put((word,))


    return gtree_bfs(qnxs, word_neighbors)
####################################################


# fxs = doublet_stream_from("water")

# for i in range(100):
#     cxs = fxs()
#     fxs = cxs.cons2
#     print(cxs.cons1)
