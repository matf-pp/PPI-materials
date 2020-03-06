import os

print("\n-----Regularni fajlovi zadatog direktorijuma-----\n")
for ime in os.listdir(os.curdir):
    # Funkcija 'join' vrsi konkatenaciju putanja koristeci sistemski separator
    if os.path.isfile(os.path.join(os.curdir, ime)):
        print(os.path.abspath(os.path.join(os.curdir, ime)))
