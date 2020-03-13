-- Pravimo listu prvih n elemenata harmonijskog reda (n>0)
-- ukoliko je n = 1, vracamo listu koja sadrzi prvi element 
-- harmonijskog reda inace pozovemo funkciju rekurzivno 
-- i na rezultat nadovezemo reciprocnu vrednost broja n
harm :: Int -> [Double]
harm n
  | n == 1 = [1.0]
  | otherwise = harm (n-1) ++ [recip n']
  where n' = fromIntegral n

-- Pritom, ovde imamo mali problem ako navedemo potpis,
-- naime da bi se radio recip, argument mora biti realan 
-- broj - stoga konvertujemo n u realan broj - nesto sto
-- se prilikom automatske dedukcije samo zakljucuje