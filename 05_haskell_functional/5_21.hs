parni :: Int -> [Int]
parni n = take n $ filter (\x -> x `mod` 2 == 0) [1..]
