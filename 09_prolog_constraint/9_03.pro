% promenljive oznacavaju broj novcica u kombinaciji redom za A - 1 din, B - 2 din, C - 5 din, D - 10 din, E - 20 din.
kombinacije(Vars) :- Vars = [A,B,C,D,E],
		% definisemo domen
		A :: 1..50,		
		B :: 1..25,
		C :: 1..10,
		D :: 1..5,
		E :: 1..2,
		% dodajemo uslov
		A+2*B+5*C+10*D+20*E #= 50,
		labeling(Vars),
		% ispisujemo resenje 		
		write(A+2*B+5*C+10*D+20*E = 50), nl.		




		
