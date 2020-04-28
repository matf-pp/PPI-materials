/*

Insertion sort algoritam se zasniva na ubacivanju redom svakog elementa liste na svoje pravo
mesto. 

IH (Induktivna hipoteza) – umemo da sortiramo listu od n-1 elementa. 
IK (Induktivni korak) – n-ti element ubacujemo na odgovarajucu lokaciju.

*/
insertionSort([], []).
insertionSort([G|R], SL):- insertionSort(R, S1), ubaciS(G, S1, SL).

% ubacuje sortirano element X u listu 
ubaciS(X, [], [X]).

% ubaciS(X, [G|R], [X, G|R]):- X=<G.
% ubaciS(X, [G|R], [G|SL]):- X>G, ubaciS(X, R, SL).
/*
 alternativno sa cut operatorom ne moramo
 da pisemo X>G u drugom predikatu, jer 
 kada stavimo cut operator kod prvog, cim 
 on uspe drugi predikat se nece ni pokusavati
*/
ubaciS(X, [G|R], [X, G|R]):- X=<G, !.
ubaciS(X, [G|R], [G|SL]):- ubaciS(X, R, SL).

/*

Merge sort algoritam se zasniva na dekompoziciji. Naime, ulaznu listu delimo na dva jednaka
dela, te delove sortiramo i posle toga ih objedinjujemo. 

IH – umemo da sortiramo liste velicine n/2. 
IK – u linearnom vremenu objedinjujemo dve sortirane liste od po n/2 elemenata.

*/
mergeSort([], []).
mergeSort([X], [X]).
mergeSort(N, SL):- podeli(N, L, R),
		 mergeSort(L, L1),
		 mergeSort(R, R1),
		 objedini(L1, R1, SL).

% delimo tako sto prvi element stavljamo u prvu particiju
% drugi u drugu pri cemu su particije dobijene
% vec rekurzivno podelom repa
podeli([], [], []).
podeli([X], [X], []):- !.
podeli([G1, G2|R], [G1|R1], [G2|R2]):- podeli(R, R1, R2).

/*
Primer: ako objedinjujemo [1,3,5,7] i [5,6,7,8,9] znamo da 1 prethodi svima pa mozemo rekurzivno da objedinimo [3,5,7] sa [5,6,7,8,9] i dodamo 1 na pocetak tako objedinjene liste
*/
objedini(L, [], L).
objedini([], L, L).
objedini([G1|R1], [G2|R2], [G1|R]):- G1<G2, objedini(R1, [G2|R2], R), !.
objedini([G1|R1], [G2|R2], [G2|R]):- G1>=G2, objedini([G1|R1], R2, R).

