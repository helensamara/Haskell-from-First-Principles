module Split where

addToFirst :: Eq a => a -> [[a]] -> [[a]]
addToFirst element listOfLists
  | listOfLists == [] = [[element]]
  | otherwise         = 
      (element : listOfLists !! 0) : drop 1 listOfLists

split :: (Eq a) => a -> [a] -> [[a]]
split sep []     = []
split sep (l:ls)
  | l == sep     = split sep ls
  | otherwise    = 
      if ls == [] || ls !! 0 == sep
        then [l] : split sep ls
        else addToFirst l (split sep ls)