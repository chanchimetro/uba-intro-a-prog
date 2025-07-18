def contar_pares_impares(numeros) -> tuple[int, int]:
    pares_mayores_a_5:int = 0
    pares_menores_a_5:int = 0
    impares_mayores_a_4:int = 0
    impares_menores_a_4:int = 0

    for n in numeros:
        if n % 2 == 0:
            if n > 5: 
                pares_mayores_a_5 += 1
            else:
                pares_menores_a_5 += 1
        else:
            if n > 5: 
                impares_mayores_a_4 += 1
            else:
                pares_menores_a_5 += 1

    return pares_menores_a_5 + pares_mayores_a_5, impares_mayores_a_4 + impares_menores_a_4


def contar_pares_impares_con_prints(numeros) -> tuple[int, int]:
    pares_mayores_a_5:int = 0
    pares_menores_a_5:int = 0
    impares_mayores_a_4:int = 0
    impares_menores_a_4:int = 0

    for n in numeros:
        print(f"\nAnalizando número: {n}")
        if n % 2 == 0:
            print("Es par")
            if n > 5: 
                pares_mayores_a_5 += 1
                print("Mayor a 5")
            else:
                pares_menores_a_5 += 1
                print("Menor o igual a 5")
        else:
            print("→ Es impar")
            if n > 5: 
                impares_mayores_a_4 += 1
                print("Mayor a 5")
            else:
                pares_menores_a_5 += 1  
                print("Menor o igual a 5")

        print(f"pares_menores_a_5 = {pares_menores_a_5}")
        print(f"pares_mayores_a_5 = {pares_mayores_a_5}")
        print(f"impares_menores_a_4 = {impares_menores_a_4}")
        print(f"impares_mayores_a_4 = {impares_mayores_a_4}")

    return pares_menores_a_5 + pares_mayores_a_5, impares_mayores_a_4 + impares_menores_a_4


def fibonacci_no_recursivo(n: int) -> int:
    if n <= 1:
        return n
    un_fibo: int = 0
    un_fibo_sig: int = 1
    i: int = 2
    while i <= n:
        aux: int = un_fibo + un_fibo_sig
        un_fibo = un_fibo_sig
        un_fibo_sig = aux
        i = i + 1
    #return un_fibo <--ERROR!
    return aux


def es_primo(n: int) -> bool:
    cant_divisores: int = 0
    i: int = 1
    while i < n and cant_divisores < 2:
        if n % i == 0:
            cant_divisores += 1
            #i += 1 <---ERROR!
        i += 1
    
    return cant_divisores < 2 and i == n


def buscar_nesimo_primo(n: int) -> int:
    cant_primos: int = 0
    i: int = 2
    while cant_primos < n:
        if es_primo(i):
            cant_primos += 1
        i+=1 #Esta linea fue agregada!
            
    return i

buscar_nesimo_primo()