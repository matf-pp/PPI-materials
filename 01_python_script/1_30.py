"""
    Iteratori.
"""
for i in [1,2,3,4]:
    print(i)
for i in ('a', 'b', 'c', 'd'):
    print(i)

# Da bi Python objekat bio iterabilan, potrebno je da implementira sledeće metode:
# * __iter__ metod koji se poziva prilikom inicijalizacije iteratora
#            vraća objekat koji implementira __next__ metod.
# * __next__ metoda vraća sledeću vrednost iteratora. 
#            Kada se iterator objekat nalazi u okviru ‘for in’ petlje, petlja implicitno 
#            poziva __next__() metod na iterator objektu.
#            Metod podiže izuzetak StopIteration kao signal kraja iteriranja. 

class MojIterator:
    def __init__(self, limit):
        self.limit = limit

    def __iter__(self):
        self.x = 0
        return self

    def __next__(self):
        # Treba nam trenutna vrednost x
        x = self.x
        if x > self.limit:
            raise StopIteration
        else:
            self.x += 1
            return x

for i in MojIterator(10):
    print(i)

# Ovo se prevodi u (priblizno, naravno):
# foo = MojIterator(10)
# foo = foo.__iter__()
# try:
#     while (True):
#         i = foo.__next__()
#         print(i)
# except StopIteration:
#     pass
