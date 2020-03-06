# JSON format
#
# Funkcije za rad sa JSON formatom se nalaze u modulu json
import json

ime = input("Unesite ime: ")
prezime = input("Unesite prezime: ")
godine = int(input("Unesite godine: "))

# json.dumps(objekat) vraca string koji sadrzi JSON reprezentaciju objekta x

print("\n-----JSON reprezentacija objekta-----\n")
junak = {"Ime": ime, "Prezime":prezime, "Godine":godine}
print(json.dumps(junak))

# json.dump(x,f) upisuje string sa JSON reprezentacijom objekta x u datoteku f

f = open("datoteka.json","w")
json.dump(junak,f)
f.close()
