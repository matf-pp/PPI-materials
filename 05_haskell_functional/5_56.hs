{-
    Maybe a

    Predstavlja opcionu vrednost (isto kao std::optional<T>,
    Optional<T> ili Nullable<T> u OOP jezicima)

    Definisan je kao (videti :info Maybe): 

        data Maybe a = Nothing | Just a
-}

glava :: [a] -> Maybe a
glava []    = Nothing
glava (x:_) = Just x

rep :: [a] -> Maybe [a]
rep []     = Nothing
rep (_:xs) = Just xs
