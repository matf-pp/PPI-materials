from constraint import *

problem = Problem()
# s oznacava broj solja, za gornju granicu domena uzimamo minimum iz ogranicenja tj. min{1200/6, 250000/75} = min{200, 3333.33}, tj. s <= 200
problem.addVariable("s", range(201)) 

# t oznacava broj tanjira, za gornju granicu domena uzimamo minimum iz ogranicenja tj. min{1200/3, 250000/100} = min{400, 2500}, tj. t <= 400
problem.addVariable("t", range(401)) 

def ogranicenje_vreme(s, t):
  if 6*s + 3*t <= 1200: 
    return True

def ogranicenje_materijal(s, t):
  if 75*s + 100*t <= 250000:
    return True

problem.addConstraint(ogranicenje_vreme, ["s","t"])
problem.addConstraint(ogranicenje_materijal, ["s","t"])

resenja = problem.getSolutions()

max_zarada = 0
max_solja = 0
max_tanjir = 0

for resenje in resenja:
  if 2*resenje["s"]+1.5*resenje["t"] > max_zarada:
    max_zarada = 2*resenje["s"]+1.5*resenje["t"]
    max_solja = resenje["s"]
    max_tanjir = resenje["t"]

print("Najveca moguca zarada je {:f} i ona se ostvaruje kada se napravi {:d} solja i {:d} tanjira.".format(max_zarada, max_solja, max_tanjir))
