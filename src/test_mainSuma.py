from main import *

def test_sumaOK():
    assert suma(3,2)==5

# Si descomentamos este error el Pipeline falla en todos los puntos posteiores al testeo.
#def test_sumaError():
#    assert suma(3,2)==6
