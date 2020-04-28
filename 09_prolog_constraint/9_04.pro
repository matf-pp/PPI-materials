magicni(Vars):- Vars=[X1,X2,X3,X4,X5,X6,X7,X8,X9],
		% domen za sve je isti
		Vars :: 1..9,
		% uslov razlicitosti
		alldifferent(Vars),
		% uslovi za zbirove
		X1+X2+X3#=15,
		X4+X5+X6#=15,
		X7+X8+X9#=15,
    		X1+X4+X7#=15,
    		X2+X5+X8#=15,
    		X3+X6+X9#=15,
    		X1+X5+X9#=15,
    		X3+X5+X7#=15,
    		labeling(Vars),
		write(X1), write(' '), write(X2), write(' '), write(X3), nl,
		write(X4), write(' '), write(X5), write(' '), write(X6), nl,
		write(X7), write(' '), write(X8), write(' '), write(X9), nl.
/*
| ?- magicni(Vars).
2 7 6
9 5 1
4 3 8
Vars = [2,7,6,9,5,1,4,3,8] ?;
2 9 4
7 5 3
6 1 8
Vars = [2,9,4,7,5,3,6,1,8] ?;
4 3 8
9 5 1
2 7 6
...
*/
