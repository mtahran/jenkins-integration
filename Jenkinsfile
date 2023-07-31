pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
        stage('Tahran') {
            steps {
                echo 'Mustafa Tahran'
            }
        }
        stage('verify terraform') {
            steps {
                sh "terraform -v"
            }
        }
    }
}