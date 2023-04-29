brojDelilaca :: Int -> Int
brojDelilaca n = length [x | x <- [2..n-1], mod n x == 0]
