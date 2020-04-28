/*
is   aritmeticko izracunavanje 
=:=  aritmeticki jednaki
=\=  aritmeticki nisu jednaki
<, =<, >, >=
+, -, *, /, // (celobrojno deljenje), div, mod, ** (stepenovanje)
*/

/*
Ako je X promenljiva, tada se njoj dodeljuje vrednost koju ima term Y (mora biti poznata vrednost), a ukoliko X nije promenljiva, X is Y se svodi na X =:= Y
*/
op1(X, Y):- X is Y.
/*
Termovima X i Y moraju biti poznate vrednosti, inace ce prijaviti gresku.
*/
op2(X, Y):- X =:= Y.

/*
| ?- op1(3,4)
no
| ?- op1(4,4)
yes
| ?- op1(X,4)
X = 4
yes
| ?- op1(4,X)
*** error
| ?- op2(4,4)
yes
| ?- op2(4,2)
no
| ?- op2(4,X)
*** error
| ?- op2(X,4)
*** error
*/

/*
apsolutna vrednost, prvi argument je broj za koji trazimo apsolutnu vrednost, a drugi promenljiva gde se smesta rezultat
 
losa implementacija, za pozitivne brojeve oba pravila prolaze

| ?- abs1(1,X)
X = 1 ?;
X = -1
yes
| ?- abs1(-1,X)
X = 1
yes

*/
abs1(X, X):- X >= 0.
abs1(X, Y):- Y is -X.

/*
dobre implementacije abs2 i abs3

| ?- abs2(1,X) 
X = 1 ?
yes
| ?- abs2(-1,X)
X = 1
yes
*/
abs2(X, X):- X >= 0.
abs2(X, Y):- X < 0, Y is -X.
             
/*
koriscenje operatora "cut" koji se oznacava sa "!" uklanjamo alternativne klauze, tako da se u slucaju pozitivnih nece primeniti drugi predikat cim uspe prvi 

| ?- abs3(1,X)
X = 1
yes
| ?- abs3(-1,X)
X = 1
yes

*/
abs3(X, X):- X >= 0, !. 
abs3(X, Y):- Y is -X.
