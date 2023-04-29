list_all :: (a -> Bool) -> [a] -> Bool
list_all p = and . map p

-- primer pozivanja funkcije: list_all (>0) [1,2,3] 

