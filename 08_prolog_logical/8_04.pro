% porodicno stablo 

% svojstva
musko(mihajlo).
musko(stevan).
musko(petar).
musko(mladen).
musko(rajko).
zensko(milena).
zensko(milica).
zensko(jelena).
zensko(senka).
zensko(mina).
zensko(maja).

% odnosi
roditelj(mihajlo,milica).
roditelj(mihajlo,senka).
roditelj(milena,rajko).
roditelj(maja,petar).
roditelj(maja,mina).
roditelj(stevan,mladen).
roditelj(stevan,jelena).
roditelj(milica,mladen).
roditelj(milica,jelena).

% pravila
majka(X,Y):- roditelj(X,Y), zensko(X).
otac(X,Y):- roditelj(X,Y), musko(X).
brat(X,Y):- musko(X), majka(Z,X), majka(Z,Y), X\==Y.  
sestra(X,Y):- zensko(X), majka(Z,X), majka(Z,Y), X\==Y.           
ujak(X,Y):- brat(X,Z), majka(Z,Y).
tetka(X,Y):- sestra(X,Z), majka(Z,Y).

% rekurzivno pravilo
% roditelj je predak
predak(X,Y):- roditelj(X,Y).
% roditelj pretka je takodje predak
predak(X,Y):- roditelj(X,Z), predak(Z,Y).
