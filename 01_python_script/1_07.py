"""
    Python moduli.
"""

# U <<math>> modulu se nalaze brojne naprednije matematicke funkcije kao sto su:
# math.sqrt(broj)
# math.log(broj, osnova)
# math.sin(ugao_u_radijanima), math.cos(), ...
# math.exp(stepen)
# math.factorial(broj)
import math
print(math.factorial(23))
print(math.log(225, 10))

# Pseudo slucajni brojevi nalaze se u modulu <<random>>
import random
print(random.random())       # [0.0, 1.0)
print(random.randint(0,1))   # {0,1,...,9,10}

# Preko <<sys>> modula se moze pristupiti objektima koje interpreter koristi,
# kao sto su npr argumenti komandne linije
import sys
print(sys.argv)

# U <<os>> modulu se nalaze, izmedju ostalog, sistemski pozivi
import os
os.system('ls -lah')

# Alias za modul
import time as t
print(t.time())

# Selektovani import
from re import search as re_src
print(re_src(r'[0-9]+', input('Unesite string za match: ')))
