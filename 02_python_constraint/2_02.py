import constraint

problem = constraint.Problem()
# Definisemo promenljive i njihove vrednosti
problem.addVariable('A',range(1,10))
problem.addVariable('B',range(10))
problem.addVariable('C',range(10))
# Dodajemo ogranicenje da su vrednosti svih promenljivih razlicite
problem.addConstraint(constraint.AllDifferentConstraint())
resenja = problem.getSolutions()
# Znamo da minimalni kolicnik mora biti manji od 999
min_kolicnik = 999
min_resenje = {}
for resenje in resenja:
    a = resenje['A']
    b = resenje['B']
    c = resenje['C']
    kolicnik = (a*100 + b*10 + c) / (a+b+c)
    if kolicnik < min_kolicnik:
        min_kolicnik = kolicnik
        min_resenje = resenje
print(min_resenje['A']*100 + min_resenje['B']*10 + min_resenje['C'])
