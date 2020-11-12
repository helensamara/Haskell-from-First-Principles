newtype ShiftList a = SL {getList :: [a]} deriving Show

instance Monoid a => Semigroup (ShiftList a) where
  SL a <> SL b = SL $ zipWith (<>) a (mempty:b)

instance Monoid a => Monoid (ShiftList a) where
  mempty = SL $ repeat mempty
  
fib 0 = SL $ repeat 1
fib 1 = SL $ repeat 1
fib n = (fib $ n-1) <> (fib $ n-2)
