lista = []

while True:
    unos = input()
    if unos == 'quit':
        break
    lista.append(unos)

# Pravljenje skupa od liste
skup = set(lista)

for i in skup:
    print(i)
