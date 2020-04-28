jednakost(Vars):- Vars=[T,W,O,F,U,R],
		Vars :: 0..9,
		% iskljucujemo za T i F nulu iz domena
		T#\=0,
		F#\=0,
		alldifferent(Vars),
		2*(T*100+W*10+O) #= F*1000+O*100+U*10+R,
		labeling(Vars),
		write(' '), write(T), write(W), write(O), nl,
		write('+'), write(T), write(W), write(O), nl,
		write('----------'), nl,
		write(F), write(O), write(U), write(R), nl.
/*
| ?- jednakost(Vars)
 734
+734
----------
1468
Vars = [7,3,4,1,6,8] ?;
 765
+765
----------
1530
...

*/

/*
BITNO: Ukoliko se na kraju predikata doda fail, ispisace se sva resenja pri pozivu, inace staje cim pronadje jedno resenje, pa sledece dobijamo kucanjem ; za nastavljanje pretrage
kao u prethodnom primeru 
*/ 

jednakostSvi(Vars):- Vars=[T,W,O,F,U,R],
		Vars :: 0..9,
		% iskljucujemo za T i F nulu iz domena
		T#\=0,
		F#\=0,
		alldifferent(Vars),
		2*(T*100+W*10+O) #= F*1000+O*100+U*10+R,
		labeling(Vars),
		write(' '), write(T), write(W), write(O), nl,
		write('+'), write(T), write(W), write(O), nl,
		write('------'), nl,
		write(F), write(O), write(U), write(R), nl,
		% odvajamo resenja jer zbog fail ne staje kod prvog  
		% resenja vec ce nastaviti pretragu 
		write('----------'), nl, fail.

