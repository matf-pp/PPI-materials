{-
  Aritmeticke operacije nad tipovima Int, Integer, Float:
  +, -, *, /,
  ^^ - stepen (tip Int)
  ** - stepen (tip Float)

  Funkcije:
  mod, div, log, sqrt, sin, cos, tan

-}

ostatak3 n = mod n 3

-- posto je mod funkcija, pise se prefiksno
-- mozemo funkcije pisati infiksno izmedju simbola `:
ostatak3' n = n `mod` 3 

-- slicno, infiksne operatore mozemo pisati prefiksno u zagradama:
-- zbir a b = (+) a b 
