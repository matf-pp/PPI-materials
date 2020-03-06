
import constraint

def o1(x,y,z):
    if x+y+z == 38:
        return True
def o2(x,y,z,w):
    if x+y+z+w == 38:
        return True
def o3(x,y,z,w,h):
    if x+y+z+w+h == 38:
        return True

problem = constraint.Problem()
problem.addVariables("ABCDEFGHIJKLMNOPQRST", range(1,38))
problem.addConstraint(constraint.AllDifferentConstraint())
# Dodajemo ogranicenja za svaku horizontalnu liniju
#  A,B,C
# D,E,F,G
#H,I,J,K,L
# M,N,O,P
#  Q,R,S
problem.addConstraint(o1,"ABC")
problem.addConstraint(o2,"DEFG")
problem.addConstraint(o3,"HIJKL")
problem.addConstraint(o2,"MNOP")
problem.addConstraint(o1,"QRS")

# Dodajemo ogranicenja za svaku od glavnih dijagonala 
#  A,B,C
# D,E,F,G
#H,I,J,K,L
# M,N,O,P
#  Q,R,S

problem.addConstraint(o1,"HMQ")
problem.addConstraint(o2,"DINR")
problem.addConstraint(o3,"AEJOS")
problem.addConstraint(o2,"BFKP")
problem.addConstraint(o1,"CGL")

# Dodajemo ogranicenja za svaku od sporednih dijagonala 
#  A,B,C
# D,E,F,G
#H,I,J,K,L
# M,N,O,P
#  Q,R,S

problem.addConstraint(o1,"ADH")
problem.addConstraint(o2,"BEIM")
problem.addConstraint(o3,"CFJNQ")
problem.addConstraint(o2,"GKOR")
problem.addConstraint(o1,"LPS")

resenja = problem.getSolutions()
for r in resenja:
    print(" -----------------")
    print("  {0:d},{1:d},{2:d}".format(r['A'],r['B'],r['C']))
    print(" {0:d},{1:d},{2:d},{3:d}".format(r['D'],r['E'],r['F'],r['G']))
    print("{0:d},{1:d},{2:d},{3:d},{4:d}".format(r['H'],r['I'],r['J'],r['K'],r['L']))
    print(" {0:d},{1:d},{2:d},{3:d}".format(r['M'],r['N'],r['O'],r['P']))
    print("  {0:d},{1:d},{2:d}".format(r['Q'],r['R'],r['S']))
    print(" -----------------")
