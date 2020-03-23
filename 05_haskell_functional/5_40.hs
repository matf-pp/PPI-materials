poslednji :: [a] -> a
poslednji lista = lista !! poz
    where poz = length lista - 1  -- moze i: length(tail lista)

-- postoji funkcija last koja vraca poslednji element
