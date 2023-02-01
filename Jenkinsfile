pipeline {
    agent any
    stages {
        stage('Build Docker App') {
            steps {
                sh '''
                docker build -t poojasdocker2023/api-docker:latest -t poojasdocker2023/api-docker:build-$BUILD_NUMBER .
                '''
            }
        }
        stage('Push Image to Docker Hub') {
            steps {
                sh '''
                docker push poojasdocker2023/api-docker:latest
                docker push poojasdocker2023/api-docker:build-$BUILD_NUMBER
                '''
            }
        }
        stage('Deploy Application') {
            steps {
                sh '''
                ssh -i "~/.ssh/id_rsa" jenkins@34.142.72.48 << EOF
                docker stop api-docker
                docker rm api-docker
                docker rmi poojasdocker2023/api-docker:latest
                docker run -d -p 80:5500 --name api-docker poojasdocker2023/api-docker:latest
                '''
            }
        }
    }
}