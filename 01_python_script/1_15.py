# LISTA
#
# Notacija: [element1, element2, ...]
#
# Liste mogu sadrzati razlicite tipove podataka
# lista = [1,2,3.4,"Another brick in the wall",True,[5,False,4.4,'Layla']]

# Prazna lista
buffer = []
i = 0
while True:
    unos = input()
    if unos == 'quit':
        break
    # Ubacivanje elementa na kraj
    buffer.append(unos)
    i += 1
    if i == 5:
        # Prolazak kroz listu
        for unos in buffer:
            print(unos)
        # Praznimo bafer
        buffer = []
        i = 0
