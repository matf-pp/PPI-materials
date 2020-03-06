# modul sys ima definisan objekat argv koji predstavlja listu argumenata komandne linije (svi argumenti se cuvaju kao niske karaktera)

import sys

if len(sys.argv) == 1:
    print("Niste naveli argumente komandne linije")
    # funkcija exit() iz modula sys prekida program
    # (ukoliko se ne prosledi argument, podrazumevano
    # se salje None objekat)
    exit()

# ispisujemo argumente komandne linije
# prvi argument, tj. sys.argv[0] je uvek ime skript fajla koji se pokrece
for item in sys.argv:
    print(item)

