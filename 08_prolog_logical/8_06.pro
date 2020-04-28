% maksimum dva broja 
% I nacin:
maksimum(A,B,M):- A>=B, M is A.
maksimum(A,B,M):- A<B, M is B. 
% II nacin bez trece promenjive:
% maksimum(A,B,A):- A>=B.
% maksimum(A,B,B):- A<B. 

% suma prvih N prirodnih brojeva
suma(1,1).
suma(N,S):- N>1, N1 is N-1, suma(N1,S1), S is S1+N. 

% suma parnih prirodnih brojeva od 2 do N
% moze se dodati provera N mod 2 =:= 0 u pravilu, ali i bez toga sam prepoznaje za neparne da je netacan upit jer rekurzijom dodje do sumaParnih(1,S) sto je netacna cinjenica u bazi
sumaParnih(2,2).
sumaParnih(N,S):- N>2, N1 is N-2, sumaParnih(N1,S1), S is S1+N. 

% proizvod prvih N prirodnih brojeva
proizvod(1,1).
proizvod(N,P):- N>1, N1 is N-1, proizvod(N1,P1), P is P1*N. 

% proizvod neparnih prirodnih brojeva od 1 do N
proizvodNeparnih(1,1).
proizvodNeparnih(N,P):- N>1, N1 is N-2, proizvodNeparnih(N1,P1), P is P1*N.

% ispis cifara unetog prirodnog broja N
cifra(0, nula).
cifra(1, jedan).
cifra(2, dva).
cifra(3, tri).
cifra(4, cetiri).
cifra(5, pet).
cifra(6, sest).
cifra(7, sedam).
cifra(8, osam).
cifra(9, devet).

% ukoliko nije prirodan broj, cut operatorom sprecavamo poziv poslednjeg predikata
cifre(N):- N < 1, !.

% ukoliko je jednocifren svodi se na poziv predikata cifra
% write(t) gde je t neki term, ispisuje term
% nl (newline) - ispisuje se novi red
% obratiti paznju na upotrebu cut operatora ! - sprecavamo poziv poslednjeg predikata za jednocifrene
cifre(N):- N > 1, N < 10, cifra(N, C), write(C), nl, !.

% ukoliko nije jednocifren, racunamo tekucu cifru koju ispisujemo i ostatak broja za koji se ponovo poziva predikat                
cifre(N):- N1 is (N // 10), cifre(N1), N2 is (N mod 10), cifra(N2, C), write(C), nl. 

