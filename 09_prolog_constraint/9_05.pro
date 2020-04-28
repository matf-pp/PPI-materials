pronadji(Vars):- Vars=[X,Y,Z],
		% definisemo domen
		X :: 1..90,
		Y :: 2..2..60,
		Z :: 1..10..100,
		% definisemo ogranicenja
		Z #=< X,
		2*X+Y*X+Z #=< 34,
		% instanciramo promenljive
		labeling(Vars).
		
/*
| ?- pronadji(Vars) 
Vars = [1,2,1] ?;
Vars = [1,4,1] ?;
Vars = [1,6,1] ?;
Vars = [1,8,1] ?;
Vars = [1,10,1] ?;
...

*/

