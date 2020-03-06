a = int(input("Unesi a: "))
b = int(input("Unesi b: "))
c = int(input("Unesi c: "))
d = int(input("Unesi d: "))

lista = []
for i in range(a, b):
	for j in range(c, d):
		lista.append((i, j))
print(lista)		

lista1 = [(i, j) for i in range(a, b) for j in range(c, d)]
print(lista1)
