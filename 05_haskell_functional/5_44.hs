ubaci :: Int -> a -> [a] -> [a]
ubaci _ e [] = [e]
ubaci k e xs = foldr (\(i,x) acc -> if i == k then e : x : acc else x : acc) [] 
             $ zip [0..] xs 

{-
    ubaci 0 n lista = n : lista
    ubaci k n [] = [n]
    ubaci k n (x:xs) = x : (ubaci (k-1) n xs)
-}