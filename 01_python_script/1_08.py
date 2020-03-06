# Matematicke funkcije

# Ukljucujemo modul <<math>>
import math

# U ovom moduli se nalaze brojne funkcije kao sto su:
#
# math.sqrt(broj)
# math.log(broj, osnova)
# math.sin(ugao_u_radijanima), math.cos(), ...
# math.exp(stepen)
# math.factorial(broj)
# i druge...
print("\n------Matematicke funkcije------\n")
print(math.factorial(6))
print(math.log(125, 5))

# Pseudo slucajni brojevi

# Ukljucujemo modul <<random>>
import random

# Funkcija random() vraca pseudo slucajan broj tipa float iz opsega [0.0, 1.0)
print("\n------Pseudo slucajni brojevi------\n")
print("Pseudo slucajan broj iz opsega [0.0,1.0)\n")
print(random.random())

# Korisne funkcije:
#
# randint(a,b) - vraca pseudo slucajan ceo broj n iz opsega [a,b]
# choice(lista) - vraca pseudo slucajan element iz liste
