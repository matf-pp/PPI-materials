% svaki negativan element dodajemo dva puta u novu listu, a pozitivne samo jednom
dupliraj([], []).
dupliraj([G|R], [G,G|R1]):- G<0, dupliraj(R, R1), !.
dupliraj([G|R], [G|R1]):- G>=0, dupliraj(R, R1). 
