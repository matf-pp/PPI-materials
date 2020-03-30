-- Pravimo par listi od liste parova kao sto radi funkcija unzip
-- [(1,2), (1,2), (1,2)] -> ([1,1,1], [2,2,2])
-- tako sto svaki par iz liste dodajemo u akumulator cija je pocetna vrednost par praznih listi
-- [(1,2), (1,2), (1,2)]  - ([],[])
-- [(1,2), (1,2)]  - ([1],[2])
-- [(1,2)]  - ([1,1],[2,2])
-- []  - ([1,1,1],[2,2,2])
listaUPar :: [(a,b)] -> ([a],[b])
listaUPar [] = ([],[])
listaUPar lista = foldr (\ (a,b) (c,d) -> (a:c, b:d)) ([],[]) lista

{- Drugi nacin bez foldr:
listaUPar [] = ([],[])
listaUPar ((a,b):xs) = (a:l1, b:l2)
		where
			l1 = fst rep
			l2 = snd rep
			rep = listaUPar xs
-}

