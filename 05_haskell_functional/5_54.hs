-- Konstruktori mogu imati argumente

data Zivotinja = Pas | Macka | Papagaj

data Ljubimac = MkLjubimac { ime :: String
                           , godine :: Int
                           , tip :: Zivotinja
                           }

-- MkLjubimac je konstruktor 3 argumenta,
-- svakom dajemo ime koje mozemo koristiti kao
-- getter

-- let dzeki = MkLjubimac 3 "Dzeki" Pas
-- let starijiDzeki = dzeki { godine = 4 }
--    ovo pravi kopiju objekta sa izmenjenim poljima