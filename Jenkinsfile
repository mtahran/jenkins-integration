pipeline {
    agent any

    stages {
        stage('terraform_ec2') {
            steps {
                dir(ec2) {
                    echo "Running terraform init" 
                }
            }
        }
    }
}