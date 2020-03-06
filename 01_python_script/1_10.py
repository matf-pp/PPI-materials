# Prenos argumenata funkciji
# Postoje dva tipa objekata u Python-u: mutabilni i imutabilni
# - Za imutabilne objekte, menjanje unutar funkcije kreira novu instancu
#   i originali se ne menjaju. Imutabilni objekti su niske, brojevi i torke.
# - Za mutabilne objekte, svaka izmena unutar funkcije menja original.
#   Medjutim, ponovna dodela instance nece promeniti instancu izvan funkcije.
#   Mutabilni objekti su (izmedju ostalih): liste, mape i klasne instance.

def translate(x):
    x = x-1
    return x
    
a = 5
print('a:', a)
translate(a)
print('a:', a)

l = [1, 2, 3]  
def translate(l):
    l = l[:-1]
print('l: ', l)
translate(l)
print(l)

l = [1, 2, 3]  
def translate(l):
    l[0] = "M"
print('l: ', l)
translate(l)
print(l)

x = 17
print("x=",x," id=",id(x))
def ref_demo(x):
    print("x=",x," id=",id(x))
    x=42
    print("x=",x," id=",id(x))
ref_demo(x)

x = 17
print("x=",x," id=",id(x))
def ref_demo1(x):
    print("x=",x," id=",id(x))
    x -= 1
    print("x=",x," id=",id(x))
ref_demo1(x)