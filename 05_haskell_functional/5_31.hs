list_elem :: Eq a => a -> [a] -> Bool
list_elem x = or . map (== x)

-- ili krace
list_elem' x = any (==x)
