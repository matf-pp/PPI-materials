-- Implementacija funkcije zip
-- [1,2,3] [4,5,6] -> [(1,4), (2,5), (3,6)]
-- Da bi radila po duzini krace liste neophodno je dodati sablone za takve situacije
parOdListi [] _ = []
parOdListi _ [] = []
-- Od glava listi pravimo par koji dodajemo na pocetak rezultujuce liste za rep
parOdListi (x:xs) (y:ys) = ( (x, y) : (parOdListi xs ys))

