myLength :: [a] -> Int
myLength = myFoldr (const (+1)) 0

xs = map show [1..10]
y = myFoldr (\a b -> concat ["(", a, " + ", b, ")"])
      "0" xs

myAny :: (a -> Bool) -> [a] -> Bool
myAny f = foldr (\x b -> f x || b) False

g = myFoldr (\_ _ -> 9001) 0

plusPlus = flip (myFoldr (:))

plusPlus' = flip $ myFoldr (:)

--

myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr f b []     = b
myFoldr f b (x:xs) = f x $ myFoldr f b xs

myFoldl :: (b -> a -> b) -> b -> [a] -> b
myFoldl f b []     = b
myFoldl f b (x:xs) = myFoldl f (f b x) xs

--

myScanr :: (a -> b -> b) -> b -> [a] -> [b]
myScanr f b []     = [b]
myScanr f b (x:xs) = f x (head old):old
  where old = myScanr f b xs


myScanl :: (b -> a -> b) -> b -> [a] -> [b]
myScanl f b []     = [b]
myScanl f b (x:xs) = b: myScanl f (f b x) xs
