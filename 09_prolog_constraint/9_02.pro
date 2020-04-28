% funkciji labeling prosledjujemo zahtev za minimizaciju trazenog izraza u listi
petocifren :- 	Vars = [A,B,C,D,E],
		% definisemo domen
		A :: 1..9,		
		B :: 0..9,
		C :: 0..9,
		D :: 0..9,
		E :: 0..9,
		% dodajemo uslov
		alldifferent(Vars),
		% prilikom obelezavanja prosledjujemo i uslov minimizacije
		labeling([minimize(A+2*B-3*C+4*D-5*E)],Vars),
		% prevodimo dobijene vednosti u broj
		Broj is 10000*A+1000*B+100*C+10*D+E,
		% ispisujemo resenje 		
		write(Broj), nl.		

		
