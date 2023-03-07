#  4 9 2
#  3 5 7
#  8 1 6
#

import constraint

def o(x,y,z):
    if x+y+z == 15:
        return True

problem = constraint.Problem()
# Promenljive:
# a b c
# d e f
# g h i
problem.addVariables("abcdefghi", range(1,10))
problem.addConstraint(constraint.AllDifferentConstraint())
# Dodajemo ogranicenja za svaku vrstu
problem.addConstraint(o,"abc")
problem.addConstraint(o,"def")
problem.addConstraint(o,"ghi")
# Dodajemo ogranicenja za svaku kolonu
problem.addConstraint(o,"adg")
problem.addConstraint(o,"beh")
problem.addConstraint(o,"cfi")
#Dodajemo ogranicenja za dijagonale
problem.addConstraint(o,"aei")
problem.addConstraint(o,"ceg")

resenja = problem.getSolutions()
for r in resenja:
    print(" ------- ")
    print("| {0:d} {1:d} {2:d} |".format(r['a'],r['b'],r['c']))
    print("| {0:d} {1:d} {2:d} |".format(r['d'],r['e'],r['f']))
    print("| {0:d} {1:d} {2:d} |".format(r['g'],r['h'],r['i']))
    print(" ------- ")


# U opstem slucaju, za kvadrat velicine `size`:
# x_0_0 x_0_1 ... x_0_(size-1)
# x_1_0 x_1_1 ...
# ...
# x_(size-1)_0 ...

size = 10
target_sum = 0    # calculate target sum for size
vars = [f'x_{i}_{j}' for i in range(size) for j in range(size)]
problem.addVariables(vars, range(size*size))

for row in range(size):
    row_vars = [f'x_{row}_{i}' for i in range(size)]
    problem.addConstraint(constraint.ExactSumConstraint(target_sum), row_vars)

# similar for columns and diagonals ...

