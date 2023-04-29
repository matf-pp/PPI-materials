delioci :: Int -> [Int]
delioci n = filter (\d -> n `mod` d == 0) [1..n]

prost :: Int -> Bool
prost n = length (delioci n) == 2

prosti :: Int -> [Int]
prosti n = [k | k <- [2..n], prost k]
