####################################################
#!/usr/bin/env python3
####################################################
"""
HX-2023-04-07: 20 points
You are required to implement the following function
generator_merge2 WITHOUT using streams. A solution that
uses streams is disqualified.
"""

import sys
####################################################
sys.path.append('./../../../../mypylib')
####################################################
from mypylib_cls import *

def generator_merge2(gen1, gen2, lte3):
    """
    Given two generators gen1 and gen2 and a comparison
    function lte3, the function generator_merge2 returns
    another generator that merges the elements produced by
    gen1 and gen2 according to the order specified by lte3.
    The function generator_merge2 is expected to work correctly
    for both finite and infinite generators.
    """
    try:
        last = next(gen1)
        fromWhich = 0
        while True:
            cur = None
            if fromWhich == 0:
                cur = next(gen2)
            else:
                cur = next(gen1)
            
            if lte3(last, cur):
                yield last
                last = cur
                fromWhich = 1-fromWhich
            else:
                yield cur
        return None
    except StopIteration:
        yield last
        for x in gen1:
            yield x
        for x in gen2:
            yield x
        return None

    
####################################################


# fx = generator_tabulate(-1, lambda i: 2*i + 1)
# cx = generator_tabulate(-1, lambda i: 2*i)

# mx = generator_merge2(fx, cx, lambda a, b: a <= b)

# for i in range(20):
#     a = next(mx)
#     print(a)

# xs1 = generator_tabulate(2, lambda i: i)
# xs2 = generator_tabulate(3, lambda i: i + 2)
# xs12 = generator_merge2(xs1, xs2, lambda x1, x2: x1 <= x2)

# for x in xs12:
#     print(x)