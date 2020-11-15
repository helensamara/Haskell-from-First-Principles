-- 1. Find the last element of a list

lastSen :: [a] -> a
lastSen = foldr1 (\x y -> y)

lastSen' :: [a] -> a
lastSen' = foldl' (\x y -> y) (error "Empty list.")

-- 2. Find the last but one element of a list

secondLast :: [a] -> a
secondLast []     = error "The list must have at least 2 elements"
secondLast [x]    = error "The list must have at least 2 elements"
secondLast [x,y]  = x
secondLast (x:xs) = secondLast xs
