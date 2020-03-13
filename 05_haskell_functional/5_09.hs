-- Ispitujemo da li je broj prost tako sto pozovemo pomocnu funkciju
-- koja ispituje da li postoji neki broj pocev od 2 do n koji deli broj n

-- Proveravamo da li postoji broj koji deli n (pocev od broja 2 - poziv iz prethodne funkcije)
-- ukoliko je k == n to znaci da smo proverili za svaki broj od 2 do n-1
-- i ustanovili da nijedan od njih ne deli n tako da vracamo True kao indikator da broj n jeste prost
-- ukoliko je n deljivo sa k, vracamo False (n nije prost)
-- ukoliko n nije deljivo sa k, pozovemo funkciju rekurzivno za sledeci broj (k+1)

prost :: Int -> Bool
prost n = prostTest n 2
  where prostTest n k 
          | n == k = True
          | n `mod` k == 0 = False
          | otherwise = prostTest n (k+1)

-- Na narednim casovima, kad naucimo funkcije viseg reda,
-- napravicemo Eratostenovo sito :)

-- Alternativno, znajuci generatore listi (u narednim primerima),
-- mozemo da kazemo sledece: "Broj je prost ako je lista njegovih 
-- pravih delilaca prazna"
prost' n = null (listaDelilaca n)
  where listaDelilaca n = [x | x <- [2..n-1], mod n x == 0]

-- Mozemo, dakle, kao i u Python-u, da pravimo nesto nalik na
-- matematicke definicije skupova
--   {x | x iz 1..n   i   n deli x}
-- "skup svih x takvih da x pripada 1..n i ...."
