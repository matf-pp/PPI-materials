/*
za odredjivanje nzd i nzs dva prirodna broja koristicemo Euklidov algoritam 

bitno je obezbediti da se pogram ispravno ponasa - kada nadje jedno resenje treba obezbediti prekid koriscenjem cut operatora u 1. klauzi nzdPom, jer bi u suprotnom program zasao u skup negativnih brojeva (pa bi nastao beskonacan ciklus) ili pokusaj deljenja sa nulom (sto bi prijavilo gresku)
*/
nzd(A,B,NZD):- A>=B, B>0, nzdPom(A,B,NZD),!.
nzd(A,B,NZD):- A<B, A>0, nzdPom(B,A,NZD).
 
nzdPom(N, 0, N):- !.
nzdPom(N, M, NZD):- P is N mod M, nzdPom(M, P, NZD).

% nzs dobijamo mnozenjem oba prirodna broja i deljenjem sa nzd
nzs(N, M, NZS):- nzd(N, M, P), NZS is N*M//P.

/*
| ?- nzd(15,9,NZD)
NZD = 3
yes
| ?- nzd(12,8,NZD)
NZD = 4
yes
| ?- nzs(13,17,NZS)
NZS = 221
yes
*/
