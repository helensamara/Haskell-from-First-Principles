-- pg 913 (961)

import Data.Monoid

data Optional a = Nada | Only a deriving Show

instance Monoid a => Monoid (Optional a) where
  mempty = Nada
  -- mappend Nada Nada = Nada
  -- mappend Nada x = x
  -- mappend x Nada = x
  -- mappend (Only a) (Only b) = Only $ mappend a b

instance Semigroup a => Semigroup (Optional a) where
  (<>) Nada Nada = Nada
  (<>) Nada x = x
  (<>) x Nada = x
  (<>) (Only a) (Only b) = Only $ (<>) a b