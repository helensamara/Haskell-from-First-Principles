data Nois = Chong | Poodle | Mendes | Seno deriving Show

eu :: Nois -> Bool
eu Seno = True
eu _    = False

mim :: Nois -> Bool
mim = \x -> case x of
  Seno -> True
  _    -> False

-- eu2 x = if x == Seno then True else False

f:: Integral a => a -> [Char]
f x = case x of
  2 -> "1.0"
  3 -> "1.4"
  1   -> "1"
  _   -> "_"

g x = case x of
  Chong -> "1.0"
  Poodle -> "1.4"
  Mendes   -> "1"
  Seno   -> "_"

h = (uncurry (+)).(uncurry divMod)