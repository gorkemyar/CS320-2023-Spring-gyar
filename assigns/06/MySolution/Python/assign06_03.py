####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../../../../mypylib')
#sys.setrecursionlimit(10000000)
from mypylib_cls import *
####################################################
"""
HX-2023-03-24: 20 points
Solving the N-queen puzzle
"""
####################################################


def int1_stream(x):
    def helper(i):
        if i >=x:
            return strcon_nil
        else:
            return strcon_cons(i, lambda: helper(i+1))
    
    return helper(0)

def solve_N_queen_puzzle(N):
    """
    Please revisit assign04-04.sml.
    A board of size N is a tuple of length N.
    ######
    For instance, a tuple (0, 0, 0, 0) stands
    for a board of size 4 (that is, a 4x4 board)
    where there are no queen pieces on the board.
    ######
    For instance, a tuple (2, 1, 0, 0) stands
    for a board of size 4 (that is, a 4x4 board)
    where there are two queen pieces; the queen piece
    on the 1st row is on the 2nd column; the queen piece
    on the 2nd row is on the 1st column; the last two rows
    contain no queen pieces.
    ######
    This function [solve_N_queen_puzzle] should return
    a stream of ALL the boards of size N that contain N
    queen pieces (one on each row and on each column) such
    that no queen piece on the board can catch any other ones
    on the same board.
    """
    
    def dfs_stream(fxs, fopr):
        if fxs == strcon_nil:
            return strcon_nil
        else:
            cxs = fxs()
            fxs = cxs.cons2
            parent = cxs.cons1
            
            while parent[-1] == 0:
                fxs = fopr(parent, fxs)
                cxs = fxs()
                
                if type(cxs).__name__ == "strcon_nil":
                    return strcon_nil()
                
                fxs = cxs.cons2
                parent = cxs.cons1
                  
            return strcon_cons(parent, lambda: dfs_stream(fxs, fopr))
        
    def find_children(parent, fxs):
        position = parent.index(0)

        flag = True
        added = False
        
        for x in range(1,N+1):
            flag = True
            for i in range(position):
                if abs(position - i) == abs(parent[i] - x) or parent[i] == x:
                    flag = False
                    break
            if flag:
                parent[position] = x
                fxs = call_strcon_con(parent[:], fxs)
                added = True

        if added:
            return lambda: fxs     
        return fxs
    
    def call_strcon_con(f, s):
        if type(s).__name__ == "strcon_cons":
            return strcon_cons(f, lambda: s)
        return strcon_cons(f, s)
    
    return lambda: dfs_stream(lambda: strcon_cons([0]*N, strcon_nil), find_children)
    

    
# fxs = solve_N_queen_puzzle(4)
# print(fxs)

# cxs = fxs()
# fxs = cxs.cons2
# print(cxs.cons1)
# cxs = fxs()
# fxs = cxs.cons2
# print(cxs.cons1)

# print(fxs())
        
####################################################
"""

def helper(N, start, prev):
            
    while True:
        position = len(prev)
        #print(start, prev)
        flag = True
        for x in range(start,N+1):
            flag = True
            for i in range(position):
                if abs(position - i) == abs(prev[i] - x) or prev[i] == x:
                    flag = False
                    break
            if flag and len(prev) != N-1:
                prev = prev + [x]
                start = 1
                break

            elif flag and len(prev) == N - 1:
                #print("hello", tuple(prev + [x]))
                return strcon_cons(tuple(prev + [x]), lambda: helper(N, x+1 , prev))  
        
        if flag == False and len(prev) > 0  :
            
            start = prev.pop() + 1
            while start >= N and len(prev) > 0:
                start = prev.pop() + 1
            if start >= N:
                return strcon_nil
            
        elif flag == False:
            
            return strcon_nil
            
#return lambda: helper(N, 1 ,[])

"""
