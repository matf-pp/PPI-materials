# Funkcije
#
# def ime_funkcije(argumenti):
#     telo funkcije

def radni_dan(broj):
    # Osnovne logicke operacije:
        # not, and, or

        if broj % 7 == 1 or broj % 7 == 2 or broj % 7 == 3:
            return True
        elif broj % 7 == 4 or broj % 7 == 5:
            return True
        # Naredbi <<elif>> moze biti vise
        else:
            return False

# Blokovi se ne ogranicavaju viticastim zagradama kao sto je u C-u
# vec moraju biti indentovani. Naredbe na istom nivou indentacije se
# smatraju istim naredbama istog bloka

i = 0
while i <= 10:
    dan = input("Unesite dan: ")
    try:
	    dan = int(dan)
    except ValueError:
	    print("Greska. Parsiranje rednog broja dana.")
	    exit(1)
    if radni_dan(dan):
        print("Uneti dan je radni dan.")
    else:
        print("Uneti dan je neradan.")
    i = i + 1 # i++ ne postoji, moze ili ovako ili i += 1

# Naredba <<break>> iskace iz bloka, isto kao i u C-u
