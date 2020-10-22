module Print3 where

myGreeting :: String
myGreeting = "hello" ++ " world!"

hello :: String
hello = "hello"

world :: [Char]
world = "world!"

main :: IO ()
main = do
  putStrLn myGreeting
  putStrLn secondGreeting
  where secondGreeting = concat [hello, " ", world]


main2 :: IO ()
main2 = let secondGreeting = concat [hello, " ", world]
        in do
         putStrLn myGreeting
         putStrLn secondGreeting
--    where secondGreeting = concat [hello, " ", world]

main3 :: IO ()
main3 = do
         putStrLn myGreeting
         let secondGreeting = concat [hello, " ", world] in        putStrLn secondGreeting

main4 :: IO ()
main4 = do
         putStrLn myGreeting
         (\secondGreeting -> putStrLn secondGreeting) (concat [hello, " ", world])

main5 :: IO ()
main5 = (\secondGreeting -> do
         putStrLn myGreeting
         putStrLn secondGreeting) (concat [hello, " ", world])

x = if False then 2 else 4