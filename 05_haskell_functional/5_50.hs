ukloniDuplikate :: Eq a => [a] -> [a]
ukloniDuplikate = foldr (\ x a -> x : filter (/= x) a) []

