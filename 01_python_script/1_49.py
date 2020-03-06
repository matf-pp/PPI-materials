import os

ime_datoteke = input("Unesite ime datoteke: ")

# pretrazujemo ceo fajl sistem, odnosno pretragu krecemo od root direktorijuma /
# imajte u vidu da ce vreme izvrsavanja ovog programa biti veliko posto se pretrazuje ceo fajl sistem, mozete ga prekinuti u svakom trenutku sa CTRL+C
for (tren_dir, pod_dir, datoteke) in os.walk("/"):
    # objekat datoteke predstavlja listu imena datoteka iz direktorijuma
    # ta imena poredimo sa zadatim
    for dat in datoteke:
        # ako smo naisli na trazenu datoteku, pravimo odgovarajucu putanju
        if dat == ime_datoteke:
            print(os.path.join(os.path.abspath(tren_dir), ime_datoteke))


