# pseudo kod za map.
# def map(func, seq):
# 	# vraca `Map` objekat gde
# 	# funkcija func primenjena na svaki element
# 	return Map(
# 	func(x)
# 	for x in seq
# 	)
niska = input("Unesi zeljenu nisku: ")
print(map(lambda c: c.upper(), niska))      		   # map object
print(list(map(lambda c: c.upper(), niska)))  		   # lista karaktera
print(''.join(list(map(lambda c: c.upper(), niska))))  # niska
