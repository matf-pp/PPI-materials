module Lib where

import Data.Maybe
import Data.List as List (elemIndex, sortBy) 

-- Kreiramo tip koji predstavlja stepen studija
data StepenStudija = OsnovneStudije 
                   | MasterStudije
                   | DoktorskeStudije
                   deriving (Show, Eq)
-- `OsnovneStudije`, `MasterStudije` i `DoktorskeStudije` su
-- konstruktori za tip `StepenStudija`.
-- Ukoliko zelimo da kreiramo objekat tipa `StepenStudija` koji
-- predstavlja `MasterStudije`, to radimo tako sto pozovemo
-- konstruktor `MasterStudije` kao bilo koju drugu funkciju.
-- Konstruktor je funkcija, u ovom slucaju bez argumenata.
-- Kazemo da StepenStudija implicitno pripada klasi Show, sto 
-- znaci da moze da se pozove funkcija `show` nad objektom tog
-- tipa, pritom koristimo podrazumevanu implementaciju koja 
-- ispisuje imena konstruktora

-- Napravimo tip za skracenicu, ovde je `Kratko` konstruktor
-- sa jednim argumentom
data KratkiStepenStudija = Kratko StepenStudija

-- Instancirajmo `Show` nad novim tipom
-- `Show` se sastoji samo od funkcije `show`
instance Show KratkiStepenStudija where
    show (Kratko OsnovneStudije)   = "BSc"
    show (Kratko MasterStudije)    = "MSc"
    show (Kratko DoktorskeStudije) = "PhD"

-- Jasno je da smo mogli alternativno da ne napisemo `deriving
-- Show` vec da rucno implementiramo `Show` tako da za stepen
-- studija vratimo odgovarajucu skracenicu. Ovde smo pravili novi
-- tip da bismo pokazali `deriving` i konstruktore sa argumentima 

-- Definisimo studenta sa imenovanim poljima (slicno klasi u OOP)
-- Paziti na indentaciju!
data Student = MkStudent { indeks  :: String
                         , ime     :: String
                         , prezime :: String 
                         , stepen  :: StepenStudija
                         }
-- U ovom slucaju, `MkStudent` je konstruktor sa 4 argumenta
-- indeks, ime, prezime i stepen su funkcije koje sluze kao 
-- "geteri"
-- Studenta mozemo napraviti pozivajuci konstruktor:
--   MkStudent "123/2018" "Pera" "Peric" OsnovneStudije
-- ili, ako je s vec postojeci objekat studenta, mozemo
-- napraviti "kopiju" sa izmenjenim poljima razdvojenim zarezima
--   s { indeks = "124/2018" }
--   s { indeks = "124/2018", prezime = "Peric" }

-- Posto Student nije u klasi Show, definisacemo metod koji
-- vraca String od datog Student-a
formatirajStudenta :: Student -> String
formatirajStudenta s = 
    let id = indeks s
        ip = (ime s) ++ " " ++ (prezime s)
        ss = show $ Kratko $ stepen s
     in id ++ " : " ++ ip ++ " : " ++ ss
    
-- Instancirajmo `Show` nad studentom
instance Show Student where
    show = formatirajStudenta

-- Instancirajmo `Eq` nad studentom
-- `Eq` se sastoji od funkcije `(==)`
instance Eq Student where
    s1 == s2 = (indeks s1) == (indeks s2)
    -- naravno, moze i prefiksno:
    -- (==) s1 s2 = (indeks s1) == (indeks s2)


-- Napravimo alias za rezultate ispita
-- Maybe predstavlja opcioni tip, definisan kao:
--      data Maybe a = Nothing | Just a
-- Nesto sto je u C++-u `std::optional<T>` ili
-- u Javi `Optional<T>` ili u C#-u `Nullable<T>`
-- Maybe ima jedan tipski parametar, posto mi zelimo
-- da cuvamo `Int` ili `Nothing` za poene na ispitu
-- onda koristimo `Maybe Int`
type Rezultat = (Student, Maybe Int)

-- Formiramo spisak rezultata za studente
rezultati :: [Student] -> [Rezultat]
rezultati = map (\s -> (s, Nothing))

-- Vracamo poene za studenta ili poruku ako nemamo rezultat
-- Either je tip definisan kao:
--      data Either a b = Left a | Right b
-- Dakle, imamo objekat koji moze biti tipa a ILI tipa b
-- Either se cesto koristi za baratanje greskama, "leva" vrednost
-- se koristi kao specijalna
poeni :: Student -> [Rezultat] -> Either String (Maybe Int)
poeni s rezultati = 
    case mi of Nothing  -> Left $ (indeks s) ++ " ne studira na fakultetu!"
               (Just i) -> Right $ snd $ rezultati !! i
    where mi = List.elemIndex s $ map fst rezultati

-- Ponisti poene za studenta
ponisti :: Student -> [Rezultat] -> [Rezultat]
ponisti s rezultati = foldr azuriraj [] rezultati
    where azuriraj rez acc = if fst rez == s then (s, Nothing) : acc
                                             else rez : acc

-- Ponisti sve rezultate
ponistiSve :: [Rezultat] -> [Rezultat]
ponistiSve = map (\rez -> (fst rez, Nothing))

-- Vraca samo rezultate sa datog stepena studija
studije :: StepenStudija -> [Rezultat] -> [Rezultat]
studije ss = filter (\(s, _) -> stepen s == ss)

-- Vraca samo rezultate studenata koji su polozili ispit
polozeni :: [Rezultat] -> [Rezultat]
polozeni = filter (\(s, mozdaRez) -> (izvuciRez mozdaRez) > 50)
    where izvuciRez Nothing    = 0
          izvuciRez (Just rez) = rez 

-- Funkcija koja upisuje rezultat za studenta
-- Ako se student nalazi u rezultatima, izasao je opet - azurirati
-- Ako se ne nalazi, onda dodati
upisi :: Student -> Int -> [Rezultat] -> [Rezultat]
upisi s p rezultati = if elem s studenti 
                      then foldr azuriraj [] rezultati
                      else (s, Just p) : rezultati
    where studenti = map fst rezultati
          azuriraj rez acc = if fst rez == s then (s, Just p) : acc 
                                             else rez : acc

-- Spisak prvih n najboljih rezultata (samo poeni)
najboljih :: Int -> [Rezultat] -> [Int]
najboljih n rezultati = take n  
                      $ List.sortBy (flip compare)
                    --   $ List.sortBy (\_ _ -> GT)
                      $ map (\(Just x) -> x)
                    --   $ map Data.Maybe.fromJust
                      $ filter (Nothing /=) 
                      $ map snd 
                      $ rezultati 
