/*

Programiranje ogranicenja nad konacnim domenom:
1) generisanje promenljivih i njihovih domena
2) generisanje ogranicenja nad promenljivima
3) instanciranje promenljivih ili obelezavanje

Definisanje domena (D) promenljivih:
-- X in D ili X :: D -> promenljiva X uzima samo vrednosti iz konacnog domena D
-- Vars in D ili Vars :: D -> sve promenjive iz liste Vars uzimaju samo vrednosti iz konacnog domena D
Domen se definise kao interval u obliku Pocetak..Korak..Kraj (Korak je opcion i ukoliko se ne navede, podrazumeva se da je Korak = 1)
Primeri za domen: 
1..10  -> 1,2,3,4,5,6,7,8,9,10
1..2..10 -> 1,3,5,7,9	

Osnovni predikati za ogranicenja

1) opsta: 
-- alldifferent(Vars) ili alldistinct(Vars) - sve vrednosti razlicite u listi termova Vars
-- atmost(N,L,V) - najvise N elemenata iz skupa L jednako sa V (N mora biti Integer, V term, a L lista termova) 
-- atleast(N,L,V) - najmanje N elemenata iz skupa L jednako sa V (N mora biti Integer, V term, a L lista termova) 
-- excatly(N,L,V) - tacno N elemenata iz skupa L jednako sa V (N mora biti Integer, V term, a L lista termova) 

2) aritmeticka:
-- E1 R E2 gde su E1 i E2 aritmeticki izrazi, a R iz skupa {#=, #\=, #>=, #>, #=<, #<}
-- min(L) - minimalni element iz liste termova L
-- max(L) - maksimalni element iz liste termova L
-- max(E1, E2)/min(E1, E2) -- manji/veci od izraza E1 i E2
-- sum(L) - suma elemenata liste termova L	

Instanciranje i prikazivanje promenljivih: labeling(Vars).
Funkcija labeling se moze pozvati i sa razlicitim opcijama u obliku labeling(Options, Vars)
gde je Options lista opcija. Ukoliko se pozove sa labeling(Vars), podrazumevano je Options = []. Neke od opcija:
-- minimize(E) - trazi instance za Vars pri kojima je vrednost celobrojnog izraza E minimalna
-- maximize(E) - trazi instance za Vars pri kojima je vrednost celobrojnog izraza E maksimalna
 	
*/

/*
Primer: X pripada skupu {1,2,3}, Y skupu {2,4,6,8,10}, Z skupu {5,6,7,8} i vazi Z>=Y   
*/

primer(Vars) :- Vars = [X, Y, Z],	% generisanje promenljivih 
		X :: 1..3,		% definisanje domena
		Y :: 2..2..10,
		Z :: 5..8,
		Z #>= Y,		% ogranicenje
		labeling(Vars).		% instanciranje

/*
| ?- primer(Vars).
Vars = [1,2,5] ?;
Vars = [1,2,6] ?;
Vars = [1,2,7] ?;
Vars = [1,2,8] ?;
Vars = [1,4,5] ?;
Vars = [1,4,6] ?;
Vars = [1,4,7] ?;
Vars = [1,4,8] ?;
Vars = [1,6,6] ?;
Vars = [1,6,7] ?;
Vars = [1,6,8] ?;
Vars = [1,8,8] ?;
...
*/

/*
Primer: ispisati sve brojeve od 1..100 koji su puni kvadrati 
 */

puni(Vars) :- Vars = [X],
           Vars :: 1..100,
           Y*Y #= X ,
           labeling(Vars).

/*
| ?- puni(Vars)    
Vars = [1] ?;
Vars = [4] ?;
Vars = [9] ?;
Vars = [16] ?;
Vars = [25] ?;
Vars = [36] ?;
Vars = [49] ?;
Vars = [64] ?;
Vars = [81] ?;
Vars = [100] ?;
no

*/
