a = (++ "!")
b = (drop 4) . (take 5)
b' x = (drop 4) $ (take 5) $ x
b'' x = (drop 4) $ (take 5) x
c = drop 9

thirdLetter :: String -> Char
thirdLetter = (!! 2)

letterIndex :: Int -> Char
letterIndex = ("Curry is awesome!" !!)

rvrs :: String -> String
rvrs x = drop 9 x ++ (drop 5 . take 9) x ++ take 5 x

rvrs2 x = concat $ map ($x) [drop 9, drop 5 . take 9, take 5] 

rvrs3 = concat $ flip map [drop 9, drop 5 . take 9, take 5] $ (flip ($))

---

last x = x !! (length x - 1)
comeco x = take (length x - 1) x

splitH :: a -> [a] -> [[a]] -> [[a]]
splitH s []   hist = hist
splitH s s:ls hist = splitH s ls (hist ++ [[]])
splitH s l:ls []   = splitH s ls [[l]]
splitH s l:ls hist = splitH s ls hist_novo
  where hist_novo  = comeco hist ++ [(last hist) ++ [l]]
  

---

d :: Int -> [a] -> [a]
d n = (drop (n-1)) . (take n)