/*
strukturama oblika k(boja, nacionalnost, jelo, pice, kucniLjubimac) opisujemo date cinjenice, a u listi L su kuce poredjane jedna pored druge, tako da po redosledu u listi imamo informaciju da li je kuca desno od neke druge kuce i da li su kuce jedna pored druge
*/

/*
pomocni predikat koji proverava da li je X clan liste, njemu prosledjujemo strukturu k sa poznatim vrednostima iz teksta i opisujemo kakva kuca treba da bude u listi
*/
clan(X, [X|_]).
clan(X, [_|R]):- clan(X,R).

% predikat smesta u listu L kuce koje zadovoljavaju uslove iz teksta, tj. predikat L unifikuje sa resenjem zagonetke
% u listu ubacujemo cinjenice koje su vezane za raspored kuca i to samo one koje jednoznacno odredjuju poziciju kuce u listi 
kuce(L):- L = [ k(_,norvezanin,_,_,_),
		k(plava,_,_,_,_),
		k(_,_,_,mleko,_),
		k(_,_,_,_,_),
		k(_,_,_,_,_) ],
		% dodajemo kakve sve kuce treba da budu u listi
		clan(k(crvena, englez,_,_,_),L),
		clan(k(_, spanac,_,_,pas),L),
		clan(k(zelena,_,_,kafa,_),L),
		clan(k(_, ukrajinac,_,caj,_),L),
		% kada informacija daje relaciju za neke dve kuce iz liste koristimo predikate desno i pored 
		desno(k(zelena,_,_,kafa,_),k(bela,_,_,_,_),L),
		clan(k(_,_,spagete,_,puz),L),
		clan(k(zuta,_,pica,_,_),L),
		pored(k(_,_,piletina,_,_),k(_,_,_,_,lisica),L),
		pored(k(_,_,pica,_,_),k(_,_,_,_,konj),L),
		clan(k(_,_,brokoli,narandza,_),L),
		clan(k(_,japanac,susi,_,_),L),
		% medju datim informacijama se ne pominje zebra niti voda, ali posto je krajnje pitanje vezano za ove pojmove, moramo dodati da takvi clanovi treba da postoje u resenju zagonetke
		clan(k(_,_,_,_,zebra),L),
		clan(k(_,_,_,voda,_),L).

% proverava da li su kuce X i Y jedna pored druge u listi L
pored(X,Y,[X,Y|_]).
pored(X,Y,[Y,X|_]).
pored(X,Y,[_|R]):- pored(X,Y,R).

% proverava da li je kuca X desno od kuce Y u listi L
desno(X,Y,[Y,X|_]).
desno(X,Y,[_|R]):- desno(X,Y,R).

% predikat zagonetka daje odgovor na pitanje cija je zebra, a ko pije vodu, tako sto prvo trazi resenje zagonetke pa iz njega izdvaja samo potrebne clanove 
zagonetka(X,Y):- kuce(L), clan(k(_,X,_,_,zebra),L), clan(k(_,Y,_,voda,_),L) .

/*
resenje:

| ?- kuce(L)    
L = [k(zuta,norvezanin,pica,voda,lisica),k(plava,ukrajinac,piletina,caj,konj),k(crvena,englez,spagete,mleko,puz),k(bela,spanac,brokoli,narandza,pas),k(zelena,japanac,susi,kafa,zebra)] 

odgovor na pitanje:

| ?- zagonetka(X,Y)
X = japanac
Y = norvezanin 

*/

