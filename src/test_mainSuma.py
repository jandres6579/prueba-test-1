from main import *

def test_sumaOK():
    assert suma(3,2)==5

def test_sumaOK_prueba():
    assert suma(4,2)==6

def test_sumaOK_prueba1():
    assert suma(5,6)==11

def test_sumaOK_prueba2():
    assert suma(5,7)==12

def test_sumaOK_prueba2():
    assert suma(6,7)==13

# Si descomentamos este error el Pipeline falla en todos los puntos posteiores al testeo.
#def test_sumaError():
#    assert suma(3,2)==6
