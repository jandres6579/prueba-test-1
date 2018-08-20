// comments
pipeline {
    agent any

    stages {
        stage('CheckOut-Git') {
            steps {
                echo 'CheckOut-Git...'
                git poll: true, url: 'https://github.com/jandres6579/prueba-test-1.git'
            }
        }
        stage('CreateVirtualEnv') {
            steps {
                echo 'Creando entorno virtual...'
                sh '''
                    bash -c "virtualenv entorno_virtual && source entorno_virtual/bin/activate"
                '''
            }
        }
        stage('InstallRequirements') {
            steps {
                echo 'Instalando requirements...'
                sh '''
                    bash -c "source ${WORKSPACE}/entorno_virtual/bin/activate && ${WORKSPACE}/entorno_virtual/bin/python ${WORKSPACE}/entorno_virtual/bin/pip install -r src/requirements.txt"
                '''
            }
        }

        stage('TestingApp') {
            steps {
                echo 'Realizando testeo...'
                sh '''
                    bash -c "source ${WORKSPACE}/entorno_virtual/bin/activate && cd src && ${WORKSPACE}/entorno_virtual/bin/python ${WORKSPACE}/entorno_virtual/bin/pytest && cd .."
                '''
            }
        }

        stage('RunningApp') {
            steps {
                echo 'Ejecutando aplicación...'
                sh '''
                    #De esta forma se pueden añaden comentarios.
                    bash -c "source ${WORKSPACE}/entorno_virtual/bin/activate && cd src && ${WORKSPACE}/entorno_virtual/bin/python src/main.py &"
                '''
            }
        }

        stage('BuildImage') {
            steps {
                echo 'Construyendo imagen...'
                sh '''
                    docker build -t testjenkinsdocker:latest .
                '''
            }
        }

        stage('BuildImageTag') {
            steps {
                echo 'Creamos la imagen...'
                sh '''
                    docker tag testjenkinsdocker:latest jandres6579/testjenkinsdocker:latest
                '''
            }
        }

        stage('DockerLogin') {
            steps {
                echo 'Realizando docker login...'
                sh '''
                    bash -c "echo fJSNHi > ${WORKSPACE}/pass_github.txt && cat ${WORKSPACE}/pass_github.txt | docker login -u jandres6579 --password-stdin"
                '''
            }
        }

        stage('PushDocker') {
            steps {
                echo 'Pushing imagen a DockerHub...'
                sh '''
                    docker push jandres6579/testjenkinsdocker:latest
                '''
            }
        }

        stage('DeleteLocalImage') {
            steps {
                echo 'Borrando imagen local...'
                sh '''
                    docker rmi testjenkinsdocker:latest && docker rmi jandres6579/testjenkinsdocker:latest
                '''
            }
        }

        stage('DockerLogout') {
            steps {
                echo 'Realizando docker logout...'
                sh '''
                    docker logout
                '''
            }
        }

    }
}

/*


#!/bin/bash
echo '********* INICIO PROCESO ************'
echo 'Creando entorno virtual'
virtualenv entorno_virtual
source entorno_virtual/bin/activate
echo 'Instalando requirements'
pip install -r src/requirements.txt
echo 'Ejecutando aplicación'
python src/main.py &
echo 'Lanzando test'
cd src && pytest
cd ..
echo 'Construyendo imagen docker'
docker build -t testjenkinsdocker:latest .
echo 'Etiquetamos la imagen'
docker tag testjenkinsdocker:latest jandres6579/testjenkinsdocker:latest
echo 'Creando fichero'
echo fJSNHi > ~/pass_github.txt
echo 'Conectando Docker_HUB'
cat ~/pass_github.txt | docker login -u jandres6579 --password-stdin
echo 'desplegando...'
echo 'Push imagen docker'
docker push jandres6579/testjenkinsdocker:latest
echo 'Desconectando Docker_HUB'
docker logout
echo 'Borramos la imagen en Local'
docker rmi testjenkinsdocker:latest
echo '********* FIN PROCESO ************'
*/