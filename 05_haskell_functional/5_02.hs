{-
  Osnovni tipovi:
  Bool
  Char
  String
  Int
  Integer
  Float
	Double
	
  Tipski razredi (definisu funkcije koje neki tip mora da implementira):
  Eq - tipovi sa jednakoscu (==,/=)
  Ord - tipovi sa uredjenjem (<,<=,>,>=,...)
  Num - numericki tipovi (+,-,*,...)
  Integral - celobrojni tipovi (div, mod,...)
  Fractional - razlomacki tipovi (/, recip,...)

  Potpis funkcije (primeri):
  f :: Int -> Int                 - 1 argument
  f :: Int -> Int -> Int -> Int   - 3 argumenta
  
  Informacije o bilo kom objektu mozete dobiti naredbom:
  :info ime_objekta

  Tip funkcije (ili izraza) se moze dobiti naredbom
  :type izraz
-}

duplo :: Int -> Int
duplo a = a * 2

-- posto je (*) funkcija dva argumenta, mozemo da
-- iskoristimo cinjenicu da se Karijevim postupkom od (*)
-- moze dobiti funkcija jednog argumenta parcijalnom 
-- primenom (*) na 2 - isto vazi za svaku funkciju
duplo' :: Int -> Int
duplo' = (*2)
