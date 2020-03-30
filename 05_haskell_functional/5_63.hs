-- Pravimo listu bez uzastopnih ponavljanja
-- tako na glavu nadovezemo rezultat rekurzivnog poziva funkcije nad korigovanim repom
-- sa pocetka repa izbacujemo sve elemente koji su jednaki glavi
-- [1,1,1,1,1,2]
-- 1 : brojPonavljanja [2]
-- [1,2]
brisiPonavljanja :: Eq a => [a] -> [a]
brisiPonavljanja [] = []
brisiPonavljanja (x:xs) = x : brisiPonavljanja(dropWhile (==x) xs)

