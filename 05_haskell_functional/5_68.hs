-- [1,1,1] [2,2,2] -> [1,2,1,2,1,2]
-- [1,1] [2,2,2,2] -> [1,2,1,2,2,2]
-- Treba obuhvatiti slucajeve listi razlicitih duzina
-- Sledeca linija koda ne radi jer nije dozvoljeno koriscenje dzoker promenljive u izrazu kojim definisete vrednost funkcije
-- ucesljaj [] _ = _
ucesljaj [] lista = lista
ucesljaj lista [] = lista
ucesljaj (x:xs) (y:ys) = [x]++[y]++(ucesljaj xs ys)
