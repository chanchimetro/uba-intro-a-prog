module SolucionT2 where
-- Ejercicio 1:
hayQueCodificar :: Char -> [(Char,Char)] -> Bool
hayQueCodificar _ [] = False
hayQueCodificar c (m:ms)
    | c == fst m = True
    | otherwise = hayQueCodificar c ms

-- Ejercicio 2:
cuantasVecesHayQueCodificar :: Char -> [Char] -> [(Char,Char)] -> Int
cuantasVecesHayQueCodificar _ [] _ = 0
cuantasVecesHayQueCodificar c (f:fs) mp
    | not (hayQueCodificar c mp) = 0
    | c == f  = 1 + cuantasVecesHayQueCodificar c fs mp
    | otherwise = cuantasVecesHayQueCodificar c fs mp

-- Ejercicio 3:
laQueMasHayQueCodificar :: [Char] -> [(Char,Char)] -> Char
laQueMasHayQueCodificar (f:[]) _ = f
laQueMasHayQueCodificar (f:fs) mp
    | cuantasVecesHayQueCodificar f (f:fs) mp >= cuantasVecesHayQueCodificar (head fs) (f:fs) mp = laQueMasHayQueCodificar (f:(tail fs)) mp
    | otherwise = laQueMasHayQueCodificar fs mp

-- Ejercicio 4:
codificarFrase :: [Char] -> [(Char,Char)] -> [Char]
codificarFrase [] _ = []
codificarFrase (f:fs) mp
    | hayQueCodificar f mp = conseguirChar f mp:codificarFrase fs mp
    | otherwise = f:codificarFrase fs mp

conseguirChar :: Char -> [(Char,Char)] -> Char
conseguirChar c [] = c
conseguirChar c (m:ms)
    | c == fst m = snd m
    | otherwise = conseguirChar c ms 