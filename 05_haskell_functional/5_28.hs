{-
  foldl :: (b -> a -> b) -> b -> [a] -> b     *
  foldr :: (a -> b -> b) -> b -> [a] -> b
  (izraz fold cemo koristiti kad je nebitno o kojem tacno fold-u je rec)
      pocevsi od binarne funkcije, pocetne vrednosti (akumulator) i kolekcije, 
      fold primenjuje funkciju redom na elemente kolekcije i akumulator i 
      rezultat primene funkcije postaje novi akumulator
      (u nekim jezicima se zove "reduce" (Python), "accumulate" (C++) mada nisu
      svuda isti parametri)

      razlike izmedju foldl i foldr:
          - foldl radi sleva na desno (normalni poredak)
          - foldr radi zdesna na levo (obrnuti poredak)
          - NAPOMENA: primetimo da nije isti redosled akumulatora i elementa!

      primer za foldl: 
          funkcija: (+)   ;   acc: 0  ;  kolekcija: [1, 2, 3, 4, 5]
              koraci koje foldl radi:
              0 + 1 = 1  --  0 je acc, 1 je trenutni element,  1 postaje acc
              1 + 2 = 3  --  1 je acc, 2 je trenutni element,  3 postaje acc
              3 + 3 = 6  --  3 je acc, 3 je trenutni element,  6 postaje acc
              6 + 4 = 10 --  6 je acc, 4 je trenutni element, 10 postaje acc
              10 + 5 = 10 -- 10 je acc, 5 je trenutni element, 15 postaje acc
              -- nema vise elemenata, rezultat foldl-a je 15 - zbir liste

      postoje i varijante foldl1/foldr1 u slucajevima kada za akumulator
      zelimo da uzmemo prvi/poslednji element kolekcije

      * slicno kao all i any, i fold je genericki, radi ne samo za liste
        potpis iznad je pojednostavljen da bi bilo lakse razumevanje
-}

sum1 lista = foldl (+) 0 lista
sum2 lista = foldr (+) 0 lista

-- probati za (-), koji nije komutativan

