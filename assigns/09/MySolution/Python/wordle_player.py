########################
# HX-2023-04-15: 20 points
########################
"""
Given a history of wordle hints, this function returns a
word as the player's guess.
"""

import sys
####################################################
sys.path.append('./../../../../mypylib')
####################################################
from mypylib_cls import *
import itertools

########################################################################
def wordle_guess(hints):
    word = [" "] * len(hints[0])

    def first_fill(word, hints):
        for i in range(len(hints)):
            for j in range(len(hints[i])):
                if hints[i][j][0] == 1:
                    word[j] = hints[i][j][1]
 
    def find_empty_spaces(word):
        res = []
        for i in range(len(word)):
            if word[i] == " ":
                res.append(i)
        return res

    def option2_match(word, hint):
        occupied_index = dict()
        for i in range(len(hint)):
            if hint[i][0] == 2:
                if word[i] == hint[i][1]:
                    return None
                else:
                    if hint[i][1] in occupied_index:
                        occupied_index[hint[i][1]] +=  [i]
                    else:
                        occupied_index[hint[i][1]] = [i]

        for i in range(len(word)):
            if word[i] in occupied_index:
                if hint[i][0] != 1:
                    occupied_index[word[i]] = occupied_index[word[i]][1:]
                    if len(occupied_index[word[i]]) == 0:
                        del occupied_index[word[i]]

         
        return occupied_index

    def test(x, conditions, conditions_list):
        for i in range(len(x)):
            if i < len(conditions_list):
                if x[i] in conditions[conditions_list[i]]: # x[i] is the index of the empty space 
                                                           # conditions_list[i] is the letter
                                                           # conditions is the dictionary
                    return False
    
        return True


    def fill_word(word, hints):
        if hints == []:
            return word
        
        hint = hints[0] 
        word_c = word[:]

        #print("hint is", hint)
        #print("word is", word_c)

        conditions = option2_match(word_c, hint)
        if conditions == None:
            return None

        #print("bomb")
        empty_space = find_empty_spaces(word_c)

        #print("conditions is", conditions)
        #print("empty_space is", empty_space)
        total_conditions = 0
        conditions_list = []
        for k in conditions:
            total_conditions += len(conditions[k])
            conditions_list += [k]* len(conditions[k])
        
        if total_conditions > len(empty_space):
            return None
        
        if total_conditions == 0 or len(empty_space) == 0:
            return fill_word(word_c, hints[1:])
        
        for x in generator_make_filter(itertools.permutations(empty_space), lambda x: test(x, conditions, conditions_list)):
            for i in range(len(conditions_list)):
                word_c[x[i]] = conditions_list[i]

            res = fill_word(word_c, hints[1:])
            if res != None:
                return res
        
        return None
    
    first_fill(word, hints)
    print(word)
    word = fill_word(word, hints)

    if word != None:
        return "".join(word)
    else:
        return None
            

            


# myhint0 = \
#     [(0, 'l'), (2, 'i'), (0, 's'), (0, 't'), (2, 'e'), (2, 'n')]
# myhint1 = \
#     [(0, 's'), (2, 'i'), (0, 'l'), (1, 'e'), (1, 'n'), (0, 't')]
# myhint2 = \
#     [(0, 'b'), (1, 'r'), (2, 'e'), (0, 'a'), (0, 'c'), (0, 'h')]
# myhint3 = \
#     [(0, 'p'), (0, 'l'), (2, 'e'), (2, 'n'), (0, 't'), (0, 'y')]
# myhint4 = \
#     [(0, 'm'), (0, 'o'), (0, 'u'), (0, 't'), (0, 'h'), (0, 'y')]
# myhint5 = \
#     [(1, 'f'), (0, 'l'), (0, 'a'), (0, 's'), (0, 'h'), (0, 'y')]
# myhint6 = \
#     [(1, 'f'), (1, 'r'), (1, 'i'), (1, 'e'), (1, 'n'), (1, 'd')]
# myhints = \
#     [myhint0, myhint1, myhint2, myhint3, myhint4, myhint5, myhint6]


# myhint0 = [(2, 'l'), (2, 'i'), (2, 's'), (2, 't'), (2, 'e'), (2, 'n')]
# myhint1 = [(2, 's'), (2, 'i'), (2, 'l'), (2, 'e'), (2, 'n'), (2, 't')]
# myhint2 = [(1, 'i'), (1, 't'), (0, 'p'), (0, 'a'), (1, 'l'), (0, 'a')]

# myhints = [myhint0, myhint1, myhint2]

# print(wordle_guess(myhints))

