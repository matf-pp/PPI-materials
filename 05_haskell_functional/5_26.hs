{-
  Lambda funkcije - sintaksa:
     \arg1 arg2 ... argn -> izraz

  Funkcija filter ocekuje predikat, tj funkciju tipa:
    a -> Bool
-}

pozitivni lista = filter (\x -> x > 0) lista

-- ili krace
pozitivni = filter (>0)

-- naravno, preferiramo (>0) jer je krace i citljivije

