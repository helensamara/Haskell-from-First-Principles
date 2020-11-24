-- um que arranca um elemento fora no índice k e devolve uma dupla com o elemento e com a lista sem o elemento. Assinatura fica Int -> [a] -> (a, [a])

removeAt :: Eq a => Int -> [a] -> (a,[a])
removeAt n xs
  = let (elem, beforeMap, after, _) = aux (head xs, id, tail xs, n)
    in (elem, beforeMap after)
    where aux (x, prepend, xs, n)
                | n < 0     = error "negative index"
--                | xs == []  = error "index too large"
                | n == 0    = (x, prepend, xs, n)
                | otherwise = aux (head xs, prepend . (x:), tail xs, n-1)
    
removeAt' :: Int -> [a] -> (a,[a])
removeAt' n []     = error "empty list"
removeAt' n (x:xs)
  = let (elem, appendBefore, after, _) = foldl aux (x, id, xs, n) xs
    in (elem, appendBefore after)
      where aux :: (a, [a] -> [a], [a], Int) -> a -> (a, [a] -> [a], [a], Int) 
            aux (x, f, xs, n) y
              | n < 0     = error "negative index"
              | n == 0    = (x, f, xs, n)
              | xs == []  = error "index too large"
              | otherwise = (y, f . (x:), tail xs, n-1)