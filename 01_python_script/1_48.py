import json, os, sys
from datetime import datetime

try:
    with open("radnici.json", "r") as f:
        radnici = json.load(f)
except IOError:
    print("Otvaranje datoteke nije uspelo!")
    sys.exit()

opcija = input("Unesite opciju koju zelite (d - dostupni radnici, o - radnici na odmoru): \n")

if opcija != "d" and opcija != "o":
    print("Uneta opcija nije podrzana.")
    exit()

tren_dat = datetime.now()

# funkcija datetime.strptime(string, format) pravi objekat tipa datetime na osnovu zadatih podataka u stringu i odgovarajuceg formata, na primer ako je datum zapisan kao "21.08.2016" odgovarajuci format je "%d.%m.%Y." pa se funkcija poziva sa datetime.strptime("21.08.2016", "%d.%m.%Y.")

for radnik in radnici:
    kraj_odmora = datetime.strptime(radnik['odmor'][1],"%d.%m.%Y.").date()
    pocetak_odmora = datetime.strptime(radnik['odmor'][0],"%d.%m.%Y.").date()
    kraj_rad_vrem = datetime.strptime(radnik['radno_vreme'][1],"%H:%M").time()
    pocetak_rad_vrem = datetime.strptime(radnik['radno_vreme'][0],"%H:%M").time()
    if opcija == "o":
        # Ukoliko je radnik trenutno na odmoru ispisujemo ga
        if  pocetak_odmora < tren_dat.date() < kraj_odmora:
            print(radnik["ime"])
    else:
        # Ukoliko je radnik trenutno dostupan i nije na odmoru, ispisujemo ga
        if not (pocetak_odmora < tren_dat.date() < kraj_odmora) and pocetak_rad_vrem < tren_dat.time() < kraj_rad_vrem:
            print(radnik["ime"])
