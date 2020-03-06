# Try catch
try:
    n = int(input("Unesite ceo broj: "))
except ValueError:
    print("Greska. Parsiranje celog broja.")
    exit(1)

# Imutabilnost stringova
x = "Hello world"
print("x: ", x, id(x))
y = "Hello world"
print("y: ", y, id(y))
print(x==y)
#x[0] = '7'  # Type Error
#print("x: ", x, id(x))