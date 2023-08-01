pipeline {
    agent any

    stages {
        stage('terraform_ec2') {
            steps {
                sh 'terraform apply -destroy -auto-approve'
            }
        }
    }
}