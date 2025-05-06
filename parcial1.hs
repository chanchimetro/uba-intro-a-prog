-- EJERCICIO 1 (2 puntos)
-- problema mediaMovilN (lista: seq⟨Z⟩, n: Z) : Float {
--   requiere: {|lista| > 0}
--   requiere: {n > 0 ∧ n ≤ |lista|}
--   asegura: {res es el promedio de los últimos n elementos de lista}
-- }

mediaMovilN :: [Int] -> Int -> Float
mediaMovilN xs n = fromIntegral (sumatoriaHastaN (invertir xs) n) / fromIntegral n

sumatoriaHastaN :: [Int] -> Int -> Int
sumatoriaHastaN _ 0 = 0
sumatoriaHastaN (x:xs) n = x + sumatoriaHastaN xs (n-1)

invertir :: [Int] -> [Int]
invertir [x] = [x]
invertir (x:xs) = invertir xs ++ [x]

-- EJERCICIO 2 (2 puntos)    n>0
-- problema esAtractivo (n: Z) : Bool {
--   requiere: {n > 0}
--   asegura: {res = true <=> la cantidad de factores primos de n (distintos o no) es también un número primo.}
-- }
-- Aclaración: los factores primos de 30 son [5,3,2]. Los factores primos de 9 son [3,3]. 
esAtractivo :: Int -> Bool
esAtractivo n = esPrimo (longitud (factorizarN n 2)) 2

factorizarN :: Int -> Int -> [Int]
factorizarN n i
    | n == i && esPrimo i 2 = [i]
    | mod n i == 0 && esPrimo i 2 = i:factorizarN (div n i) 2
    | otherwise = factorizarN n (i+1)


esPrimo :: Int -> Int -> Bool
esPrimo n i 
    | n == i = True
    | mod n i == 0 = False
    | otherwise = esPrimo n (i+1)

longitud :: [Int] -> Int
longitud [x] = 1
longitud (x:xs) = 1 + longitud xs

-- EJERCICIO 3 (2 puntos)
-- problema palabraOrdenada (palabra: seq⟨Char⟩) : Bool {
--   requiere: {True}
--   asegura: {res = true <=> cada uno de los elementos no blancos de palabra es mayor o igual al anterior caracter no blanco, si existe alguno.}
-- }
-- Aclaración: 'a' < 'b' es True.

palabraOrdenada :: [Char] -> Bool
palabraOrdenada (x:[]) = True
palabraOrdenada xs
    | y < head ys = palabraOrdenada ys
    | otherwise = False
    where (y:ys) = sacarBlancos xs

sacarBlancos :: [Char] -> [Char]
sacarBlancos [] = []
sacarBlancos (x:xs)
    | x == ' ' = sacarBlancos xs
    | otherwise = x:sacarBlancos xs

-- EJERCICIO 4 (3 puntos)
-- problema similAnagrama (palabra1: seq⟨Char⟩, palabra2: seq⟨Char⟩) : Bool⟩{
--   requiere: {True}
--   asegura: {res = true <=> (para todo caracter no blanco, la cantidad de apariciones de ese caracter en palabra1 es igual a la cantidad de apariciones en palabra2, y además existe al menos un caracter en palabra1 que tiene una posición distinta en palabra2)}
-- }

similAnagrama :: [Char] -> [Char] -> Bool
similAnagrama x y = mismasLetras x y && x/=y

mismasLetras :: [Char] -> [Char] -> Bool
mismasLetras [] [] = True
mismasLetras a b
    | longitudChar (x:xs) /= longitudChar (y:ys) = False
    | cant x (x:xs) == cant x (y:ys) = mismasLetras (sacarChar x (x:xs)) (sacarChar x (y:ys))
    | otherwise = False
    where 
        (x:xs) = sacarBlancos a
        (y:ys) = sacarBlancos b

cant :: Char -> [Char] -> Int
cant _ [] = 0
cant c (x:xs)
    | c == x = 1 + cant c xs
    | otherwise = cant c xs

longitudChar :: [Char] -> Int
longitudChar [x] = 1
longitudChar (x:xs) = 1 + longitudChar xs

sacarChar :: Char -> [Char] -> [Char]
sacarChar _ [] = []
sacarChar c (x:xs)
    | c == x = sacarChar c xs
    | otherwise = x:sacarChar c xs
-- EJERCICIO 5 (1 punto)
-- ¿Cuándo se dice que una especificación está sub-especificada?:
-- [x] Cuando se da una precondición más restrictiva de lo realmente necesario, o bien una postcondición más débil de la que se necesita.
-- [ ] Cuando se da una precondición más débil de lo realmente necesario, o bien una postcondición más restrictiva de la que se necesita.
-- [ ] Cuando no hay precondiciones (o la precondición es True).