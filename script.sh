#!/bin/bash
echo 'Creando entorno virtual'
virtualenv entorno_virtual
source entorno_virtual/bin/activate
echo 'Instalando requirements'
pip install -r src/requirements.txt
echo 'Ejecutando aplicación'
python src/main.py &
echo 'Lanzando test'
cd src && pytest && cd ..
echo 'desplegando...'
