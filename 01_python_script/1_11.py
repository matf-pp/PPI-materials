# Funkcije sa nepoznatim brojem argumenata
def printf(*x):
    print(x)
printf()
printf(14)
printf([1,2,3])
printf(1,2,3,translate, printf)

def aritm_sredina(head, *tail):
    sum = head
    for i in tail:
        sum += i
    return sum / (1.0 + len(l))
print(aritm_sredina(1,2,3,4,5))

# Proizvoljan broj imenovanih argumenata
def printf(**x):
    print(x)
printf()
printf(de="German",en="English",fr="French")

# Lokalne funkcije
def average(a, b, c):
    def total(a, b, c):
        return a+b+c
    return total(a,b,c)/3
print(average(1, 2, 3))

# REFERENCE:
# https://www.python-course.eu/passing_arguments.php
# https://www.zentut.com/python-tutorial/advanced-python-function/

