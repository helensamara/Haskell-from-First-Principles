partialVersion :: RecShape a b -> (SelfApplicable a b)

partialVersion funcShape =
  \p -> funcShape (p p)

y :: RecShape a b -> a -> b
y = selfApplier . partialVersion

factShape :: RecShape a b
factShape r 0 = 1
factShape r n = n * r (n-1)

fact:: a -> b
fact = y factShape


-- A data declaration abaixo faz duas coisas:
--   1. Cria o tipo soma ``Self a b``
--   2. Define o data constructor ``Partial``, que é uma função que recebe uma função do tipo ``Self a b -> (a -> b)`` e retorna essa função com o nome ``Partial`` na frente, e declara que essa coisa é do tipo Self a b.

data Self a b = Partial ( Self a b -> (a -> b) )

-- As próximas linhas são ``aliases``

type A = Integer
type B = Integer

-- Nossa amiga:

factPartial :: Self A B -> A -> B
factPartial (Partial p) n =
  if n == 0
    then 1
    else n * p (Partial p) (n-1)

main :: IO ()
main = do
  putStr "n = "
  n' <- getLine
  let n = read n' :: Integer
  let ans = factPartial (Partial factPartial) (n)
  putStr "n! = "
  print ans