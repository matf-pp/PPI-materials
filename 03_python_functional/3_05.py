# Funkcija filter
# - kao prvi argument uzima funkciju uslova (funkcija koja vraca logicku vrednost)
# i izdvaja iz liste koju uzima kao drugi argument
# sve elemente koji zadovoljavaju zadat uslov
#
# def filter(evaluate , seq):
# 	return Map(
# 		x for x in seq
# 		if evaluate(x) is True
# 	)
niska = input("Unesite zeljenu nisku: ")
print(list(filter(lambda c: not c.isalpha(), niska)))  # lista karaktera koji nisu slova
