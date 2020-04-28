/*
kompanija ima 250 zaposlenih radnika 
za sve njih organizuje dodatnu obuku 
ako je E promenjiva za Elixir, a D za Dart
mora da vazi (gruba procena) E<=250, D<=250 i E + D = 250
*/

kompanija(Vars) :- Vars = [E, D],
		Vars :: 0..250,

		% dodajemo uslov za ukupan broj radnika
		E+D#=250,

		% dodajemo ogranicenje za broj projekat sati
		150*E+170*D#=<51200,

		% dodajemo ogranicenje za raspoloziva sredstva
		100*E+105*D#=<26000,

/*
ukupna zarada se dobija kada od ostvarene dobiti preko broja projekat/sati oduzmemo gubitak za placanje kurseva radnicima, tj. funkcija koju treba maksimizovati je:

150*5*E + 170*6*D - (100*E + 105*D) --> ovo dodajemo kod obelezavanja
*/
		labeling([maximize(150*5*E + 170*6*D - (100*E + 105*D))],Vars),
		Zarada is (150*5*E + 170*6*D - (100*E + 105*D)),		
		write('Maksimalna zarada je '), write(Zarada),
		write(', broj radnika koje treba poslati na kurs Elixir je '), write(E),
		write(', a broj radnika koje treba poslati na kurs Dart je '), write(D),nl.


