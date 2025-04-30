import Test.HUnit

--Ejercicio 1:
longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

ultimo :: [t] -> t
ultimo (x:[]) = x
ultimo (x:xs) = ultimo xs

principio :: [t] -> [t]
principio (x:[]) = []
principio (x:xs) = x : principio xs

reverso :: [t] -> [t]
reverso (x:[]) = [x]
reverso xs = (ultimo xs : reverso (principio xs))

--Ejercicio 2:
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece a [] = False
pertenece a (x:xs) | a == x = True
                   | otherwise = pertenece a xs

todosIguales :: (Eq t) => [t] -> Bool
todosIguales (x:[]) = True
todosIguales (x:xs) | x == head xs = todosIguales xs
                    | otherwise = False

todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos (x:[]) = True
todosDistintos (x:xs) | pertenece x xs = False
                      | otherwise = todosDistintos xs

hayRepetidos ::  (Eq t) => [t] -> Bool
hayRepetidos xs = not (todosDistintos xs)

--Ejercicio 6:
type Texto = [Char]
type Nombre = Texto
type Telefono = Texto
type Contacto = (Nombre, Telefono)
type ContactosTel = [Contacto]

enLosContactos :: Nombre -> ContactosTel -> Bool
enLosContactos n [] = False
enLosContactos n (c:cs) | n == fst c = True
                        | otherwise = enLosContactos n cs

-- agregarContacto :: Contacto -> ContactosTel -> ContactosTel
-- agregarContacto c cs | enLosContactos c cs = []
--                      | otherwise = c:cs

--Ejercicio 7:
type Identificacion = Integer
type Ubicacion = Texto
type Estado = (Disponibilidad, Ubicacion)
type Locker = (Identificacion, Estado)
type MapaDeLockers = [Locker]
type Disponibilidad = Bool

--Guia Repaso:
generarStock :: [String] -> [(String, Integer)]
generarStock [] = []
generarStock (x:xs) = (x, (cant x (x:xs))) : generarStock (quitarTodos x xs)

cant :: String -> [String] -> Integer
cant i [] = 0
cant i (x:xs) | i == x = 1 + (cant i xs)
              | otherwise = cant i xs

quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos i [] = []
quitarTodos i (x:xs) | i == x = quitarTodos i xs
                     | otherwise = x:quitarTodos i xs

-- mismosElementos :: (Eq t) => [t] -> [t] -> Bool
-- mismosElementos (x:[]) = True

-- Casos de Test

runTestGenStock = runTestTT testsGenStock

testsGenStock = test [
    " Casobase 1 : generarStock []" ~: (generarStock []) ~?= [] ,
    " Caso Elementos Distintos : generarStock ['Manzana', 'Pera', 'Naranja']" ~: (generarStock ["Manzana", "Pera", "Naranja"]) ~?= [("Manzana",1),("Pera",1),("Naranja",1)],
    " Caso Elementos Ordenados : generarStock ['Manzana', 'Manzana', 'Manzana', 'Pera', 'Naranja', 'Naranja']" ~: (generarStock ["Manzana", "Manzana", "Manzana", "Pera", "Naranja", "Naranja"]) ~?= [("Manzana",3),("Pera",1),("Naranja",2)],
    " Caso Elementos Ordenados : generarStock ['Naranja', 'Manzana', 'Manzana', 'Pera', 'Manzana', 'Naranja']" ~: (generarStock ["Naranja", "Manzana", "Manzana", "Pera", "Manzana", "Naranja"]) ~?= [("Naranja",2),("Manzana",3),("Pera",1)]
    ]
      