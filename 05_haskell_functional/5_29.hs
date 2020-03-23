{-
  Kompozicija funkcija

  (f . g) x  <-> f (g x)
-}

-- sum - ugradjena funkcija koja odredjuje sumu elemenata liste
-- abs - ugradjena funkcija za odredjivanje apsolutne vrednosti broja

absSume lista_listi = map (abs . sum) lista_listi

