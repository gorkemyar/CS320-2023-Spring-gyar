########################
# HX-2023-04-15: 10 points
########################
"""
Given two words w1 and w2 of the same length,
please implement a function wordle_hint(w1, w2)
that return a sequence of pairs (i, c) for each
character c in w2 where i indicates the color
of c according to the rule of the wordle game:
0: c does not appear in w1
1: c appears in w1 at the same position as it does in w2
2: c appears in w1 at a different position as it does in w2
Please note that the number of times (1, c) or (2, c) appearing
in the returned sequence must be less than or equal to the number
of times c appearing in w1.
For instance,
w1 = water and w2 = water
wordle_hint(w1, w2) =
(1, w), (1, a), (1, t), (1, e), (1, r)
For instance,
w1 = water and w2 = waste
wordle_hint(w1, w2) =
(1, w), (1, a), (0, s), (2, t), (2, e)
For instance,
w1 = abbcc and w2 = bbccd
wordle_hint(w1, w2) =
(2, b), (1, b), (2, c), (1, c), (0, d)
"""

import sys
####################################################
sys.path.append('./../../../../mypylib')
####################################################
from mypylib_cls import *

########################################################################
def wordle_hint(w1, w2):
    memo = {}
    res = []
    for i in w1:
        if i not in memo:
            memo[i] = 1
        else:
            memo[i] += 1

    for i in range(len(w2)):
        if w2[i] == w1[i]:
            res.append((1, w2[i]))
            memo[w2[i]] -= 1
            if memo[w2[i]] == 0:
                del memo[w2[i]]
        else:
            res.append([0, w2[i]])
    
    for i in range(len(w2)):
        if res[i][0] == 0 and w2[i] in memo:       
            res[i][0] = 2
            memo[w2[i]] -= 1
            if memo[w2[i]] == 0:
                del memo[w2[i]]

    for i in range(len(res)):
        res[i] = tuple(res[i])    
    return res

########################################################################

# w1 = "water"  
# w2 = "water"

# print(wordle_hint(w1, w2))

# w1 = "water"
# w2 = "waste"

# print(wordle_hint(w1, w2))

# w1 = "abbcc"
# w2 = "bbccd"

# print(wordle_hint(w1, w2))


# w1 = "apple"
# w2 = "paapp"

# print(wordle_hint(w1, w2))