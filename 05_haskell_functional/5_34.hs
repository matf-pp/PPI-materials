parni :: Int -> Int -> [Int]
parni a b = [x | x <- [a..b], even x]

neparni :: Int -> Int -> [Int]
neparni a b = [x | x <- [a..b], odd x]
