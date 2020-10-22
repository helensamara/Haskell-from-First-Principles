module Chap04.Um where

data Mood = Blah | Woot deriving Show

changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood    x = Blah

tupFunc :: (Int, [a])
        -> (Int, [a])
        -> (Int, [a])
tupFunc (a,b) (c,d) = 
  (a + c, b ++ d)