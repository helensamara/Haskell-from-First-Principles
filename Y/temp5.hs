data SelfApplicable = SA { func:: SelfApplicable -> Integer -> Integer}

factPartial :: SelfApplicable
func factPartial p n = 
  if n == 0
    then 1
    else n * (func p) (Box p) (n-1)

fact :: Integer -> Integer
fact = func factPartial $ (factPartial)
