-- Generatori mogu zavisiti jedni od drugih
-- kasniji generatori mogu zavisiti samo od promenljivih 
-- koje su uvedene ranijim generatorima citajuci sa leva na desno 
zavisnoY :: Int -> Int -> [(Int,Int)]
zavisnoY a b = [(x,y) | x <- [a..b], y <- [x..b]]
