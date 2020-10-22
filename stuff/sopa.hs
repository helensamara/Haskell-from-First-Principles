class Sopa a where
  isInteger ::  a -> Bool
  isFloat   ::  a -> Bool
  fromSopa  ::  a -> Float

instance Sopa Integer where
  isInteger x = True
  isFloat   x = False
  fromSopa  x = fromInteger x :: Float

instance Sopa Float where
  isInteger x = False
  isFloat   x = True
  fromSopa  x = x

f :: Sopa a => a -> a
f x = 
  if isInteger x 
  then x
  else
    if isFloat x
    then x
    else undefined

g :: Sopa a => a -> Float
g x = 
  if isInteger x 
  then fromSopa x + 2
  else
    if isFloat x
    then fromSopa x / 2
    else undefined