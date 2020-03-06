# Ispitivanje da li je otvaranje datoteke uspelo:
try:
    with open("datoteka.txt","r") as g:
        # Liniju po liniju mozemo ucitavati koristeci petlju
        # tako sto 'iteriramo' kroz Datoteku
        print("-----Iteriranje kroz datoteku <<for>> petljom-----\n")
        # Metod f.readline() cita jednu liniju iz Datoteke
        for linija in g:
            print(linija)
except IOError:
    # Ukoliko ne uspe otvaranje datoteke, Python ispaljuje
    # izuzetak 'IOError'.
    print("Nije uspelo otvaranje datoteke.")
