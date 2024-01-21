pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from Git
                git url: 'https://github.com/SananKhan001/ChatRoomProject.git'
            }
        }
        stage('build') {
            steps {
                docker build -t chat-app:v1 .
            }
        }
        stage('deploy') {
            steps {
                docker run -d --name chat-app -p 8081:8081 chat-app:v1 
            }
        }
    }
}
