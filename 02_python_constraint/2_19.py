import constraint

def magicna(s):
	n = len(s)
	# sekvenca s dimenzije n je magicna ako je za svako i od 0 do n-1 ispunjeno da je s[i] jednako broju pojavljivanja broja i u sekvenci
	for i in range(n):
		if s.count(i)!=s[i]:
			return False
	return True
			

problem=constraint.Problem()

n=int(input("Unesite duzinu magicne sekvence: \n"))
# n dimenzija sekvence S=(X0,X1,...,Xn-1), X0 do Xn-1 promenljive koje uzimaju vrednosti od 0 do n-1
for i in range(n):
  problem.addVariable("X"+str(i),range(n))

resenja=problem.getSolutions()
# za svaku sekvencu proveravamo da li je magicna, posto je resenje recnik, pravimo odgovarajucu listu od njega pa nju prosledjujemo funkciji magicna
id = 0
for resenje in resenja:
	s = []
	for kljuc in resenje:
		s.append(resenje[kljuc])
	if magicna(s):
		id = 1
		print(s)
if id==0:
	print("Ne postoji magicna sekvenca duzine " + str(n)    )
    
