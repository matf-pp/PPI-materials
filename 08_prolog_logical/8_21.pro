% pomocni predikat za proveru pripadnosti elementa listi
sadrzi(X, [X|_]):- !.
sadrzi(X, [G|R]):- G \== X, sadrzi(X, R).

% izbacivanje duplikata iz liste
duplikati([], []).
duplikati([G|R], [G|R1]):- not(sadrzi(G, R)), duplikati(R,R1), !.
duplikati([_|R], R1):- duplikati(R,R1).

% pomocni predikat za spajanje dve liste
spoji([], L, L).
spoji([G|R1], L2, [G|R3]):- spoji(R1, L2, R3).

% unija listi - jedna ideja: spajamo liste pa uklanjamo duplikate
% za vezbu implementirati ovaj predikat tako da se duplikati uklanjaju pri samom spajanju listi
unija(L1, L2, L):- spoji(L1, L2, L3), duplikati(L3, L).

% presek listi
presek([], _, []).
presek([G|R1], L2, [G|R3]):- sadrzi(G, L2), presek(R1, L2, R3), !.
presek([_|R1], L2, L):- presek(R1, L2, L).

% razlika listi L1 i L2
razlika([], _, []).
razlika([G1|R1], L2, R3):- sadrzi(G1, L2), razlika(R1, L2, R3), !.
razlika([G|R1], L2, [G|R3]):- razlika(R1, L2, R3).
