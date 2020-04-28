% poredjenjem glava listi zakljucujemo u kom redosledu dodajemo elemente u spojenu listu
spoji([], L, L):- !.
spoji(L, [], L):- !.
spoji([G1|R1], [G2|R2], [G1|R]):- G1<G2, spoji(R1, [G2|R2], R), !.
spoji([G1|R1], [G2|R2], [G2|R]):- G1>=G2, spoji([G1|R1], R2, R). 
