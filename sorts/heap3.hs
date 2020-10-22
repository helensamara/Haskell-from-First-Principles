data minHeap a = Nil | Node { val   :: a,
                              left  :: minHeap a,
                              right :: minHeap a }

instance Ord a => Ord (minHeap a) where
  _          <= Nil        = True
  Nil        <= Node _ _ _ = False
  Node a _ _ <= Node b _ _ = a <= b

newNode :: Ord a => a -> minHeap a -> minHeap a -> minHeap a
newNode a h1 h2
  | Node a h1 h2 <= min h1 h2 = Node a h1 h2
  | h1 <= h2                  = Node (val h1) (down h1) h2
  | otherwise                 = Node (val h2) h1 (down h2)
  where
    down h = newNode a (left h) (right h)

tail 





last :: Tree a -> a
last Nil = undefined
last Node a left right  = case right of
  Nil -> left
  

toTree :: [a] -> Tree a
toTree []  = Nil
toTree [x] = Node x Nil Nil
toTree 
toTree x:xs = Node x





popMin :: Heap a -> (Maybe a, Heap a)

heapSort :: Ord a => [a] -> [a]
heapSort = heapToList . listToHeap

heapToList :: Heap a -> a
heapToList h =
  let (m, h') = popMin h in 
    case m of
      Nothing -> []
      Just x  -> x : heapToList h'

 



  if isEmpty h
  then []
  else 