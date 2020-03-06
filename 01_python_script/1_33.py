# Datoteku otvaramo koristeci funkciju open koja vraca
# referencu na otvoreni tok podataka.
#
# rezimi:
# - "r"  -> read
# - "w"  -> write
# - "a"  -> append
# - "r+" -> read + append
#
# Datoteku smo duzni da zatvorimo sa 'datoteka.close()',
#
# datoteka = open("datoteka.txt","r")
# kod koji obradjuje datoteku
# ...
# datoteka.close()

# Python nudi 'with' koji omogucava da
# se datoteka automatski zatvori, cak i u situaciji
# kada se ispali izuzetak. Ovo je preporuceni nacin
# za citanje tokova podataka u Python-u.
with open("datoteka.txt", "r") as datoteka:
    # Citamo datoteku liniju po liniju, a potom
    # u liniji citamo karakter po karakter.
    for linija in datoteka:
        for karakter in linija:
            print(karakter)
    # datoteka.close() nam nije neophodno,
    # Python ce sam zatvoriti datoteku kada
    # se zavrsi 'with' blok

