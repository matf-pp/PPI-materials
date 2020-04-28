% ovo je jednolinijski komentar

/*
ovo je viselinijski
komentar
*/

/*
Programi se cuvaju sa ekstenzijom .pro ili .pl (na sistemima gde ekstenzije imaju globalno znacenje, kao sto je MS-Windows da ne bi bilo mesanja sa Perl programima treba uvek koristiti .pro). 
Interpreter se pokrece komandom bp. Naredbe:
help -- pomoc
compile('ime_programa') -- prevodi program i pravi izvrsni fajl ukoliko nema gresaka
load('ime_izvrsnog_fajla') -- uvozi izvrsni fajl 
cl('ime_programa') -- compile + load
halt ili control+D -- za izlazak iz interpretera

Termovi: konstante, promenljive ili kompozitni termovi.
--- Konstante: atomi i brojevi.	
------ Atomi: stringovi od najvise 1000 karaktera koji pocinju malim slovom ('abc', 'a01', 'b_cd', 'l122k', ...).
------ Brojevi: celi i realni.
--- Promenljive: imena pocinju velikim slovom ili podvlakom (_). Specijalna, anonimna promenljiva: '_'.
--- Kompozitni (slozeni) termovi ili strukture: oblika f(t1, ..., tn) gde je f neka funkcija arnosti n ( 0<n<32768), a t1, ..., tn termovi.

Program:  sekvenca Hornovih klauza. Postoje tri tipa Hornovih klauza: cinjenice, pravila i upiti.
--- Cinjenice: atomicna formula oblika p(t1, ..., tn) gde je p predikat arnosti n, a t1, ..., tn termi. One opisuju svojstva i relacije izmedju objekata. Primer:
	zivotinja(slon).
	veci(zebra,vuk).	
--- Pravila: imaju sledecu formu
	H :- B1, ..., Bn. (n>0)
H, B1, ..., Bn su atomicne formule. H se zove GLAVA pravila, dok je sve sa desne strane :- TELO pravila. Citamo ih kao implikaciju sa desna na levo: vazi H, ako vaze B1, ..., Bn ("," u pravilu zamenjuje logicko "i").
--- Cinjenice i pravila cine BAZU ZNANJA.
--- Upiti: konstrukcije kojima korisnik komunicira sa bazom znanja. Za ovo je neophodan interpetator kome se postavlja upit. Primer:
	?- veci(slon, zec).
	true.	
	?- zivotinja(veverica).
	false.
*/

/* cinjenice, svojstva */
zivotinja(slon).
zivotinja(vuk).
zivotinja(zec).
zivotinja(zebra).

/* cinjenice, odnosi */
veci(slon,vuk).
veci(vuk,zec).
veci(slon,zebra).
veci(zebra,vuk).
veci(slon,zec).

/*
upiti sa promenljivama:
-- daje jedno resenje, ako zelimo da prikaze jos resenja kucamo ; nakon prikazanog ? a za prekid control+C

?- veci(slon, X).
X = vuk ? ^C

| ?- veci(slon, X).
X = vuk ?;
X = zebra ?;
X = zec
yes
 
| ?- veci(X, Y).   
X = slon
Y = vuk ?;
X = vuk
Y = zec ?;
X = slon
Y = zebra ?;
X = zebra
Y = vuk ?;
X = slon
Y = zec
yes 
*/

/* 
pravilo : za neko X i Y vazi je_veci(X,Y) ako postoji Z tako da vazi veci(X,Z) i veci(Z,Y) 
*/
je_veci(X,Y):- veci(X,Z), veci(Z,Y).
/*
| ?- je_veci(X,Y)
X = slon
Y = zec ?;
X = slon
Y = vuk ?;
X = zebra
Y = zec ?;
no
*/
