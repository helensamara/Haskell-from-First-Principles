sayHello :: String -> IO()
sayHello x = 
  putStrLn ("Hello, " ++ x ++ "!")

triple x = x*3

piTimes x = 3.14*x

realPiTimes x = pi*x

foo x =
    let y = x*2
        z = x^2
    in 2*y*z