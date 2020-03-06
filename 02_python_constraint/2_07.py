# Dati sistem nejednacina nema resenje, tj. metog getSolutions() vraca praznu listu
# Ukoliko se za promenljivu W domen promeni na {1,...,100} sistem ce imati resenje
import constraint

problem = constraint.Problem()

# Dodajemo promenljivu X i definisemo njen domen
problem.addVariable('X', range(1,11))

# Dodajemo promenljivu Y i definisemo njen domen
problem.addVariable('Y', range(1,52,2))

domenZ = []
domenW = []

for i in range(1,11):
    domenZ.append(i*10)
    domenW.append(i**3)

# Dodajemo promenljivu Z i definisemo njen domen
problem.addVariable('Z', domenZ)

# Dodajemo promenljivu W i definisemo njen domen
problem.addVariable('W', domenW)

# Za ovako definisan domen za promenljivu W sistem ce imati resenje
# problem.addVariable('W', range(1,101))


def o1(x,w):
    if x >= 2*w:
        return True

def o2(y,z):
    if 3 + y <= z:
        return True

def o3(x,y,z,w):
    if x - 11*w + y + 11*z <= 100:
        return True;

# Dodajemo ogranicenja
problem.addConstraint(o1, 'XW')
problem.addConstraint(o2, 'YZ')
problem.addConstraint(o3, 'XYZW')

resenja = problem.getSolutions()
# Proveravamo da li postoji resenje za sistem nejednacina
if resenja==[]:
    print("Sistem nema resenje.")
else:
    for r in resenja:
        print("------------------------")
        print("X = {0:d} , Y = {1:d} , Z = {2:d}, W = {3:d}".format(r['X'],r['Y'],r['Z'], r['W']))
        print("------------------------")
