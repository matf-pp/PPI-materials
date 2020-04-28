% potreban nam je dodatni predikat za izdvajanje poslednjeg elementa liste
izdvojPoslednji([G], G, []):- !.
izdvojPoslednji([G|R], X, [G|R1]):- izdvojPoslednji(R, X, R1).

% formira broj od date liste cifara
pretvori([], 0):- !.
pretvori(L, X):- izdvojPoslednji(L, Poslednji, Ostatak), 
		pretvori(Ostatak, Y),
		X is Poslednji + 10 * Y. 

/*
| ?- pretvori([7,0,7], X)
X = 707
yes
| ?- pretvori([0,2,3], X)
X = 23
yes
| ?- pretvori([], X)     
X = 0
yes

*/
