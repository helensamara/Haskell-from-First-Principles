-- Primeiramente, eu escrevi:

-- data SelfApplicable = SelfApplicable -> Integer -> Integer

-- Mas isso está semanticamente errado: à esquerda do igual a gente tem o "type constructor", que define o novo tipo, e à direita a gente tem o "data constructor", que dá uma função que constroi elementos desse novo tipo. 
-- O correto é:

newtype SelfApplicable = Box (SelfApplicable -> Integer -> Integer)

-- Veja, à esquerda do igual estamos falando "existe um tipo chamado SelfApplicable", e à direita estamos falando "existe uma função Box que recebe uma função do tipo SelfApplicable -> Integer -> Integer, põe ela numa caixinha e diz que o resultado é do tipo SelfApplicable"
-- Para apliacar uma SelfApplicable, a gente tem que tirar a função da caixinha. Para passar como argumento, a gente tem que por na caixinha.

factPartial :: SelfApplicable -> Integer -> Integer
factPartial (Box p) n = 
  if n == 0
    then 1
    else n * p (Box p) (n-1)

fact :: Integer -> Integer
fact = factPartial( Box factPartial )