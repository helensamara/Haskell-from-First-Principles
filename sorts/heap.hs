class (Ord a) => Heap (heap a) where
  makeHeap  ::   [a]  -> heap a
  -- insert    ::    a   -> heap a -> heap a
  removeMax :: heap a -> (heap a, a) 
  isEmpty   :: heap a -> Bool

heapSort :: [a] -> [a]
heapSort = heapToList . makeHeap

heapToList :: Heap (heap a) => heap a -> [a]
heapToList h = 
  if isEmpty h
  then []
  else let (h', max) = removeMax h in 
    heapToList h' ++ [max]





data Heap a = Empty | Node a (Heap a) (Heap a)

add :: Ord a => a -> Heap a ->  Heap a
add x Empty = Node x Empty Empty
add x Node a Empty Empty
  | x <= a    = Node a (add x Empty) Empty
  | otherwise = Node x (add a Empty) Empty

findNext Heap a ->  Heap a
