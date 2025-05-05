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

quitar :: (Eq t) => t -> [t] -> [t]
quitar z [] = []
quitar z (x:xs) | z == x = xs
                | otherwise = [x] ++ quitar z xs

quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos z [] = []
quitarTodos z (x:xs) | z == x = quitarTodos z xs
                     | otherwise = x:quitarTodos z xs

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:[]) = [x]
eliminarRepetidos (x:xs) | xs == [] = []
                         | otherwise = [x] ++ eliminarRepetidos (tail h)
                         where h = [x] ++ (quitarTodos x xs)

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [] [] = True
mismosElementos [] _ = False
mismosElementos _ [] = False
mismosElementos (x:xs) (y:ys) | (pertenece x (y:ys)) && (pertenece y (x:xs)) = mismosElementos (quitar y (eliminarRepetidos xs)) (quitar x (eliminarRepetidos ys))
                              | otherwise = False

capicua :: (Eq t) => [t] -> Bool
capicua a = a == reverso a



-- Ejercicio 3:

sumatoria :: [Integer] -> Integer
sumatoria (x:[]) = x
sumatoria (x:xs) = x + sumatoria xs

productoria :: [Integer] -> Integer
productoria (x:[]) = x
productoria (x:xs) = x * productoria xs

maximo :: [Integer] -> Integer
maximo (x:[]) = x
maximo (x:xs) | x > maximo xs = x
              | otherwise = maximo xs

sumarN :: Integer -> [Integer] -> [Integer]
sumarN s [] = []
sumarN s (x:xs) = (s+x):sumarN s xs

sumarElPrimero :: [Integer] -> [Integer] 
sumarElPrimero (x:xs) = sumarN x (x:xs)

sumarElUltimo :: [Integer] -> [Integer] 
sumarElUltimo x = sumarN (ultimo x) x

pares :: [Integer] -> [Integer] 
pares [] = []
pares (x:xs) | mod x 2 == 0 = x:(pares xs)
             | otherwise = pares xs

multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN n [] = []
multiplosDeN n (x:xs) | mod x n == 0 = x:(multiplosDeN n xs)
                      | otherwise = multiplosDeN n xs



--Ejercicio 6:
type Texto = [Char]
type Nombre = Texto
type Telefono = Texto
type Contacto = (Nombre, Telefono)
type ContactosTel = [Contacto]

elNombre :: Contacto -> Nombre
elNombre cnt = fst cnt

elTelefono :: Contacto -> Telefono
elTelefono cnt = snd cnt

enLosContactos :: Nombre -> ContactosTel -> Bool
enLosContactos n [] = False
enLosContactos n (c:cs) | n == fst c = True
                        | otherwise = enLosContactos n cs

agregarContacto :: Contacto -> ContactosTel -> ContactosTel
agregarContacto c cs | enLosContactos (elNombre c) cs = actualizarNumero c cs
                     | otherwise = c:cs

actualizarNumero :: Contacto -> ContactosTel -> ContactosTel
actualizarNumero c [] = []
actualizarNumero c (x:xs) | elNombre c == elNombre x = ((elNombre x),(elTelefono c)):xs
                          | otherwise = c:(actualizarNumero c xs)

eliminarContacto :: Nombre -> ContactosTel -> ContactosTel
eliminarContacto n [] = []
eliminarContacto n (c:cs) | n == elNombre c = cs
                          | otherwise = c:(eliminarContacto n cs)

--Ejercicio 7:
type Identificacion = Integer
type Ubicacion = Texto
type Estado = (Disponibilidad, Ubicacion)
type Locker = (Identificacion, Estado)
type MapaDeLockers = [Locker]
type Disponibilidad = Bool

-- let lockers = [(100,(False,"ZD39I")),
-- (101,(True,"JAH3I")),
-- (103,(True,"IQSA9")),
-- (105,(True,"QOTSA")),
-- (109,(False,"893JJ")),
-- (110,(False,"99292"))]

existeElLocker :: Identificacion -> MapaDeLockers -> Bool
existeElLocker i [] = False
existeElLocker i (l:ls) | i == fst l = True
                        | otherwise = existeElLocker i ls

ubicacionDelLocker :: Identificacion -> MapaDeLockers -> Ubicacion
ubicacionDelLocker i [] = "El locker no existe."
ubicacionDelLocker i (l:ls) | i == fst l = snd (snd l)
                            | otherwise = ubicacionDelLocker i ls

estaDisponibleElLocker :: Identificacion -> MapaDeLockers -> Bool
estaDisponibleElLocker i [] = False
estaDisponibleElLocker i (l:ls) | i == fst l = fst (snd l)
                                | otherwise = estaDisponibleElLocker i ls

ocuparLocker :: Identificacion -> MapaDeLockers -> MapaDeLockers
ocuparLocker i [] = []
ocuparLocker i (l:ls) | i == fst l = (fst l,(False,snd (snd l))):ls
                      | otherwise = l:ocuparLocker i ls

--Guia Repaso:

--Stock
generarStock :: [String] -> [(String, Integer)]
generarStock [] = []
generarStock (x:xs) = (x, cant x (x:xs)) : generarStock (quitarTodos x xs)

cant :: String -> [String] -> Integer
cant i [] = 0
cant i (x:xs) | i == x = 1 + cant i xs
              | otherwise = cant i xs

stockDeProducto :: [(String, Int)] -> String -> Int
stockDeProducto [] _ = 0
stockDeProducto (x:xs) y
    | fst x == y = snd x
    | otherwise = stockDeProducto xs y

dineroEnStock :: [(String, Int)] -> [(String, Float)] -> Float
dineroEnStock [] _ = 0
dineroEnStock _ [] = 0
dineroEnStock (x:xs) (y:ys)
    | fst x == fst y = fromIntegral (snd x) * snd y + dineroEnStock xs (y:ys)
    | otherwise = dineroEnStock (x:xs) (ys++[y])

aplicarOferta :: [(String, Int)] -> [(String, Float)] -> [(String,Float)]
aplicarOferta [] _ = []
aplicarOferta _ [] = []
aplicarOferta (x:xs) (y:ys)
    | fromIntegral (stockDeProducto (x:xs) (fst y)) > 10  = (fst y,snd y * 0.8): aplicarOferta (x:xs) ys
    | otherwise = y : aplicarOferta (x:xs) ys

--Sopa de numeros
type Fila = [Int]
type Tablero = [Fila]
type Posicion = (Int, Int) --(fila, columna)
type Camino = [Posicion]

-- maximo :: Tablero -> Int
-- maximo [f] = 