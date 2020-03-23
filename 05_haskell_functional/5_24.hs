{-
Neke jednostavne funkcije viseg reda:
  map :: (a -> b) -> [a] -> [b]
      primenjuje funkciju (a -> b) na listu elemenata tipa a
      moze se reci da transformise listu koristeci datu funkciju ili
      da selektuje finalni rezultat (slicno SELECT-u u SQL upitima) -
      stoga se u nekim jezicima zove "transform" (C++) ili "Select" (C#)

      primer: map (\t -> t + 1) [1, 2, 3]   -- vraca [2,3,4]
      primer: map (+1) [1, 2, 3]            -- vraca [2,3,4]
      primer: map fst [(1,2), (3,4)]        -- vraca [1,3]

  filter :: (a -> Bool) -> [a] -> [a]
      filtrira listu koristeci predikat (a -> Bool) - svi elementi
      za koje taj predikat vrati True se nalaze u rezultatu

      primer: filter (\t -> t > 2) [1, 2, 3] -- vraca [3]
      primer: filter (>2) [1, 2, 3]          -- vraca [3]

  all :: (a -> Bool) -> [a] -> Bool   *
      proverava da li svi elementi date liste zadovoljavaju predikat

      * tip nije bas ovakav ako se proveri u ghci, razlog je zato sto je all
        jos vise genericki - radi ne samo za liste nego za bilo koji tip 
        koja pripada odredjenoj klasi (Foldable - definisani foldl i foldr
        - videti opise za foldl i foldr u nastavku teksta)

      primer: all (\t -> t < 2) [1, 2, 3] -- vraca False
      primer: all (<5) [1, 2, 3]          -- vraca True

  any :: (a -> Bool) -> [a] -> Bool
      slicno kao all samo sto vraca True ako neki od elemenata zadovoljava
      predikat
  
      primer: any (\t -> t < 2) [1, 2, 3] -- vraca True
      primer: any (>5) [1, 2, 3]          -- vraca False
-}

uvecaj lista = map (+1) lista

-- ili krace:
uvecaj' = map (+1)