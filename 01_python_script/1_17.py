def max_list(lista):
    # Mozemo indeksirati liste unazad, pozicija -1 odgovara poslednjem elementu
    maximum = lista[-1]
    for element in lista:
        if maximum < element:
            maximum = element
    return maximum

lista = [1, 4, -6, 7, 9, 0, 1]
print(max_list(lista))
