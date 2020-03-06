import json
from functools import reduce

def cena_voca(prodavnica, ime_voca): # [{"ime" :"jabuke", "cena" : 69.9},...], "jabuke"
	for voce in prodavnica:
		if voce['ime']==ime_voca:
			return voce['cena']
			
# Ucitavam podatke
try:
	with open('korpa.json', 'r') as f:  # [ {"ime" : "jabuke" ,"kolicina": 3.3},...]
		korpa = json.load(f)
	with open('maxi_cene.json', 'r') as f:
		maxi_cene = json.load(f)
	with open('idea_cene.json', 'r') as f:
		idea_cene = json.load(f)
	with open('shopngo_cene.json', 'r') as f:
		shopngo_cene = json.load(f)
except IOError:
	print("Error: open json file")
	exit(1)

maxi_racun = reduce(lambda a, b: a+b, [voce['kolicina']*cena_voca(maxi_cene, voce['ime']) for voce in korpa])
idea_racun = reduce(lambda a, b: a+b, [voce['kolicina']*cena_voca(idea_cene, voce['ime']) for voce in korpa])
shopngo_racun = reduce(lambda a, b: a+b, [voce['kolicina']*cena_voca(shopngo_cene, voce['ime']) for voce in korpa])

print("Racuni u prodavnicama: ")
print("Maxi: " + str(maxi_racun) + " dinara")
print("Idea: " + str(idea_racun) + " dinara")
print("Shopngo: " + str(shopngo_racun) + " dinara")
	
	