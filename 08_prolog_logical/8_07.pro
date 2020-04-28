/*
Lista - niz uredjenih elemenata, tj. termova.
Lista moze biti:
	[] - prazna 
	.(G,R) - struktura, gde je G ma koji term i naziva se glava liste, a R lista i naziva se rep liste

Primeri:
	[] - prazna
	.(a, []) - jednoclana lista, gde je a bilo koji term 
	.(a, .(b, [])) - dvoclana lista, gde su a i b termi ...

Zapis pomocu zagrada (prvi element predstavlja glavu, a ostali cine listu koja je rep):
	[a,b,c] <=> .(a, .(b, [c])) 

Zapis liste u kom su jasno razdvojeni glava i rep (pogodan za unifikaciju): [G|R].

Primeri unifikacije listi:
[X, Y, Z]	[jabuka, kruska, banana]  -----> X = jabuka, Y = kruska, Z = banana
[racunar]	[X|Y]                     -----> X = racunar, Y = []
[maja, ana, jovana]	[X, Y|Z]          -----> X = maja, Y = ana, Z = [jovana]	  
	
*/

% predikat proverava da li element pripada listi (ako joj pripada jednak je glavi ili nekom elementu iz repa liste)
sadrzi(X, [X|_]):- !.
sadrzi(X, [G|R]):- G \== X, sadrzi(X, R).

% drugi nacin, predikat kao disjunkcija:
% sadrzi(X, [G|R]):- G == X; sadrzi(X, R).

% predikat koji racuna duzinu liste (prazna je duzine nula, nepraznu dekomponujemo na glavu i rep, pa je duzina liste = 1 + duzina repa)
duzina([], 0).
duzina([G|R], L):- duzina(R,L1), L is L1+1. 

% predikat racuna sumu elemenata liste brojeva
suma([], 0).
suma([G|R], S):- number(G), suma(R, S1), S is S1+G.

% predikat racuna aritmeticku sredinu elemenata liste brojeva
arsr([],0).
% ako ne koristimo sablon za nepraznu listu [G|R], moramo proveriti da li je K nula jer se sada L moze unifikovati sa []
arsr(L, A):- duzina(L, K), K =\= 0, suma(L, S), A is S/K. 

% predikat ucitava listu duzine N ciji elementi mogu biti proizvoljni termovi 
% za negativno N ne ucitava listu
ucitaj(N,_) :- N < 0, !.
% za nulu vraca praznu listu
ucitaj(0, []).
% read(X) ucitanu vrednost sa ulaza dodeljuje promenljivoj X
% ako je N > 1, lista ima glavu i rep, ucitamo glavu, pa pozovemo predikat za ucitavanje repa 
ucitaj(N, [G|R]):- N >= 1, write('unesi element '), read(G), nl, M is N-1, ucitaj(M,R). 

/*
prilikom unosa vrednosti obavezna je tacka kao oznaka kraja ulaza za read
| ?- ucitaj(3,L)
unesi element | 5.

unesi element | 4.

unesi element | 3.

L = [5,4,3]
yes

| ?- ucitaj(3,L)
unesi element | [1,2,3].

unesi element | 4.

unesi element | [].

L = [[1,2,3],4,[]]
yes

*/
