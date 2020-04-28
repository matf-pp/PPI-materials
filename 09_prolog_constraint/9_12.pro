/*

Kraljica se moze pomerati u pravoj liniji vertikalno, horizontalno ili dijagonalno, za bilo koliko slobodnih polja. Resenje zahteva da nikoje dve dame ne dele istu vrstu, kolonu ni dijagonalu. Problem je opstiji od poznatog problema osam sahovskih dama jer u ovom problemu treba N dama postaviti na sahovsku tablu dimenzije NxN koje se zadaje kao ulazni podatak.
 
*** U resenju se koristi petlja FOREACH. Opsti oblik:

	foreach(E1 in D1, . . ., En in Dn, LocalVars, Goal)

- Ei - moze biti bilo koji term, najcesce promenljiva
- Di – lista ili opseg celih brojeva oblika L..R (L i R su ukljuceni)
- LocalVars (opciono) – lista lokalnih promenljivih
- Goal – predikat koji se poziva

Primeri:

| ?- foreach(I in [1,2,3], write(I))
123
yes

Domen za X i Y u ovom slucaju mora biti iste kardinalnosti
| ?- foreach((X,Y) in ([a,b], 1..2), writeln(X==Y))
a==1
b==2
yes

| ?- foreach(X in [a,b], Y in [1,2], writeln(X==Y))
a==1
a==2
b==1
b==2
yes
*/

% Indeksi niza Qs I i J predstavljaju kolone u kojima su kraljice, a elementi niza Qs[I] i Qs[J] predstavljaju vrste u kojima se nalaze kraljice
kraljice(N):- length(Qs,N), 	% Qs je niz, tj. lista od n promenljivih
		Qs :: 1..N,	
% I je implicitno razlicito od J -> razlicite kolone
% Qs[I] treba da bude razlicito od Qs[J] -> razlicite vrste
% apsolutna vrednost razlike vrsta treba da bude razlicita od apsolutne vrednosti razlike kolona -> razlicite dijagonale
		foreach(I in 1..N-1, J in I+1..N, 
		(Qs[I] #\= Qs[J], abs(Qs[I]-Qs[J]) #\= J-I)), 
		labeling(Qs),
		writeln(Qs), fail. 
% stavljanjem predikata fail na kraj, dobicemo sve moguce kombinacije za kraljice
% bez fail, program staje posle prvog pronadjenog rezultata 
