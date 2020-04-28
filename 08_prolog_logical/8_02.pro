/*

Provera tipa:

atom(X) - da li je term X atom
atomic(X) - da li je term X atom ili broj
number(X) -  da li je term X broj
float(X) ili real(X) - da li je term X realan broj
integer(X) - da li je term X ceo broj
var(X) -  da li je term X slobodna promenljiva
nonvar(X) - da li term X nije promenljiva

Primeri:
| ?- atom('abc')
yes
| ?- atomic(5)
yes

Unifikacija:

=   unifikabilni
\=  nisu unifikabilni
==  identicno jednaki termovi
\== nisu identicno jednaki termovi

*/

uni(X, Y):- X = Y.

/*
| ?- uni(4,5)
no
| ?- uni(4,X)
X = 4
yes
*/

jed(X, Y):- X == Y.

/*
| ?- jed(4,X)
no
| ?- jed(4,5)
no
| ?- jed(4,4)
yes
*/

