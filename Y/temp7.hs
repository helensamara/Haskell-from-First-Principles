
newtype SelfMap b = Box ((SelfMap b) -> b)

instance Functor MapWithDomain where
  fmap :: (a -> b) -> SelfMap a -> SelfMap b
  fmap g = \x -> case x of
    Box f -> Box $ g . f

factPartial :: SelfApplicable -> Integer -> Integer
factPartial (Box p) n = 
  if n == 0
    then 1
    else n * p (Box p) (n-1)

fact :: Integer -> Integer
fact = factPartial( Box factPartial )