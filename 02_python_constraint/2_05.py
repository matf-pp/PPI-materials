# X,Y,Z
#
# X >= Z
# X*2 + X*Y + Z <= 34
#
# X <- {1,2,3,...90}
# Y <- {2,4,6,...60}
# Z <- {1,4,9,16,...100}
#

import constraint

problem = constraint.Problem()

# Dodajemo promenljivu X i definisemo njen domen
problem.addVariable('X', range(1,91))

# Dodajemo promenljivu Y i definisemo njen domen
problem.addVariable('Y', range(2,61,2))

domenZ = [];
for i in range(1,11):
    domenZ.append(i*i)

# Dodajemo promenljivu Z i definisemo njen domen
problem.addVariable('Z', domenZ)

def o1(x,z):
    if x >= z:
        return True

def o2(x,y,z):
    if x*2 + x*y + z <= 34:
        return True;

# Dodajemo ogranicenja
problem.addConstraint(o1, 'XZ')
problem.addConstraint(o2, 'XYZ')

resenja = problem.getSolutions()

for r in resenja:
    print("------------------------")
    print("X = {0:d} , Y = {1:d} , Z = {2:d}".format(r['X'],r['Y'],r['Z']))
print("------------------------")
