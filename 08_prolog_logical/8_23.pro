/*
resenje je lista L sa 5 struktura oblika: d(ime, prezime, godine)
*/

% predikat kojim se proverava da li je X clan liste
clan(X, [X|_]).
clan(X, [_|R]):- clan(X,R).
% predikat smesta u listu L decu koja zadovoljavaju uslove iz teksta
% redosled dece u resenju nije bitan 
% direktno u listi mozemo naznaciti ili broj godina, ili data imena ili data prezimena, ovde su izabrane godine, a ostale informacije dodate preko predikata clan
deca(L):- L = [d(_,_,2), d(_,_,3), d(_,_,4), d(_,_,5), d(_,_,6)],
		clan(d(lazar,jankovic,_),L),
		clan(d(kata,_,G1),L),
		clan(d(_,ivanovic,G2),L),
		clan(d(nevenka,_,G3),L),
		clan(d(_,filipovic,G4),L),
		clan(d(marko,_,G5),L),
		clan(d(ognjen,_,G6),L),
		clan(d(_,hadzic,G7),L),
		clan(d(_,grbovic,_),L),
		% medju informacijama imamo odnos izmedju broja godina odredjene dece, ali ne znamo tacno koliko godina imaju ta deca, zbog toga koristimo promenljive kojima opisujemo date relacije, obratiti paznju da je potrebno koristiti aritmeticko poredjenje =:=, a ne poredjenje na identicnost (==), jer ne zelimo da se porede termovi oblika Gi i Gj+N vec njihove brojevne vrednosti prilikom izgradjivanja resenja
		G1=:=G2+1, G2=:=G3+1, G4=:=G5+3, G6=:=2*G7.

/*
resenje:

| ?- deca(L)     
L = [d(marko,hadzic,2),d(nevenka,grbovic,3),d(ognjen,ivanovic,4),d(kata,filipovic,5),d(lazar,jankovic,6)] ?yes


*/
