% menja elemente X i Y u listi 
zameni(X, Y, [], []).
zameni(X, Y, [X|R], [Y|R1]):- zameni(X, Y, R, R1), !.
zameni(X, Y, [Y|R], [X|R1]):- zameni(X, Y, R, R1), !.
zameni(X, Y, [G|R], [G|R1]):- G \== X, G \== Y, zameni(X, Y, R, R1).

