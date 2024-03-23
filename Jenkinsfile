pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: 'main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/mgportada/pytest-intro-vs.git']]])
            }
        }
        stage('Test') {
            steps {
                bat 'python -m pytest'
            }
        }
        stage('Build Docker Image') {
            steps {
                bat 'docker build -t mi-servicio-fastapi .'
            }
        }
        stage('Deploy Docker Container') {
            steps {
                bat 'docker run -d --name mi-contenedor-fastapi -p 8001:8000 mi-servicio-fastapi'
            }
        }
    }
}
