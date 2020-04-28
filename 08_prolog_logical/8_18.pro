% baza znanja
automobil(a1, audi).
automobil(h1, honda).
automobil(m1, mercedes).
automobil(m2, mercedes).
automobil(c1, citroen).
automobil(c2, citroen).

vlasnik(milan, h1).
vlasnik(maja, m1).
vlasnik(nemanja, m2).
vlasnik(aleksandar, a1).
vlasnik(andjela, c1).
vlasnik(petar, c2).

brziSifra(a1, c1).
brziSifra(m1, c1).
brziSifra(m2, h1).
brziSifra(a1, c2).

brziNaziv(X, Y):- automobil(SX, X), automobil(SY, Y), brziSifra(SX, SY).

imaAutomobil(X):- vlasnik(X, _).

imaBrzi(X, Y):- vlasnik(X, S1), vlasnik(Y, S2), brziSifra(S1, S2).

