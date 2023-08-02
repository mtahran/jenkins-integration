pipeline {
    agent any

    stages {
        stage('terraform_ec2') {
            steps {
                dir('ec2') {
                    echo "Ready to go!"
                    echo "Running terraform init" 
                    sh 'terraform init'
                }
            }
        }

        stage('pwd') {
            steps {
                sh "pwd"
            }
        }

        stage('whoami') {
            steps {
                sh "whoami"
            }
        }
    }
}