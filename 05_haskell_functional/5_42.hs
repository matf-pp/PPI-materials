sufiksi :: [a] -> [[a]]
sufiksi [] = [[]]
-- lista je sama svoj sufiks, a ostali sufiksi su sufiksi njenog repa
sufiksi (x:xs) = (x:xs) : sufiksi xs
