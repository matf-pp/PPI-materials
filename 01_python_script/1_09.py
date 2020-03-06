"""
    Python funkcije.
"""

# Sintaksa:
# def name(args):
#   body

# Definicija funkcije (prazna funkcija)
def empty(x, y, z):
    pass
print(empty(1,2,3))  

# Definicija anonimne funkcije (funkcija sabiranja)
sum = lambda x, y: x + y
print(sum(1,2))
print(sum)

def square(x):
    """ Vraca kvadrat svog argumenta """
    return x**2
    
print(square.__repr__())
print(help(square))
x = 9
print(square(x))
x = 9.3
print(square(x))

square = lambda x : x**2
print(square)
print(square(7))
