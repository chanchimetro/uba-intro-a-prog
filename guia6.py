#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Ejercicio 1:
import math

def imprimir_hola_mundo():
    print('Hola Mundo')

def imprimir_un_verso():
    print('I laughed and shook his hand\nI searched for foreign land\nFor years and years I roamed')

def raizDe2():
    return round(math.sqrt(2), 4)

def factorial_2() -> int:
    return 2*1

def perimetro() -> float:
    return 2*math.pi

# Ejercicio 2:
def imprimir_saludo(nombre: str) -> str:
    print('Hola', nombre)
    
def raiz_cuadradra_de(n: int) -> float:
    return math.sqrt(n)

def farenheit_a_celsius(tf: float) -> float:
    return ((tf-32) * 5) / 9

def imprimir_dos_veces(e: str) -> str:
    print(e*2)
    
def es_multiplo_de(n: int, m: int) -> bool:
    return m % n == 0

def es_par(n: int) -> bool:
    return es_multiplo_de(2, n)

def cantidad_de_pizzas(com: int, min_cant: int) -> int:
    return math.ceil(com*min_cant/8)

# Ejercicio 3:
def alguno_es_0(n1: int, n2: int) -> bool:
    return n1 == 0 or n2 == 0

def ambos_son_0(n1: int, n2: int) -> bool:
    return n1 == 0 and n2 == 0

def es_nombre_largo(n: str) -> bool:
    return len(n) >= 3 and len(n) <= 8

def es_bisiesto(a: int) -> bool:
    return es_multiplo_de(400, a) or (es_multiplo_de(4, a) and not es_multiplo_de(100, a))

# Ejercicio 4:
def peso_pino(alt: int) -> int:
    alt *= 100
    if alt <= 300:
        return alt * 3
    else:
        return 900 + (alt-300) * 2
    
def es_peso_util(p: int) -> bool:
    return p>=400 and p<=1000

def sirve_pino(alt: int) -> bool:
    return es_peso_util(peso_pino(alt))

# Ejercicio 5:
def devolver_el_doble_si_es_par(n: int) -> int:
    if (es_par(n)):
        return n*2
    else:
        return n
    
def devolver_valor_si_es_par_sino_el_que_sigue(n: int) -> int:
    if es_par(n):
        return n
    else:
        return n+1
    
def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(n: int) -> int:
    if es_multiplo_de(9, n):
        return n*2
    elif es_multiplo_de(3, n):
        return n*3
    return n

def lindo_nombre(n: str):
    if len(n) >= 5:
        print("Tu nombre tiene muchas letras!")
    else:
        print("Tu nombre tiene menos de 5 caracteres")
    
def elRango(n: int):
    if  n < 5:
        print("Menor a 5")
    elif (n >= 10 and n <= 20):
        print("Entre 10 y 20")
    elif n > 20:
        print("Mayor a 20")

def vacaciones_o_pala(s: str, e:int):
    if (e<18 or (s == "F" and e >= 60) or (s == "M" and e >= 65)):
        print("Andá de vacaciones!!")
    else:
        print("Toca laburar :(")
        
# Ejercicio 6:
def uno_al_diez():
    i = 1
    while i<=10:
        print(i)
        i += 1
        
def pares_entre_10_y_40():
    i = 10
    while i<=40:
        print(i)
        i += 2
        
def eco():
    i = 1
    while i<=10:
        print("eco")
        i += 1
        
def cuenta_regresiva(t: int):
    while t>=1:
        print(t)
        t -= 1
    print("Despegue.")
    
def viaje_en_el_tiempo(aSal: int, aLleg: int):
    añoMasCercano: int = 
    while aSal>=aLleg:
        print("Viajó un año al pasado, estamos en el año:", aSal)
        aSal -= 1

def viaje_a_aristoteles(aSal: int):
    while aSal>=aLleg:
        print("Viajó un año al pasado, estamos en el año:", aSal)
        aSal -= 1