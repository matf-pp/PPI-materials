% cinjenice
stan(petrovic, 76).
stan(ciric, 93).
stan(aleksic, 55).
stan(lisic, 123).
stan(peric, 67).

clan(ciric, 3).
clan(peric, 5).
clan(aleksic, 2).
clan(lisic, 3).
clan(petrovic, 4).

% koristimo operator za realno deljenje / (// je za celobrojno, ne mesati ova dva operatora) da bi se dobio tacan rezultat
poClanu(Porodica, Prosek):- stan(Porodica, X), clan(Porodica, Y), Prosek is X/Y.

