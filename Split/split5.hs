newElement :: Eq a => a -> Bool -> [[a]] -> [[a]]
newElement element newList listOfLists
  | newList == True  = [element]:listOfLists
  | newList == False = 
      (element : head listOfLists) : tail listOfLists

split :: (Eq a) => a -> [a] -> [[a]]
split sep []     = []
split sep (l:ls)
    | l == sep     = rec
    | otherwise    = 
        if ls == [] || ls !! 0 == sep
          then newElement l True  rec
          else newElement l False rec
  where
    rec = split sep ls