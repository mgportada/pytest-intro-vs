pipeline {
    agent any

    environment {
        CONTAINER_NAME = 'mi-contenedor-fastapi'
        SERVICE_NAME = 'mi-servicio-fastapi'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: 'main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/mgportada/pytest-intro-vs.git']]])
            }
        }
        stage('Test') {
            steps {
                bat 'python -m pytest --pyargs ./tests'
            }
        }
        stage('Build Docker Image') {
            steps {
                bat 'docker build -t $SERVICE_NAME .'
            }
        }
        stage('Cleanup') {
            steps {
                bat 'docker rm -f $CONTAINER_NAME || true'
            }
        }
        stage('Deploy Docker Container') {
            steps {
                bat "docker run -d --rm --name $CONTAINER_NAME -p 8001:8000 $SERVICE_NAME"
            }
        }
    }
}
