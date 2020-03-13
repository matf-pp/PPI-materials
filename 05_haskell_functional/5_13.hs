-- Trazimo ceo deo korena broja x
-- trazimo prvi broj (pocev od 1) ciji je kvadrat veci 
-- od kvadrata naseg broja x i kao rezultat vracamo broj 
-- koji je za jedan manji
ceoDeo :: (Ord a, Num a) => a -> a
ceoDeo x = ceoDeo' x 1
  where ceoDeo' x i
          | (i*i) > x = (i-1)
          | otherwise = ceoDeo' x (i+1)
