{-
  Jos neke funkcije viseg reda za rad sa listama:

  any uslov lista - vraca True ako postoji element u listi koji zadovoljava uslov, False inace
  all uslov lista - vraca True ako svi elementi u listi zadovoljavaju uslov, False inace
  takeWhile uslov lista - izdvaja jedan po jedan element liste sve dok ne stigne do elementa koji ne zadovoljava uslov
  dropWhile uslov lista - izbacuje jedan po jedan element liste sve dok ne stigne do elementa koji ne zadovoljava uslov
  sum lista - sabira elemente liste
  product lista - mnozi elemente liste
  reverse lista - obrce listu
  unzip - razdvaja listu parova u liste ciji su elementi prvi, odnosno drugi elementi parova
  concat lista - spaja liste iz liste listi u jednu listu
  elem e lista - vraca True ako e postoji u listi, False inace
  replicate n x - kopira broj x n puta
-}

prviNegativni lista = takeWhile (<0) lista

