% dodaje element na pocetak  liste
dodajPocetak(X, L, [X|L]).

% dodaje element na kraj liste
dodajKraj(X, [], [X]).
dodajKraj(X, [G|R], [G|LR]):- dodajKraj(X, R, LR).

% brise prvi element liste 
% za praznu listu ce uvek vratiti no jer ne moze unifikovati sa sablonom [G|R], a mozemo napraviti i sami za taj slucaj da je predikat netacan 
% fail je uvek netacan pa ce nam ovako definisan predikat za slucaj prazne liste vratiti no
obrisiPrvi([], _):- fail. 
obrisiPrvi([_|R], R).

% brise poslednji element liste
obrisiPoslednji([],_):- fail.
% bitan cut operator jer se jednoclana moze upariti sa sablonom [G|R]
obrisiPoslednji([_],[]):- !.
obrisiPoslednji([G|R], [G|R1]):- obrisiPoslednji(R, R1). 

% brise element X iz liste ako postoji (svako pojavljivanje elementa X)
obrisi(_, [], []).
obrisi(X, [X|R], R1):- obrisi(X, R, R1), !.
obrisi(X, [G|R], [G|R1]):- G \== X, obrisi(X, R, R1).

% brise element X iz liste ako postoji (samo prvo pojavljivanje elementa X)
obrisiPrvo(X, [], []).
obrisiPrvo(X, [X|R], R):- !.
obrisiPrvo(X, [G|R], [G|R1]):- G \== X, obrisiPrvo(X, R, R1).

% brise K-ti element liste, brojimo od 1, ako je K vece od duzine liste, treci argument je jednak prvom 
obrisiK([], K, []):- K > 0.
obrisiK([G|R], 1, R):- !.
obrisiK([G|R], K, [G|R1]):- K>1, K1 is K-1, obrisiK(R, K1, R1).

% druga varijanta predikata: brise K-ti element liste, broji od 1, ali ukoliko zadata lista nema K-ti element, predikat vraca no kao odgovor i nema unifikacije za treci argument  
% obrisiK([], K, []):- fail.
% obrisiK([G|R], 1, R):- !.
% obrisiK([G|R], K, [G|R1]):- K>1, K1 is K-1, obrisiK(R, K1, R1).

