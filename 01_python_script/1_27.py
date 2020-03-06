"""
    Python klase. Uvod. Konstruktor. Instanciranje. self promenljiva.
"""
class Stek:

    # konstruktor
    def __init__(self):
        self.stek = []
        
    def push(self, elem):
        self.stek.append(elem)

    def pop(self):
        try:
            return self.stek.pop()
        except IndexError:
            print("Stek prazan, nemoguce izvesti pop.")
            return None

    def peek(self):
        try:
            return self.stek[-1]
        except IndexError:
            print("Stek prazan, nemoguce izvesti peek.")
            return None

s = Stek()
s.push(1)
s.push(2)
s.push(3)
print(s.peek())
print(s.pop())
print(s.pop())
print(s.pop())
print(s.pop())
print(s.peek())
