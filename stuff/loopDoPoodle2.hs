module ArthurCozinhando where

import System.Random

data AguaDoArroz = Agua Int Int StdGen
data Paladar     = Paladar Int

instance Show AguaDoArroz where
  show (Agua sal pitadas gen) = concat ["A agua esta no nivel ",
                              show sal,
                              " de sal, depois de ",
                              show pitadas,
                              " pitadas."]

novaAgua :: StdGen -> AguaDoArroz
novaAgua gen = Agua 0 0 gen

prova :: AguaDoArroz -> Paladar
prova (Agua sal pitadas gen)
  = Paladar $ sal + uncertainty
      where uncertainty = fst $ randomR (-2,2) gen

poeUmPouquinhoDeSal :: AguaDoArroz -> AguaDoArroz
poeUmPouquinhoDeSal (Agua sal pitadas gen)
  = Agua (sal + pouquinho) (pitadas + 1)  gen'
      where (pouquinho, gen') = randomR (1,4) gen

daPraSentir :: Paladar -> Bool
daPraSentir (Paladar n) = n > 7

salgarOArroz :: AguaDoArroz -> AguaDoArroz
salgarOArroz a
  = let a' = poeUmPouquinhoDeSal a in
      if daPraSentir $ prova a'
      then a'
      else salgarOArroz a'

boraLa :: Int -> AguaDoArroz
boraLa = salgarOArroz . novaAgua . mkStdGen
