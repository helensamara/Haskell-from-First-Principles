data Price = Price Integer deriving (Eq, Show)

data Manufacturer = Mini
                  | Mazda
                  | Tata
                  deriving (Eq, Show)

data Airline = PapuAir
             | CatapultsR'Us
             | TakeYourChancesUnited
             deriving (Eq, Show)

newtype Size = Size Float deriving (Eq, Show)

data Vehicle = Car Manufacturer Price | Plane Airline Size
               deriving (Eq, Show)

myCar    = Car Mini  (Price 14000)
urCar    = Car Mazda (Price 20000)
clownCar = Car Tata  (Price 7000)
doge     = Plane PapuAir (Size 2)

-- 1. What is the type of myCar?
-- Vehicle

-- 2. Given the following, define the functions:

isCar :: Vehicle -> Bool
isCar (Car _ _)   = True
isCar (Plane _ _) = False

isPlane :: Vehicle -> Bool
isPlane (Car _ _)   = False
isPlane (Plane _ _) = True

areCars :: [Vehicle] -> [Bool]
areCars = map isCar

-- 3. Now we’re going to write a function to tell us
--    the manufacturer of a piece of data:

getManu :: Vehicle -> Manufacturer
getManu (Car x y) = x
getManu _         = error "Manufacturer not defined for planes."

-- >>> Test
getManu myCar