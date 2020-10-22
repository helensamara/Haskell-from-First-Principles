safeHead :: [a] -> Maybe a
safeHead []     = Nothing
safeHead (x:xs) = Just x

myEnumFromTo :: (Enum a, Ord a) => a -> a -> [a]
myEnumFromTo a b
  | a>b = []
  | otherwise = a:myEnumFromTo (succ a) b

