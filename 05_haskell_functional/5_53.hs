-- Konstruktori mogu imati argumente

data Oblik = Kvadrat Float
           | Pravougaonik Float Float
           | Krug Float
           | Trougao Float Float Float
           deriving Show

-- deriving Show znaci da nas tip Oblik pripada
-- klasi Show - koristimo cinjenicu da postoji 
-- podrazumevana implementacija funkcije show
