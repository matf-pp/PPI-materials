module Lib where

-- Kreiramo biblioteku za rad sa grafikom u 2D

-- Pravimo alias za tip uredjenog para realnih brojeva,
-- nesto slicno kao `using` u C++-u
type Tacka = (Float, Float) 

-- Funkcija koja pravi tacku od datih koordinata
-- Primetimo da korisnik ne zna internu reprezentaciju
-- (proveriti sa :t tacka)
-- Naravno, sa :info Tacka vidi se definicija tipa Tacka
tacka :: Float -> Float -> Tacka
tacka x y = (x,y)

-- Funkcija koja predstavlja koordinatni pocetak
-- Ne mozemo koristiti O zato sto funkcije moraju poceti
-- malim slovom
o :: Tacka
o = (0.0, 0.0)

-- Putanja predstavlja spisak tacaka
type Putanja = [Tacka]

-- Posto je putanja lista tacaka, vracamo argument bez izmene
-- Mozemo koristiti funckiju identiteta da definisemo nasu funkciju
putanja :: [Tacka] -> Putanja
putanja = id
-- skraceno za: putanja tacke = tacke

-- Sabloni listi:
--   length [_] = 1                     -- [_] predstavlja listu sa jednim elementom
--   length lst = 1 + length (tail lst) -- lst predstavlja listu
duzinaPutanje :: Putanja -> Int
duzinaPutanje = length

-- Translira tacku za dati pomeraj
translirajTacku :: Tacka -> Float -> Float -> Tacka
translirajTacku (x,y) xt yt = tacka (x + xt) (y + yt)
-- bolje nego da vracamo par (x+xt, y+yt) jer ako promenimo
-- implementaciju tipa Tacka u nekom trenutku, ovo ce i dalje raditi!

rastojanje :: Tacka -> Tacka -> Float
rastojanje (x1, y1) (x2, y2) = sqrt $ (x1-x2)^2 + (y1-y2)^2

-- Vraca tacke koje se nalaze u krugu datog poluprecnika sa centrom u O 
uKrugu :: Float -> [Tacka] -> [Tacka]
uKrugu r lst = [t | t <- lst, rastojanje o t < r]

-- Translira sve tacke date putanje za dati vektor
translirajPutanju :: Putanja -> Float -> Float -> Putanja
translirajPutanju putanja x y = map (\t -> translirajTacku t x y) putanja

-- Nadovezuje tacku na putanju
nadovezi :: Tacka -> Putanja -> Putanja
nadovezi t putanja = reverse $ t : (reverse putanja)
-- pokazujemo funkciju reverse, moze bolje naravno

spojiPutanje :: Putanja -> Putanja -> Putanja
spojiPutanje = (++)

centroid :: [Tacka] -> Tacka
centroid ts = tacka prosekX prosekY
    where prosekX = prosek $ map fst ts
          prosekY = prosek $ map snd ts
          prosek lst = (sum lst) / (fromIntegral $ length lst) 

kvadrantTacke :: Tacka -> Int
kvadrantTacke (x,y) 
    | x > 0 && y > 0 = 1
    | x < 0 && y > 0 = 2
    | x < 0 && y < 0 = 3
    | x > 0 && y < 0 = 4
    | otherwise = 0        -- koord. pocetak

-- Vraca kvadrant u kom se nalazi putanja ako je ona u celosti sadrzana u nekom od
-- njih, 0 inace
kvadrantPutanje :: Putanja -> Int
kvadrantPutanje lst = if istiKvadranti then head kvadranti else 0
    where kvadranti = map kvadrantTacke lst
          istiKvadranti = all (== head kvadranti) (tail kvadranti)

-- Vraca samo one tacke iz datog kvadranta
tackeUKvadrantu :: Int -> [Tacka] -> [Tacka]
tackeUKvadrantu k = filter (\t -> kvadrantTacke t == k) 
-- skraceno za (mozemo delimicno primeniti funkciju):
-- tackeUKvadrantu k tacke = filter (\t -> kvadrantTacke t == k) tacke

tackeVanKvadranta :: Int -> [Tacka] -> [Tacka]
tackeVanKvadranta k = filter (\t -> (not . (==k)) (kvadrantTacke t)) 
-- moze t != k, ovde samo pokazujemo kompoziciju funkcija - (.)

-- Vraca par maksimuma X i Y koordinata tacaka, redom
maksimumi :: [Tacka] -> (Float, Float)
maksimumi lst = (maksimum $ map fst lst, maksimum $ map snd lst)
    where maksimum (x:xs) = foldl (\acc e -> if e > acc then e else acc) x xs
    -- ekvivalentno sa:
    -- maksimum = foldl1 (\acc e -> e > if acc then e else acc)
    -- ili, jos krace (i preferirano):
    -- maksimum = foldl1 max
