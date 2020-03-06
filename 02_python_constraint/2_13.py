# 8 D - - - - - - -
# 7 - - - - D - - -
# 6 - D - - - - - -
# 5 - - - - - D - -
# 4 - - D - - - - -
# 3 - - - - - - D -
# 2 - - - D - - - -
# 1 - - - - - - - D
#   1 2 3 4 5 6 7 8
#

import constraint
import math

problem = constraint.Problem()
# Dodajemo promenljive za svaku kolonu i njihove vrednosti 1-8
problem.addVariables("12345678", range(1,9))
# Dodajemo ogranicenje da se dame ne napadaju medjusobno po svakoj vrsti
problem.addConstraint(constraint.AllDifferentConstraint())

for k1 in range(1,9):
    for k2 in range(1,9):
        if k1 < k2:
            # Definisemo funkciju ogranicenja za dijagonale
            def o(vrsta1, vrsta2, kolona1=k1, kolona2=k2):
                if math.fabs(vrsta1 - vrsta2) != math.fabs(kolona1 - kolona2):
                    return True
            problem.addConstraint(o, [str(k1),str(k2)])

resenja = problem.getSolutions()
# Za prikaz svih najbolje pozvati program sa preusmerenjem izlaznih podataka 
# python 2_13.py > izlaz.txt
print("Broj resenja je: {0:d}.".format(len(resenja)))
for r in resenja:
    print("---------------")
    for i in "12345678":
        for j in range(1,9):
            if r[i] == j:
                print("D", end='')
            else:
                print("-", end='')
        print("")
    print("---------------")
