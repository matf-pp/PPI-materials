import constraint

problem = constraint.Problem()
# Definisemo promenljive za svaki novcic
# ako bi se zahtevalo da u kombinaciji bude od svake vrednosti
# bar po jedan novcic samo treba promeniti da domen za svaku
# promenljivu krece od 1
problem.addVariable("1 din",range(0,51))
problem.addVariable("2 din",range(0,26))
problem.addVariable("5 din",range(0,11))
problem.addVariable("10 din",range(0,6))
problem.addVariable("20 din",range(0,3))

# Problem koji je uocen pri ispisu resenja je sledeci,
# redosled u kom ce biti dodate promenljive problemu ne
# mora uvek da odgovara redosledu kojim smo mi definisali promenljive,
# u konkretnom primeru (videti oblik u kom ispisuje resenje),
# promenljive ce se dodati u sledecem redosledu:
# '1 din', '2 din', '10 din', '20 din', '5 din'
# (nacin na koji se kljucevi organizuju u recniku nije striktno definisan,
# primetimo da niske nisu sortirane)
# posledica je da postavljanje ogranicenja
#	problem.addConstraint(constraint.ExactSumConstraint(50,[1,2,5,10,20]))
# nece ispravno dodeliti tezine, na primer,
# tezinu 5 dodeli promenljivoj '10 din' umesto '5 din' kako bismo ocekivali

# I nacin da se resi ovaj problem je da redosled promenljivih
# koji odgovara redosledu tezina za ExactSumConstraint prosledimo
# kao dodatni argument za funkciju addConstraint

problem.addConstraint(
    constraint.ExactSumConstraint(50,[1,2,5,10,20]),
    ["1 din", "2 din", "5 din","10 din", "20 din"])

# II nacin je da definisemo svoju funkciju koja predstavlja ogranicenje, samo ce sada solver nesto sporije da radi posto ugradjene funkcije imaju optimizovanu pretragu i brze dolaze do resenja
#
#def o(a, b, c, d, e):
#	if a + 2*b + 5*c + 10*d + 20*e == 50:
#		return True
#
#problem.addConstraint(o, ["1 din", "2 din", "5 din","10 din", "20 din"])
#
resenja = problem.getSolutions()

for r in resenja:
	print("---")
	print("""1 din: {0:d}
2 din: {1:d}
5 din: {2:d}
10 din: {3:d}
20 din: {4:d}""".format(r["1 din"],r["2 din"],r["5 din"], r["10 din"], r["20 din"]))
	# Provera da je suma bas 50
	print("Ukupno:", r["1 din"] + r["2 din"]*2 + r["5 din"]*5 + r["10 din"]*10 + r["20 din"]*20)
	print("---")
