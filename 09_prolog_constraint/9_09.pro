/* 
 H - broj komada hleba, K - broj komada kifli 

 H>=0
 K>=0

 S obzirom na to da imamo 20kg brasna na raspolaganju, mozemo napraviti:
 - najvise 20000/120 kifli
 - najvise 20000/300 hleba

 K <= 20000/120 ~ 166
 H <= 20000/300 ~ 66

 S obzirom na to da imamo 20h na raspolaganju, mozemo napraviti:
 - najvise 1200/12 kifli
 - najvise 1200/10 hleba

 H <= 1200/10 = 120
 K <= 1200/12 = 100

 najoptimalnije je za gornju granicu domena postaviti minimum od dobijenih vrednosti, tj. sve ukupno H <= 66, K <= 100

*/

pekara(Vars) :- Vars = [H, K],
		H :: 0..66,
		K :: 0..100, 

/*
 Ogranicenja vremena:
 - vreme potrebno za mesenje jednog hleba je 10 min,
   tj. za mesenje H komada hleba potrebno je 10*H minuta
 - vreme potrebno za mesenje jedne kifle je 12 min,
   tj. za mesenje K komada kifli potrebno je 12*K minuta

 Ukupno vreme koje je na raspolaganju iznosi 20h, tako da je:
 10*H + 12*K <= 1200
*/

		10*H + 12*K #=< 1200,

/*
 Ogranicenje materijala:
 - za jedan hleb potrebno je 300g brasna, a za H komada hleba potrebno je H*300 grama
 - za jednu kifli potrebno je 120g brasna, a za K komada kifli potrebno je K*120 grama

 Ukupno, na raspolaganju je 20kg brasna, tako da je:
 300*H + 120*K <= 20000
*/
		300*H + 120*K #=< 20000,


/*
 Zarada iznosi:
 - 7din/hleb, tj. zarada za H komada hleba bice 7*H
 - 9din/kifla tj. zarada za K komada kifli bice 9*K

 Ukupna zarada iznosi:
 7*H + 9*K - funkcija koju treba maksimizovati - ovo dodajemo prilikom obelezavanja
*/
		labeling([maximize(7*H+9*K)], Vars),
		Zarada is 7*H+9*K,
		write('Maksimalna zarada od '), write(Zarada), write(' dinara se ostvaruje za '),
		write(H), write(' komada hleba i '), write(K), write(' komada kifli.'), nl.
