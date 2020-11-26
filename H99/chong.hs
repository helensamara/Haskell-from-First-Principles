-- um que arranca um elemento fora no índice k e devolve uma dupla com o elemento e com a lista sem o elemento. Assinatura fica Int -> [a] -> (a, [a])

removeAt :: Int -> [a] -> (a, [a])
removeAt n _ | n < 0 = error "negative index"
removeAt n xs = removeAtAux n (id, xs)
                where removeAtAux :: Int -> ([a]->[a], [a]) -> (a, [a])
                      removeAtAux _ (_, [])              = error "index too large"
                      removeAtAux 0 (prependStart, y:ys) = (y, prependStart ys)
                      removeAtAux n (prependStart, y:ys)
                        = removeAtAux (n-1) (prependStart . (y:), ys)

-- Nova versão do chong

kthElem2 :: [a] -> Int -> a
kthElem2 xs k = head $ foldr (\x -> tail) xs [1..k]

-- Nova versão do removeAt

removeAt' :: Int -> [a] -> (a, [a])
removeAt' n _ | n < 0 = error "negative index"
removeAt' n xs = (elem, prependStart end)
  where
    (elem, prependStart, end) = foldr f (undefined, id, xs) [0..n]
    f _ (_, _, [])            = error "index too large"
    f 0 (_, prepend, y:ys)    = (y, prepend, ys)
    f _ (_, prepend, y:ys)    = (undefined, prepend . (y:), ys)

-- Versão com Maybe

removeAt'' :: Int -> [a] -> (Maybe a, [a])
removeAt'' n xs = (elem, prependStart end)
  where
    (elem, prependStart, end) = foldr f (Nothing, id, xs) [0..n]
    f _ (_, prepend, [])      = (Nothing, prepend       , [])
    f 0 (_, prepend, y:ys)    = (Just y , prepend       , ys)
    f _ (_, prepend, y:ys)    = (Nothing, prepend . (y:), ys)