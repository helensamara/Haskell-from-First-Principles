import System.Random

data AguaDoArroz = Agua Int Int StdGen

instance Show AguaDoArroz where
  show (Agua n p g) = concat ["A agua esta no nivel ", show n, " de sal, depois de ", show p, " pitadas."]

data Paladar = Paladar Int

novaAgua :: StdGen -> AguaDoArroz
novaAgua g = Agua 0 0 g

poeUmPouquinhoDeSal :: AguaDoArroz -> AguaDoArroz
poeUmPouquinhoDeSal (Agua n p g) =
  Agua (n + pouquinho) (p+1)  g'
    where (pouquinho, g') = randomR (1,4) g

prova :: AguaDoArroz -> Paladar
prova (Agua n p g) = Paladar $ n + uncertainty
  where uncertainty = fst $ randomR (-2,2) g

daPraSentir         :: Paladar -> Bool
daPraSentir (Paladar n) = n > 7

salgarOArroz :: AguaDoArroz -> AguaDoArroz
salgarOArroz a =
  let a' = poeUmPouquinhoDeSal a in
    if daPraSentir $ prova a' then a' else salgarOArroz a'

vamoLa :: Int -> AguaDoArroz
vamoLa = salgarOArroz . novaAgua . mkStdGen