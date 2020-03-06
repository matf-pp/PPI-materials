import json
import math
import sys
from functools import partial

# funkcija koja proverava da li tacka pripada kvadrantu
def pripada(kvadrant, tacka):  # 1, {'teme': 'A', 'koordinate': [10.0, 1.1]}
    koordinate = tacka["koordinate"]
    if kvadrant == 1:
        return koordinate[0] >=0 and koordinate[1] >=0
    elif kvadrant == 2:
        return koordinate[0] <=0 and koordinate[1] >=0
    elif kvadrant == 3:
        return koordinate[0] <=0 and koordinate[1] <=0
    elif kvadrant == 4:
        return koordinate[0] >=0 and koordinate[1] <=0
    else:
        print("Error: Kvadrant nije ispravno unet")
        exit()

if len(sys.argv) != 2:
    print("Niste naveli dovoljno argumenta komandne linije: kvadrant")
    exit(1)
	
try:
	with open("tacke.json","r") as f:  # [{'teme': 'A', 'koordinate': [10.0, 1.1]}, ...]
		tacke = json.load(f)
except IOError:
	print('Error: open json file')
	exit(1)
	
try:
	kvadrant = int(sys.argv[1])
except ValueError:
	print('Error: invalid cast')
	exit(1)
	
# sa partial fiksiramo jedan argument: kvadrant
# partial vraca objekat koji se moze pozvati kao funkcija (u konkretnom slucaju jednog argumenta)
uslov = partial(pripada, kvadrant)
kvadrant_tacke = list(filter(uslov, tacke))  # listu dobijamo od filter objecta

# Ispis
if len(kvadrant_tacke) > 0:
    print(min(kvadrant_tacke, key = lambda x: x['koordinate'][0]**2 + x['koordinate'][1]**2))
else:
    print("Trazena tacka ne postoji")
	
# Eventualno resavanje zadatka sortiranjem: (nije efikasno)
# sortirane_tacke = sorted(tacke, key = lambda x: x['koordinate'][0]**2 + x['koordinate'][1]**2)
# print(sortirane_tacke)



