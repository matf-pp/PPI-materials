# Pogodi broj

import random

print("-------- IGRA: Pogodi broj ---------\n")

zamisljen_broj = random.randint(0,100)

ime = input("Unesite Vase ime: ")

print("Zdravo {0:s}. :) \nZamislio sam neki broj od 1 do 100. Da li mozes da pogodis koji je to broj? ".format(ime))

pogodio = False
while not pogodio:
    print("Unesi broj:")
    broj = int(input())
    if broj == zamisljen_broj:
        pogodio = True
    elif broj > zamisljen_broj:
        print("Broj koji sam zamislio je MANJI od {0:d}.".format(broj))
    else:
        print("Broj koji sam zamislio je VECI od {0:d}.".format(broj))

print("BRAVO!!! Pogodio si! Zamislio sam {0:d}. Bilo je lepo igrati se sa tobom. :)".format(zamisljen_broj))
