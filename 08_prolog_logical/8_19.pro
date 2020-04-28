% fail ce prouzrokovati da 2. klauza uvek bude netacna jer zelimo da se poziv predikata za neispravan argument vidi kao netacna cinjenica u bazi 
provera(N):- N > 0.
provera(N):- N =< 0, write('Broj nije prirodan'), nl, fail.

% predikat sumaPom za treci argument ima kandidata delioca broja N koji postepeno uvecavamo (pocinjemo od jedinice koja deli svaki broj)
sumaDelilaca(N, S):- sumaPom(N, S, 1).
% dovoljno je ici do N/2, suma je inicijalno 0, tako da na primer za N==1 vraca 0
sumaPom(N, 0, I):- I>N//2.
% ako I deli, dodajemo ga na tekucu sumu i pozivamo za sledeceg kandidata delioca
sumaPom(N, S, I):- I=<N//2, N mod I=:=0, I1 is I+1, sumaPom(N, S1, I1), S is S1+I.
% ako I ne deli, ne dodajemo ga na tekucu sumu vec samo pozivamo za sledeceg kandidata delioca
sumaPom(N, S, I):- I=<N//2, N mod I=\=0, I1 is I+1, sumaPom(N, S, I1).

% ako provera prodje, tada se izvrsava predikat sumaDelilaca i proverava da li je dobijena suma jednaka broju N, ako provera ne prodje, ispisace se poruka i prekinuti program
savrsen(N):- provera(N), sumaDelilaca(N, S), N=:=S.

/*
| ?- savrsen(6)
yes
| ?- savrsen(-6)
Broj nije prirodan
no
*/

