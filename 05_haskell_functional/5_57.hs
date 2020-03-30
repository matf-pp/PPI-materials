{-
    Either a b

    Predstavlja vrednosti koje mogu biti jednog ILI drugog tipa
    (nesto slicno std::variant<T1, T2...>, s tim sto je variant 
    mocniji jer je sablon sa proizvoljno mnogo tipova, Either je
    fiksiran na dva)

    Definisan je kao (videti :info Maybe): 

        data Either a b = Left a | Right b

    Koristi se cesto za baratanje greskama
-}

glava :: [a] -> Either String a
glava []    = Left "Prazna lista"
glava (x:_) = Right x

rep :: [a] -> Either String [a]
rep []     = Left "Prazna lista"
rep (_:xs) = Right xs
