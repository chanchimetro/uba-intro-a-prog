--preludio clase !
factorial :: Integer -> Integer
factorial n
    | n == 0 = 1
    | otherwise = n * factorial(n-1)

factorialPattern :: Integer -> Integer
factorialPattern 0 = 1
factorialPattern n = n * factorialPattern(n-1)

--ejercicio 1
fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci(n-1) + fibonacci(n-2)

--ejercicio 2
parteEntera :: Float -> Integer
parteEntera n
            | n < 1 = 0
            | otherwise = 1 + parteEntera(n-1)

--ejercicio 3
esDivisible :: Integer -> Integer -> Bool
esDivisible x y
    | y == x = True
    | y > x = False
    | otherwise = esDivisible x (y + y) 

--ejercicio 4
sumaImpares :: Integer -> Integer
sumaImpares 1 = 1
sumaImpares n = (n*2) - 1 + sumaImpares(n-1)

--ejercicio 5
medioFact :: Integer -> Integer
medioFact 0 = 1
medioFact 1 = 1
medioFact n = n * medioFact(n-2)

--ejercicio 6
todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n
    | div n 10 == 0 = True
    | mod n 10 == mod (div n 10) 10 = todosDigitosIguales (div n 10)
    | otherwise = False

--ejercicio 7 REVISAR, NO FUNCIONA >:(
iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n 1 = div n 10^(cantDigitos n - 1)
iesimoDigito n i = iesimoDigito (mod n (10^(cantDigitos n - 1))) (i-1)


cantDigitos :: Integer -> Integer
cantDigitos 0 = 0
cantDigitos n = 1 + cantDigitos(div n 10)

--ejercicio 8
sumaDigitos :: Integer -> Integer
--TERMINAR !!!