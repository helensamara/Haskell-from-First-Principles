module Countdown where

countdown :: (Integral a, Show a) => a -> IO ()
countdown 0 = print "Launch!!"
countdown n = do
  putStr "T-"
  print n
  countdown $ n-1