bezbedanRep1 :: [a] -> [a]
bezbedanRep1 xs = if null xs then [] else tail xs

bezbedanRep2 :: [a] -> [a]
bezbedanRep2 xs
  | xs == [] = []
  | otherwise = tail xs

bezbedanRep3 :: [a] -> [a]
bezbedanRep3 [] = []
bezbedanRep3 (_:xs) = xs
-- bezbedanRep3 xs = tail xs
