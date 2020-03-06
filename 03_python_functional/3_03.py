imena = ["Marko", "Petar", "Pavle"]
ocene = [int(input("unesi ocenu koju je dobio "+ime+": ")) for ime in imena]

print(zip(imena, ocene))

for par in zip(imena, ocene):
	print(par)
