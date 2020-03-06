# Niske
#
# Mozemo ih pisati izmedju jednostrukih i dvostrukih navodnika

niska1 = input("Unesite nisku: ")
niska2 = input("Unesite nisku: ")

# Duzinu niske racunamo koristeci funkciju len(niska)
if len(niska1) >= len(niska2):
    # Funkcija count
    # niska.count(podniska [, pocetak [, kraj]]) - vraca broj koliko se puta
    # podniska nalazi u niski (u intervalu od pocetak do kraj)
    n = niska1.count(niska2)
    if n > 0:
        # Funkcija find
        # niska.find(podniska [, pocetak [, kraj]]) - vraca poziciju prvog pojavljivanja
        # podniska u niski (u intervalu od pocetak do kraj), -1 ukoliko se podniska ne nalazi u niski
        i = niska1.find(niska2)
        # Karakterima u niski mozemo pristupati koristeci notaciju [] kao kod listi
        niska1 = niska1[0 : i] + '$' + niska1[i+len(niska2) : ]
        print(niska1)
    else:
        # Funkcija join
        # niska_separator.join([niska1,niska2,niska3,...]) - spaja listu niski separatorom
        print('-'.join([niska1,niska2]))
else:
    print("Duznina niske {0:s} je {1:d}".format(niska2, len(niska2)))

# Korisne funkcije za rad sa niskama:
#
# niska.isalnum()
#       isalpha()
#       isdigit()
#       islower()
#       isspace()
#       isupper()
# niska.split(separator) - razlaze nisku u listu koristeci separator
# niska.replace(stara, nova [, n]) - zamenjuje svako pojavljivanje niske stara
# niskom nova (ukoliko je zadat broj n, onda zamenjuje najvise n pojavljivanja)
