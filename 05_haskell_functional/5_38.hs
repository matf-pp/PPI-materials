savrseni :: Int -> [Int]
savrseni n = [x | x <- [1..n-1], sum (faktori x) == x]
    where faktori x = [i | i <- [1..x-1], x `mod` i == 0]
