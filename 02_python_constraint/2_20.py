import constraint

problem=constraint.Problem()
#Dodajemo promenljivu S za stan i definisemo njen domen, najoptimalnije je uzeti skup koji predstavlja presek svih skupova iz ogranicenja, odnosno od 0 do min{40/1,5000/120}=min{40,41.666}=40
problem.addVariable('S',range(41))

#Dodajemo promenljivu K za kucu i definisemo njen domen, najoptimalnije je uzeti skup koji predstavlja presek svih skupova iz ogranicenja, od 0 do min{40/1.5,5000/100}=min{26.6667,50}=26 
problem.addVariable('K',range(27))

def ogranicenje_vremena(s,k):
  if 1*s+1.5*k<=40:
    return True

def ogranicenje_deterdzenta(s,k):
  if 120*s+100*k<=5000:
    return True

problem.addConstraint(ogranicenje_vremena, 'SK')
problem.addConstraint(ogranicenje_deterdzenta, 'SK')

resenja=problem.getSolutions()
max_zarada = 0
max_stan = 0
max_kuca = 0
for resenje in resenja:
  if 1000*resenje['S']+1500*resenje['K'] > max_zarada:
    max_zarada = 1000*resenje['S']+1500*resenje['K']
    max_stan = resenje['S']
    max_kuca = resenje['K']

print("Najveca moguca zarada je {:d} i ona se ostvaruje kada se ocisti {:d} stanova i {:d} kuca.".format(max_zarada, max_stan, max_kuca))
