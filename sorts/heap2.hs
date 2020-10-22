data Tree a = Empty | Node { value :: a,
                             left  :: Tree a, 
                             right :: Tree a } deriving Eq

instance Ord a => Ord (Tree a) where
  _ <= Empty = True
  Empty <= Node _ _ _ = False
  Node a _ _ <= Node b _ _ = a <= b

minHeapfy :: Ord a => Tree a -> Tree a
-- Assume que os filhos de raiz são heaps já
minHeapfy Empty = Empty
minHeapfy Node x a b 
  | Node x <= min a b = Node x a b 
  | a <= b            = Node (value a) (rec a) b
  | otherwise         = Node (value b) a (rec b)
    where rec c =
      minHeapfy $ Node x (left c) (right c)

buildMinHeap :: Ord a => Tree a -> Tree a


