zbirPar :: Int -> [(Int,Int)]
zbirPar n = [(a,b) | a <- [1..n], b <- [1..n], a + b == n]

-- drugi, efikasniji nacin
zbirPar' :: Int -> [(Int,Int)]
zbirPar' n = [(a,b) | a <- [1..n], b <- [n-a], b /= 0]
