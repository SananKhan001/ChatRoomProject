pipeline {
    agent any

    stages {
        stage('Clone Code') {
            steps {
                echo 'Cloning the code'
                git 'https://github.com/SananKhan001/ChatRoomProject.git'
            }
        }
        stage('Build') {
            steps {
                echo 'building the code'
                sh 'docker build -t chat-app:registery .'
            }
        }
        stage('Push to Registery') {
            steps {
                echo 'Pushing the code to docker registery'
                withCredentials([usernamePassword(credentialsId:'DockerId', passwordVariable:'docker_password', usernameVariable:'docker_username')]) {
                    // some block
                    sh "docker tag chat-app:registery ${env.docker_username}/chat-app:registery"
                    sh "docker login -u ${env.docker_username} -p ${env.docker_password}"
                    sh "docker push ${env.docker_username}/chat-app:registery"
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying the code'
                sh "kubectl apply -f Deployment.yml"
                sh "kubectl apply -f service.yml"
            }
        }
    }
}

