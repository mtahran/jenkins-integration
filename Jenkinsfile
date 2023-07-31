pipeline {
    agent any

    stages {
        stage('terraform_ec2') {
            steps {
                sh 'terraform init'
                sh 'terraform apply -auto-approve'
            }
        }
    }
}