spoji :: [[a]] -> [a]
spoji [] = [] -- nije neophodno, prolazi drugi sablon i za praznu listu
spoji lista = [x | podlista <- lista, x <- podlista]

{-
spoji [] = []
spoji (x:xs) = x ++ spoji xs
-}
