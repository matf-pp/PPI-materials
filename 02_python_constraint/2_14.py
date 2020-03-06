# 9 - - - - - - - - -
# 8 - - - - - - - - -
# 7 - - - - - - - - -
# 6 - - - - - - - - -
# 5 - - - - - - - - -
# 4 - - - - - - - - -
# 3 - - - - - - - - -
# 2 - - - - - - - - -
# 1 - - - - - - - - -
#   1 2 3 4 5 6 7 8 9
#

import constraint
import json

problem = constraint.Problem()

# Dodajemo promenljive za svaki red i njihove vrednosti 1-9
for i in range(1, 10):
    problem.addVariables(range(i * 10 + 1, i * 10 + 10), range(1, 10))

# Dodajemo ogranicenja da se u svakoj vrsti nalaze razlicite vrednosti
for i in range(1, 10):
    problem.addConstraint(constraint.AllDifferentConstraint(), range(i * 10 + 1, i * 10 + 10))

# Dodajemo ogranicenja da se u svakoj koloni nalaze razlicite vrednosti
for i in range(1, 10):
    problem.addConstraint(constraint.AllDifferentConstraint(), range(10 + i, 100 + i, 10))

# Dodajemo ogranicenja da svaki podkvadrat od 3x3 promenljive ima razlicite vrednosti
for i in [1,4,7]:
    for j in [1,4,7]:
        pozicije = [10*i+j,10*i+j+1,10*i+j+2,10*(i+1)+j,10*(i+1)+j+1,10*(i+1)+j+2,10*(i+2)+j,10*(i+2)+j+1,10*(i+2)+j+2]
        problem.addConstraint(constraint.AllDifferentConstraint(),pozicije)


ime_datoteke = input("Unesite ime datoteke sa tablom za sudoku: ")
f = open(ime_datoteke, "r")
tabla = json.load(f)
f.close()

# Dodajemo ogranicenja za svaki broj koji je zadat na tabli
for i in range(9):
    for j in range(9):
        if tabla[i][j] != 0:
            def o(vrednost_promenljive, vrednost_na_tabli = tabla[i][j]):
                if vrednost_promenljive == vrednost_na_tabli:
                    return True

            problem.addConstraint(o, [((i+1)*10 + (j+1))])

resenja = problem.getSolutions()

for r in resenja:
    print("==================")
    for i in range(1,10):
        print("|", end='')
        for j in range(1,10):
            if j%3 == 0:
                print(str(r[i*10+j])+" | ", end='')
            else:
                print(str(r[i*10+j]), end='')
        print("")
        if i%3 == 0 and i!=9:
            print("------------------")
    print("==================")
