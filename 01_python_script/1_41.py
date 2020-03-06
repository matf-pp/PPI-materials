import os

# funkcija za prosledjenu putanju direktorijuma vraca listu imena
# svih fajlova u tom direktorijumu, . je zamena za putanju tekuceg direktorijuma
print(os.listdir(os.curdir))

# os.walk() - vraca listu torki (trenutni_direktorijum, poddirektorijumi, datoteke)
# os.path.join(putanja, ime) - pravi putanju tako sto nadovezuje na
#   prosledjenu putanju zadato ime odvojeno /

print("\n-----Prolazak kroz zadati direktorijum-----\n")
for (trenutni_dir, poddirektorijumi, datoteke) in os.walk(os.curdir):
    print(trenutni_dir)
    for datoteka in datoteke:
        print(os.path.join(trenutni_dir, datoteka))

# os.path.abspath(path) - vraca apsolutnu putanju za zadatu relativnu putanju nekog fajla
# os.path.isdir(path) - vraca True ako je path putanja direktorijuma, inace vraca False
# os.path.isfile(path) - vraca True ako je path putanja regularnog fajla, inace vraca False
