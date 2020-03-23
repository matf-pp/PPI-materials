-- preslikava iz liste elemenata u jedan element 
glava :: [a] -> a
glava (x:_) = x

-- preslikava iz liste u listu  
rep :: [a] -> [a]
rep (_:xs) = xs
