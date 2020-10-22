data Penguin = Caio | Dauto | L 

instance Show Penguin where
  show(Caio) = "Caio"
  show(Dauto) = "Dauto"
  show(L) = "Mamae"

me :: Penguin -> Bool
me Caio = True
me _    = False

me2 :: Penguin -> Bool
me2 = \x -> case x of
  Caio -> True
  _    -> False