izbaci :: Int -> [a] -> [a]
izbaci _ [] = []
izbaci k lst = foldr (\(i,x) acc -> if i == k then acc else x : acc) [] 
             $ zip [0..] lst

{-    
    izbaci _ [] = []
    izbaci 0 (_:xs) = xs
    izbaci k (x:xs) = x : (izbaci (k-1) xs)
-}