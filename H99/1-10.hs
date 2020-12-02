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

-- 5. Reverse a list.

reverseSen :: [a] -> [a]
reverseSen = foldl (flip (:)) []

reverseSen' :: [a] -> [a]
reverseSen' = ($ []) . prependChain

prependChain :: [a] -> [a] -> [a]
prependMap   :: a -> ([a] -> [a]) -> ([a] -> [a])
prependChain  = foldr prependMap id
prependMap x g = g . (x:)

-- 6. Find out whether a list is a palindrome.

isPalindromeSen :: Eq a => [a] -> Bool
isPalindromeSen x = reverseSen x == x

{- isPalindromeSen' :: Eq a => [a] -> Bool
isPalindromeSen' = foldr f (const True) x x
  where f x g = (x ==) . (&&) . g -}

isPalindromeSen'' x = and $ zipWith (==) x $ reverseSen x

-- 7. Flatten a nested list structure.

data Nested a = Base a | List [Nested a]

flattenSen :: [Nested a] -> [a]
flattenSen [] = []
flattenSen (x:xs)
  = case x of
    Base y -> y : flattenSen xs
    List y -> flattenSen y ++ flattenSen xs

flattenSen' :: [Nested a] -> [a]
flattenSen' = foldr f []
  where f :: Nested a -> [a] -> [a]
        f (Base y) xs  = y : xs
        f (List ys) xs = flattenSen' ys ++ xs
