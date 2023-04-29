data Krug = MkKrug 
          { r :: Float 
          }
data Pravougaonik = MkPravougaonik 
                  { a :: Float
                  , b :: Float 
                  }

instance Eq Krug where
    c1 == c2 = (r c1) == (r c2)

instance Show Krug where
    show x = "(r=" ++ show (r x) ++ ")"

instance Eq Pravougaonik where
    r1 == r2 = (a r1) == (a r2) && (b r1) == (b r2)
    
instance Show Pravougaonik where
    show r = "(a=" ++ show (a r) ++ ",b=" ++ show (b r) ++ ")";