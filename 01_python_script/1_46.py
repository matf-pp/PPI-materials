import os

dat_u_duze = 0
dat_u_sire = 0

# Funkcija koja obilazi datoteku i vraca 1 ukoliko datoteka pripada skupu duze
# odnosno 0 ukoliko datoteka pripada skupu sire
def obilazak(ime_datoteke):
    br_linija = 0
    najduza_linija = 0
    with open(ime_datoteke, "r") as f:
        for linija in f:
            br_linija = br_linija + 1
            if len(linija) > najduza_linija:
                najduza_linija = len(linija)
    if br_linija > najduza_linija:
        return 1
    else:
        return 0

ime_direktorijuma = input("Unesite putanju do direktorijuma: ")

for (tren_dir, pod_dir, datoteke ) in os.walk(ime_direktorijuma):
    for dat in datoteke:
        if obilazak(os.path.join(tren_dir, dat)) == 0:
            dat_u_sire += 1
        else:
            dat_u_duze += 1

print("Kardinalnost skupa duze: kardinalnost skupa sire")
print(str(dat_u_duze)+":"+str(dat_u_sire))
