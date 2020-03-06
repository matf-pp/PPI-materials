from constraint import *

problem=Problem()
# dodajemo promenljivu za racunare, za gornju granicu domena uzimamo min od dobijenih granica iz ogranicenja, tj. min{30000/360, 14000/200} = min{83.33, 70} = 70
problem.addVariable("r", range(71))
# dodajemo promenljivu za stampace, za gornju granicu domena uzimamo min od dobijenih granica iz ogranicenja, tj. min{30000/240, 14000/60} = min{125, 233.33} = 125
problem.addVariable("s", range(126))
# dodajemo ogranicenje da mesecno prodatih racunara treba da ima za 50% vise od prodatih stampaca
def o(r, s):
	if r>=(3.0*s/2):
		return True

# dodajemo ogranicenje za kapacitet skladista
problem.addConstraint(MaxSumConstraint(30000, [360, 240]), ["r", "s"])
# dodajemo ogranicenje za raspoloziv novac
problem.addConstraint(MaxSumConstraint(14000, [200, 60]), ["r", "s"])
problem.addConstraint(o, "rs")

resenja=problem.getSolutions()

max_zarada=0
racunar=0
stampac=0
# kako se racunar nabavlja po ceni od 200, a prodaje za 400, zarada po racunaru je 200, slicno, stampac se nabavlja po ceni od 60, a prodaje za 140, zarada po stampacu je 80
for r in resenja:
	if max_zarada<(r["r"]*200+r["s"]*80):
		max_zarada=r["r"]*200+r["s"]*80
		racunar=r["r"]
		stampac=r["s"]

print("Maksimalna zarada je: {:d}, broj racunara: {:d}, broj stampaca: {:d}".format(max_zarada, racunar, stampac))
