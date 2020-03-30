-- Racunamo sve pozicije broja x u listi
-- tako sto spajamo listu sa listom brojeva od 0 do n
-- i od liste parova (broj, pozicija)
-- izdvajamo one pozicije kod kojih je broj = x
-- where omogucava da u okviru funkcije uvedemo novu promenljivu za neki izraz koji se koristi u definiciji
pozicije :: Eq a => a -> [a] -> [Int]
pozicije x [] = []
pozicije x lista = [i | (x1,i) <- zip lista [0..n], x == x1]
    where n = length lista - 1
