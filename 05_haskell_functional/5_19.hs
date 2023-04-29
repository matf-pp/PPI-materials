fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n 
    | n > 0 = fib (n-1) + fib (n-2)
    | otherwise = 0
