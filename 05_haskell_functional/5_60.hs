prosekOdlicni :: [[Integer]] -> Float
prosekOdlicni = prosek . filter (>= 4.5) . map prosek
    where prosek xs = realToFrac (sum xs) / fromIntegral (length xs)
