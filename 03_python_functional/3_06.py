# funkcija koja odgovara funkciji fold u Haskelu je funkcija reduce
# ona se nalazi u modulu functools
from functools import reduce

try:
	n = int(input("Unesi n: "))
except ValueError:
	print("Error: cast error")
	
brojevi = range(0, n+1)
print("Suma(prvih {}) = {}".format(n, reduce(lambda x, y: x+y, brojevi)))
