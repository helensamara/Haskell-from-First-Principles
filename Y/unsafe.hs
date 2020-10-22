import Unsafe.Coerce

-- x :: a -> b -- x is a function
-- x :: a      -- x is applied to x
-- --------------------------------
-- a = a -> b  -- infinite type

-- factPartial :: SelfApplicable -> Integer -> Integer
factPartial p n = 
  if n == 0
    then 1
    else n * unsafeCoerce p p (n-1)

fact :: Integer -> Integer
fact = factPartial(factPartial )