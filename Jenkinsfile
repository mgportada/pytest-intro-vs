pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: 'main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/mgportada/pytest-intro-vs.git']]])
            }
        }
        stage('Build Docker Image') {
            steps {
                bat 'docker build -t mi-servicio-fastapi .'
            }
        }
        stage('Test') {
            steps {
                bat 'docker exec mi-contenedor-fastapi /bin/bash -c "python -m pytest --pyargs ./tests"'
            }
        }
        stage('Cleanup') {
            steps {
                bat 'docker rm -f mi-contenedor-fastapi || true'
            }
        }
        stage('Deploy Docker Container') {
            steps {
                bat 'docker run -d --rm --name mi-contenedor-fastapi -p 8001:8000 mi-servicio-fastapi'
            }
        }
    }
}
