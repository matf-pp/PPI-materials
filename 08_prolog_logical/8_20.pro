% mozemo kao u 4. zadatku pisati pomocni predikat ili uslov ispravnosti argumenta ubaciti u predikat direktno, za svako N < 1 izbaci3 vraca no i prekida program jer ce sve klauze biti netacne

% bazni slucaj kad znamo rezultat
izbaci3(1, 0):- !.

% delimo na slucajeve da li je tekuca cifra manja ili veca/jednaka 3 
izbaci3(N, X):- N>1, N mod 10>=3, N1 is N//10, izbaci3(N1, X1), X is X1*10+N mod 10, !.
izbaci3(N, X):- N>1, N mod 10<3, N1 is N//10, izbaci3(N1, X).

% ako bi trebalo ispisati poruku da je neispravan ulaz, mozemo dodati klauzu i za N<1
% bez fail, za upit izbaci3(-12,X) daje odgovor yes, a sa fail no
izbaci3(N, _):- N<1, writeln('Neispravan argument N'), fail.
