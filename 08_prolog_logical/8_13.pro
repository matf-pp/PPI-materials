% maksimalni element liste
maxEl([X], M):- M is X, !.
% pozivamo za rep (idemo u dubinu), pa poredimo maksimalni element repa i glavu liste
maxEl([G|R], X):- maxEl(R, Y), G < Y, X is Y, !.
maxEl([G|R], X):- maxEl(R, Y), G >= Y, X is G.

