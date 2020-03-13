-- Pravimo listu delioca broja n
-- ukoliko je n = 1, vracamo listu koja sadrzi samo 1
-- inace pozivamo pomocnu funkciju sa jos jednim parametrom
-- koji nam govori do kog potencijalnog delioca smo stigli

-- Pravimo listu delioca broja n pocev od broja k
-- ukoliko smo stigli do broja n (k==n) vracamo praznu listu
-- inace proveravamo da li je k delioc broja n
-- ako jeste, stavljamo ga u listu i pozivamo funkciju rekurzivno
-- za k+1 (sledeci potencijalni delilac)
-- inace samo pozivamo funkciju rekurzivno za k+1

delioci n
    | n == 1 = [1]
    | otherwise = delioci' n 2
    where delioci' n k
            | k == n = []
            | n `mod` k == 0 = [k] ++ (delioci' n (k+1))
            | otherwise = delioci' n (k+1)

