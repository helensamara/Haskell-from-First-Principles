addToFirst :: a -> Bool -> [[a]] -> [[a]]
addToFirst element newFirst listOfLists
  | newFirst == True  = [element] : listOfLists
  | newFirst == False = 
      (element : head listOfLists) : tail listOfLists

split :: (Eq a) => a -> [a] -> [[a]]
split sep []    = []
split sep (l:ls)
    | l == sep  = rec
    | otherwise = addToFirst l newFirst rec
  where
    rec      = split sep ls
    newFirst = (ls == [] || head ls == sep)