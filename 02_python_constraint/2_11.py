import constraint

problem = constraint.Problem()
# Kompanija ima 250 zaposlenih radnika
# za sve njih organizuje dodatnu obuku
# ako je E promenjiva za Elixir, a D za Dart
# mora da vazi E<=250, D<=250 i E + D = 250
#
# Dodajemo promenljivu E i definisemo njen domen
problem.addVariable('E', range(0,251))

# Dodajemo promenljivu D i definisemo njen domen
problem.addVariable('D', range(0,251))

def ukupno_radnika(e,d):
	if e+d == 250:
		return True

def ogranicenje_projekat_sati(e,d):
    if 150*e + 170*d <= 51200:
        return True

def ogranicenje_sredstava(e,d):
    if 100*e + 105*d <= 26000:
        return True;

# Dodajemo ogranicenja za broj projekat/sati i ukupna sredstva
# na raspolaganju kao i za broj radnika u firmi
problem.addConstraint(ogranicenje_projekat_sati, 'ED')
problem.addConstraint(ogranicenje_sredstava, 'ED')
problem.addConstraint(ukupno_radnika, 'ED')

resenja = problem.getSolutions()

# Pronalazimo maksimalnu vrednost funkcije cilja
max_E = 0
max_D = 0
# Od ostvarene dobiti preko broja projekat/sati oduzimamo gubitak za placanje kurseva radnicima
for r in resenja:
    if 150*5*r['E'] + 170*6*r['D'] - (100*r['E'] + 105*r['D']) > 150*5*max_E + 170*6*max_D - (100*max_E + 105*max_D) :
        max_E = r['E']
        max_D = r['D']


print("Maksimalna zarada je {0:d}, broj radnika koje treba poslati na kurs Elixir je {1:d}, a broj radnika koje treba poslati na kurs Dart je {2:d}.".format(170*6*max_E + 150*5*max_D - (100*max_E + 150*max_D) , max_E, max_D))
