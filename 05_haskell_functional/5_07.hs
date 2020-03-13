{-
  Lista je kolekcija vrednosti istog tipa:
  [element1,element2,...]

  U Haskell-u je lista osnovna struktura podataka za cuvanje
  kolekcija - lista je jednostruko ulancana i imutabilna

  Treba imati u vidu da, zbog implementacije, neke operacije su
  znatno sporije od ostalih jer pristup elementima nije konstantan
  kao kod niza npr.

  Operacije:
    - konstrukcija liste: operator (:)
      (:) :: a -> [a] -> [a]
      primer: 5 : [1,2,3]    (rezultat je [5,1,2,3])
    - konkatenacija listi: operator (++)
      (++) :: [a] -> [a] -> [a]
      primer: [1,2] ++ [3,4] (rezultat je [1,2,3,4])
    - indeksiranje liste: operator (!!)
      (!!) :: [a] -> Int -> a
      primer: [1,2,3] !! 1   (rezultat je 2)
    - raspon (range): 
      [a..b]
      primer: [1..5]         (rezultat je [1,2,3,4,5])
      primer: [5,4..1]       (rezultat je [5,4,3,2,1])
      primer: [1,3..10]      (rezultat je [1,3,5,7,10])

  Neke korisne funkcije:
    - head :: [a] -> a
      vraca glavu liste
    - tail :: [a] -> [a]
      vraca rep liste
    - length :: [a] -> Int
      vraca duzinu liste
    - take :: Int -> [a] -> [a]
      uzima zadati broj elemenata sa pocetka liste
    - drop :: Int -> [a] -> [a]
      izbacuje zadati broj elemenata sa pocetka liste
    - null :: [a] -> Bool
      testira da li je lista prazna
    - elem :: Eq a => a -> [a] -> Bool
      (potpis je pojednostavljen, elem ne radi samo za liste)
      testira da li se element nalazi u listi
      elementi se porede po jednakosti, stoga elementi liste
      moraju biti u tipskom razredu Eq - operator (==)


  Niske su liste karaktera, na primer:
  niska1 = ['A','l','a','d','d','i','n']
  niska2 = "Aladdin"

  Mozemo niske tretirati kao [Char] ili kao String, nema razlike
-}

lista :: Int -> Int -> [Int]
lista a b = [a..b]

-- Napomena:
-- posto (..) nije operator vec deo sintakse, _ne mozemo_
-- ukloniti argumente tako sto napisemo:
-- lista = (..)
