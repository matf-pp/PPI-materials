qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort manji ++ [x] ++ qsort veci
      where manji = [a | a <- xs, a <= x]
            veci  = [b | b <- xs, b > x]
