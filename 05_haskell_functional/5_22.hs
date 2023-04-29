fibLista :: Int -> [Int]
fibLista n = take n $ fibs
    where fibs = 1 : 1 : zipWith (+) fibs (tail fibs)
