-- Nadovezujemo listu2 na listu1 n puta
-- ukoliko je n == 1 na listu1 nadovezemo listu2 operatorom ++
-- inace pozovemo funkciju rekurzivno za n-1 i na rezultat nadovezemo listu2
nadovezi :: [a] -> [a] -> Int -> [a]
nadovezi l1 l2 n = l1 ++ rep
  where rep = concat $ replicate n l2

-- replicate ponavlja element odredjeni broj puta - vraca
-- listu. S obzirom da je element vec lista, rezultat je
-- lista listi. Stoga, koristimo funkciju concat da ih 
-- sve spojimo u jednu (flatten u nekim jezicima)
