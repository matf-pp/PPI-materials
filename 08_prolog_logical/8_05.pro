% godina je prestupna ako je deljiva sa 4 i nije deljiva sa 100 ili je deljiva sa 400
prestupna(X):- X mod 4 =:= 0, X mod 100 =\= 0.
prestupna(X):- X mod 400 =:= 0.

/*
anonimna promenljiva _ se koristi da oznaci da nam vrednost koja se prosledi za godinu nije bitna, moze biti bilo sta, ali tu vrednost ne koristimo

| ?- brdana(januar, _, X) 
X = 31
yes
| ?- brdana(januar, 2017, X) 
X = 31
yes
*/
brdana(januar, _, 31).
brdana(februar, X, 28):- not(prestupna(X)).
brdana(februar, X, 29):- prestupna(X).
brdana(mart,_,31).
brdana(april,_,30).
brdana(maj,_,31).
brdana(jun,_,30).
brdana(jul,_,31).
brdana(avgust,_,31).
brdana(septembar,_,30).
brdana(oktobar,_,31).
brdana(novembar,_,30).
brdana(decembar,_,31).
