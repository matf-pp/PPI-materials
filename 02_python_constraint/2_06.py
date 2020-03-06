#   TWO
#  +TWO
#  ------
#  FOUR
#

import constraint

problem = constraint.Problem()
# Definisemo promenljive i njihove vrednosti
problem.addVariables("TF",range(1,10))
problem.addVariables("WOUR",range(10))

# Definisemo ogranicenje za cifre
def o(t, w, o, f, u, r):
    if 2*(t*100 + w*10 + o) == f*1000 + o*100 + u*10 + r:
        return True

# Dodajemo ogranicenja za cifre
problem.addConstraint(o,"TWOFUR")
# Dodajemo ogranicenje da su sve cifre razlicite
problem.addConstraint(constraint.AllDifferentConstraint())

resenja = problem.getSolutions()

for r in resenja:
    print("-----")
    print("  "+str(r['T'])+str(r['W'])+str(r['O']))
    print(" +"+str(r['T'])+str(r['W'])+str(r['O']))
    print("="+str(r['F'])+str(r['O'])+str(r['U'])+str(r['R']))
