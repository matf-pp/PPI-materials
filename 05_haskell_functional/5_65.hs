-- [1,2,3] -> 321

brojObrnut :: Num a => [a] -> a
brojObrnut [] = 0
brojObrnut (x:xs) = (brojObrnut xs)*10 + x

-- [1,2,3] -> 123
-- Koriscenje funkcije brojObrnut
-- broj lista = brojObrnut (reverse lista)

-- Drugi nacin
broj [] = 0
broj (x:xs) = x*10^(length xs) + broj xs


