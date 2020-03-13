tipJednacine :: Double -> Double -> Double -> String
tipJednacine a b c
  | a == 0 = "Degenerisana"
  | (b*b - 4*a*c) == 0 = "Jedno resenje"
  | (b*b - 4*a*c) > 0 = "Dva resenja"
  | otherwise = "Nema resenja"
