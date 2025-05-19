def pertenece1(a:list[int], x: int) -> bool:
    for i in a:
        if i == x: return True
    return False

def pertenece2(a:list[int], x: int) -> bool:
    i = 0
    while i < len(a):
        if a[i] == x:
            return True
        else:
            i += 1
    return False

def pertenece3(a:list[int], x: int) -> bool:
    if a == []: return False
    if a[0] == x: return True
    else: pertenece3(a.pop(0), x)

def divide_a_todos(s:list[int], e: int) -> bool:
    for x in s:
        if x % e != 0:
            return False
    return True

def suma_total(s:list[int]) -> int:
    i = 0
    for x in s:
        i += x
    return i

def maximo(s:list[int]) -> int:
    m = -1
    for x in s:
        if x > m:
            m = x
    return m

def minimo(s:list[int]) -> int:
    m = -1
    for x in s:
        if x < m or m == -1:
            m = x
    return m

def ordenados(s:list[int]) -> bool:
    for x in range(1,len(s)):
        if s[x] < s[x-1]: return False
    return True

def pos_maximo(s:list[int]) -> int:
    m = maximo(s)
    for x in range(len(s)):
        if s[x] == m: return x
    return -1

def pos_minimo(s:list[int]) -> int:
    m = minimo(s)
    for x in range(len(s)):
        if s[x] == m: return x
    return -1

def long_mayor_a_7(s:list[str]) -> bool:
    for x in s:
        if len(x) > 7: return True
    return False

def revertir(s: str) -> bool:
    r = []
    for x in s:
        r.insert(0,x)
    return "".join(r)

def es_palindroma(s: str) -> bool:
    return s == revertir(s)

def iguales_consecutivos(s: list[int]) -> int:
    cont = 1
    for x in range(len(s)-1):
        if s[x] == s[x+1]: cont += 1
        else: cont = 1
    return cont == 3

#def vocales_distintas(s: list[int]) -> int:
    


#2
def ceros_en_pos_pares(s: list[int]) -> list[int]:
    for x in range(len(s)):
        if s[x] % 2 == 0: s[x] = 0
    return s

def ceros_en_pos_pares2(s: list[int]) -> list[int]:
    r = []
    for x in s:
        if x % 2 == 0:
            r.append(0)
        else: 
            r.append(x)
    return r

def sin_vocales(s: str) -> str:
    r=''
    for x in s:
        if x not in ['a','e','i','o','u']:
            r+=x
    return r

def reemplaza_vocales(s: str) -> str:
    r=''
    for x in s:
        if x in ['a','e','i','o','u']:
            r+='_'
        else:
            r+=x
    return r

#da_vuelta_str esta hecho en la funcion revertir()

