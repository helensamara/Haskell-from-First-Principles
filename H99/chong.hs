-- um que arranca um elemento fora no índice k e devolve uma dupla com o elemento e com a lista sem o elemento. Assinatura fica Int -> [a] -> (a, [a])

removeAt :: Int -> [a] -> (a, [a])
removeAt n _ | n < 0 = error "negative index"
removeAt n xs = removeAtAux n (id, xs)
                where removeAtAux :: Int -> ([a]->[a], [a]) -> (a, [a])
                      removeAtAux _ (_, [])              = error "index too large"
                      removeAtAux 0 (prependStart, y:ys) = (y, prependStart ys)
                      removeAtAux n (prependStart, y:ys)
                        = removeAtAux (n-1) (prependStart . (y:), ys)

removeAt' :: Int -> [a] -> (a, [a])
removeAt' n _ | n < 0 = error "negative index"
removeAt' n xs = let (m, prependStart, end) = foldl f (n, id, xs)
                 in undefined
                 where f :: (Int, [a] -> [a], [a]) -> a -> (Int, [a] -> [a], [a])
                       f (m, )