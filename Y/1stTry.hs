
factPartial p n =
  if n == 0
    then 1
    else n * p p (n-1)

main :: IO ()
main = do
  putStr "n  = "
  let n = 10
  print n
  let ans = factPartial (factPartial) (n)
  putStr "n! = "
  print ans