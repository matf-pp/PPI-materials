# Aproksimacija broja PI metodom Monte Karlo

import random, math

def dist(A, B):
    """Funkcija izracunava euklidsko rastojanje izmedju tacaka A i B"""
    return math.sqrt((A[0]-B[0])**2 + (A[1]-B[1])**2)

print("Izracunavanje broja PI metodom Monte Karlo \n")
try:
    N = int(input("Unesite broj iteracija: "))
except ValueError as err:
    print("Greska. Parsiranje broja iteracija: ", err)
    exit(1)
A = 0   # Broj tacaka u krugu
B = 0   # Broj tacaka u kvadratu

i = N
while i >= 0:
    tacka = (random.random(), random.random())
    # Ukoliko se tacka nalazi u krugu, povecavamo broj tacaka u krugu
    if dist(tacka, (0.5, 0.5)) <= 0.5:
        A = A + 1
    B = B + 1
    i = i - 1

print("Broj PI aproksimiran metodom Monte Karlo: ")
print(4.0*A/B)
