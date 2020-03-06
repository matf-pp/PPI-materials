# Sortiranje
#
# sorted(kolekcija [, kljuc [, obrni]]) - vraca sortiranu kolekciju
#
# kolekcija - kolekcija koju zelimo da sortiramo
# kljuc - funkcija koja vraca kljuc po kome se poredi
# obrni - True/False (opadajuce/rastuce)
#
# Ukoliko zelimo da sortiramo po odredjenoj funkciji, mozemo iskoristiti 
# funkciju iz `functools` modula `cmp_to_key()` koja ce prosledjenu
# funkciju "transformisati" u argument kljuc po kojem se poredi.
# Funkcija koja se prosledjuje funkciji cmp_to_key() ima potpis:
# foo(x, y) -> integer
# i vraca negativnu vrednost ako je x < y, 0 za x == y i pozitivnu vrednost za x > y
#
# primer:
# 
# def foo(x, y):
#     return x + y
# sorted(kolekcija, key=cmp_to_key(foo))
#
# napomena: foo se prosledjuje bez zagrada jer se prosledjuje objekat koji
# predstavlja funkcija a ne povratna vrednost funkcije (zagrade znace da se 
# funkcija evaluira za date argumente)

import json
import math

# l = ["A", "C", "D", "5", "1", "3"]
# print(l)
# print("sortirana lista: ", sorted(l))  # definisan operator < nad niskama

# U sledecem primeru je neophodno da definisemo svoje funkcije za vracanje kljuca po kom se poredi jer je kolekcija lista recnika i nad njima nije definisan operator '<'
with open("tacke.json","r") as f:
    tacke = json.load(f)

# Za definisanje kljuca poredjenja tacaka iskoristicemo anonimnu (lambda) funkciju (na mala vrata uvodimo ono sto cemo raditi detaljnije u programskom jeziku Haskell)
sortirane_tacke = sorted(tacke, key=lambda x: math.sqrt(x['koordinate'][0]**2 + x['koordinate'][1]**2))  # Optimizacija: bez .sqrt; reverse=True za obratan redosled
print("Tacke pre sortiranja:")
for item in tacke:
        print(item["teme"],)
print("\nTacke nakon sortiranja: ")
for item in sortirane_tacke:
        print(item["teme"],)
print()

# import functools
# TODO Probati isto koristeci cmp_to_key()