filterSen :: (a -> Bool) -> [a] -> [a]
filterSen p []     = []
filterSen p (x:xs) = if p x
                     then x : filterSen xs
                     else filterSen xs

filterSen' :: (a -> Bool) -> [a] -> [a]
filterSen' p   = foldr f []
  where f x xs = if p x
                 then x : xs
                 else xs