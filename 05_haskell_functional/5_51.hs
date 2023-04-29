qsort :: (Ord a) => [a] -> [a]
qsort [] = []
qsort (x:xs) =
  let manji = qsort [a | a <- xs, a <= x]
      veci = qsort [a | a <- xs, a > x]
   in manji ++ [x] ++ veci
