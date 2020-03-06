# Programiranje ogranicenja

# Ukljucujemo modul za rad sa ogranicenjima
import constraint

# Definisemo problem
problem = constraint.Problem()
# Dodajemo promenljive
#
# problem.addVariable(ime_promenljive, domen_lista)
# problem.addVariables(lista_imena_promenljivih, domen_lista)
problem.addVariable('x',['a','b','c'])
problem.addVariable('y',[1,2,3])
# Ispisujemo resenja
# print(problem.getSolutions())

problem.addVariable('z',[0.1,0.2,0.3])
# Dodajemo ogranicenja
#
# problem.addConstraint(ogranicenje [, redosled_promenljivih])
#
# ogranicenje moze biti:
#   constraint.AllDifferentConstraint() - razlicite vrednosti svih promenljivih
#   constraint.AllEqualConstraint() - iste vrednosti svih promenljivih
#   constraint.MaxSumConstraint(s [,tezine]) - suma vrednosti promenljivih (pomnozena sa tezinama) ne prelazi s
#   constraint.MinSumConstraint(s [,tezine]) - suma vrednosti promenljivih (pomnozena sa tezinama) nije manja od s
#   constraint.ExactSumConstraint(s [,tezine]) - suma vrednosti promenljivih (pomnozena sa tezinama) je s
#   constraint.InSetConstraint(skup) - vrednosti promenljivih se nalaze u skupu skup
#   constraint.NotInSetConstraint(skup) - vrednosti promenljivih se ne nalaze u skupu skup
#   constraint.SomeInSetConstraint(skup) - vrednosti nekih promenljivih se nalaze u skupu skup
#   constraint.SomeNotInSetConstraint(skup) - vrednosti nekih promenljivih se ne nalaze u skupu skup
#
# redosled_promenljivih predstavlja listu promenljivih
# i zadaje se zbog definisanja tacnog redosleda
# ogranicenja koja se primenjuju na promenljive
#
# Mozemo napraviti i svoju funkciju ogranicenja
def ogranicenje(y,z):
    if y / 10.0 == z:
        return True

# Prosledjujemo funkciju ogranicenja i redosled promenljivih koji treba da odgovara redosledu argumenata funkcije ogranicenja
problem.addConstraint(ogranicenje,['y','z'])
resenja = problem.getSolutions()
print("\n-----Resenja-----\n")
for resenje in resenja:
    print(str(resenje['x']) + " " + str(resenje['y'])+ " " + str(resenje['z']))
