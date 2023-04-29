{-
  Deklaracija aliasa (novo ime za vec postojece tipove):
    type String = [Char]
    type Tacka = (Double, Double)
    type Tacka a = Num a => (a, a)

  Tipovi mogu imati parametre, kao u slucaju tipa Par
-}

type ParRazlicitih a b = (a,b)
