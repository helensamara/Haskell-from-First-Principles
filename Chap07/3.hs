sentence = "Curry is awesome"

rvrs :: String -> String
rvrs x = drop 9 x ++ (drop 5 . take 9) x ++ take 5 x

rvrs2 x = concat $ map ($x) [drop 9, (drop 5 . take 9), take 5] 

rvrs3 = concat . (flip map [drop 9, drop 5 . take 9, take 5]) . (flip ($))

-- Simulando uma string "mutável"
-- ------------------------------

-- Quando eu escrevi `(drop 5 . take 9)`, eu tava pensando em "pegue 5 da que sobrou depois do 1o passo". Claro que não é assim que funciona. Mas tem como simular essa ideia?

-- A estratégia é guardar a parte que "sobrou" como uma segunda entrada numa dupla. A primeira entrada é "o que interessa" e a gente vai "atualizando". 

dropMutable :: Int -> [a] -> ([a],[a])
dropMutable n list = (drop n list, take n list)

passo0 x      = ([], x)

passo1 (a, b) = (a ++ fst res, snd res)
  where res = dropMutable 9 b

passo2 (a, b) = (a ++ fst res, snd res)
  where res = dropMutable 5 b

passo3 (a, b) = (a ++ fst res, snd res)
  where res = dropMutable 0 b 

passo4 (a, b) = a

rvrs' = (passo4).(passo3).(passo2).(passo1).(passo0)

-- Rmk pro Chong:
-- $ nao eh parenteses com funcoes infixas