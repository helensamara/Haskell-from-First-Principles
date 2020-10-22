data Trivial = Trivial'

instance Eq Trivial where
  Trivial' == Trivial' = True

data DayOfWeek =
  Mon | Tue | Weds | Thu | Fri | Sat | Sun deriving Show

instance Eq DayOfWeek where
  (==) Mon Mon   = True
  (==) Tue Tue   = True
  (==) Weds Weds = True
  (==) Thu Thu   = True
  (==) Fri Fri   = True
  (==) Sat Sat   = True
  (==) Sun Sun   = True
  (==) x   y     = False

data Identity a = Identity a

instance Eq a => Eq (Identity a) where
  (==) (Identity v) (Identity v') = v == v'

data Date = Date DayOfWeek Int

instance Show Date where
  show (Date weekday dayOfMonth) = show weekday ++ " " ++ show dayOfMonth

instance Eq Date where
  Date weekday dayOfMonth == Date weekday' dayOfMonth' =
    weekday == weekday' && dayOfMonth == dayOfMonth'

data Sopa a b = Tijela a | Cumbuca b

data Sopa' = I Integer |  F Float

f :: (Sopa Integer Float) -> Float
f (Tijela x)  = fromInteger x + 2 
f (Cumbuca x) = x/2

f' :: (Sopa') -> Float
f' (I x)  = fromInteger $ x `div` 2 
f' (F x) = x/2