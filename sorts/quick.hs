partition :: Ord a => a -> [a] -> ([a], [a])
partition pivot list = partitionAux [] [] list
  where -- partitionAux :: [a] -> [a] -> [a] -> ([a], [a])
        -- Note that `pivot` is already in the scope at this point.
        partitionAux left right [] = (left, right) 
        partitionAux left right (x:xs)
          | x < pivot = partitionAux (x:left) right xs
          | otherwise = partitionAux left (x:right) xs

partition' :: Ord a => a -> [a] -> ([a], [a])
partition' pivot list = (filter (< pivot) list, filter (>= pivot) list)

partition'' pivot [] = ([], [])
partition'' pivot (x:xs)
  | x < pivot = (x:left, right)
  | otherwise = (left, x:right)
  where (left, right) = partition'' pivot xs

quickSort :: Ord a => [a] -> [a]
quickSort [] = []
quickSort (x:xs) =
  quickSort left ++ [x] ++ quickSort right
    where (left, right) = partition x xs

-- QuickSort do Poodle:

f [] = []
f (x:xs) = f (filter (<= x) xs) ++ x:f(filter (>x) xs)