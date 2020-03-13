{-
  Torke (Tuples) su uredjeni niz vrednosti nekog tipa 
  (ne nuzno istog):
    
  ('a',1,[1.2, 2.3],"torka")

  Funkcije definisane za parove (n=2):
  fst - vraca prvi element para
  snd - vraca drugi element para
-}

parMax :: (Double, Double) -> Double
parMax p 
  | fst p <= snd p = snd p
  | otherwise = fst p

-- mozemo koristiti ugradjenu funkciju max:
parMax' :: (Double, Double) -> Double
parMax' p = max (fst p) (snd p)

{-
  Uparivanje sablona (pattern matching)

  not :: Bool -> Bool
  not True = False
  not False = True

  Ako pozovemo not True uparice se prvi sablon,
  a ako pozovemo not False uparice se drugi sablon

  Dzoker (wildcard)

  prvi nacin (ako bismo zamenili redosled sablona, javlja pattern match overlapped)
  (&&) :: Bool -> Bool -> Bool
  True && True = True
  _ && _ = False   --- moglo bi i: n && m = False, bitno je samo da su razlicito imenovani

  drugi nacin, efikasniji:
  (&&) :: Bool -> Bool -> Bool
  True && x = x
  False && _ = False

  _ predstavlja dzoker, tj. sablon koji odgovara bilo kojoj vrednosti (obratiti paznju na redosled definisanja sablona!)

  Sabloni torki:
    prviParan (x,_) = even x
-}

parMax'' :: (Double, Double) -> Double
parMax'' (l,r) = max l r

