module Chap04.Exercises where

awesome = ["Papuchon", "curry", ":)"]
also = ["Quake", "The Simons"]
allAwesome = [awesome, also]

-- length :: [Char] -> Integer

-- a = 2 :: Integer
b = 3/2

c= 2
d= 3/2

-- isPalindrome x = (x == reverse x)

-- isPalindrome = (==).reverse

pair x y = \f -> f x y

pairMap f = \pair -> pair f

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome = pairMap ((==).reverse) . (\z -> pair z z)

-- 9

myAbs :: Integer -> Integer
myAbs n = if n >= 0 then n else (-n)

-- 10

f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f p1 p2 = ((snd p1, snd p2), (fst p1, fst p2))

-- Correct Syntax
-- 1

x = (+)

f xs = w `x` 1
       where w = length xs