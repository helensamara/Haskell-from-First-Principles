-- 1. Find the last element of a list

lastSen :: [a] -> a
lastSen = foldr1 (\x y -> y)

lastSen' :: [a] -> a
lastSen' = foldl (\x y -> y) (error "Empty list.")

-- 2. Find the last but one element of a list

secondLast :: [a] -> a
secondLast []     = error "The list must have at least 2 elements"
secondLast [x]    = error "The list must have at least 2 elements"
secondLast [x,y]  = x
secondLast (x:xs) = secondLast xs

secondLast' :: [a] -> a
secondLast' = fst . foldl (\pair x -> (snd pair, x)) (error "The list must have at least 2 elements")

-- 3. Find the K'th element of a list. The first element in the list is number 1.

elementAt :: [a] -> Int -> a
elementAt []     _ = error "out of range"
elementAt (x:xs) 1 = x
elementAt (x:xs) n = elementAt xs (n-1)

elementAt' :: [a] -> Int -> a
elementAt' xs n = fst $ foldl f (error "out of range", n) xs
  where f (x, 0) _ = (x, 0)
        f (x, n) y = if n < 0 then error "negative number"
                     else (y, n-1)

-- 4. Find the number of elements of a list.

lengthSen :: [a] -> Int
lengthSen = foldr (\x n -> n+1) 0

lengthSen' :: [a] -> Int
lengthSen' = fst . last . zip [1..]