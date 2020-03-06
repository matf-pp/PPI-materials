# Grananje
print("if/elif: ")
x = int(input("Unesi jedan broj: "))
if x%5==0:
    print("Unet je broj deljiv sa 5.")
elif x%5==1 or x%5==2:
    print("Uneti broj daje ostatak 1 ili 2 pri deljenju sa 5.")
elif x%5==3:
    print("Uneti broj daje ostatak 3 pri deljenju sa 5.")
else:
    print("Preostaje da uneti broj daje ostatak 4 pri deljenju sa 5.")

# While petlja
print("while: ")
i = 0
while i < 10:
    print(i, end=' ')
    i += 1  # i++ nije podrzano

# For petlja
print("for: ")
for i in range(10):
    print(i, end=' ')