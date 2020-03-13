-- ukoliko koristimo funkcije koje su definisane za realne 
-- tipove nad argumentima koji su celobrojnog tipa potrebno 
-- je prevesti vrednost u nadklasu Num koriscenjem funkcije 
-- fromIntegral - Haskell je striktno tipiziran

korenCeli :: Int -> Double
korenCeli n = sqrt (fromIntegral n)
