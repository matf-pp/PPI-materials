#
# Potrebno je napraviti H komada hleba i K komada kifli
#
# Zarada iznosi:
# - 7din/hleb, tj. zarada za H komada hleba bice 7*H
# - 9din/kifla tj. zarada za K komada kifli bice 9*K
#
# Ukupna zarada iznosi:
# 7*H + 9*K - funkcija koju treba maksimizovati
#
# Ogranicenja vremena:
# - vreme potrebno za mesenje jednog hleba je 10min,
#   tj. za mesenje H komada hleba potrebno je 10*H minuta
# - vreme potrebno za mesenje jedne kifle je 12min,
#   tj. za mesenje K komada kifli potrebno je 12*K minuta
#
# Ukupno vreme koje je na raspolaganju iznosi 20h, tako da je:
# 10*H + 12*K <= 1200
#
# Ogranicenje materijala:
# - za jedan hleb potrebno je 300g brasna, a za H komada hleba potrebno je H*300 grama
# - za jednu kifli potrebno je 120g brasna, a za K komada kifli potrebno je K*120 grama
#
# Ukupno, na raspolaganju je 20kg brasna, tako da je:
# 300*H + 120*K <= 20000
#
# Broj kifli i hleba je najmanje 0, tako da:
# H>=0
# K>=0
#
# S obzirom na to da imamo 20kg brasna na raspolaganju, mozemo napraviti:
# - najvise 20000/120 kifli
# - najvise 20000/300 hleba
#
# H <= 20000/120 ~ 167
# K <= 20000/300 ~ 67
#
# S obzirom na to da imamo 20h na raspolaganju, mozemo napraviti:
# - najvise 1200/12 kifli
# - najvise 1200/10 hleba
#
# H <= 1200/10 = 120
# K <= 1200/12 = 100
#
# najoptimalnije je za gornju granicu domena postaviti
# minimum od dobijenih vrednosti,
# tj. sve ukupno H <= 120, K <= 67

import constraint

problem = constraint.Problem()

# Dodajemo promenljivu H i definisemo njen domen
problem.addVariable('H', range(0,121))

# Dodajemo promenljivu K i definisemo njen domen
problem.addVariable('K', range(0,68))

def ogranicenje_vremena(h,k):
    if 10*h + 12*k <= 1200:
        return True

def ogranicenje_materijala(h,k):
    if 300*h + 120*k <= 20000:
        return True;

# Dodajemo ogranicenja vremena i matrijala
problem.addConstraint(ogranicenje_vremena, 'HK')
problem.addConstraint(ogranicenje_materijala, 'HK')

resenja = problem.getSolutions()

# Pronalazimo maksimalnu vrednost funkcije cilja
max_H = 0
max_K = 0

for r in resenja:
    if 7*r['H'] + 9*r['K'] > 7*max_H + 9*max_K:
        max_H = r['H']
        max_K = r['K']

print("----------------------------------------------------------------")
print("Maksimalna zarada je {0:d}, komada hleba je {1:d}, a komada kifli {2:d}".format(7*max_H + 9*max_K, max_H, max_K))
print("----------------------------------------------------------------")

