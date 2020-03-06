"""
    Python klase. Nasledjivanje.
"""

import math

class Oblik:
    def __init__(self, boja='crna', popuna=False):
        # protected promenljive pocinju sa _
        # private promenljive pocinju sa __
        # Ovo je samo konvencija o imenovanju, ne postoje zaista privatne promenljive u Pythonu.
        # Radi se o kvazi privatnim, Python promenljivim koje počinju sa __ menja naziv interno, 
        # i na taj način vrši skrivanje imena.
        self.__boja = boja 
        self.__popuna = popuna
    def get_boja(self):
        return self.__boja
    def get_popuna(self):
        return self.__popuna
    def set_popuna(self, popuna):
        self.__popuna = popuna


class Pravougaonik(Oblik):
    def __init__(self, a, b):
        super().__init__(boja='crvena')
        self.__a = a
        self.__b = b
    def povrsina(self):
        return self.__a * self.__b
    def obim(self):
        return 2 * (self.__a + self.__b)


class Circle(Oblik):
    def __init__(self, r):
        super().__init__(boja='plava')
        self.__r = r
    def povrsina(self):
        return math.pi * self.__r ** 2
    def obim(self):
        return 2 * math.pi * self.__r


r1 = Pravougaonik(10.5, 2.5)
print("Povrsina pravougaonika r1:", r1.povrsina())
print("Obim pravougaonika r1:", r1.obim())
print("Boja pravougaonika r1:", r1.get_boja())
print("Da li je r1 popunjen? ", r1.get_popuna())
r1.set_popuna(True)
print("Da li je r1 popunjen? ", r1.get_popuna())

c1 = Circle(12)
print("\nPovrsina kruga c1:", format(c1.povrsina(), "0.2f"))
print("Obim kruga c1:", format(c1.obim(), "0.2f"))
print("Boja kruga c1:", c1.get_boja())
print("Da li je c1 popunjen? ", c1.get_popuna())
c1.set_popuna(True)
print("Da li je c1 popunjen? ", c1.get_popuna())

"""
Visestruko nasledjivanje: 
class A:
    def __init__(self):
        super(A, self).__init__()        
        print('A')
class B:
    def __init__(self):
        super(B, self).__init__()        
        print('B')
class C:
    def __init__(self):
        super(C, self).__init__()        
        print('C')
class X(A, B, C):
    def __init__(self):
        super(X, self).__init__()
x = X()
"""

"""
Virtualne funkcije:
class A:
    def metod(self):
        print("metod() iz klase A")
class B(A):
    def metod(self):
        print("metod() iz klase B")
b_obj = B()
a_obj = A()
b_obj.metod()
a_obj.metod()
"""

"""
Predefinisanje operatora:
class Tacka:
    def __init__(self, x = 0, y = 0):
        self.x = x
        self.y = y 
    def __str__(self):
        return "({0},{1})".format(self.x,self.y)
    def __add__(self,other):
        x = self.x + other.x
        y = self.y + other.y
        return Tacka(x,y)
p1 = Tacka(2,3)
p2 = Tacka(-1,2)
print(p1 + p2)
"""

# REFERENCE:
# https://overiq.com/python-101/inheritance-and-polymorphism-in-python/