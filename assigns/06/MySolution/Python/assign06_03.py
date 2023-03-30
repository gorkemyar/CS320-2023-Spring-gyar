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

import queue



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
    
    def find_children(parent):
        res = []
        position = -1
        for i in range(len(parent)):
            if parent[i] == 0:
                position = i
                break
        if position == -1:
            return res
        
        for x in range(1,len(parent)+1):
            flag = True
            for i in range(position):
                if abs(position - i) == abs(parent[i] - x) or parent[i] == x:
                    flag = False
                    break
            if flag:
                child = parent[:]
                child[position] = x
                res += [child]        
        return res
            
    def gtree_dfs(nxs, fchildren):
        def helper(nxs):
            if nxs.empty():
                return strcon_nil()
            else:
                nx1 = nxs.get()
                # print("gtree_bfs: helper: nx1 = ", nx1)
                for nx2 in reversed(fchildren(nx1)):
                    nxs.put(nx2)
                return strcon_cons(nx1, lambda: helper(nxs))
        # end-of-(if(not nxs)-then-else)
        return lambda: helper(nxs)

    def check_valid_board(board):
        #print(board)
        for i in range(len(board)):
            for j in range(0, i):
                if abs(i - j) == abs(board[i] - board[j]) or board[i] == board[j] or board[i] == 0:
                    return False  

        #print("True")    
        return True

    def find_first(snxs):
        stream_board = gtree_dfs(snxs, find_children)
        call_board = stream_board()
        check_valid = check_valid_board(call_board.cons1)
        while check_valid == False:
            stream_board = call_board.cons2
            
            call_board = stream_board()
            check_valid = check_valid_board(call_board.cons1)
        return strcon_cons(call_board.cons1, lambda: find_first(snxs))


    snxs = queue.LifoQueue()
    snxs.put([0]*N)
    
    return lambda: find_first(snxs)
    

    
# fxs = solve_N_queen_puzzle(5)
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
