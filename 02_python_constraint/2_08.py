#       1   3
#        2 4
#         5
#        6 8
#       7   9
#

import constraint

# Definisemo ogranicenje za jednu dijagonalu
def o(a,b,c,d,e):
    if a<b<c<d<e and a+b+c+d+e==25:
        return True

problem = constraint.Problem()
# Definisemo promenljive za svaku poziciju
problem.addVariables('abcdeABDE',range(1,10))
# Dodajemo ogranicenja za obe dijagonale
problem.addConstraint(o,'abcde')
problem.addConstraint(o,'ABcDE')
# Dodajemo ogranicenje da su vrednosti svih promenljivih razlicite
problem.addConstraint(constraint.AllDifferentConstraint())

resenja = problem.getSolutions()
for r in resenja:
    print("-------------")
    print("{0:d}   {1:d}".format(r['a'],r['A']))
    print(" {0:d} {1:d} ".format(r['b'],r['B']))
    print("  {0:d}  ".format(r['c']))
    print(" {0:d} {1:d} ".format(r['D'],r['d']))
    print("{0:d}   {1:d}".format(r['E'],r['e']))
    print("-------------")
