-- True if a value is in [a] list
elemSen :: (Eq a) => a -> [a] -> Bool
elemSen x []     = False
elemSen x (y:ys) = if x == y then True else elemSen x ys

-- returns [a] list with duplicate values removed
nubSen :: (Eq a) => [a] -> [a]
nubSen []     = []
nubSen (x:xs) =
  let ys = nubSen xs in
    if elemSen x ys  then ys else x:ys

-- returns [a] list with duplicate values removed *after first appearence*

nubSen' :: (Eq a) => [a] -> [a]
nubSen' = reverse . nubSen . reverse

reverseSen :: [a] -> [a]
reverseSen []     = []
reverseSen (x:xs) = reverseSen xs ++ [x]

-- True if list of Ords is in ascending order
isAscSen :: (Ord a) => [a] -> Bool
isAscSen []     = True
isAscSen [_]    = True
isAscSen (x:xs) = x <= head xs && isAscSen xs