sufiks :: [a] -> [[a]]
sufiks = scanr (:) []
