obrni :: [a] -> [a]
obrni = foldl (flip (:))  []
