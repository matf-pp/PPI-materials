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
