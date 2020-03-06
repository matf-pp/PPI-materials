"""
    Python klase. Destruktor, promenljive.
"""
class Robot:
    """Predstavlja robota sa imenom."""

    # Mozemo pristupiti dokumentaciji preko __doc__() metoda
    
    populacija = 0  # klasna promenljiva

    def __init__(self, name):
        """Konstruktor."""
        self.name = name
        Robot.populacija += 1
        print(f"{self.name} je kreiran!")

    def __del__(self):
        """Destruktor."""
        print(f"{self.name} se unistava!")
        Robot.populacija -= 1

    def oglasi_se(self):
        """Oglasavanje za trenutnog robota."""
        print(f"Zdravo, moje ime je {self.name}.")

    @classmethod
    def koliko(cls):
        """Ispisuje broj trenutno aktivnih robota."""
        print(f"Imamo {cls.populacija} aktivnih robota.")

    # postoji i @staticmethod, takve funkcije nemaju parametre
    # koriste se kada nije potrebno da metod pristupa atributima klase


droid1 = Robot("R2-D2")
droid1.oglasi_se()
Robot.koliko()

droid2 = Robot("C-3PO")
droid2.oglasi_se()
Robot.koliko()

print("\nRoboti rade posao ovde...\n")

print("Roboti su zavrsili posao. Obrisimo ih.")
del droid1
del droid2

Robot.koliko()

# REFERENCE:
# https://python.swaroopch.com/oop.html
