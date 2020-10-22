module TopOrLocal where

topLevelFunction :: Integer -> Integer
topLevelFunction x = 
  x + woot + topLevelValue
  where woot :: Integer
        woot = 10

topLevelValue :: Integer
topLevelValue = 5

topLevelFunction2 = 
  \x -> x + woot + topLevelValue where woot = 10

topLevelFunction3 = 
  (\woot -> \x -> x + woot + topLevelValue) 10

topLevelFunction4 = 
  (\x -> (\woot -> x + woot + topLevelValue) 10)