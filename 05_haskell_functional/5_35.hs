-- Mozemo imati vise generatora

parovi :: Int -> Int -> Int -> Int -> [(Int,Int)]
parovi a b c d = [(x,y) | x <- [a..b], y <- [c..d]]

{- 
obratiti paznju kako utice zamena redosleda 
parovi a b c d = [(x,y) | y <- [c..d], x <- [a..b]]
-}
