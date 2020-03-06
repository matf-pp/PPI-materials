import json

def cena_voca(prodavnica, ime_voca):
	for voce in prodavnica:
		if voce['ime'] == ime_voca:
			return voce['cena']

# Ucitavamo podatke iz datoteka
f = open('korpa.json', "r")
korpa = json.load(f)
f.close()

f = open('maxi_cene.json', "r")
maxi_cene = json.load(f)
f.close()

f = open('idea_cene.json', "r")
idea_cene = json.load(f)
f.close()

f = open('shopngo_cene.json', "r")
shopngo_cene = json.load(f)
f.close()

maxi_racun = 0
idea_racun = 0
shopngo_racun = 0
i = 0
# Za svako voce u korpi dodajemo njegovu cenu u svaki racun posebno
while i < len(korpa):
    ime_voca = korpa[i]['ime']
    maxi_racun = maxi_racun + korpa[i]['kolicina']*cena_voca(maxi_cene, ime_voca)
    idea_racun = idea_racun + korpa[i]['kolicina']*cena_voca(idea_cene, ime_voca)
    shopngo_racun = shopngo_racun + korpa[i]['kolicina']*cena_voca(shopngo_cene, ime_voca)
    i += 1

print("Maxi: " + str(maxi_racun) + " dinara")
print("Idea: " + str(idea_racun) + " dinara")
print("Shopngo: " + str(shopngo_racun) + " dinara")
