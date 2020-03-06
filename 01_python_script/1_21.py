# Uredjene N-TORKE
print("\n------Torke------\n")
# torka = ("Daffy","Duck",11)

def min_torka(torke):
    # Pristupanje elementima u torki
    minimum = torke[0]
    for torka in torke:
        # Ukoliko torke ne sadrze elemente istog tipa na istim pozicijama, i dalje ih mozemo porediti,
        # ali poredjenje se vrsi na osnovu imena tipa elementa leksikografski
        # npr.  element tipa List < element tipa String < element tipa Tuple i slicno
        if minimum > torka:
            minimum = torka
    return minimum

torke1 = ((1, 2, 'a'), (1, 2, 'b'), (1, 3, 'z'), (2, 2, '5'))
print(min_torka(torke1))

torke2 = ((1,2,'a'),(1,2,'b'),([1,2,3], 'Bugs', 4), ([1,1,1], 'Bunny', 6),(1,2,['a','b']),(1,2,'ab'))
try:
    print(min_torka(torke2))
except TypeError as err:
    print("Greska. Python3 ne poredi razlicite tipove: ", err)
    exit(1)
