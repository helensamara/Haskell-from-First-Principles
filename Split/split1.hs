module Split where

beginning :: [a] -> [a]
beginning x = take (length x - 1) x

split :: (Eq a) => a -> [a] -> [[a]]
split sep word = splitH sep word [] True

splitH :: (Eq a) => a -> [a] -> [[a]] -> Bool -> [[a]]
splitH sep []     hist isNew = hist
splitH sep (l:ls) hist isNew
  | sep == l  = splitH sep ls hist    True
  | otherwise = splitH sep ls newHist False
    where
      newHist 
        | isNew      = hist ++ [[l]]
        | otherwise  = beginning hist ++ [last hist ++ [l]]