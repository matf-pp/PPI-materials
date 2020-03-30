varijacije xs 0 = [[]]
varijacije xs n = concat (map (\ x -> map (x:) ys) xs)
	where ys = varijacije xs (n-1)
