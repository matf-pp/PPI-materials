{-
  Cesto nam je potrebno da listu zadamo na sledeci nacin:

  lista = [f(x) | x<-D, p(x)]

  to mozemo jednostavno uraditi koristeci funkcije map i filter

  map f (filter p xs)
-}

sledbenici = map (+1) (filter (>0) lista)
