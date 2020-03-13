nzd :: Int -> Int -> Int
nzd a b
  | b == 0 = a
  | otherwise = nzd b (a `mod` b)

-- alternativno
nzd' = gcd
