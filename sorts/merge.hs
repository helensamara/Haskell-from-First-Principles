merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys)
    | x <= y   = x : merge xs (y:ys)
    |otherwise = y : merge (x:xs) ys

mergeSort []   = []
mergeSort [x]  = [x]
mergeSort list =
  let n = length list `div` 2 in 
    merge (mergeSort $ take n list) (mergeSort $ drop n list)

mergeSort = intercalate . 
(mergeSort `mapTuple`) . splitHalf 