addShift x y = zipWith (+) x (y)

fib 0 = repeat 0
fib 1 = 0 : repeat 1
fib n = 0 : addShift (fib $ n - 1) take (fib $ n - 2)
