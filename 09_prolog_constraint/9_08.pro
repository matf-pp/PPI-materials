% A1, B1, C1, D1, E1 predstavljaju brojeve na glavnoj dijagonali 
% A2, B2, C1, D2, E2 predstavljaju brojeve na glavnoj dijagonali  
dijagonale(Vars):- Vars=[A1,B1,C1,D1,E1,A2,B2,D2,E2],
		% domen za sve je isti
		Vars :: 1..9,
		% uslov razlicitosti 
		alldifferent(Vars),
		% uslovi za zbirove 
		A1+B1+C1+D1+E1#=25,
		A2+B2+C1+D2+E2#=25,
		% uslovi za poredak
		A1#<B1, B1#<C1, C1#<D1, D1#<E1, 
		A2#<B2, B2#<C1, C1#<D2, D2#<E2, 
    		labeling(Vars),
		write(A1), write('     '), write(A2), nl,
		write(' '), write(B1), write('   '), write(B2), nl,
		write('   '), write(C1), nl,
		write(' '), write(D2), write('   '), write(D1), nl,
		write(E2), write('     '), write(E1), nl.
