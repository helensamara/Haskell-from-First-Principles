-- As funções que vou usar de base

ponhaAgua             :: AguaDoArroz
ponhaUmPouquinhoDeSal :: AguaDoArroz -> AguaDoArroz
prova                 :: AguaDoArroz -> Paladar
daPraSentir           :: Paladar -> Bool

-- Versão mais natural do loop
-- ---------------------------

salgarOArroz :: AguaDoArroz -> AguaDoArroz
salgarOArroz a = 
  let a' = ponhaUmPouquinhoDeSal a in 
    if daPraSentir (prova a') then a' else salgarOArroz a'

-- Versão que parece um "do"
-- -------------------------

-- Para parecer com uma sequencia de passos, eu gostaria de algo assim:

-- doSalgarOArroz =
--   repeteOuNao . daPraSentir . prova . ponhaUmPouquinhoDeSal

-- Mas a função ``prova`` esquece a água, retorna só um Paladar. 
-- Isso quebra tudo, então a gente conserta:

provaMasNaoJogaFora :: AguaDoArroz -> (Paladar, AguaDoArroz)
provaMasNaoJogaFora a = (prova a, a)

-- Mas aí a gente tem que consertar a função daPraSentir tb.
-- Vou usar um nome que lembra mais o loop original, pra nao ter um nome ainda mais longo

naoDaPraSentir (p, a) = (not $ daPraSentir p, a)

-- Notem que essa função não altera a água, mas tem que levar a água para o próximo passo, que é:

repeteOuNao :: (Bool, AguaDoArroz) -> AguaDoArroz
repeteOuNao (teste, a) = 
  if teste 
  then doSalgarOArroz a
  else a

-- Enfim:

doSalgarOArroz :: AguaDoArroz -> AguaDoArroz
doSalgarOArroz = 
  repeteOuNao . naoDaPraSentir . provaMasNaoJogaFora . ponhaUmPouquinhoDeSal

-- Como não podemos ficar usando o Arthur como computador, precisamos simular os tipos e as funções...

data AguaDoArroz = Agua Int deriving Show
data Paladar     = Paladar Int

ponhaAgua                      = Agua 0
ponhaUmPouquinhoDeSal (Agua n) = Agua $ n+1
daPraSentir (Paladar n)        = n > 2
prova (Agua n)                 = (Paladar n)