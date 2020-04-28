% podeli1 - deli listu na dve liste - listu pozitivnih i listu negativnih elemenata
% L1 - lista pozitivnih, L2 - lista negativnih
podeli([], [], []).
podeli([G|R], [G|R1], L2):- G >= 0, podeli(R, R1, L2), !.
podeli([G|R], L1, [G|R2]):- G < 0, podeli(R, L1, R2).
                          
