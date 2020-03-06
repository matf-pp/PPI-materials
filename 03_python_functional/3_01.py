def suma(a, b):
	return a + b
	
suma2 = lambda a, b : a + b 

a = int(input("Unesi a: "))
b = int(input("Unesi b: "))
print("suma: {}".format(suma(a, b)))
print("suma1: {}".format(suma2(a, b)))
