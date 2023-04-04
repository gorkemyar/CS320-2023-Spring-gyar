
def foreach_to_find(foreach):
    class FindExn(Exception):
        def __init__(self, val):
            self.val = val
    def find(xs, find_func):
        def work_func(x0):
            if find_func(x0):
                raise FindExn(x0)
            else:
                return None
        try:
            foreach(xs, work_func)
            return None
        except FindExn as Argument:
            return Argument
    return find