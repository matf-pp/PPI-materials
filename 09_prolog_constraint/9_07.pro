pronadji(Vars):- Vars=[X,Y,Z,W],
		% definisemo domen
		X :: 1..10,
		Y :: 1..2..51,
		Z :: 10..10..100,
		W :: 1..7..1002,
		% definisemo ogranicenja
		2*W #=< X,
		3+Y #=< Z,
		X-11*W+Y+11*Z #=< 100,
		% instanciramo promenljive
		labeling(Vars).
/*
Ovo je primer sistema nejednacina bez resenja:

| ?- pronadji(Vars)
no

*/

