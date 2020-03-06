# KATALOG
#
# Katalog je kolekcija uredjenih parova oblika (kljuc, vrednost)
#
# Notacija: {kljuc:vrednost, kljuc:vrednost, ...}

mapa = {} # prazna mapa

try:
    n = int(input("Unesite n: "))
except ValueError as err:
    print("Greska. Parsiranje broja elemenata: ", err)
    exit(1)
for x in range(n):
    mapa[x] = x**2

# Prolazak kroz mapu
print("\n------Prolazak kroz katalog------\n")
for kljuc in mapa:
    print("f({0:s}) =  {1:s}\n".format(str(kljuc),str(mapa[kljuc])))

# Korisne funkcije
#
# map.keys() - vraca listu kljuceva iz kataloga
# map.values() - vraca listu vrednosti iz kataloga
# map.has_key(kljuc) - vraca True/False u zavisnosti od toga da li se element
# sa kljucem kljuc nalazi u katalogu
