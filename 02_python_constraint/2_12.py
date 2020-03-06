# Jedan od mogucih rasporeda
# sva ostala resenja su permutacije
# takve da je u svakoj vrsti i koloni samo jedan top
#
# 8 T - - - - - - -
# 7 - T - - - - - -
# 6 - - T - - - - -
# 5 - - - T - - - -
# 4 - - - - T - - -
# 3 - - - - - T - -
# 2 - - - - - - T -
# 1 - - - - - - - T
#   1 2 3 4 5 6 7 8
#

import constraint

problem = constraint.Problem()
# Dodajemo promenljive za svaku kolonu i njihove vrednosti 1-8
problem.addVariables("12345678", range(1,9))
# Dodajemo ogranicenje da se topovi ne napadaju medjusobno po svakoj vrsti
problem.addConstraint(constraint.AllDifferentConstraint())
resenja = problem.getSolutions()

# Broj svih mogucih permutacija je 8! = 40320
# Za prikaz svih najbolje pozvati program sa preusmerenjem izlaznih podataka
# python 2_12.py > izlaz.txt
print("Broj resenja je: {0:d}.".format(len(resenja)))

for r in resenja:
    print("---------------")
    for i in "12345678":
        for j in range(1,9):
            if r[i] == j:
                print("T", end='')
            else:
                print("-", end='')
        print("")
    print("---------------")
