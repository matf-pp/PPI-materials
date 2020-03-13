-- Ne postoje petlje, jedini nacin ponavljanja je rekurzija

-- Blokovi se u Haskelu odvajaju indentacijom
-- Haskell je striktan sto se tice poravnanja - blokove moramo
-- lepo ravnati inace cemo dobiti gresku

-- Uslovni izraz (mora imati else granu)
sumaPrvih n = 
    if n == 0 then 0
    else n + sumaPrvih(n-1)

-- Ogradjene jednacine (guards) - mozemo ih koristiti umesto 
-- uslovnih izraza, bitan je redosled navodjenja, otherwise
-- slucaj treba uvek staviti na kraju
sumaPrvih' n             -- primetimo da nema znaka "=" !
    | n == 0 = 0
    | otherwise = n + sumaPrvih'(n-1)

-- jasno, ovaj zadatak se trivijalno moze resiti bez rekurzije
-- ako znamo liste (vraticemo se na ovaj primer u nastavku):
sumaPrvih'' n = sum [1..n]