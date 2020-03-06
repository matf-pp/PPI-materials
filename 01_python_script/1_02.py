# Promenljive se dinamicki tipiziraju
# a = 45
# b = 67.45
# istina = True
# Niske su konstantne tj. nisu promenljive.
# To znaci da se menjanjem nekog karaktera u niski
# pravi nova niska u memoriji.
#niska = "I believe i can fly!"

# Ispis na standardni izlaz
# print(a)
# print(b)
# print(a, b, istina)

# Ucitavanje niske sa standardnog ulaza
print("\n------Ucitavanje sa standardnog ulaza------\n")
string_broj = input("Unesite ceo broj: ")
a = int(string_broj) # vrsi se konverzija stringa u ceo broj, slicno: float, str

string_broj = input("Unesite ceo broj: ")
b = int(string_broj)

niska = input("Unesite nisku: ")

# Formatiran ispis
print("\n------Formatiran ispis------\n")
print("Brojevi: {0:d} {1:d}\nNiska: {2:s}\n".format(a,b,niska))

# Osnovne aritmeticke operacije:
# +, -, *, /, %, ** (stepenovanje), // (celobrojno deljenje)
zbir = a + b
razlika = a - b
proizvod = a * b
kolicnik = float(a) / b
stepen = a ** b
div = a // b

print("Zbir {0:d}\nRazlika {1:d}\nProizvod {2:d}\nKolicnik {3:f}\nStepen {4:d}\nCelobrojni kolicnik {5:d}"
    .format(zbir, razlika, proizvod, kolicnik, stepen, div))
