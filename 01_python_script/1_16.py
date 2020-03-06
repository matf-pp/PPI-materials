# Korisne funkcije za liste:
#
# list.remove(x) - izbacuje prvo pojavljivanje elementa x iz liste
# list.count(x) - vraca broj koliko puta se element x nalazi u listi
# list.index(x) - vraca indeks prvog pojavljivanja elementa x u listi
# len(lista) - vraca broj elemenata liste
# del lista[a:b] - brise elemente liste od pozicije a do b

try:
    n = int(input("Unesite broj elemenata: "))
except ValueError:
    print("Greska. Parsiranje broja elemenata.")
    exit(1)

elementi = []
# Funkcija <<range>>
#
# range(kraj)
# range(pocetak, kraj[, korak])

for i in range(n):
    element = int(input())
    # Provera da li se element nalazi u listi
    if not element in elementi:
        # Ubacivanje elementa u listi
        elementi.append(element)

k = 0
for i in range(n-1):
    # Pristupanje elementima liste
    if elementi[i] > elementi[i+1]:
        k = i + 1
        break

prvi_deo = elementi[0:k]
drugi_deo = elementi[k:]

# Nadovezvivanje dve liste
sortirani = drugi_deo + prvi_deo
print("Sortirani elementi: ")
for element in sortirani:
    print(element)
