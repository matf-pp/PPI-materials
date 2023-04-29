jednocifreniDelioci :: Int -> [Int]
jednocifreniDelioci n = [x | x <- [1..9], mod n x == 0]
