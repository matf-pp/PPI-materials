import json
# json.load(f) ucitava iz datoteke string koji sadrzi
# JSON format objekta i vraca referencu na mapu koja
# je konstruisana na osnovu .json datoteke.
print("\n-----Ucitavanje objekta iz datoteke-----\n")
f = open("dat4.json","r")
x = json.load(f)
print(x['Ime'])
print(x['Prezime'])
print(x['Godine'])
f.close()
