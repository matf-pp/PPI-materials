# Skup (Set)
imena = set()
for ime in ['Milan', 'Ivan', 'Milan', 'Ana', 'Ana', 'Milan']:
    imena.add(ime)
print(imena)
print(set(['Milan', 'Ivan', 'Milan', 'Ana', 'Ana', 'Milan']))


# Stek (LIFO struktura)
# Funkcije:
# * empty() – da li je stek prazan? – Time Complexity : O(1)
# * size() – veličina steka? – Time Complexity : O(1)
# * top() – Vraća referencu na element sa vrha steka – Time Complexity : O(1)
# * push(g) – Dodaje element g na vrh steka – Time Complexity : O(1)
# * pop() – Skida element sa vrha steka – Time Complexity : O(1)
#
# Implementacije: collections.deque, queue.LifoQueue etc. ili jednostavno koristiti listu!
stack = []
stack.append('a')
stack.append('b')
stack.append('c')
print('Inicijlani stek:', end=':')
print(stack)
print('pop():')
print(stack.pop())
print(stack.pop())
print(stack.pop())
print('Stanje steka:', end=':')
print(stack)

# Mapa (Dictionary)
# Notacija: {kljuc:vrednost, kljuc:vrednost, ...} - JSON format
prosek = {'Milan':9.45, 'Ana':9.87, 'Nikola':6.76}
print(prosek)
print(type(prosek))
print(prosek.keys())
print(prosek.values())
print('Milan' in prosek)

# Torke (Tuple)
# Torka predstavlja strukturu podataka koja je uredjena i imutabilna 
torka = ("jabuka", "banana", "visnja", "pomorandza", "kivi", "lubenica", "mango")
print(torka[2:5])
try:
    torka[0] = 11
except TypeError:
    print("Torke su imutabilne.")