# Lista (List)
l = [1, 2, 3, 4, 5]
print(l, type(l))
l += [-3, -3, -3]
print(l)
print('len:', len(l))
print('sum:', sum(l))
l.append(-6)
print(l)
l.pop()
print(l)
l = [1, 2, "Matf", 12.3, [1, 2, 3], [[1,2], [3,4]], 1]
print(l)
print(l[2])
print(l[-2])
print(l[2:])
print(l[:-2])
print(l.count(1))
l1 = [2, 3, 34, 341, 2, -23, 213]

l = list(input())
print('len:', len(l))
print('sum:', sum(l))
print('max: ', max(l1))
print(l.count(1))

# Poredjenje razlicitih tipova
lista = [[1,2,3], [1,2,5], ['abc','abc','abc'], ['abc', 'ab', 'abcd'], ['a','b','c'] > ['a', 'b']]
try:
    print(max(lista))
except TypeError as err:
    print("Greska. Python3 ne poredi razlicite tipove: ", err)
