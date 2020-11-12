import Data.Time

data DatabaseItem = DbString String 
                  | DbNumber Integer 
                  | DbDate UTCTime 
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
  [ DbDate $ UTCTime
              (fromGregorian 1911 5 1) 
              (secondsToDiffTime 34123)
  , DbNumber 9001
  , DbString "Hello, world!"
  , DbDate $ UTCTime
              (fromGregorian 1921 5 1) 
              (secondsToDiffTime 34123)
  ]

-- filterDbConstructor :: (DatabaseItem -> a) -> [DatabaseItem] -> [a]
-- filterDbConstructor dataCons = foldr f [] 
--   where f (dataCons x) y = x:y
--         f _            y = y

filterDbDate :: [DatabaseItem] -> [UTCTime]
-- filterDbDate = filterDbConstructor DbDate
filterDbDate = foldr f [] 
  where f (DbDate x) y = x:y
        f _          y = y

filterDbNumber :: [DatabaseItem] -> [Integer]
-- filterDbNumber = filterDbConstructor DbNumber
filterDbNumber = foldr f [] 
  where f (DbNumber x) y = x:y
        f _            y = y

mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = foldr1 min . filterDbDate

sumDb :: [DatabaseItem] -> Integer
sumDb = foldr (+) 0 . filterDbNumber

avgDb :: [DatabaseItem] -> Double
avgDb x = let x' = filterDbNumber x in
            (fromIntegral $ sum x') / (fromIntegral $ length x')

avgDb' :: [DatabaseItem] -> Double
avgDb' = uncurry (/) . pair
  where pair = foldr f (0,0) . filterDbNumber
        f = \x (acc,count) -> (fromIntegral x + acc, 1 + count)